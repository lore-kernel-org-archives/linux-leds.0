Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C8442B327
	for <linux-leds@vger.kernel.org>; Wed,  2 Sep 2026 18:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372957; cv=none; b=Jwl9g8VOwsCN1QzCvibnRW0lkhPiQTvFZd3lTzzXsIcyT2HnXmlTlY5wfdj3mhlvRrfiJP9VVMZuCzkL+IhCTHnhhRO92HaPLzR3GJcalW2MweSB9+V0ckhoBiIo+IbKOX2RVQO6Pxhuo1Sr+UyLuHGXbNT6sGgZj6ICaexsuvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372957; c=relaxed/simple;
	bh=uew0SA47IdVwnVRjF6okTl3KbZT8sD4/MLV3ERQ5Ek0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=laggCu+lJcWku5bv8BVh/CHXg01SZ4k8wdYnJQLJlbIFQaJjs0gTODyRbHTWJFVDXx6UVL/s7Aq0xBt2Xn2kKEJywrMMAbZlzIzjrUDszE2TvYMhJ0lsxmOON5+BdJ1ZKb6D1OGD7VP4l+8a0I9JV1uF5j+U09J32KNribjqD8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ffBlXCvD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ffBlXCvD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258DE1F00A3E;
	Wed,  2 Sep 2026 18:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788372955;
	bh=BMWD0gPupHEMRzmxB+WAkIU8vBO5MAFeNgHfEk3JuWs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ffBlXCvDTXKMJPJbyXZAuAJdwO9nUToBZcOrXT2QUZB8u7vMShkXaS2xQuUpa6uv1
	 7eAOV5BowtBnxrYdGlz5sidtFFER5+AkInOY/vymJfNPscHESiwUYtK38O3ETbhVJ7
	 vFGGZct4VmwCHxKTCjDzlO8Qvjc12sfp9MKo6k+fdvDD7cptOuaScNsTqsuOP41OAJ
	 jkwUd68qO2fxnZVGtg9iAp4lewH/t6BpnAbpkBVU+I6fiBkD6M8Z/t/eVZDZGVIpC5
	 I3hd4nmYAO5eTcXAqTtPAPiljL8LMBKl1/KKKu4NUDqszj/o670f033qIpAwCve31L
	 tKG97P20VHRlg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 06/12] leds: turris-omnia: Implement offloaded()
 trigger callback and declare hw_control_trigger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260902-leds-trigger-hw-changed-v6-6-55693cd78877@rong.moe>
References: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
 <20260902-leds-trigger-hw-changed-v6-6-55693cd78877@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 18:15:54 +0000
Message-Id: <20260902181555.258DE1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The statically allocated `omnia_hw_trigger` object is registered m=
ultiple times via `devm_led_trigger_register()` on probe, causing lock and =
list corruption if multiple driver instances are bound.
--

commit 836486b7bf6dc3bf19d25d5b547db0edd0d638af
Author: Rong Zhang <i@rong.moe>

leds: turris-omnia: Implement offloaded() trigger callback and declare hw_c=
ontrol_trigger
   =20
This commit implements the offloaded() callback for the omnia-mcu hardware
control trigger, returning true to reflect its state. It also declares it as
a hardware control trigger in the class device during registration.

> diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-=
omnia.c
> index ed6a47bbb44f9..32d40d176d3f1 100644
> --- a/drivers/leds/leds-turris-omnia.c
> +++ b/drivers/leds/leds-turris-omnia.c
[ ... ]
> @@ -195,10 +195,16 @@ static void omnia_hwtrig_deactivate(struct led_clas=
sdev *cdev)
>  			err);
>  }
> =20
> +static bool omnia_hwtrig_offloaded(struct led_classdev *cdev)
> +{
> +	return true;
> +}
> +
>  static struct led_trigger omnia_hw_trigger =3D {
>  	.name		=3D "omnia-mcu",
>  	.activate	=3D omnia_hwtrig_activate,
>  	.deactivate	=3D omnia_hwtrig_deactivate,
> +	.offloaded	=3D omnia_hwtrig_offloaded,
>  	.trigger_type	=3D &omnia_hw_trigger_type,
>  };

[Severity: High]
This is a pre-existing issue, but does this statically allocated singleton
trigger cause list corruption if multiple driver instances are bound?

If a user manually binds a second device instance to the leds-turris-omnia
driver via the sysfs bind interface (or multiple I2C devices probe),
devm_led_trigger_register() in omnia_leds_probe() will be called again with
this exact same statically allocated omnia_hw_trigger structure pointer.

In drivers/leds/led-triggers.c:led_trigger_register(), the core initializes
the lock and list head before checking for duplicate registrations:

    spin_lock_init(&trig->leddev_list_lock);
    INIT_LIST_HEAD(&trig->led_cdevs);

Wouldn't this blindly overwrite the active lock and list state of the
trigger, destroying the lock state while another CPU is iterating and
unlinking any already-registered LEDs, leading to a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-leds-trigg=
er-hw-changed-v6-0-55693cd78877@rong.moe?part=3D6

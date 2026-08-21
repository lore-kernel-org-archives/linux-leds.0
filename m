Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A363D2F7EE1
	for <linux-leds@vger.kernel.org>; Fri, 21 Aug 2026 17:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787333258; cv=none; b=Yz7scxihYVbK00D0Ltmc6RF94Rv01ZXWK7yJZUZqt6uCIQdkfJmZkdU+rlA0oSlNAmOG5n2VROXpfdVXlmN8Vj9vECRgY/PQ9dRF6cCDqgKzLEh7rPMuUkz9wt5fTC55IhU2QAfG4gr69ZWhAbnxviFZfh1l9a3ywcMk33sRdWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787333258; c=relaxed/simple;
	bh=afgychTw/lyP1v8U6Rop3qvHanTFgINwlfQuj6fT7ME=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rdPzcGeeD9pgxk8CdPTOCDDfoGd+QSfq7JhEoa7vZgHQiBzLx5JuiW/iYYgbNbt0frZxUW/ds2E5y4prJdmV4XWOJ6vpJfuquu2Lr/oewGYKRcHj3/Z+yHB47gB8gUaPQWZqz/QMfqNZmRAX1VtoAlRrQH3Sg+djbNjMradXLIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZrU7c9Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZrU7c9Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287FC1F00A3A;
	Fri, 21 Aug 2026 17:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787333257;
	bh=4ebegaV13dh/SCJmLv2QeWAXSCd5EiJwBfT78X+WgyA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZZrU7c9Ysiy5pjVrJwC+z1wfuQEVA7kiFIGNXfeOosBW523YvrEiXZh/zYVbEdpNs
	 MH7fBRBCmAEXQT+1qAp/QC2JzjSVCgRnZnpxzhnoN6114tMPMsRH3w2AZSip0/9gwj
	 lsuSGFF2eLKAmUpyFmSZpTbFVC2M1pRx1x4YIwR+cb4Qzqa54LopwcsixSO/Ez6HSG
	 htXfo68Go0q7ogkwmi8LvqyfVxB8sux05yPjp/7lM7xO5lLR8PT7eKVIYcAAcvjF1m
	 2YMHovUeJGnDC3fjV25pXgPgIDudhKw8Cvj2gvfRAMNjTSZQDDNmkV+qSYtyr3T3FS
	 LLP7DvPqD9aJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 05/12] leds: turris-omnia: Implement offloaded()
 trigger callback and declare hw_control_trigger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260821-leds-trigger-hw-changed-v5-5-3e00d6c4a936@rong.moe>
References: <20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe>
 <20260821-leds-trigger-hw-changed-v5-5-3e00d6c4a936@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 17:27:36 +0000
Message-Id: <20260821172737.287FC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The statically allocated `omnia_hw_trigger` object is registered m=
ultiple times via `devm_led_trigger_register()` on probe if multiple driver=
 instances are bound, causing lock and list corruption.
--

--- Patch [5]: [PATCH v5 05/12] leds: turris-omnia: Implement offloaded() t=
rigger callback and declare hw_control_trigger ---
commit f8e07428579f0c7761609a5c572f8b597a213a09
Author: Rong Zhang <i@rong.moe>

leds: turris-omnia: Implement offloaded() trigger callback and declare hw_c=
ontrol_trigger

"omnia-mcu" is a private hardware control trigger which always stays in
hardware control mode. Implement offloaded() callback with its return
value to be always true to reflect this.

> diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-=
omnia.c
> index ed6a47bbb44f9..32d40d176d3f1 100644
> --- a/drivers/leds/leds-turris-omnia.c
> +++ b/drivers/leds/leds-turris-omnia.c
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
This isn't a bug introduced by this patch, but does using a statically
allocated global trigger structure risk lock and list corruption?

If multiple instances of the driver are bound (for example, via I2C
`new_device` sysfs bindings), `omnia_leds_probe()` will call
`devm_led_trigger_register()` multiple times using this shared
`omnia_hw_trigger` object:

omnia_leds_probe()
    devm_led_trigger_register(dev, &omnia_hw_trigger)

Inside the core `led_trigger_register()` function, `spin_lock_init()` and
`INIT_LIST_HEAD()` are called unconditionally before checking if the trigger
name already exists. As a result, the second probe call will silently
re-initialize the active spinlock and reset the list head of the first
instance's trigger, which could lead to a kernel panic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-leds-trigg=
er-hw-changed-v5-0-3e00d6c4a936@rong.moe?part=3D5

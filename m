Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ACA233926
	for <linux-leds@vger.kernel.org>; Sun,  2 Aug 2026 17:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785691907; cv=none; b=FwLU0OMqKa+H1hFAQtxr8IqmibkaDxUz77vI5G37qogUyG1MBvszw/3lhaVOmGHjJMo3WCbeQWD13EgyDR/DB0Pry7300LHyAFmweF/WXVRy9gIkhZE6V7T5+IdBwHMKu8DoLi0192T5J15CBFYC+T4GttzZBHslCkMLQXk5cuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785691907; c=relaxed/simple;
	bh=BgcBSnaRpSKAyWWMtPUrQCayHwhJebTYu5JtZMuNvhQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NGGI+04i9pW3QxXbZYXoMBkURFIeotqGv75RV7YHRbqD4KHYMFhYqzUXCVsbLw5b7oNRwm5fx3gRA19vPJPaAIObGW7oBFQGekoJhji3jJxvh29rY6uASfAKEmnBgyRHnevtCf7zfrVMaJUsmUxTe5jPahPbYjsZO6p2xKL9h/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RL7eOt7h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RL7eOt7h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22AB71F00A3A;
	Sun,  2 Aug 2026 17:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785691906;
	bh=+a/zmVFkc5y/ctb7Y3/dwNWjQ8zkGQ4KLsJhgw3XnsQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RL7eOt7h65FjnL8zelpj996iPs2g5TzHivjRqHxXy0Qt4wpThQE9EeuhxFyyXJLbi
	 /PyfNvRp7TAwm5JknoGzhFf/prdgt6C2DFSdAe9m37yy5vqSbzffDg0HUyEU5DzJ8s
	 PVRkwafirNeZY8xPy185llqZJ/AzNercBGrpM7iUpqNXfUoJpsEzrFDWwDok1lV4bz
	 +1SV8aMnIvPlqgJJvU0u48fMbcvpaN98bx3+xol3FlZEAsTGWJybkxLcW9J9NwjIwc
	 a3MdeqU0ilpbI+6Fg7FfVsaq7ZHQz5yjFF2wHPZvhv215O4v/ytEhPfoZnrlUhDdIv
	 PjKcx4cCLKvvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/12] leds: turris-omnia: Implement offloaded()
 trigger callback and declare hw_control_trigger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260802-leds-trigger-hw-changed-v4-5-f97e2ca976fe@rong.moe>
References: <20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe>
 <20260802-leds-trigger-hw-changed-v4-5-f97e2ca976fe@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 17:31:45 +0000
Message-Id: <20260802173146.22AB71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Registering a globally shared static trigger via `devm_led_trigger=
_register()` corrupts internal trigger lists when multiple instances probe.
--

--- Patch [5]: [PATCH v4 05/12] leds: turris-omnia: Implement offloaded() t=
rigger callback and declare hw_control_trigger ---
commit 258c3687f19ed5315a5258f70ed410cbdb5b243c
Author: Rong Zhang <i@rong.moe>

leds: turris-omnia: Implement offloaded() trigger callback and declare hw_c=
ontrol_trigger

The omnia-mcu trigger always stays in hardware control mode. This commit
implements the offloaded() callback to always return true and declares it
as a hardware control trigger.

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

[Severity: High]
This is a pre-existing issue, but could this statically allocated global
trigger lead to list corruption when multiple instances of the device probe?

If a second instance of the device is bound (e.g., via sysfs new_device or a
DT overlay), omnia_leds_probe() will call devm_led_trigger_register() again
on this same global omnia_hw_trigger structure.

In led_trigger_register(), the core unconditionally executes
INIT_LIST_HEAD(&trig->led_cdevs) and spin_lock_init(&trig->leddev_list_lock)
before checking for duplicate trigger names and returning -EEXIST.

Because the same global structure is passed, this resets the list head of t=
he
first, active instance, stranding the currently attached LEDs.

Subsequent attempts to unregister the first device or trigger events will t=
hen
operate on a corrupted linked list, potentially causing a kernel oops.

>  	.activate	=3D omnia_hwtrig_activate,
>  	.deactivate	=3D omnia_hwtrig_deactivate,
> +	.offloaded	=3D omnia_hwtrig_offloaded,
>  	.trigger_type	=3D &omnia_hw_trigger_type,
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-leds-trigg=
er-hw-changed-v4-0-f97e2ca976fe@rong.moe?part=3D5

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18A649C4D5;
	Wed,  2 Sep 2026 12:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353036; cv=none; b=tnhMF9yEYBVEoiaTn/oDEVBu1Vl9hXzikVtK+vfBa3clNoBl2do2uhVV6Zv4XrXW70Xf+TKRKz/SZ4YuZCcMpr7cIa4o/pPraLoMjtDWN9nq3F2qSsYsyE8Pb4AYCiTZdyEtO0PWwgjJ3nh/SK5cR6hZtf+8uyDHsaN00OH+HBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353036; c=relaxed/simple;
	bh=ohplCGQNf3Soc/5a1Jw4+PkywueX3S28yHWZjsUkHPI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TiGfqdJx/yAJIyx3IFwPSPugD9qKh5d4exV9KTy7Gt083rE48jOLjl9PdIwu/rMfYYT2lSk8C7wI6Z4XXMxJHyc8ormlQz6O1OT7ygu2nXzBN4t94BbMaLg4cCoPQKTv9PjYJ5iMtRHU5qU1Vd7LZAlpgNEeA1wJzHhkDJaUUwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oPUAmGHT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oPUAmGHT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33FB1F00A3A;
	Wed,  2 Sep 2026 12:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788353034;
	bh=xqoR3OegmE92tcSUI06tPZM7Vii3gRlmtM6fh/Y623A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oPUAmGHT09/pO1yjrwyl1rqfKSypfniXwtdNvETwki9mh+OBaVFFmppWELqxGHqej
	 J3eWANYoVeLMoTXSfPfENn+Tu5OwPom1rmzU+J1t37E87QShxqVSm4qXj0HpOOvA35
	 Y+ugoY9GV2WANe9lX/cRwFCIVQfIcYVFH0fIPS+k9TsfVhnMjvYIwfwIo7gxINQKx9
	 3YYqMkyHsl1kqR704Bbs8kV300z0TEweQ5GgZRxkNlgGHbJuo+ylsofSHndGaexXke
	 lmKD/mYNg9bwy5w2tyePTdZEPDD/2eiVKqALYS2Oh2FtUIGxM1lUWw6gFnI0PGcPc4
	 4eCIsj6mgTN7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/7] leds: pca995x: add support for group brightness
 control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <225583885966f45079a7dafdbc2b1c419a25fa4b.1788350618.git.nora.schiffer@ew.tq-group.com>
References: <6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com>
 <225583885966f45079a7dafdbc2b1c419a25fa4b.1788350618.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 12:43:53 +0000
Message-Id: <20260902124353.F33FB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Missing explicit initialization of GRPPWM and MODE2 registers ma=
kes LED brightness dependent on undefined hardware states.
- [Low] The commit message description is not capitalized, violating LED su=
bsystem naming conventions.
- [Low] has_errors_store uses strcmp() instead of sysfs_streq() to parse sy=
sfs input, rejecting valid inputs without a newline.
--

commit 2816a66784d3fbb95bdf9b79d38d26cc4f4d0d96
Author: Nora Schiffer <nora.schiffer@ew.tq-group.com>

leds: pca995x: add support for group brightness control

This commit introduces group brightness control for PCA995x LEDs. It sets
the LEDs to group PWM mode, enabling global group PWM settings to modulate
individual brightness. It also adds a sysfs attribute for group brightness
and removes the non-group PWM setting.

> leds: pca995x: add support for group brightness control

[Severity: Low]
This isn't a bug, but does the commit message subject line violate the LED
subsystem naming conventions?  Should the description after the subsystem
prefix be capitalized, such as "leds: pca995x: Add support for group
brightness control"?

> diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
> index 62f2764661b9d..d65c33edc83ab 100644
> --- a/drivers/leds/leds-pca995x.c
> +++ b/drivers/leds/leds-pca995x.c

[ ... ]

> @@ -110,11 +115,10 @@ static int pca995x_brightness_set(struct led_classd=
ev *led_cdev,
> =20
>  	/*
>  	 * Change LDRx configuration to individual brightness via PWM.
> -	 * LED will stop blinking if it's doing so.
>  	 */
>  	return regmap_update_bits(chip->regmap, ledout_addr,
>  				  PCA995X_LDRX_MASK << shift,
> -				  PCA995X_LED_PWM_MODE << shift);
> +				  PCA995X_LED_PWM_MODE_GRP << shift);
>  }

[Severity: Medium]
Does this change make the LED brightness depend on undefined hardware state=
s?

Without explicit initialization of the GRPPWM and MODE2 registers during
pca995x_probe(), a system without a reset GPIO might leave the PCA995x in an
unexpected state during a warm reboot.

If the driver loads and configures the LEDs into PCA995X_LED_PWM_MODE_GRP
while the registers aren't at their default values (GRPPWM=3D255 and
MODE2=3Ddimming), will this cause incorrect behavior such as LEDs blinking =
or
remaining off instead of turning on dimly?

[ ... ]

> @@ -186,10 +190,41 @@ static ssize_t has_errors_store(struct device *dev,=
 struct device_attribute *att
>  	return ret ?: count;
>  }

[Severity: Low]
Is the parsing logic in has_errors_store() overly strict?

It currently uses strcmp(buf, "clear\n"), which rejects valid userspace
commands like 'echo -n clear' because they lack a trailing newline.  Would =
it
be better to use sysfs_streq() instead to handle inputs both with and witho=
ut
a newline?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/6d3600f99c77c31166f=
0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com?part=3D7

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4278C37F74C
	for <linux-leds@vger.kernel.org>; Fri, 21 Aug 2026 17:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787333262; cv=none; b=qSIzzZWKJ1HAlMPSG/wH9NBZTe788GQQ8MVMwvw3lDQMGpmaXfxN4KEX5qJBw9YcZ3usNNsAkaMVZOpj4Xe/zrpcs7k2yC41HoF5dUzpdpFrHMF5K/aRQMt76UnYm81JheTJaemq5G4bLvTn9JiumWZbEOb5RCwi44axczfQp/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787333262; c=relaxed/simple;
	bh=dWruPgdvnwedb+jI6p9/bZix1A3bzo/t1ZtIee/ZPbE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nbKGMuRTfcWi+g+Drt9EB992Jf9OKL5YptKmheYKoQ3uCGEFgB0dSzsrs8J45wWC05EhUhMXZAgC0Vgxjm+XhSJLr3py9Ap8jbBDqEOgQ4JHtlZffskBBwTzHCgkppYMKbCXc78MBz1Yqgq1x7YeTmEtXmbOTEEQwzDO4EVD6sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tm3rTGhe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tm3rTGhe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 010471F00A3D;
	Fri, 21 Aug 2026 17:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787333261;
	bh=iUC8IYCjCt676pap/1d5tfcD+uGx3JCFx06H9itg4lc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tm3rTGheetG6cAcZoHz+lbWzedHjQoblOkqsm0oQ4NSIJBalxD0Y7E348gYyRz4e5
	 zSgKxgKGrf35kL3SeYGUtKJ9iSiC/jcLuiwiXRYK0x5jF4TD5bc8atY4cR0q7pG94G
	 e6Rh/W3a/OeAAcG+hGVm4K1LmEGrPQXsETXF9e5Arr+pV/FQ59Js61WEk3yivXAJbU
	 85T1D82GD0M7ZqjYI80On33UTiC2R2hn1IF69h1+kMjaZBWD/Zx95KxeDcs4nge6lo
	 +dwJCIzhVFDZt6SuPJyhj1ZXJvvzjXjGCYhJIdGOzDEQSBkHAQuTdKdAmJ954xt8WW
	 R2dP5FlpVxklg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 10/12] platform/x86: ideapad-laptop: Decouple
 hardware & classdev brightness for keyboard backlight
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260821-leds-trigger-hw-changed-v5-10-3e00d6c4a936@rong.moe>
References: <20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe>
 <20260821-leds-trigger-hw-changed-v5-10-3e00d6c4a936@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 17:27:40 +0000
Message-Id: <20260821172741.010471F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The conversion of `last_hw_brightness` to an `atomic_t` fails to p=
revent a TOCTOU (Time-Of-Check to Time-Of-Use) race condition between ACPI =
notifications and sysfs brightness writes, violating core kernel locking ru=
les.
--

--- Patch [10]: [PATCH v5 10/12] platform/x86: ideapad-laptop: Decouple har=
dware & classdev brightness for keyboard backlight ---
commit b73007a6498db545468f511c09a496e09dfcac31
Author: Rong Zhang <i@rong.moe>

platform/x86: ideapad-laptop: Decouple hardware & classdev brightness for k=
eyboard backlight

This commit decouples hardware brightness from LED classdev brightness for
the keyboard backlight. It also converts last_hw_brightness into an atomic_t
to help prevent potential race conditions.

> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platf=
orm/x86/lenovo/ideapad-laptop.c
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
[ ... ]
> @@ -1637,32 +1676,37 @@ static enum led_brightness ideapad_kbd_bl_led_cde=
v_brightness_get(struct led_cla
>  	return ideapad_kbd_bl_brightness_get(priv);
>  }
> =20
> -static int ideapad_kbd_bl_brightness_set(struct ideapad_private *priv, u=
nsigned int brightness)
> +static int ideapad_kbd_bl_hw_brightness_set(struct ideapad_private *priv=
, int hw_brightness)
>  {
[ ... ]
>  	if (err)
>  		return err;
> =20
> -	priv->kbd_bl.last_brightness =3D brightness;
> +	atomic_set(&priv->kbd_bl.last_hw_brightness, hw_brightness);
> =20
>  	return 0;
>  }
[ ... ]
> @@ -1673,26 +1717,29 @@ static int ideapad_kbd_bl_led_cdev_brightness_set=
(struct led_classdev *led_cdev,
> =20
>  static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
>  {
> -	int brightness;
> +	int hw_brightness, brightness, last_hw_brightness;
> =20
>  	if (!priv->kbd_bl.initialized)
>  		return;
> =20
> -	brightness =3D ideapad_kbd_bl_brightness_get(priv);
> -	if (brightness < 0)
> +	hw_brightness =3D ideapad_kbd_bl_hw_brightness_get(priv);
> +	if (hw_brightness < 0)
>  		return;
> =20
> -	if (brightness =3D=3D priv->kbd_bl.last_brightness)
> -		return;
> +	brightness =3D ideapad_kbd_bl_brightness_parse(priv, hw_brightness);
> +	if (brightness < 0)
> +		return; /* Reject insane values early. */
> =20
> -	priv->kbd_bl.last_brightness =3D brightness;
> +	last_hw_brightness =3D atomic_xchg(&priv->kbd_bl.last_hw_brightness, hw=
_brightness);

[Severity: High]
This is a pre-existing issue, but does converting last_hw_brightness to an
atomic_t fully prevent a time-of-check to time-of-use race condition here?

Since the hardware read and the atomic_xchg() are separate steps, could
the following sequence occur?

CPU1 in ideapad_kbd_bl_notify():
    hw_brightness =3D ideapad_kbd_bl_hw_brightness_get(priv);

CPU2 in ideapad_kbd_bl_hw_brightness_set() via concurrent sysfs write:
    exec_kblc(priv->adev->handle, value);
    atomic_set(&priv->kbd_bl.last_hw_brightness, hw_brightness);

CPU1 resumes in ideapad_kbd_bl_notify():
    last_hw_brightness =3D atomic_xchg(&priv->kbd_bl.last_hw_brightness, hw=
_brightness);

In this scenario, wouldn't CPU1 overwrite the software cache with a stale
hardware state, causing it to become permanently desynchronized from the
actual hardware?

Although follow-up patches in this series introduce a notif_mutex, does
the sysfs write path ever acquire this mutex to serialize these updates
properly?

> +	if (hw_brightness =3D=3D last_hw_brightness)
> +		return;
> =20
>  	led_classdev_notify_brightness_hw_changed(&priv->kbd_bl.led, brightness=
);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-leds-trigg=
er-hw-changed-v5-0-3e00d6c4a936@rong.moe?part=3D10

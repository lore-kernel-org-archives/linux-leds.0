Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70ECB38E8D3;
	Wed,  2 Sep 2026 19:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788376862; cv=pass; b=f1DiDYe2mtFG7jIiwlE6Ie51UJbpTfVBqeA4cPZPgk8Co8Wk7CF9yfYVD07YHD9KtwcLrrIIj+JFX5EoYWs2Kr11Io6c6YH3MEsOIzsUxBi6TddHv/EmbuSsqJzkvq2uyBQ1tpuOe3F62gwUQQgHyEYRAHbgSKTp6Pftt7s5Vy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788376862; c=relaxed/simple;
	bh=WB/y+I+OGXd5+lSeYRYNlG7bWuPUAsWONedA8rBrFw8=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RA5p4z5ifzFvUzhgD+4lR6y2exxlXRL84nt7qFgObfQJoR62jaaVYoTfzroVQGx+/6FBp2g1nvYyS9hflXFNDPGw196yW/7S5Ja/zl80hhWVH5aDv5agCk1RcDHq9vf3mWSyheREHAEgz4tHwD9DRFoCqGSILDjU2fcPntWSafk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=EVoDmiKm; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="EVoDmiKm"
ARC-Seal: i=1; a=rsa-sha256; t=1788376851; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AQ8WNBMN0VojsfPf8Z0tshaqVIXpwQiC43Y2Oz56G7sElqmKFfZL1JVVP1XndFHvRhG9VvqvdbVPtH0ze1SkV8qVwKC8KzRs3FVATEyIymwG9TVCeGWwz/USCd3dQp1WHzSL4BXQ8cHBf8Vm6o4IMF6p3LBSA7H12WPO4/iA1e0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788376851; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=szIh6WcIgwAVe3/omV91b4EK5M/Q077a47SuW6IWMks=; 
	b=oL0C4+En6Sjy0c27SZWf6EDPWR9FD+KqW7e9BJ6I4ffXuoTXuKVvlsTYFdpmjFZmsA2lMalk9OVohbwyZeXo31yPjdBuMoprvp081OaAWwIvvlQXUxf65V2r0POC3dNkLRxpztVXP6RZ1MEftBFYkf44GXwdVn1KPnNtpHZwIEw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788376851;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=szIh6WcIgwAVe3/omV91b4EK5M/Q077a47SuW6IWMks=;
	b=EVoDmiKmE4t3vKi3uNgVPmPXqru1GS5lO4vrJc7q2nH4y/nQu4YIu85biiuuBE4U
	JqjmDKyB7mpdmUCJROFtZWJZRj3suoctq9UQN/JxhwxSdgmCU0zhIUaLxYOv3sw/mdc
	ePZgbB27e/LwDxyUPVc53nVeXGViJh1AOZhsExIavS8vCfbHh5qNrRSylnxWgLGI9FV
	E+BkuTlzEdUiztopqrnu7TUQxgnH8i/h1V/hFe/dSKHtow+YOFK75g3JDXEiwzAj51p
	F1E3NtMxCfSe4flXKSRNCbSVKQDQrYM/Ik4wlPaVjR5EcrtS2DYoXDYinAzaHVmIzzS
	/gbwoZcMNA==
Received: by mx.zohomail.com with SMTPS id 1788376848137140.70314822538194;
	Wed, 2 Sep 2026 12:20:48 -0700 (PDT)
Message-ID: <8fd61cb314df880cd70d4fdd30642ed58af38c2b.camel@rong.moe>
Subject: Re: [PATCH v6 11/12] platform/x86: ideapad-laptop: Decouple
 hardware & classdev brightness for keyboard backlight
From: Rong Zhang <i@rong.moe>
To: lee@kernel.org, sashiko-reviews@lists.linux.dev
Cc: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	linux-leds@vger.kernel.org, platform-driver-x86
	 <platform-driver-x86@vger.kernel.org>
In-Reply-To: <20260902181558.5FAD11F000E9@smtp.kernel.org>
References: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
	 <20260902-leds-trigger-hw-changed-v6-11-55693cd78877@rong.moe>
	 <20260902181558.5FAD11F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 03:15:44 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Lee,

On Wed, 2026-09-02 at 18:15 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>=20
> New issues:
> - [Low] Incorrect format string `%d` used for `unsigned int hw_brightness=
` in `dev_warn`.

Well, let me fix it in the next revision.

>=20
> Pre-existing issues:
> - [High] The driver uses the unmanaged `led_classdev_register` API instea=
d of the managed `devm_led_classdev_register` API.

This is yet another LLM hallucination. The driver needs to manage LED
unregistration itself to coordinate with ACPI notification handling.

Sashiko's concerns on other patches in the series are either pre-existing
issues that are out of the scope of the series, or LLM hallucinations.

Lee, I believe the series is ready for your review. Could you kindly
shine some light on the series? If you decide to apply PATCH v6 1-9 to
the LED tree, I will send a v7 solely for pdx86. Otherwise I will refresh
the whole series according to your insights.

Thanks,
Rong

> --
>=20
> commit 227fca9f070999fc85599521adcec4975c6e441e
> Author: Rong Zhang <i@rong.moe>
>=20
> platform/x86: ideapad-laptop: Decouple hardware & classdev brightness for=
 keyboard backlight
>=20
> This commit decouples hardware brightness from LED classdev brightness to
> better support models with an ambient light sensor (ALS). It also introdu=
ces
> a refactor of the initialization path to prepare for exposing the auto
> brightness mode.
>=20
> > diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/pla=
tform/x86/lenovo/ideapad-laptop.c
> > index 684421ba53cbc..712999b6900df 100644
> > --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> > +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
>=20
> [ ... ]
>=20
> > @@ -1594,7 +1619,24 @@ static int ideapad_kbd_bl_check_tristate(int typ=
e)
> >  	return (type =3D=3D KBD_BL_TRISTATE) || (type =3D=3D KBD_BL_TRISTATE_=
AUTO);
> >  }
> > =20
> > -static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
> > +static int ideapad_kbd_bl_brightness_parse(struct ideapad_private *pri=
v, unsigned int hw_brightness)
> > +{
> > +	/* Off, low or high */
> > +	if (hw_brightness <=3D priv->kbd_bl.led.max_brightness)
> > +		return hw_brightness;
> > +
> > +	/* Auto (controlled by EC according to ALS), report as off */
> > +	if (priv->kbd_bl.type =3D=3D KBD_BL_TRISTATE_AUTO &&
> > +	    hw_brightness =3D=3D KBD_BL_AUTO_MODE_HW_BRIGHTNESS)
> > +		return 0;
> > +
> > +	/* Unknown value */
> > +	dev_warn(&priv->platform_device->dev,
> > +		 "Unknown keyboard backlight value: %d", hw_brightness);
>=20
> [Severity: Low]
> Does this dev_warn() use the correct format string for its argument?
> The hw_brightness variable is passed as an unsigned int, but the format
> string uses %d which expects a signed int.
>=20
> > +	return -EINVAL;
> > +}
>=20
> [ ... ]
>=20
> > @@ -1710,21 +1758,35 @@ static int ideapad_kbd_bl_init(struct ideapad_p=
rivate *priv)
> >  	if (err)
> >  		return err;
>=20
> [ ... ]
>=20
> > +	/* Reject insane values. */
> > +	err =3D ideapad_kbd_bl_brightness_parse(priv, hw_brightness);
> > +	if (err < 0)
> > +		return err;
> > +
> >  	err =3D led_classdev_register(&priv->platform_device->dev, &priv->kbd=
_bl.led);
>=20
> [Severity: High]
> This isn't a bug introduced by this patch, but should this use the manage=
d
> devm_led_classdev_register() API instead?
>=20
> The LED subsystem guidelines mandate using managed registration APIs to
> prevent resource leaks and use-after-free hazards during driver removal.
>=20
> >  	if (err)
> >  		return err;

Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67F93BFAF2
	for <linux-leds@vger.kernel.org>; Tue,  6 Oct 2026 10:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281221; cv=pass; b=JY70S4xoNOa52iSrORH00BYGy14LWYwP6SAdM0FZqOxWyfDr9WlPG7S/nUEW8cF85QjWeML9qCP3Ra0T4CYRTp/Asc5U0gBZ0O2vbkYTKXJ8V8OvLsQ+QqYllG9EsUC9bk1F9S/iJZdeH24uiY38OZWrB6OW0P51HZoZ43cHUu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281221; c=relaxed/simple;
	bh=jXoCJSmZrRsEtjPvzR6W3LtMbjIzm96pCRvUzmkQjw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mxti4sO4AClEtvqkvBghX20dM2NTJHZO3UJvITMTxySvDRzTa0T8JMTpZVLANBwEmT/kg5QQMtbnBesGyWdrozcC6F2+tSAKbrKKhaIdofvl7tZ9PlFCXMlXzVbsK0VUVOWKC6VWy13stnrOsJxixIP6qmNwsE9FzDIKq8jIt+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQvktCp8; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQvktCp8"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3514e7cbbbaso547280eec.1
        for <linux-leds@vger.kernel.org>; Tue, 06 Oct 2026 03:06:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791281219; cv=none;
        d=google.com; s=arc-20260327;
        b=i0Gvy+jmJrIG+NmufDQp9OXVzsYSe+coR8ZqlabRQcFPtVqeb4XPxoA8+3zQFusg1B
         agIQEJaVKKwJt4mga1KDwpHEue8PN5b/ORbmWd2mjxtRZBDV+tb3aYU5dWiYYr3fFiY+
         pWqkmszRCVnJOpK6m/F3LbMzHRCTs6Xwdw2cI+GCCCvt26fYP3z85VGBtdY9Ry1LB6qi
         UUP9k4MhYAqaqcSv6OVDkV9faIVOwR73i8OeZhpDwY/FBN1WT3zqrKUTAKEHUB/iKGl9
         lhiiKrkKZiLjLuiHPSGnhnPThpJN2q5EN4Plfo1Hdyc8gFKq9zwGJlTMkjKThX2bxWRW
         AlLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6NBVbMbxanh8syK4XzpA91skjBSLQAwKVvNkTlGCE98=;
        fh=V9E31vDKhFdhWaOqfuxw6E4iIiOV2M33lB1qCrLoj6M=;
        b=YGbAjXxKLqNnsfTGGg2nHpZH6wO4Z8DqFjcQvt42OI/oB6iYHkcgI4plMKiZTuFG1H
         LvJJz59E00phXzpYs0zn8vRZ5Y043NL8vKtM3zIYY8BXM6mf8PwCIIP/vFkk67bPEbp8
         QqaEYx/fybHyVyTqO4VEj0KJ38MU7/B2URallq4l0Gu2hDFTgL8GRDMX/zyrDymT0PgC
         gkGYNAJMoUv7FhEvQOXZ+/f2uWa5XL0jzEFLpLTXTUqCLrXFY3gaqdD3XdxuOTDaSRnw
         0rqzKFswCMq7YgJqeHRCyCUCt1C9+tDyfQDmVS7lx001pK3tYSoyr8GTfowJZBxMl5XM
         hF9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791281219; x=1791886019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6NBVbMbxanh8syK4XzpA91skjBSLQAwKVvNkTlGCE98=;
        b=NQvktCp8eEOXlgz+kjY7UmNhYqTf65ja4qKCDyllIKb58fSr4ZdIiBp39imPIIKEAM
         +zbscR9PG+akcAyWbw5+NtFT/UG/2SXz/b0qJtNrgT/vOQjqyh3DOh7gzfycr6d56T69
         Zy7V1AJe8Sy5wQkqmE+5fGgjpAjsRG3ul6sVyVrhbfdJXCgyEaPdKGXNCEJVb9Ti8TMh
         b2d+WXnjzoKpmbb8XpWrhvmNMwijSNYxMpYAvr5h8xk6qvWoh6Il9FVd60VQnRwg9Zs4
         2DWCkNHylDfGFw266DXaY+uy/D9Wo94FZz5LZkn/W6OJk1v6+he0ya8LEWD5Z8uiOzMF
         LGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281219; x=1791886019;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6NBVbMbxanh8syK4XzpA91skjBSLQAwKVvNkTlGCE98=;
        b=RcnNEG1wpIKUFEXKgq3KaqvidqVHORb8A+TjSRE6jl5oarVZnPmZOLAyFQOvnradHG
         Toe5XLqsnrfSPv3IMaq/wSVdZ51wZo9EyLGU6KKjCNlX4IszrEJULtlH5LMFjKP1NUsk
         SCSrM49pH6GtKQiMeqb/iVxo0ra9r6lvvmPHu6lW3ttRpqLNWZgsREOFh5O71nrhanFy
         pKpMe5xQjF1j+LVxMXcAM4jF9Jyt1m69oMiKYBTzHh/uwa257dTEDc9uNqv8V9FfSucZ
         18MkFSSnqQ0jAgusj7CejF7stlgajaqhUs14p7Pud+sZJJaFah7vpgmOJy6Ro+lxpCgy
         01tg==
X-Forwarded-Encrypted: i=1; AKwUvBxiEGubOLwZ5sqPCltfH6/PAiLnIvobDj0FckwGjCJDpVEHPb2Z1PQxgNMv5jyNhOT9x0IRJmW0Sfkd@vger.kernel.org
X-Gm-Message-State: AFq9FYJO/R71nFTEseQFLcx4WUg4zad03goG66MH1jaFbyVZo37oOo3l
	SqFYoNd5dTdA2V9B17AhYY8HQROCYZbN2kIs6IPCCl1vqMqm5rELDUSsX8v1lnxYc3DvnNxmZmb
	Z8CUjr4+FuKY216Gp4k8ER8QKZeb9XZE=
X-Gm-Gg: AYBFou2u4KiFvujVxaKt+x/u66IpgTPbiyvW2knxyUYE2k8d9s2tEkMNTEkur+WLrAR
	d60UM4EvTOh/aIwPxzU07JpGiTZTuBK4femVWONHVIBRskMgfS4OPb6OAsYzsjtcoaACr5yifH5
	s3cyXCxHjn9uX/nT4OC2N/F+YROH9Mskc5V/6iimL6VKJGWAp3RSdgx5Qih1U17v70PT62i18Ns
	RBLp/x6Eopb+0ANpqfEpOMK73Y9/wSm2oWcADMkL0/fTl23y4bB+Jw5IwFUIA+36tyKldMMSmi9
	MBsnC0GMMAcxop8KfEPQ2aXBbr7fjacanhf+hWOkpopLBTQKfZJ4JRhBrDvztFqCfc2DauOWFru
	pCZF/OQ8zb87JMHAjgt7PkOE=
X-Received: by 2002:a05:7300:fe83:b0:34d:2c1a:9881 with SMTP id
 5a478bee46e88-3514e2e4731mr1077709eec.36.1791281218726; Tue, 06 Oct 2026
 03:06:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004164121.193514-1-clamor95@gmail.com> <20261004164121.193514-3-clamor95@gmail.com>
 <asPVmbvyslGgEsjk@aspen.lan> <CAPVz0n29+1yOO0i057RdpUAu+z85hhnm9GGaHkqgf5XW1SPfeQ@mail.gmail.com>
 <asTBp2RPPvsD4AsU@aspen.lan>
In-Reply-To: <asTBp2RPPvsD4AsU@aspen.lan>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 6 Oct 2026 13:06:47 +0300
X-Gm-Features: AclHuK9B4BcbljbuUp4qHu8_KC4fu9LyfN3Q8g8blEUDDcIte_SIuNY9L1q_5iI
Message-ID: <CAPVz0n1PMxOoHMJ3viKa-e3=tjZ6AtzffjnHE9kCFrz1tjezOw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mfd: aat2870: Convert to use OF bindings
To: Daniel Thompson <danielt@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 6 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 12:38=
 Daniel Thompson <danielt@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Oct 05, 2026 at 08:18:31PM +0300, Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 5 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 1=
9:51 Daniel Thompson <danielt@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sun, Oct 04, 2026 at 07:41:20PM +0300, Svyatoslav Ryhel wrote:
> > > > Conversion of the AAT2870 driver to use OF bindings requires a few =
complex
> > > > changes that should be done simultaneously.
> > > >
> > > > The AAT2870 essentially provides two functions via child devices:
> > > > backlight and regulators. Both functions are fairly self-sufficient=
 and
> > > > may not be populated on the final board. Consequently, the MFD
> > > > registration API was replaced with of_platform_populate(), and each
> > > > sub-device was given its own compatible string.
> > > >
> > > > Additionally, aat2870-core utilizes an enable GPIO. Obtaining this =
GPIO
> > > > was converted to use modern gpiod/OF helpers, allowing the redundan=
t
> > > > aat2870_enable() and aat2870_disable() helpers to be removed.
> > > >
> > > > The aat2870-regulator driver was updated to register each of the fo=
ur LDOs
> > > > from a dedicated OF node.
> > > >
> > > > The aat2870-backlight driver was changed to populate all required
> > > > properties from a dedicated Device Tree node. Its channel map was u=
pdated
> > > > to use u8 instead of int. Furthermore, because the maximum current =
is now
> > > > parsed as an absolute value rather than an enum entry, the calculat=
ion and
> > > > application of the maximum current were updated accordingly.
> > > >
> > > > All of the changes above allow platform data to be removed entirely=
.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/mfd/aat2870-core.c            | 115 ++++++----------------=
----
> > > >  drivers/regulator/aat2870-regulator.c |  76 ++++++++++++-----
> > > >  drivers/video/backlight/aat2870_bl.c  |  55 ++++++------
> > > >  include/linux/mfd/aat2870.h           |  95 +--------------------
> > > >  4 files changed, 111 insertions(+), 230 deletions(-)
> > > >
> > > > [snip]
> > > >
> > > > diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/b=
acklight/aat2870_bl.c
> > > > index 8b790df1e842b..933a8f728f66a 100644
> > > > --- a/drivers/video/backlight/aat2870_bl.c
> > > > +++ b/drivers/video/backlight/aat2870_bl.c
> > > > @@ -15,11 +15,19 @@
> > > >  #include <linux/backlight.h>
> > > >  #include <linux/mfd/aat2870.h>
> > > >
> > > > +/* Backlight has 8 channels, each bit represents one channel */
> > > > +#define AAT2870_BL_CH_ALL    0xff
> > > > +
> > > > +/* Backlight current magnitude (uA), 450uA current is eq to 0 */
> > > > +#define AAT2870_CURRENT_MIN  450
> > > > +#define AAT2870_CURRENT_MAX  27900
> > > > +#define AAT2870_CURRENT_STEP 900
> > > > +
> > > >  struct aat2870_bl_driver_data {
> > > >       struct platform_device *pdev;
> > > >       struct backlight_device *bd;
> > > >
> > > > -     int channels;
> > > > +     u8 channels;
> > > >       int max_current;
> > > >       int brightness; /* current brightness */
> > > >  };
> > > > @@ -30,7 +38,7 @@ static inline int aat2870_brightness(struct aat28=
70_bl_driver_data *aat2870_bl,
> > > >       struct backlight_device *bd =3D aat2870_bl->bd;
> > > >       int val;
> > > >
> > > > -     val =3D brightness * (aat2870_bl->max_current - 1);
> > > > +     val =3D brightness * aat2870_bl->max_current;
> > > >       val /=3D bd->props.max_brightness;
> > >
> > > What is the purpose of max_brightness?
> > >
> > > Normally it is used to limit brightness but max_current is already do=
ing
> > > that. Is it just being used to reduce the number of steps in the
> > > brightness scale (and if so, why is that useful)?
> > >
> >
> > This is the original driver behavior; I did not modify it.
>
> I can see that but the parameters for these (rather dubious) previous
> behaviours are now being copied into the devicetree bindings where they
> become stable ABI.
>
>
> > The AAT2870 backlight intensity is regulated by the Main Backlight
> > Current Magnitude register. It has 31 steps from 450uA (0) to 27.9mA
> > (31), so even setting max_current to 0 will not disable the backlight.
> > The max current value may be limited for some configurations, which is
> > why this property exists.
> >
> > The max_brightness property determines the maximum number of steps the
> > backlight can have and is mapped to the available current range
> > provided by the hardware. The backlight is controlled in steps, not in
> > uA.
>
> This behaviour does not match the devicetree bindings documentation for
> max-brightness:
>
>   Normally the maximum brightness is determined by the hardware and this
>   property is not required. This property is used to put a software limit
>   on the brightness apart from what the driver says, as it could happen
>   that a LED can be made so bright that it gets damaged or causes damage
>   due to restrictions in a specific system, such as mounting conditions.
>
> Hence the question, why is the current behaviour useful?
>
> If I understand your summary correctly the hardware has 32 steps
> including 0) and the effect of max_current is to ban all brightness
> values greater than max_current / AAT2870_CURRENT_STEP.
>
> If that is the case then max_brightness if fundamentally broken because
> it's default value offers more steps than exists in the hardware.
> bd->props.max_brightness should be set to max_current /
> AAT2870_CURRENT_STEP and the whole of aat2870_brightness() should be
> removed (use backlight_get_brightness() instead).
>
> IMHO the patchset will be cleaner if the weird max_brightness logic is
> removed in a separate before doing the DT changes.
>

Noted, I will see what I can do. Thank you.

>
> Daniel.

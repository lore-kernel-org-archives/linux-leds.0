Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421717;
	b=wj7ldhW78nVe8xaDInE6S2cpWVHT3rdFAYTpOs7Bo3wlU6T4RaP+n6l9gQtJbF9Wm7Gl
	 ipw1FL96lJBpF6mSOdqggrn7sERfcF5pj/SQj/OdsP57pE0Cwnf1L7FLn+VIKqO8vvYpI
	 RtAgKcnjkHaqTB9yFEsKGi6L4kCcBjZ5lN1koCgEOWKXsTCb5bjC8Dt6iw837kBtCUELL
	 uj2BxQvJ6AhYfOtiP7Jn+BgRGBI2MABwEmv0T7qUDS82/KaFRq3TZVpC62PAG/xKzikRB
	 CHx3IGc9Y1mHctMSEOLqocnuhGISKXghaUQxNmpIx3he8W5iDBwSwTlPWr5i348wNgA==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421717;
	h=Received:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1JVa4anZLJXOQzT6DdFCFiAtwNU6Km/IK3O7kS1gknE=;
	b=bFcspDvSsYaG7THOsdJA7CwCvakysjst4CvonVsLTE0TGa90u7zOsqTWj8sHFPw/XFI4
	 dsx2e+dm5gMOijq/diHgf0ZcstIacO2A6IYKLgHIXMA+LiRKMDiEm/qe811cq2SzK5SIl
	 nZldfXvIF//X8LjTV8Aoobm0C63Tvh0tlp3PFyBfGRZ94AWIVKDZRslV5hne1WCWCXeyP
	 DiyIHYWWqhsM5ge5/SflIXGkKzsJoJClEmPT0mLdM1sFKmkBM2q/8AlTGFI4RovgB0WTI
	 Qm3qNWDzfsLY1KfO2QL7PJvPPBbOL5h2Wo18ARidRhHHsPlbVjYnl/8TrjodkSetPdg==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IOaySC7U;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E634606EFFB
	for <linux-leds.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IOaySC7U
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F2338422E
	for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 14:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421717; cv=pass; b=BvN3Z1BweA81bCQn+4mOJjWz7sTkeuEHnKcXl7aHNVXMF5UjYvkTcVb/lyswflb1VLey/fSq1BmOWVxHgwpSW5mDsyAA+banR51y3OZd5wpPUt+LyTAb6WmVhc2iDsvb/8Y5Evv1k322kX4NTuzkvw1ixP5ueJ/dTK1v5V1jKU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421717; c=relaxed/simple;
	bh=AKW3t68ZOk81dPuxPw32ZX6gYuPNE52T8jj7L1+y7RM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZRGGZo9PiLQePBLqtTYBpqrsSIuHkzXWLhQc3d7e2+v2fmvgazMVFOBFYeL7RX/Kj/XCvocC4e0ujeiaf/UnH7x3dOoBjlCFqB1FYrrN5oBVndJFHYdba/o0c55aDvDWhySbRb23lza+n+nYsv9IHGlKkdmGQueq0VSEB9iPybQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IOaySC7U; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-17bc533fda3so2462588c88.1
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 07:55:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792421715; cv=none;
        d=google.com; s=arc-20260327;
        b=UkfgCFnRAK6OZrOxOHHTYudYWAQnK6WJhgfgsx0OzWtzvwoNit6kGguIGW9De4pcYO
         34BFrw37aJytoIhHwKdzuvfEJcbwWMocN3ySbRHI5O7TtNvNPnCY7mG8xqiOsw3GMeXS
         yhpErtLm5k4W8JyT5Bnb2nkWB8xEuyCP7SKDC8ChD1Ea2taxUTnYn5CbZQjsWgXPFOqC
         vTR+nCNO5EVoUcY6aNUS/gY5JkMZPVpTs1QWMbO3lOQgn2DHGJyh9n17mpnMLwp4v+4V
         YSN0DXQV1/ZtNgpc92J5j6nVG3WxlK5cjTTEDsA+dVDqTo59GFfHtUNKDQcA5t8BC8sS
         ooLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1JVa4anZLJXOQzT6DdFCFiAtwNU6Km/IK3O7kS1gknE=;
        fh=EUKOZHU4dRuz2BZbNv7PpqZzMG6zIOfCe+Cf1qCqgP8=;
        b=l03gGKbpI1476njwMZHezXyL6qHcD8OlkuuE4xatsNLjZST73GHrK8oJjoKZ9nln3E
         nEzUcIJqP+Eyrd/GOcJdVGsUwVkqQUI1Fp8wYlUVtIGztOUNDkbve4d4c5LXDbuJB56W
         EzZSKYtDlov+5cQIdQXUr3Zngt6vv2MI9KnIrmTL9WbL2HS3uJCLtPheKi2a2w8t+3on
         jip51j8nv9q0Hded0G/vbuVjPiEyfajb/KS4OZ/NXcClPgsMRzBi0ogWBc6DnPtwQzTc
         gQom8O1R/K4ZLjxutD8U7sAwQ8pdbew6GZajEQRb0R60DHDy7Z3KCcNyHI587VF/lpak
         fWBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792421715; x=1793026515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1JVa4anZLJXOQzT6DdFCFiAtwNU6Km/IK3O7kS1gknE=;
        b=IOaySC7U7W3uf19SUIgQObLWJ1HaLaEi8jv+lORJA1D3mjRjX/AMccUsulTefGV2X7
         LssP+DVlzVD6X7WdIIo6/p2/khhDwe0+x6Ylo3djuwxncoOMlPQCexPT9dOFbLa9nz6V
         kVEuvNC1cCl6DJlAybsPj2wGhHApWyLYxk9DPidR/P8zhVTzXr9Btl/5upVkpGurwFkZ
         jVI00O/WHa7aNmeupJ4Bo68cZlmX+mBEIkNVgy7kdJHAqb9gpQPlmOyp0mPqbzkTewFE
         azcdcRBkYIOd8SPDf4fTzO7P9QFEQg78Q61TxDUNiiFSRcuUPYnclPj+yAaGVDluFz7o
         BZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421715; x=1793026515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JVa4anZLJXOQzT6DdFCFiAtwNU6Km/IK3O7kS1gknE=;
        b=DAq2ALR3MROgwsLOkIVa7fZdyh5UhCC9JJ3s6AnffBo5TMJk1yWUHXQawVWFmMSdXl
         inYX3LcBA3V4O68EWG7K+Z0DKmTa+cHM6dzOOo5hHMteRD9/pXgfuycQIcV6a++azSoX
         eSTrc3vRconuA3gYw8zK7JTddboODZCMSNTos+ePa/ygp2Hx0nJhA9ePFw4awU8ujG0F
         Oc0pDtzedXhSk2uYWYpY0aChdQJKqaioobMQ/cooJuP1HY3T3JWsug0wWsxekFm/dsHB
         jHtph5ZOKY7N8+dVjrHryRnjC4DIffoZWXfiKsZJQK58qJxxj/Tmbe4FmLF0vTMOEBK6
         KWvg==
X-Forwarded-Encrypted: i=1; AKwUvBwxSIycoflMfENpxoWqTN9O3ePGYHlhpB+ojaSk8S599rERV5fPim4jU6rDN7LHFG3CJlB9dd8SHHNF@vger.kernel.org
X-Gm-Message-State: AFq9FYJASV8FH7d/SVxWnMkAzeaTH8iKrFHafZBF2wLlH06AjoPHAWt2
	k4gXny27dgoY2CTQokQlLkkWJEsGAguSn1agNkPZLVvkP8ZT8Q3hUYNo3ooIiVyAtrzdyWhWp/q
	I+N35rQHLJGpm6+kKeQAPu8GgQec+s0g=
X-Gm-Gg: AYBFou3ap3xEomaI4mBB/pjhq7K5TOSbZoog6cmxlnLyc7REB2p//xrp8QbtSiwPsoX
	rsZVFDMzn34GZgQq2IC72gPTiTCvteklBjHnjvNZWLF+Ux9kqSch5W+NBGl9LVod/x8+NaviQnC
	BGthFh+pA7KwgX4Hr3hS1tUAiGiFeO9N0hysO8VKkLbXRQvWOEbMO/HuDFitCn1lZTYKmqZfhxO
	3EnNnLVeAxy/KBfyz3+b4AIgW/nIgPrSpf/Aus5uRMzAQcBe2RUz43Tii4oZyEM3eR9o0ukEG4f
	Ee0uBhtI6NImXvdaMUOUPbensMqPjxaKHP6bbUslWbbw6aGQFD2ZCTMylNVDr2mGk2/3gKMEO4J
	//I/OjWMMvFpI
X-Received: by 2002:a05:693c:87ca:b0:35b:c1d2:eab9 with SMTP id
 5a478bee46e88-361a2e3d3abmr10553103eec.39.1792421714834; Mon, 19 Oct 2026
 07:55:14 -0700 (PDT)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013180933.487013-1-clamor95@gmail.com> <20261013180933.487013-3-clamor95@gmail.com>
 <179198332384.839288.13126529382772558553@kernel.org>
In-Reply-To: <179198332384.839288.13126529382772558553@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 19 Oct 2026 17:55:03 +0300
X-Gm-Features: AclHuK-mou-LoaLS3qywfc3GD7SbgOiLXnwqTE0Jl9qjYTR1SQVKYSakF-bo474
Message-ID: <CAPVz0n14BhmK4P-tqnt6AMrAh=W-HPoBbP0ztdOrRd_JocRSqQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] mfd: aat2870: Derive brightness steps from max current
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:4=
4 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Wrong subject line.
>

What do you mean by "Wrong subject line"? Specify.

> Please review, explain or fix the Sashiko review(s).
> If this is a set, this request includes the other patches too.
>
> > The AAT2870 allows only 32 steps of brightness, with this amount define=
d
> > by the maximum supported current. Remove the need for max_brightness by
> > calculating the allowed number of steps from the maximum current.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/video/backlight/aat2870_bl.c | 30 ++++++++++------------------
> >  1 file changed, 10 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backl=
ight/aat2870_bl.c
> > index 8b790df1e842b..eb686e315921d 100644
> > --- a/drivers/video/backlight/aat2870_bl.c
> > +++ b/drivers/video/backlight/aat2870_bl.c
> > @@ -24,18 +24,6 @@ struct aat2870_bl_driver_data {
> >       int brightness; /* current brightness */
> >  };
> >
> > -static inline int aat2870_brightness(struct aat2870_bl_driver_data *aa=
t2870_bl,
> > -                                  int brightness)
> > -{
> > -     struct backlight_device *bd =3D aat2870_bl->bd;
> > -     int val;
> > -
> > -     val =3D brightness * (aat2870_bl->max_current - 1);
> > -     val /=3D bd->props.max_brightness;
> > -
> > -     return val;
> > -}
> > -
> >  static inline int aat2870_bl_enable(struct aat2870_bl_driver_data *aat=
2870_bl)
> >  {
> >       struct aat2870_data *aat2870
> > @@ -69,10 +57,11 @@ static int aat2870_bl_update_status(struct backligh=
t_device *bd)
> >       dev_dbg(&bd->dev, "brightness=3D%d, power=3D%d, state=3D%d\n",
> >                bd->props.brightness, bd->props.power, bd->props.state);
> >
> > -     ret =3D aat2870->write(aat2870, AAT2870_BLM,
> > -                          (u8)aat2870_brightness(aat2870_bl, brightnes=
s));
> > -     if (ret < 0)
> > -             return ret;
> > +     if (brightness) {
> > +             ret =3D aat2870->write(aat2870, AAT2870_BLM, (u8)brightne=
ss - 1);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> >
> >       if (brightness =3D=3D 0) {
> >               ret =3D aat2870_bl_disable(aat2870_bl);
> > @@ -150,10 +139,11 @@ static int aat2870_bl_probe(struct platform_devic=
e *pdev)
> >       else
> >               aat2870_bl->max_current =3D AAT2870_CURRENT_27_9;
> >
> > -     if (pdata->max_brightness > 0)
> > -             bd->props.max_brightness =3D pdata->max_brightness;
> > -     else
> > -             bd->props.max_brightness =3D 255;
> > +     /*
> > +      * The maximum number of brightness steps is determined by the ma=
x current.
> > +      * The aat2870_current enum maps directly to the allowed brightne=
ss steps.
> > +      */
> > +     bd->props.max_brightness =3D pdata->max_current;
>
> What happens if 'pdata->max_current' is 0?  Above, we fall back to
> AAT2870_CURRENT_27_9 when assigning 'aat2870_bl->max_current'.  Shouldn't=
 this
> use 'aat2870_bl->max_current' instead, and if 'aat2870_bl->max_current' i=
s no
> longer used anywhere else, should it be dropped from 'aat2870_bl_driver_d=
ata'?
>

Resolved in v4

https://lore.kernel.org/lkml/20261019100930.110954-1-clamor95@gmail.com/

> >
> >       aat2870_bl->brightness =3D 0;
> >       bd->props.power =3D BACKLIGHT_POWER_ON;
> > --
> > 2.53.0
> >
>
> --
> Lee Jones

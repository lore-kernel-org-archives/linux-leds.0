Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795697431;
	b=GKeIMPH9Us0tjlWkaW/urFGjY+/P8+IMOrYO8fxLqhDIrrwXF8teh06dIjdzQK2OYWct
	 S4vAQPTLIxgJW6m54Wid3BuRVi8abKfbKkvFrRtb1fT5kNOM6BlW5dNaKQnHusVIo/N9x
	 ScFmA4/GnMQcBh2zYjpmg7tRIKbUshcBbUZKdD39sS+WONwZ4tICc0/zH0tJaa4EvTcBP
	 PFIqZ/O1k5ndkgXLu1jlBzcJGsNF08EBRLmyHvyWwqBaESFtRgTOD6mKVbn74oHTsiIfB
	 544/pwIU7LHm4GAatOXqWnQtyGdACj8fi+HqD728/sL2xA0XIyoWhYVPyVfG9nLZo2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ruYpKxR0jnfDu2Yt0vn3RyxCANQ3viM4x4RpbrQpd9M=;
	b=KqB7NIRN68oFqYebuCMPi1QWbEsXKQc6h866f3DslpGslDHQqEspLDFRb7Uexl+ktNpQ
	 Aemmsr09simBeZT4f8Boi15kV7MD6MHBWjbdGbnnQbqnR+gvu7OIA5iD3qll2GhHVsQq5
	 Vog3Wx7aWEwndakQYaZdfyhttPd5qWoF2bGckwGBXXofSnUP/IGBF0Hw2dlhbs8py6VJP
	 gVDwL40lKiF26vsJ+2ABt7zVmG5DuX3xrBDMYhTLHKZMW8VyiMoPaOBzvBe7ztqEP9hXS
	 STGLqBdcHqhQwhcQldWWxy74PhgYGi5zSGjzwxyrmOOjVbT62GJkPuK1ekJl/pwMGIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DiD4IfCS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DB1606A321
	for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 12:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3DB1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DiD4IfCS
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3863db981d4so9828855eec.0
        for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 04:50:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795697430; cv=none;
        d=google.com; s=arc-20260327;
        b=G8KXax7KKkJ9DvYszAATlR5OIAi6bkwsTYjYcMEFWD8c0BlpKRkZLD85mUz/5EVgdj
         uB2xtto8WDRMnMBkF0zKCfa0BCXbWuH8s/HVAbmBDELmLQbHO2t+WI4ErFjmKpic/s7K
         79C2hRyOCTUDHS/au+1X8Pt/KmlYVPrjsk4Mj9GIDcT2bY7Qq2fWWB27cj4ZMpOtluTT
         uIAxyrXG27v4hITHyxwCE7aEphzm4M3nRP+/VYTxZhllugb3oQhwTwlaLPqwI90blGaN
         cMLnATOS6Q2/nFHgmQfQ1Uup6/I6WAMnXeYj4fPAr3tridO2fU0w6MrqVIna8L1028VD
         ShKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ruYpKxR0jnfDu2Yt0vn3RyxCANQ3viM4x4RpbrQpd9M=;
        fh=ABTb2fJFhwX04zdlbKug2y5aQGwirTifQMlR8lXCpcY=;
        b=Y15ZRxcZbQcTMLny/12GjaB7gDCP6xS6oluWGRALi5hIGu2C7UmiUJ5/5ZvHKUoVsE
         KPdDKFh73bM3XG6UdlXTLxjPmrWtBGSD+YOcE+I1/l3yW8Uv7p0yiAD7IEPW7qWtxzoM
         Pa17VJqt6ScsPOt9X8pec689Ek1N480VbA+C0zwPNffnjzBEvtoFLr77rxA/6JCEEdHP
         +4yGjwn94qBLcKm3lmpBrilrqVTqC/1tJxKxXFv2Yyv5Uj5H1Fmbb8oyP8pmzE2UYjEe
         mA6m2u0R6VR2zASnWYfBjWI/wWizk84ZndGBXDgtWwh+bS32epmzj8WJAthqtXJx8cZl
         kHGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795697430; x=1796302230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ruYpKxR0jnfDu2Yt0vn3RyxCANQ3viM4x4RpbrQpd9M=;
        b=DiD4IfCSj5LI0ZTuvV8wtiF82UnMDxvfjqUBavKh+wVIqS++D7AZLaBSYRHijkLNdg
         86RpW81gFKtn7ojYeSCCY5VVpq1y2CuYHX92oXMBaEUv6d5waRxi+jUW4kLamrPDxvbI
         LBKc5jIrzyNzpVvoSAcNlK+xJWwhoAWPKBgP57pqPwr/hJurvYKE58bH9735sI5GyhG+
         q1wxDZFLvZ8Vah+5PEPGb1N/bdEoUhRCEeSdkw88wJk6KDFj//qMm4CXxXcLy2h6Pc9m
         exKd/xWsSMGEGmCcjPXa3p+W32B4TPRz4JljeNIR8BKB+ewNg7f4xVhSVuZBGB2zV+6V
         uhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697430; x=1796302230;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ruYpKxR0jnfDu2Yt0vn3RyxCANQ3viM4x4RpbrQpd9M=;
        b=k7gkD2P/2ih6Z9pXHmL9AbIeqquUm/ApCg3iDe7IOnr4zemci+unoE00rnMKLYmWK9
         zxIiz+g2Hmma+mK2Pvs2ljucAc+Z/0SvgB0gh4yVxszFDd1f9xpUoqRzCStu/26w15OM
         JpidT43E/0wKOMEIkaB7358siJ49PV0WWF6BE4eb2/R4n5OfVaAMfES9xpuPqF0gudgz
         CV88moWg8PVXcnlTahQspSO4SBMctUCRIRJWrMV0v1ZDDW9YpQSVGziVoOQZQoJZ1OTP
         zkxJD1ICUMn80kJrGa+FrLZlKrKDSKjU8XYCIJW3H2m0EOPo0hG8cZeAzYpwZdyayMnN
         fngw==
X-Forwarded-Encrypted: i=1; AL+hErE8+9hKyXwkce3w1aHbt3wwKwBQ1GUi24vCeQIZiPVzCdymD46mJgSJPdHrXDakJ3ezyTgNCvgpUFFR@vger.kernel.org
X-Gm-Message-State: APuU4Z/4HSsbuJQaG2aTHrqiypHOxpjDP3oGfy6QnaQE7ZkSDU/cnvkY
	0tsg6kq/Z0ZY8ng7bTVM9TtwE7B2FisOgFVnj5agqZOfklJHPp61xyJgyKC1M2eF320rocxQD3X
	8mQvQaVEbdz8n9Zki2nZQiNpOV8CK7nU=
X-Gm-Gg: AZFdTZfUacYpHqsxsohs3oFi91DfR2cShF5AlGaKzW3qHOxm6avYSAc79DXc7/rHhM5
	V1iUojSh1tG3Ba2FlBt0V7+vqqidjfYyubxO6FtuegJP/kYDyjax/eXrdNLTeQOyYvgPdFPzcFD
	rh9TFNEaj7/1HOkAh2RDcNPuhHfEOvDktbd2hB1LPH0ETUUwNWRZMlOi+pbOoOwlEZ71bOKL8ya
	wMUw/pfEfWFCd7rSP1fcKq3vwcsc+dbJ0BSV0QNcBCVtYOVrliDgh+8NPkx3gZN6e2MmooyrJ0L
	/MjX9CdZytSUJpA+qhgr/0A5O1UAe1fx7quCV23ZlFWeq+sbsD0+FAxhojautXGJYlPkbxnKMr8
	C2pM7GUm4L8BFi/3Ei0caB7HttlE92xqO0h4M8h7iKQAxc4BbCtHii7glY1qJPgc8MysyqKJzkJ
	p0xTPVYJNpyxyhyTLMu+KeMaICKuo0Hg==
X-Received: by 2002:a05:7301:4d18:b0:37d:bd4e:c378 with SMTP id
 5a478bee46e88-3857181d8ddmr20532737eec.41.1795697429793; Thu, 26 Nov 2026
 04:50:29 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115085826.89641-1-clamor95@gmail.com> <20261115085826.89641-5-clamor95@gmail.com>
 <20261126114728.GG38590@joneslee-macbookpro.roam.internal>
 <CAPVz0n138PXP88++q4QXiao-7=nzade=e_jAdfKK0_xsEyPtFg@mail.gmail.com> <20261126124719.GJ38590@joneslee-macbookpro.roam.internal>
In-Reply-To: <20261126124719.GJ38590@joneslee-macbookpro.roam.internal>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 26 Nov 2026 14:50:18 +0200
X-Gm-Features: Aa3M54royAl1sABN4xJ1Cip7AOIlFSUkJQoKYmmC67r_RL_cs_moDjpaDX6PwaQ
Message-ID: <CAPVz0n1xgOqusgO23pXzZdaq0A-j0NyX2PvYPyzrzrqUfYM+3Q@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:4=
7 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, 26 Nov 2026, Svyatoslav Ryhel wrote:
>
> > =D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
13:47 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sun, 15 Nov 2026, Svyatoslav Ryhel wrote:
> > >
> > > > The AAT2870 supports a dedicated main power supply input alongside =
parent
> > > > power supply for its internal regulators.
> > > >
> > > > Add support for retrieving and managing these supply regulators
> > > > (vin-supply and in-ldo-supply) using the regulator framework to ens=
ure
> > > > proper power supply dependencies and power-up sequencing.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/mfd/aat2870-core.c            | 5 +++++
> > > >  drivers/regulator/aat2870-regulator.c | 1 +
> > >
> > > Is this a build dep?
> > >
> >
> > More a logical link, I can break it but it still will be part of this p=
atch set.
> >
> > > Would something that was working before, break?
> >
> > Other way, it was broken (aat2870 may have a dedicated supply) and now
> > it is fixed.
>
> Great.  Split it and Mark and I will take them into our own subsystems.
>
> Thanks.
>

Then pick first 3. I will send this as a follow-up

> --
> Lee Jones

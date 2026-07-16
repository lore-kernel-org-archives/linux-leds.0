Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0476042F6E5
	for <linux-leds@vger.kernel.org>; Thu, 16 Jul 2026 14:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784213795; cv=none; b=tJxxg8Ks16/geWcv923O5cV6Xmy+vEuXxZBjy79Y0pnHhCODsh/KIetT6acxJo478ulZsEEUqwe5JETLCxMqnfo4hvUYvCInXI/70Coj5MpW7Ke2EieADEg5W5rGfuL+ty7dc/t5Xy+Fi2EUZ8PdArUIWJqPr3jRu+bNkssjVcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784213795; c=relaxed/simple;
	bh=SdWulTIlVP4+rPyAsOJwu6A+saTsJb/AbyMAwq+c1tE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ok3Kvt6PfRxybRUlHppb80OFsLmUNGD5oLGCZruobJ2uwSrR0ye78nKPTyeXLRAMjPhK6Mlzk2+AjWeDt5+EnGw6X48qWkyztoof8Sv1WzI5zDRFKoHNyKAebLd81qe8biShsB4NuRABnEORO4tOM0dt4+Rx7jg4NyfwQc61/rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QY72FGsD; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QY72FGsD"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47640541585so3334618f8f.1
        for <linux-leds@vger.kernel.org>; Thu, 16 Jul 2026 07:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784213791; x=1784818591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nSYyTbNo6U7C8VSUfRHtsCLXJdq8taujUtNZijqMhPA=;
        b=QY72FGsDU26mzoCd/J3UqnsSj9ivhuL4Q+1vFPec5fLfFmgGB3MxLPvNg3m3rEYTUm
         d/iSqpjRo/FG1rrTEvd/neQEbgzkM6/sWfkkHzGu+uHCmGtzbZRO7IMI0bPeFGFVXbH5
         aTCGZQ8Tltyer1DhEOQznzDAld0xerwfpjDkdX2m18Z7/Sees4rYZZCc8u4ObLmkWCZV
         fyfCKWyrG6J696uewzc6c8CHnU5YSPS1iwwObElIaQF1NTHv5HXzlVTxwzoLzSHMhOFM
         ZMyFT61IEHOP7L4S8SzjIqiUo1ha6adChpPTUhvMDAprb9PV46pGXokZytcogV5XCPpz
         Q0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784213791; x=1784818591;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nSYyTbNo6U7C8VSUfRHtsCLXJdq8taujUtNZijqMhPA=;
        b=rU/MrzdmQVkRL6YuqRWsUhUqCX+CodmRZITbL8urGtykOwnPXwNoNleVz5H/fUV+gV
         +ThGeMltYtu6qpanLy522FzXsQnOIQRPfRg3HL6BzlSUXI7/FDhvx38nx2/dCNLqmNv4
         bCJl9U1qXEOW6sk9PBKC9B+IUOF2RlMKHcEbKu+HRamLm/EBv4sHQBYfYA3KpuHhEjVP
         RbjQCwJSSMc3G/e/kwDZTHsWI1pjODrDDPO5aiXBdzlJBQJKH0vWOPPL+oK8NwhQgqFV
         WQ0zD8i0pr/UkkmkUv9UR8YyIOtA8BAYI9mUfWl8RHZMj75Kcd9iDHiVgZ5ldRGEJ+hW
         l3NQ==
X-Forwarded-Encrypted: i=1; AHgh+Roy/MP9Hje/oMUagxZPfpbXLX7wEuFDurQRU8gILmfWiTqeZIa4eoEXPckwiXZ+X6RtK06uQ0Dph9aN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9pvHILmj6ZTWAbsE2QcR3m/hFlXYW1i6nDrHTHmfkRYPfLvdD
	4xrW/nSuRhnqzId9PN8yNcVPLG/pqmmHnlQst1GJEOmIH1/LWnOjgo4wRqvm8SVOBeuZz2LsP54
	LiXzc
X-Gm-Gg: AfdE7clRICf4sT5rgL9Bi+9lypYqQlHA346pD5PrLOWS9lc1gnI7lizuxOH9Koh6uf+
	0dsgT4CVkpEiUSzN3gcB3avdOZL9qtNAJYmNb3alNeoVngU2showX2r5VYYtp1Q3AxuMJTtGgHu
	XHmrMTe0TPiFZrKRbz37JqLnrnDITlxyEfp8XtMq6PviMNKWB6fv/GGwrvT4JYzzxqAYb2UF/Q8
	GoLYNZsMPAka3BNvyGp37WuQDOLSnQmGniBlzdTDppf0R9q2xI1DekddRiMT6r0f5HO2faGM6zM
	pUmOkD14lXsvDp2YvGgkC2Fwm/dEJlB/uQkxSfEe+guqXg512iH1rra1mtEc+DRBJrPYx+AQ69K
	pk9qkJJ2gBh4OjKu3zdicVXcj2WouRFGUfgpSjeKnruOFWlHsGWM5/ifEoe+1hSm8RLSCoKQ+jb
	b9Mb1vZd8Le1LTDx8w1qAaS/6jxBrS51AVCTyUVWhwu1JttvqclylqEuokxGH+xVT32A==
X-Received: by 2002:a05:6000:2dc8:b0:47f:4d3b:ebce with SMTP id ffacd0b85a97d-47f4fc9951bmr9586765f8f.10.1784213791166;
        Thu, 16 Jul 2026 07:56:31 -0700 (PDT)
Received: from localhost (p200300f65f47db04428ffe85f0247d91.dip0.t-ipconnect.de. [2003:f6:5f47:db04:428f:fe85:f024:7d91])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f464a96cfsm25167724f8f.20.2026.07.16.07.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:56:30 -0700 (PDT)
Date: Thu, 16 Jul 2026 16:56:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Message-ID: <aljweARVNZ7PvgSY@monoceros>
References: <20260708-upstream-ltc3208-v7-0-aed7f7bd461c@analog.com>
 <20260708-upstream-ltc3208-v7-2-aed7f7bd461c@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xiy2nkjambp6zyzr"
Content-Disposition: inline
In-Reply-To: <20260708-upstream-ltc3208-v7-2-aed7f7bd461c@analog.com>


--xiy2nkjambp6zyzr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v7 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
MIME-Version: 1.0

Hello,

On Wed, Jul 08, 2026 at 03:00:07PM +0800, Jan Carlo Roleda wrote:
> +#include <linux/bitfield.h>
> +#include <linux/errno.h>
> +#include <linux/i2c.h>
> +#include <linux/leds.h>
> +#include <linux/mod_devicetable.h>

Please don't include this header. The the device-id structs you use are
available via <linux/i2c.h> already.

> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> [...]
> +static const struct reg_default ltc3208_reg_defaults[LTC3208_REG_G_OPT] = {
> +	{LTC3208_REG_A_GRNRED, 0},
> +	{LTC3208_REG_B_AUXBLU, 0},
> +	{LTC3208_REG_C_MAIN, 0},
> +	{LTC3208_REG_D_SUB, 0},
> +	{LTC3208_REG_E_AUX_SELECT, 0},
> +	{LTC3208_REG_F_CAM, 0},
> +	{LTC3208_REG_G_OPT, 0}

Space after opening { and before } please.

> +};
> [...]
> +	device_for_each_child_node_scoped(&client->dev, child) {
> +		struct ltc3208_led *led;
> +		struct led_init_data init_data = {};

s/{}/{ }/ is the more usual option.

> +		u32 chan;

Best regards
Uwe

--xiy2nkjambp6zyzr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpY8REACgkQj4D7WH0S
/k4bnAf9GHaRuOgfn9c8DhVjfpWlYi8lEyWHsPejrVo9S6Dtsx99pTiHQHmC4a+N
tqy0t8OB/sS5p0i/PDgjcg6cHgIibPEII3IPIWu8zk6XLaRaYAC6mfMnOH7RrqYT
5XWYZtqSHbLT+aUKZoIw96ud9k7UQI9L6z5VJdggCY4LK8v/waEN7AMzbHJd7XnY
hVaUMp7/fURlgtWWV+y9FgyVrBWligFIs0NIMrtEDHlIByvf2Zx91JTLVaShQx/8
WNo81MA2Z4p/QjMCS+Xm2NOF9wCu8wd3R4cgFBUFdLMLZz/kJWBS4f0WuoNXG+T8
ORKp8O97/HvSuczN39cGY0YwqjKz2g==
=Tv8I
-----END PGP SIGNATURE-----

--xiy2nkjambp6zyzr--

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795265619;
	b=aGCFLSiTBq5pcv/d14/dR2Ib6hlWO9GXWVIZIPPvYDCyo04DHBmN76wGtEPrylsNuklL
	 7VgcazvMk5VgVtqK1CCxnvQbiNF0zmiHOGIZhAMGmmPMLpnJ+faNZ4M/020XyFwP+JwGZ
	 X1D0GHe/6JGLxBCUEwaiZp7hqvMj54Kf02p/rn4XIE1IV4eowZ8NBe4KEk2BctFWFcRI7
	 x7nFYTRbSHiGuIIsjKeMEDfnkkaugaXidaajzTccseBnkFQDmjNWBdlnxQRWrQgIifr5K
	 T83pB5/fSagL0ouxiUnbiduy+fv463TbkfO0rPLbBErujSZkgkTF4v61IvVAwIcVDFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795265619;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=VWPDfwi8Sv2dAHLaLHU6iBFuT+j1joYI31Jp1qLSPdU=;
	b=UT387/iiPTCYapIkK1PDhaA5E1USpAhQyKLaKQTiI5QCDjzKGJ54VL6sswvrozMNLBb3
	 B5v4fcrc03MeYVT3u9z6zWKEuwXhlBr7L56W+Ll+lcd1p2owaeejOhYtjdAy0uhsH0AxE
	 zhtokTWMk/bOViItz62xFko6KdqIbLuymNLyi9xhYemSHZomOO1Jv7jPLAYVzHs9CU0yA
	 woVGzDtJYyxjVw1VC3m467B792G4Dr7Wv3EFb2qQTnskr12a9ThymaDfHMUUnm2785L+k
	 e6HiOcpSjHjwlsb0PG23AORLfUBtuF0KWeuW+iPYB6xpH7ug5te4CCiA2uPEjEQ/OOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=I9Nb3VRT;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBD3606A339
	for <linux-leds@vger.kernel.org>; Sat, 21 Nov 2026 12:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CBD3606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=I9Nb3VRT
DKIM2-Signature:  i=1; m=1; t=1795265616;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:gviTlHETNILlkXVnzvlzYm9ux2i4
   lZfs+Ls7poWfGztqcP4gfwPAdPaq/nZEJULZCgrLeOz6pKUZGYZvW+BLAU2uky4C/VnteekYkhb
   YedBIOl4CZoddGIIfOzjDaNdapRyeU6QudE5qQoEQlvV5AA91dwVngISem5CcF5/d5uQ3Ps+Hb3
   PMgPZkhxUup7gJgW2IgLR5L8ZPmUO+CnWiBb4hweSB78eKODEHQ+zxWG0gINhpCO7p7sXmTwp6y
   bJtLquVx7aiXfsUAb68t5JBRUvd2w5XDarqhLC4EQ/sw61yyMe9oT5sZjd0MwBA1sB0o+Zq29oM
   IO3GMFMkFqm3gw==;
Message-Instance:  m=1;
 h=sha256:
   lm0d7u03/4gREt/VXSbl0n2p6dgjf3pPIT7IT1wx8ns=:
   kQnAF2fGU4QP/K//FUqPEHeugo4k0vG9dSdxUlgOPVA=,
  sha512:
   D0jVuMGLGhEmsQ5R+dZPHggduuxvvNt7iWfr9I4XUxzvJFAH3HIj8r9q3XegayL/Ev7vDbeUsJHBSEjtgQ0w5g==:
   tnpy23IO+dVUHYR3zo5Z/4LD5hVNgDM0and2d9wi6gplgX34tnzWlPwsiKvQz+ykCWEmrreIWR1pfUnPHfFDVw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795265603; x=1795870403; i=w_armin@gmx.de;
	bh=VWPDfwi8Sv2dAHLaLHU6iBFuT+j1joYI31Jp1qLSPdU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=I9Nb3VRTf6c44aglo9rRGbEqntO17fVltvu1boMwHxAHJIYPBLrox7hBg+NqYFtd
	 PE24R6tFw1zOLklcMvfSPs2JpsmHk9kvAMDGrAP/R4uGOW6hCHBYQ7S6eSfwFohe1
	 KLYJ4deBrvRyjzwwQPPK/iwbeidnmFhLAlOVRObz5O9Cg1+3360P0DOtugMGN/xIQ
	 Y6cp9q4dMeSfwgE8l6QBPTHMg/mSpnCkXoO2jfMJeRhjGTIiN8asNqaZ/ZtIy1kgq
	 YO3ocQOZUEQnu35t/pHxvLusbxvFvE0uOrKG4LQnVte4PxlvVbbRq1Lsx2Wtg/sN+
	 Iz1r/JvuQNEGhKmdaw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mirna-1y9I0t012K-00bZQf; Sat, 21
 Nov 2026 13:53:23 +0100
Message-ID: <498a9e07-3b8e-4dce-86da-37c9eb2837a5@gmx.de>
Date: Sat, 21 Nov 2026 13:53:22 +0100
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/11] leds: rgb: ktd202x: Initialize max_brightness
 before registering LED
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org, pavel@kernel.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, i@rong.moe
References: <20261120212431.152081-1-W_Armin@gmx.de>
 <20261120212431.152081-11-W_Armin@gmx.de>
Content-Language: en-US
In-Reply-To: <20261120212431.152081-11-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Y5fDaFKu0wvHjoLFZLkowbRUuiFvbIaTg8NhX8WwJqkSY2ZHG5y
 0nlEeRQ5yiA0MhHlvf9Bm4eyxLkV3RTLuiN6Ehuepjmwbhty74ctvvalw8ve4uHpgs82YNJ
 8W2s44XqRpJ4PAictTco/DJqTZ3VG8jzGaCwo8IvxaIE5IcveFd5WRNKJXTeHyJuwWDP7i+
 V9szNHG+87RWiXQzKzVoA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JTHLPxLieh4=;whYOX00YI9g5jAegcp1aoClvaUk
 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
 MlgQPjjNNJPTRSLmq3ws8W+p2dVg==

Am 20.11.26 um 22:22 schrieb Armin Wolf:

> Initializing max_brightness after having already registered the LED
> class device will overwrite any adjustments made via devicetree and
> mess up the multicolor LED fallback path for multi_intensity_max.
>
> Fix this by initializing max_brightness brefore registering the LED
> class device.

Sashiko now complains that initializing info[i].intensity with KTD202X_MAX=
_BRIGHTNESS
will cause issues if max_brightness is being lowered by devicetree propert=
ies.

AFAIK many RGB LED drivers have this problem, and i am uneasy in making la=
rge changes
to them without being able to test them on real hardware.

Do you want me to fix this issue too or do you consider it out-of-scope?

Thanks,
Armin Wolf

> Fixes: 0ebdb7210943 ("leds: Add ktd202x driver")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   drivers/leds/rgb/leds-ktd202x.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd=
202x.c
> index 143020945e23..2f5d0694c9c9 100644
> --- a/drivers/leds/rgb/leds-ktd202x.c
> +++ b/drivers/leds/rgb/leds-ktd202x.c
> @@ -477,9 +477,11 @@ static int ktd202x_add_led(struct ktd202x *chip, st=
ruct fwnode_handle *fwnode, u
>  =20
>   	if (color =3D=3D LED_COLOR_ID_RGB) {
>   		cdev =3D &led->mcdev.led_cdev;
> +		cdev->max_brightness =3D KTD202X_MAX_BRIGHTNESS;
>   		ret =3D ktd202x_setup_led_rgb(chip, fwnode, led, &init_data);
>   	} else {
>   		cdev =3D &led->cdev;
> +		cdev->max_brightness =3D KTD202X_MAX_BRIGHTNESS;
>   		ret =3D ktd202x_setup_led_single(chip, fwnode, led, &init_data);
>   	}
>  =20
> @@ -488,8 +490,6 @@ static int ktd202x_add_led(struct ktd202x *chip, str=
uct fwnode_handle *fwnode, u
>   		return ret;
>   	}
>  =20
> -	cdev->max_brightness =3D KTD202X_MAX_BRIGHTNESS;
> -
>   	return 0;
>   }
>  =20

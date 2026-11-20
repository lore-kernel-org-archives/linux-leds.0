Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795210639;
	b=xVZ4r7Rrk+S50AAUmXkmGB+qQr8Iwf2m3XV5TnQ2tH2Pi9ent2EqwDi3V3uIU2wnzpk6
	 abnEr85ziad/46B6WhLqyySjM2dNoTYA+j8FsNQeKyuXjH+4Xq9N42HPI6DJWwRjsmO1W
	 yFNoFOcUrqcaHuLKgfJ/+l72J3dN2EMV0KENjtfzjJz/O/L8ZbC2R0/oULzc19U/Xpxd+
	 WNzW0ImnfO27yVBFI/1CsgUpZ5MiLE2eTcnpGbC+vPu5tWQoXrFjKEriSuj/FxWo/WTqN
	 q4c8JqIipJB3KfNF2NZD8Cmpy3raJaBJrWZEzdJfz4GUBTh7LI9P5sGG7jwXkSyrZyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210639;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EbLRCrMcr5pyjVvTCP+J+n/do+lbA3Dy70DNnQaRekY=;
	b=vJy72zV3R5qg9YKLKVoFkhsd34V1dcG+7tnX5262/S9uDXNSdf4Rtb94NPqqWZnTdgEv
	 NPhhIMQF72kv3TseAzKVz3gE/jzEKt3EdCp7XrNIsE7eQVmFhFc/DU1xRqDNcIJwZc9Pq
	 PSB3ADsQ8LNZR0iAMEM8Kd2Pktzj8cf+K2RvYmqJS4x5Z+Pkap5mO/2CnajTbV5TCjqpF
	 6DxVQYptfyIWrTYyq+ldjvV7yAoEsE30rfADPBc7QHLRhTXxALSCpJmiTKNbZv1kjhB91
	 xl4zQpLEMnlliVIKLNJvkuGzs0DsQ9gQGWtUkTqdTxNjXgujitJmEjYTJtj2IRe14SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dv+8yK3D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD0C606A68B
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 21:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dv+8yK3D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF7F1F000C6;
	Fri, 20 Nov 2026 21:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795210638;
	bh=EbLRCrMcr5pyjVvTCP+J+n/do+lbA3Dy70DNnQaRekY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dv+8yK3DFoTLzFcoiMFasj4S1IvWDBb3vz1T43T8CjjiJNK0QYC0bvHL3da2LGwzw
	 47EGsobLUxiwWJPMRjFOYXbYL4MlXz5E5oaMxSw2pBVRy69jf0/nzk4zA5Q8UUuQfb
	 Bnp8GEANGWuOFeZoGvP54XC39FhR6tyggJSpJNiexCmg6KoSefut7aBheFS5fMlzLm
	 +IDtA1CbfF3KVsYIdPhhVWriIlbxcUmQlINzrl0bI5IVT3NXuPzxkjOAAQzzqPjSVV
	 hAy4ebuFrPZlXyVhHV8OivvMsg2C90Lwl6v77lpJiKK41iwfljcFwteRjHinXAHfEt
	 zXJTzGbLIGK1w==
Message-ID: <sashiko-outbox-226200@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/11] leds: rgb: ktd202x: Initialize max_brightness
 before registering LED
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261120212431.152081-11-W_Armin@gmx.de>
References: <20261120212431.152081-1-W_Armin@gmx.de>
 <20261120212431.152081-11-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 21:37:17 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] leds: ktd202x: hardcoded KTD202X_MAX_BRIGHTNESS ignores DT
  max_brightness
--

commit 2dae2f4ed8c12ac6d32eb710582a2086db8b13e9
Author: Armin Wolf <W_Armin@gmx.de>

leds: rgb: ktd202x: Initialize max_brightness before registering LED

This commit initializes cdev->max_brightness before registering the LED
class device so that devicetree max-brightness adjustments and multicolor
fallback paths are not overwritten.

> diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd2=
02x.c
> index f1822281c3e61..90e0e2f084a50 100644
> --- a/drivers/leds/rgb/leds-ktd202x.c
> +++ b/drivers/leds/rgb/leds-ktd202x.c
> @@ -477,9 +477,11 @@ static int ktd202x_add_led(struct ktd202x *chip, str=
uct fwnode_handle *fwnode, u
> =20
>  	if (color =3D=3D LED_COLOR_ID_RGB) {
>  		cdev =3D &led->mcdev.led_cdev;
> +		cdev->max_brightness =3D KTD202X_MAX_BRIGHTNESS;
>  		ret =3D ktd202x_setup_led_rgb(chip, fwnode, led, &init_data);
>  	} else {
>  		cdev =3D &led->cdev;
> +		cdev->max_brightness =3D KTD202X_MAX_BRIGHTNESS;
>  		ret =3D ktd202x_setup_led_single(chip, fwnode, led, &init_data);
>  	}

[Severity: Medium]
When devicetree lowers cdev->max_brightness below KTD202X_MAX_BRIGHTNESS,
do the remaining hardcoded KTD202X_MAX_BRIGHTNESS uses bypass or overflow
that limit?

In ktd202x_setup_led_rgb(), info[i].intensity is still initialized to
KTD202X_MAX_BRIGHTNESS before registration while info[i].max_intensity
defaults to the lower cdev->max_brightness, so
led_mc_calc_color_components() scales channels up to
KTD202X_MAX_BRIGHTNESS until userspace writes multi_intensity:

drivers/leds/rgb/leds-ktd202x.c:ktd202x_setup_led_rgb() {
	...
		info[i].color_index =3D mono_color;
		info[i].channel =3D reg;
		info[i].intensity =3D KTD202X_MAX_BRIGHTNESS;
		i++;
	}
	...
	return devm_led_classdev_multicolor_register_ext(chip->dev, &led->mcdev, i=
nit_data);
}

In addition, ktd202x_blink_single_set() and ktd202x_blink_mc_set() still
pass KTD202X_MAX_BRIGHTNESS instead of cdev->max_brightness when blinking
from LED_OFF; for multicolor LEDs, led_mc_calc_color_components() divides
KTD202X_MAX_BRIGHTNESS * info[i].intensity by the smaller
cdev->max_brightness, producing values above KTD202X_MAX_BRIGHTNESS that
overflow the current range in KTD202X_REG_LED_IOUT.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120212431.1520=
81-1-W_Armin@gmx.de?part=3D10

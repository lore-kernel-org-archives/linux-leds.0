Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794698431;
	b=wl0V4Nt8b6z6NF4mMAG/QfVzPsWHVTchtB5mCs9ANvG3pdjyVmuwSmGr7P1KF7a798YF
	 vM+ae1btGjruioPMKTCiDJ3NRNcYZehGTh7XdRuU9MJ/9G9TJqhAgsVTyeFLnktG3j8Qk
	 Ziops33AfGFSvzbmVnkuoAprRc55FQaWao+7tGzzvzHE9gZKiZCiKmJY18lW2EYXypYkY
	 C/b9GWcZnFXOKs2ob/BW/Rk9flSezBN9LuzN5guZk34ys3F3Co8YleBkrLdDjvEBkqpFV
	 82TkENT/jm/KR8sZOLdWr7ekkj84lkM1AUKp7DRboqR8dKwYjzretrWSsPyvYQUOp6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794698431;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dzw4VMHylxR5Z8kEH2P1YhZS48XwZeqxVZDitMlCCUw=;
	b=FTErpj6bVQ3wu6/uNfM8Jr3XGEio6uwk0JmswxoIJj7VZX9WhWwsgUHJME3ZjNZcSZPs
	 Z/6Q9eP8ZqiEpf4RCYlqK66MH7BeY0jCJR6OQOBqYERM1+C785BbcZrQS7ms0O7QtWpLQ
	 PN47c8clno2fxlhN+cNtBR3zTcKm9x20Y2nuXVRSREI6xvIAYM28hvO7aRSv1IoyTRkT0
	 L1ip0g0fSKU6Sz/e5JPNoYRJN394b3CXSbCZnwkGTg6p7OOXaAd5QSIFjeazzveu1/g+S
	 zZqfXy2LO/7ode+uZ7CamFJCQaNEEW35gLgtqDX5YtvzNxug/a73nXs40RmfAkTVv/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cm9Gr1BR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A12606A329;
	Sat, 14 Nov 2026 23:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cm9Gr1BR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE391F000C4;
	Sat, 14 Nov 2026 23:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794698431;
	bh=dzw4VMHylxR5Z8kEH2P1YhZS48XwZeqxVZDitMlCCUw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cm9Gr1BRr6Gl5rT+Wr/Qp9QNXWTFGuQWdUUAUoH1oSo6ccRYPGU01jsl8OeTBHHyG
	 yWbmAVxisWY3pZMRQ0iRwSaMQOtYzAQhpWciHIcRNi3VYcZJm6pqz728LhOY3jWggu
	 L9l/qblmRYcNA44Iwo1NYeyvkoEDN8ph+3NnzQVXa9usZmrCsJDLq7tvDmMULl4fGN
	 PthVmYsPRHDBtec9+iTcaZ2wDAXo45Ppb/A1VBc6ockuTrgTgYcvO+uG4JeNi5dHi5
	 4I/7tXDjs7c5GkyjvET3nS6lrZVL7uUgV9I8/2fp+Pvn4vxV0JqUOWfV4pUGKgvKg0
	 xFCRiN6veVG9A==
Message-ID: <sashiko-outbox-215101@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/4] leds: aw2013: Add AW2027 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261114-aw2013-aw20xx-rename-v7-4-ea5a3113a479@postmarketos.org>
References: <20261114-aw2013-aw20xx-rename-v7-0-ea5a3113a479@postmarketos.org>
 <20261114-aw2013-aw20xx-rename-v7-4-ea5a3113a479@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 23:20:30 +0000
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
- [Low] leds: aw2013: duplicated per-LED imax update in
  aw2013_chip_init()
--

commit fe70881eccdb317dc7ce37e26b9965b979fe6113
Author: Paul Sajna <sajattack@postmarketos.org>

leds: aw2013: Add AW2027 support

This commit adds support for the Awinic AW2027 3-channel LED controller to =
the
aw2013 driver, introducing chip-specific definitions and handling for its
global and per-channel current limits.

> diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
> index 7fe7e9dae9031..f62f977e2bfef 100644
> --- a/drivers/leds/leds-aw2013.c
> +++ b/drivers/leds/leds-aw2013.c

[ ... ]

> @@ -60,16 +72,88 @@ struct aw2013_led {

[ ... ]

> +static int aw2027_set_local_imax(struct aw2013 *chip, struct aw2013_led =
*led, u32 imax)
> +{
> +	return regmap_update_bits(chip->regmap,
> +				 AW2013_LCFG(led->num),
> +				 AW2027_LOCAL_IMAX_MASK,
> +				 imax);
> +}
> +
>  static int aw2013_chip_init(struct aw2013 *chip)
>  {
>  	int ret;
> @@ -81,17 +165,47 @@ static int aw2013_chip_init(struct aw2013 *chip)
>  		return ret;
>  	}
> =20
> -	for (int i =3D 0; i < chip->num_leds; i++) {
> -		ret =3D regmap_update_bits(chip->regmap,
> -					 AW2013_LCFG(chip->leds[i].num),
> -					 AW2013_LCFG_IMAX_MASK,
> -					 chip->leds[i].imax);
> +	if (chip->cdef->gcr2_imax) {
> +		/*
> +		 * AW2027 supports 4-step global imax, and also a 16-step control for =
limiting
> +		 * individual current per LED. This doesn't map to the single value the
> +		 * devicetree provides super well, so set global imax to maximum, and
> +		 * local imax to whatever gets us closest to the value in the devicetr=
ee.
> +		 */
> +		ret =3D aw2027_set_global_imax(chip);
>  		if (ret) {
>  			dev_err(&chip->client->dev,
> -				"Failed to set maximum current for led %d: %d\n",
> -				chip->leds[i].num, ret);
> +				"Failed to set maximum global current: %d\n",
> +				ret);
>  			return ret;
>  		}
> +		/*
> +		 * This still needs to be here despite also being in aw2013_probe_dt,
> +		 * for cases where chip is disabled and re-enabled.
> +		 */
> +		for (int i =3D 0; i < chip->num_leds; i++) {
> +			ret =3D aw2027_set_local_imax(chip, &chip->leds[i], chip->leds[i].ima=
x);
> +			if (ret) {
> +				dev_err(&chip->client->dev,
> +					"Failed to set maximum current for led %d: %d\n",
> +					chip->leds[i].num, ret);
> +				return ret;
> +			}
> +		}
> +	} else {
> +		/* AW2013 only supports 4-step individual current per LED */
> +		for (int i =3D 0; i < chip->num_leds; i++) {
> +			ret =3D regmap_update_bits(chip->regmap,
> +						 AW2013_LCFG(chip->leds[i].num),
> +						 AW2013_IMAX_MASK,
> +						 chip->leds[i].imax);
> +			if (ret) {
> +				dev_err(&chip->client->dev,
> +					"Failed to set maximum current for led %d: %d\n",
> +					chip->leds[i].num, ret);
> +				return ret;
> +			}
> +		}
>  	}

[ ... ]

> @@ -303,14 +417,30 @@ static int aw2013_probe_dt(struct aw2013 *chip)
> =20
>  		mutex_lock(&chip->mutex);
>  		chip->num_leds =3D ++i;
> -		if (chip->enabled) {
> +		/*
> +		 * needs to be here and in aw2013_chip_init because chip->num_leds inc=
rements
> +		 * just above here while we're parsing the devicetree, and chip->enabl=
ed
> +		 * ensures chip_init runs as little as possible.
> +		 * Requires this function to have regulators enabled.
> +		 */
> +		if (chip->cdef->gcr2_imax) {
> +			ret =3D aw2027_set_local_imax(chip, led, led->imax);
> +			if (ret) {
> +				mutex_unlock(&chip->mutex);
> +				return dev_err_probe(&chip->client->dev, ret,
> +						     "Failed to set maximum current for led %d\n",
> +						     led->num);
> +			}
> +		} else {
>  			ret =3D regmap_update_bits(chip->regmap,
>  						 AW2013_LCFG(led->num),
> -						 AW2013_LCFG_IMAX_MASK,
> +						 AW2013_IMAX_MASK,
>  						 led->imax);
>  			if (ret) {
>  				mutex_unlock(&chip->mutex);
> -				return ret;
> +				return dev_err_probe(&chip->client->dev, ret,
> +						     "Failed to set maximum current for led %d\n",
> +						     led->num);
>  			}
>  		}

[Severity: Low]
As reported by Lee Jones on v3 [1], why duplicate the per-LED current update
and error handling across the gcr2_imax branches in both aw2013_chip_init()
and aw2013_probe_dt()?

Both AW2027 and AW2013 update AW2013_LCFG(led->num) with led->imax via
regmap_update_bits() and differ only in the bitmask (AW2027_LOCAL_IMAX_MASK=
 vs
AW2013_IMAX_MASK, i.e. chip->cdef->current_levels - 1), so a single common
loop in aw2013_chip_init() and a single update call in aw2013_probe_dt() can
handle both chips.

[1] https://lore.kernel.org/r/179198402838.839288.17911568760182808689@kern=
el.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-aw2013-aw2=
0xx-rename-v7-0-ea5a3113a479@postmarketos.org?part=3D4

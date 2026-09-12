Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD9E3E008F
	for <linux-leds@vger.kernel.org>; Sat, 12 Sep 2026 22:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253468; cv=none; b=gOEYib7ZKApUnAfrYilup9/KgY1HYcRaUZGYt8GgKXjSPK3PR7hiqfOZQJ+pWibbBVgJHsZom5s6WLuLjF6xtR9MWwvvegPoeqj8L0/JdslC6SVCG2EN3zNlzJKLHQxf1XTlHrJag1FCeyrfXtIm19y9YMnrjHv2ypItTXoe/sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253468; c=relaxed/simple;
	bh=CBjzrLUNQf8OVXairHHPdJYTMw7XM2JYyd8LnipkeVs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rj9vuncXOrt1KLK0Na71Niwhza5qJWyRfvZngJaTGnLQdp+NufaNPFiQZur/KSAdk6purUkNZlpdWG4k2+pdvJT3EquhnaFSW2uXd3jVIIMha9WJyPexi7cI2QZuLV0l/Iw+agy5ngG9s+RlLrZ5kPLh3r8JkW5/kwlDc1EeZRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8SlUJ9U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8SlUJ9U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 509BD1F00893;
	Sat, 12 Sep 2026 22:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789253467;
	bh=mZAmm6Qt01vlycrpkrngHieF5iF+CfdzU113ffkk09U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q8SlUJ9UnAFnT/y7ZOxScEwGCF4pu79Fe/VHcW0aWaKbby1D4SXkLlegU8982O4qW
	 CV3XgpJ3xFvW/qXAjDvJ2YS2koHr1u3WOvDWbbN/e+L2l3bVANOY81T2Jbb59Wj2Uk
	 irKqMFix3Ma2WbhKo9j7o86j+m4WH6L39H8Y/MZGnFJhZ0Wto540sawkVRv+1gAMfV
	 RH4DV2gWA2ff4uVJqC8aM+tVPw1DxGhTiAD5iWIfq+0l4zP2vbgvHLZUWHf1Kk0Hty
	 BUhOcOV5AKTyzrJ9J8lpy+LELx1vPQVlUtdBi6QGSZ6iCM8jFEJYgbDOpPo1Zg7IUY
	 exyjdUq2yCaKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 01/11] leds: st1202: Correct the name of the
 prescaler conversion helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <GV1PR08MB84975AC922A0F9308A5A45F1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB84975AC922A0F9308A5A45F1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 22:51:06 +0000
Message-Id: <20260912225107.509BD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] st1202_blink_set clobbers the state of all other active LEDs on th=
e same chip, unintentionally turning them off.
--

commit 39a1d0b65cb7b4a9e52158952579297ea332318e
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: Correct the name of the prescaler conversion helper
   =20
This commit renames the prescaler conversion helper to correct typos and
accurately reflect the conversion direction from milliseconds to prescaler.
It makes no functional changes.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index ead1441558497..5a2202fb4c223 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
> @@ -85,7 +85,7 @@ static int st1202_write_reg(struct st1202_chip *chip, i=
nt reg, uint8_t val)
>  	return ret;
>  }
> =20
> -static uint8_t st1202_prescalar_to_miliseconds(unsigned int value)
> +static uint8_t st1202_milliseconds_to_prescaler(unsigned int value)
>  {
>  	return value / ST1202_MILLIS_PATTERN_DUR_MIN;
>  }

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but it was not addressed by the
follow-up patches in the series.

Does st1202_blink_set() unintentionally clobber the state of all other acti=
ve
LEDs on the same chip?

drivers/leds/leds-st1202.c:st1202_blink_set() {
    ...
	/* Zero out PWM for all other active channels to prevent them from blinkin=
g */
	for (int chan =3D 0; chan < ST1202_MAX_LEDS; chan++) {
		if (!chip->leds[chan].is_active || chan =3D=3D led->led_num)
			continue;

		ret =3D st1202_pwm_pattern_write(chip, chan, 0, LED_OFF);
    ...
}

If a user writes a constant brightness to LED A via sysfs attributes, and
then sets a timer trigger on LED B to make it blink, won't this loop
explicitly destroy the PWM state of LED A (such as the ST1202_PATTERN_PWM_F=
ULL
written by st1202_led_set to maintain constant brightness)?

Since unprivileged user-space can trigger this by writing to independent
sysfs devices, they could unintentionally turn off other active channels on
the chip.

Is there a way to isolate the blinking configuration to a single LED without
wiping out the PWM values for the rest?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497422B7A=
44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D1

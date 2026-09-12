Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EF336E494
	for <linux-leds@vger.kernel.org>; Sat, 12 Sep 2026 22:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253759; cv=none; b=B9SDWzPxJdSL0MXwQZphRO6jP6a6p02Pfbx0K3u8CXHpCPb+pmA12UWP4OdjDZZrk8UB2Q0bRzKpegm4cP85sDb5auWPLAfK2lVsfUAY+I2C/flnq69CS0KLWn57OGuiERWSU6/r/kV1XSElfl662qfnyua1BEmwuQC4lYtdG4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253759; c=relaxed/simple;
	bh=SW2P0j09YdZ5KPjX2Z5bJHIXxBi7pTkNutKUjxh6TcE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=js1J0coerqn6tQtQMC2AIuvdsBMa5zp0XojGFypkXHYfZtm65Qjw0KoLsX1g0bMfEG4tFIybLvs7WpM6Hme8j1DoH1vdc2rLngIWBJBS7MCK2Nq52wYod64aN6CnQBtubPnV0hAtjPZnyICcAnTi6aWEYsER9P0Qm13oLDU200c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zk8UpH8N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zk8UpH8N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE461F000FF;
	Sat, 12 Sep 2026 22:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789253757;
	bh=oW9K+Y0q7QjCVA63AkWYL3dDpQWbFKSKGmxWaLSoGuE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zk8UpH8NtsBaKNxDYSssKLaKBUcASmjDk3sFZkguiKkWRIsd19/DNJ5z4c5B714N0
	 h1L4pHt/OXW8KNDw36ngSQ59AUtx6gXlOGpNtkSec/G00mvqL2QBbUrbUMPfxGR7fj
	 k9EYX/BDEuREnFjatxoabvLd5OyIhwrtq2xcp9L1hjyGOkPzSQfmmXczejmRU1m5lP
	 g6ElgE3qXLuVk7Wte1Yz/f3nx81b3dbctx1PYrYrjLwgEEI+IzcECu2lcVTtDXCDmi
	 8h9GyJvmtLdFjsYzw0G7jiRiaN9Z0rd4oPwxOcLp7kes02vaIW3iO37OrCRhl6njGM
	 n/biqfvCSfW3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 11/11] leds: st1202: Honour max_brightness when
 blinking
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <GV1PR08MB849736BD134900C02F674EBEC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB849736BD134900C02F674EBEC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 22:55:56 +0000
Message-Id: <20260912225557.5CE461F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Blinking one channel forcibly turns off all other active channels =
due to a shared global sequencer zeroing out their PWM slots.
- [High] st1202_led_set() passes the requested brightness directly to a u8 =
register write without capping it, causing silent integer truncation that c=
an turn the LED off.
--

commit 3ae7cb7beb88cd5d234d548399ec8a5dcd6d48e8
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: Honour max_brightness when blinking

This commit updates the blinking path to respect the max-brightness property
defined in the device tree, capping the value to the width of the register.
It ensures the current is only raised after the channel is enabled and the
sequencer is started to prevent raising current for a failed blink.

>     The brightness and pattern paths both respect it. Blinking is the one
>     that does not, so a board that declares a lower ceiling holds it until
>     something enables the timer trigger.

[Severity: High]
This isn't a bug introduced by this patch, but does the brightness path
actually respect the maximum brightness properly?

Looking at st1202_led_set(), the value is directly passed to the register
write:

drivers/leds/leds-st1202.c:st1202_led_set() {
    ...
    ret =3D st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
    if (ret)
        return ret;
    ...
}

Because st1202_write_reg() takes a u8 for the value, if a device tree
specifies a max-brightness greater than 255 (e.g., 256), a requested
brightness of 256 will silently truncate to 0 and turn the led off instead
of setting it to max.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index b93828fbbe26c..2114ef8a31194 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
> @@ -385,10 +385,6 @@ static int st1202_blink_set(struct led_classdev *led=
_cdev,

[Severity: High]
This is a pre-existing issue, but does blinking one led forcibly break the
state of all other active leds?

Looking earlier in st1202_blink_set():

drivers/leds/leds-st1202.c:st1202_blink_set() {
    ...
    /* Zero out PWM for all other active channels to prevent them from blin=
king */
    for (int chan =3D 0; chan < ST1202_MAX_LEDS; chan++) {
        if (!chip->leds[chan].is_active || chan =3D=3D led->led_num)
            continue;

        ret =3D st1202_pwm_pattern_write(chip, chan, 0, LED_OFF);
        if (ret)
            return ret;

        ret =3D st1202_pwm_pattern_write(chip, chan, 1, LED_OFF);
        if (ret)
            return ret;
    }
    ...
}

If a user configures one led to be continuously on and then configures a
second led to blink, won't this loop overwrite the first led's pwm slots
and turn it off during both sequencer phases?

If the driver left the other active leds' pwm slots at
ST1202_PATTERN_PWM_FULL, wouldn't they correctly remain solidly on without
blinking while the global sequencer runs?

>  	if (ret)
>  		return ret;
> =20
> -	ret =3D st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, U8_MAX);
> -	if (ret)
> -		return ret;
> -
>  	ret =3D __st1202_channel_set(chip, led->led_num, true);
>  	if (ret)
>  		return ret;
> @@ -399,6 +395,11 @@ static int st1202_blink_set(struct led_classdev *led=
_cdev,
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num,
> +				min_t(unsigned int, led_cdev->max_brightness, U8_MAX));
> +	if (ret)
> +		return ret;
> +
>  	*delay_on =3D on;
>  	*delay_off =3D off;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497422B7A=
44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D11

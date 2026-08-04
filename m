Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC46453A47
	for <linux-leds@vger.kernel.org>; Tue,  4 Aug 2026 10:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785840782; cv=none; b=sx2VCDpuJeGkTdlVRloaDgDhgXkcTOWgwKM0Agn4ZeNphJNlGo2vlUpDr78MZMCnsqHdYX2qN7CIY8YGLP2JZ/Taoo2+vlFK2GWdeRrXE6VdLnrjelwp09Jb6cBA9ZVml0pJzO3qG1dnpCHDLM2JiAEnDXtcgIFd5pPS2T5yWdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785840782; c=relaxed/simple;
	bh=tnLmaQfVcMSOagiZ/MyfiwnK+5y6Tmu5XZp5rh4hMKs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nFY2qNqmu+/yCc3RszHEi6E8Ur1bAsqa5CzJrmfDLjFp3dBJhRs2R1+AwR5lOa6Sv/AJeftTT5QOTSu9YRkazavvYUOF4FmqHqXmQNbLecdoEJ8GsFgQHvihaI5PLXc/yutTuT/gF7iSCQVq48UhqkaXllkyrR7Ivu+waJ409Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c6w10ZOe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c6w10ZOe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68661F000E9;
	Tue,  4 Aug 2026 10:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785840774;
	bh=CY7AW7vIfF8NshgfYVl10NwUrlLto2q03mzA1isIiEI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c6w10ZOevt8qS6BYxhFPfApY5h43KYQQ1+0U+omHqgh54J7XmRFLbnq5s+XAzEsgR
	 r8ACicWV497F8S29EHci8V/J3IAJx+TVfwC/RkjsfrG0GpzKmussh96p1zxcKVB4+9
	 MRmh9UzWXnUKMaaSbl40SvnyzksyWxsWXyLFr/XvHhpO4ZLBMYJf4eRB/dSlsXRb1a
	 vmk0lXMExoi90EYQkXaTP6drfs5+9iCY6326ehIDZkqhTNoQ0vRtQXnD81tKKDwC2m
	 hkMQtDUF/uUYXqBsp2JSOkIqYx15r5j4Pa3IPsqXYWs7unCTJ/ZAAg2ALsvR7HiOW8
	 Aad+DiNDKuDeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/1] leds: st1202: Add hardware-accelerated blink
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <GV1PR08MB849709A3BE3D1CBB9E28ABD2C5D42@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497E2498ED9D66AF60A3ACFC5D42@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB849709A3BE3D1CBB9E28ABD2C5D42@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 10:52:53 +0000
Message-Id: <20260804105253.C68661F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Hardware-accelerated blink destructively alters the physical state=
 of all other active LEDs by zeroing their PWM slots.
- [Medium] Hardware blink overrides user-configured brightness by hardcodin=
g maximum intensity.
- [Medium] Updating LED brightness indiscriminately breaks an active hardwa=
re blink configuration.

Pre-existing issues:
- [High] The driver incorrectly assigns a sleeping function to the non-bloc=
king `brightness_set` callback, causing 'scheduling while atomic' panics.
- [High] Dangling `fwnode` pointers due to un-incremented scoped device nod=
e reference.
--

--- Patch [1]: [PATCH v5 1/1] leds: st1202: Add hardware-accelerated blink =
support ---
commit c3a88eb697aa140ded0dcf2250d8f8ad71aa79ac
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: Add hardware-accelerated blink support

Implement blink_set() to enable hardware-accelerated blinking via the timer
trigger. Requested delays are clamped to the hardware range and the LED1202
pattern sequencer is configured globally.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
[ ... ]
> +static int st1202_blink_set(struct led_classdev *led_cdev,
> +			unsigned long *delay_on, unsigned long *delay_off)
> +{
[ ... ]
> +	/* Zero out PWM for all other active channels to prevent them from blin=
king */
> +	for (int i =3D 0; i < ST1202_MAX_LEDS; i++) {
> +		if (!chip->leds[i].is_active || i =3D=3D led->led_num)
> +			continue;
> +		ret =3D st1202_pwm_pattern_write(chip, i, 0, LED_OFF);
> +		if (ret)
> +			return ret;
> +		ret =3D st1202_pwm_pattern_write(chip, i, 1, LED_OFF);
> +		if (ret)
> +			return ret;
> +	}

[Severity: High]
Does this loop destructively alter the physical state of all other active
LEDs?

Because the LED1202 hardware sequencer is a global resource, starting it
forces all channels to execute the sequence. Any LED that was previously set
to steady ON will output zero during these steps, causing it to go dark
while the kernel subsystem still believes it to be on.

> +
> +	ret =3D st1202_pwm_pattern_write(chip, led->led_num, 0, ST1202_PATTERN_=
PWM_FULL);

[Severity: Medium]
Can this override the user-configured brightness by hardcoding maximum
intensity?

The PWM slot is being forced to ST1202_PATTERN_PWM_FULL, and later the ILED
register is forced to U8_MAX, completely disregarding the
led_cdev->brightness value.

[ ... ]
> @@ -301,6 +380,7 @@ static int st1202_dt_init(struct st1202_chip *chip)
[ ... ]
>  		led =3D &chip->leds[reg];
>  		led->is_active =3D true;
>  		led->fwnode =3D of_fwnode_handle(child);

[Severity: High]
This is a pre-existing issue, but could this leave led->fwnode with a
dangling pointer?

The driver stores a pointer to this node from the scoped
for_each_available_child_of_node_scoped() loop, but fails to increment
its reference count via fwnode_handle_get(). When the scoped loop
drops the reference, the node may be freed, causing a use-after-free
when accessing the fwnode during class device registration or subsystem
operations.

> =20
>  		led->led_cdev.max_brightness =3D U8_MAX;
>  		led->led_cdev.brightness_set_blocking =3D st1202_led_set;
>  		led->led_cdev.pattern_set =3D st1202_led_pattern_set;
>  		led->led_cdev.pattern_clear =3D st1202_led_pattern_clear;
>  		led->led_cdev.default_trigger =3D "pattern";
> +		led->led_cdev.blink_set =3D st1202_blink_set;

[Severity: Medium]
Would updating the LED brightness indiscriminately break an active hardware
blink configuration?

If a user changes the brightness while the LED is hardware-blinking,
st1202_brightness_set() unconditionally forces all 8 PWM pattern slots to
ST1202_PATTERN_PWM_FULL:

st1202_brightness_set() {
        ...
        for (int patt =3D 0; patt < ST1202_MAX_PATTERNS; patt++)
                st1202_pwm_pattern_write(chip, led->led_num, patt,=20
                                         ST1202_PATTERN_PWM_FULL);
        ...
}

This overwrites the OFF step established by st1202_blink_set(), turning the
LED steadily ON while the subsystem still considers it to be blinking.

>  		led->led_cdev.brightness_set =3D st1202_brightness_set;

[Severity: High]
This is a pre-existing issue, but is it safe to assign a sleeping function
to the non-blocking brightness_set callback?=20

st1202_brightness_set() acquires a mutex and performs sleepable I2C
operations:

st1202_brightness_set() {
        ...
        guard(mutex)(&chip->lock);
        ...
        st1202_write_reg(...)
}

The LED core assumes led_cdev.brightness_set does not sleep, calling it
directly from atomic contexts. This can cause scheduling while atomic
panics.

>  		led->led_cdev.brightness_get =3D st1202_brightness_get;
>  	}
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB849709A3BE=
3D1CBB9E28ABD2C5D42@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDE33D565D
	for <linux-leds@vger.kernel.org>; Sat, 12 Sep 2026 22:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253489; cv=none; b=fkqNUhKJBMYFN1jMIDNbCy4jkRkAO5NR4bt7iZcPsxvhTOs2ESh5SVZj0bRiSeXlRChSHiFQhIWkXkfx6qyqw5Oy9lkBrHmC2bX0+FVvDnDnwxcGXB4qem5vdUrmwE7lnso/GlprNERXykturpm7bGkeHEILj16Rrza6bdHAd+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253489; c=relaxed/simple;
	bh=/sWhfoNCt1Pheu6JkTgvy9UfzEP2nILysCN7S5L1pG0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DYx1Cxn1iqHEJ3pNNrr9GErEjBnC9wl1WcGFP6wv4w5+BvU8DLoU4Y96GxJ31ApGyPy+/19RUt0XFd6Cs0ErYmpkOfCQ8s93O9ENe5sx0gE9Oj9fclw7ou15NFMYlkAFzZAVctpsDJuVy4bRULfUPZGiBPmhDnVWdkeaZJvmK1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqNESOPQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqNESOPQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11EB91F000FF;
	Sat, 12 Sep 2026 22:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789253488;
	bh=VXfgbnsOeEDtmi9Nb2H9hI6zF25gXdUFE0t1pumYCL0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fqNESOPQbReMwLeb2rp0aDL+yHeBJNFvMOXnCw8q+TjpgCaUw3myr5zDh7TDeZGnG
	 rrh+xDckbJAEk9S6LfMpj5yVfeFUgmFnIU/ksM4ZftGPwkBCo3Agezq+N7bWZqhwJ+
	 k9T1Cf9gYY2Edey0C0szolfEgYGIjdtQS51A9VvI+RraWwim9osc7Ywe4ecE7Ipodn
	 SqFVsa3v2uW5fJSkwo84Iku+7zqZUbKfMyym2p/Hi57VFXjNPJdV2UMSTRrUJf1TrW
	 o5PuHcKbKM89s0AZf3JqFedokeJ+Dx0SDl04TQjxoHPAa7u3b7Upt0PvW7oYDZgX8F
	 uVpXiF0zukHqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 10/11] leds: st1202: Clear unused pattern slots in
 blink_set()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <GV1PR08MB8497E28C8864E97AF8C6F08DC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497E28C8864E97AF8C6F08DC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 22:51:27 +0000
Message-Id: <20260912225128.11EB91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] st1202_blink_set() incorrectly zeroes out PWM slots for other acti=
ve channels, breaking solid-on LEDs and causing cross-channel interference.
- [High] st1202_led_pattern_clear() and st1202_blink_set() destructively cl=
ear shared global sequencer duration registers, halting hardware patterns o=
n other channels.
--

commit a162d0d169d87855db4320cf80b6e7c657d7bddc
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: Clear unused pattern slots in blink_set()

The patch clears unused pattern slots (2 to 7) in st1202_blink_set() by
zeroing them out for the channel. This prevents a blinking channel from
emitting unrequested output when another channel programs longer hardware
patterns and re-arms the global sequencer.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index 1267671557f09..b93828fbbe26c 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
> @@ -361,9 +361,11 @@ static int st1202_blink_set(struct led_classdev *led=
_cdev,

[Severity: High]
This isn't a bug introduced by this patch, but does st1202_blink_set()
corrupt the PWM state of independent, non-blinking channels?

Earlier in drivers/leds/leds-st1202.c:st1202_blink_set(), the code zeros
out other active channels:

	/* Zero out PWM for all other active channels to prevent them from blinkin=
g */
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

Because solid-on LEDs rely on having all their PWM slots set to
ST1202_PATTERN_PWM_FULL, overwriting their slots 0 and 1 to LED_OFF causes
them to incorrectly turn dark during the first two steps of the global
sequencer's cycle when any LED is set to blink mode via sysfs.

>  	if (ret)
>  		return ret;
> =20
> -	ret =3D st1202_pwm_pattern_write(chip, led->led_num, 1, LED_OFF);
> -	if (ret)
> -		return ret;
> +	for (int pattern =3D 1; pattern < ST1202_MAX_PATTERNS; pattern++) {
> +		ret =3D st1202_pwm_pattern_write(chip, led->led_num, pattern, LED_OFF);
> +		if (ret)
> +			return ret;
> +	}
> =20
>  	ret =3D st1202_duration_pattern_write(chip, 0, on);
>  	if (ret)

[Severity: High]
This is a pre-existing issue, but do st1202_led_pattern_clear() and
st1202_blink_set() destructively clear shared global sequencer duration
registers?

Later in drivers/leds/leds-st1202.c:st1202_blink_set(), the duration regist=
ers
are reset to zero for all slots:

	for (int pattern =3D 2; pattern < ST1202_MAX_PATTERNS; pattern++) {
		ret =3D st1202_write_reg(chip, ST1202_PATTERN_DUR + pattern, 0);
		if (ret)
			return ret;
	}

And similarly in drivers/leds/leds-st1202.c:st1202_led_pattern_clear():

	ret =3D st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_PHASE_=
SHIFT);
	if (ret !=3D 0)
		return ret;
	...
		ret =3D st1202_write_reg(chip, ST1202_PATTERN_DUR + pattern, 0);

Since the ST1202 features a single, globally shared sequencer and duration
register set, zeroing these registers for one channel via sysfs truncates t=
he
shared timeline. Does this prematurely halt or break all other channels that
are simultaneously using hardware blinking or patterns?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497422B7A=
44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D10

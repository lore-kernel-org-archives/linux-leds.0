Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0572443F0AC;
	Fri, 24 Jul 2026 15:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905870; cv=none; b=UJxiSY6AGFGzdkdlfhIOKxOeia8jDH/V6lERJ0/8V1bGtYSZ2ErmXjoF0nfBvvSAuf4LArz5Uj8Fe7FOCaXQoJUHZT6cm+uo3NYN0ERHb7Zm6kalDNv5eYCmBxlo3i60Mgbc2wFt3helIXJzvyaQgDjyz+e8aeska8JXDJEw37U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905870; c=relaxed/simple;
	bh=qaT8R5JHwG8lHsrT2lgNCnUQMQJ/NoihdypcadXz2IQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IQfXr2XglpW0SdF3hLZy6HOdTUnm+zSXAjiJ0aN/F0icSWJTpsHANqLQ7cAWh2yBmMFpBKjgkI7CoOmW1Qf1EawJ4hLI85duKPeb2hqntcyWsMWWGHGRjcGBi4hw4Fw2Zyf7EOnoe/5TlyQutJyytQEEMAu9UoVZtg8Yg79acQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VEqCsiEQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEqCsiEQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA651F000E9;
	Fri, 24 Jul 2026 15:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784905865;
	bh=XWPAIcZdyfQSfA3vW4uopZjhz54hNRAg8r1Piylo3Zs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VEqCsiEQKyYHXJ2T89AUCpVF9xKbOz1puNBoRtXXixccBJAEsewRjx+yZQrCIqFrW
	 S/00qXyoTilbgvXPmuTetqKieeo2uDhzTAtBh4WSkCBcsspbvStqR10BCv2uXRSPR0
	 pIkj70viOtIfRBIeIOxYx5YX1MgDhA4FgBkOcLPAEYH0e/oBgEu0f5/xUTXlUL3r4q
	 +XXOZJZMHJv22lMbwonx4oXmvbEg1y2CgHCuxeHl7pGTn8Q011YqqUjQgE39YWIPlj
	 orTTcNC9fuknfrf4WrVTOm4247wYZPFwQsC/JG47DWBl+QC9uwR9qCNGQ7nEOl7cnz
	 ZUxs24ByjjNKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 2/2] platform: Add initial synology microp driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Probst" <markus.probst@posteo.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, ojeda@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260724-synology_microp_initial-v17-2-e2f70b4dc691@posteo.de>
References: <20260724-synology_microp_initial-v17-0-e2f70b4dc691@posteo.de>
 <20260724-synology_microp_initial-v17-2-e2f70b4dc691@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 15:11:04 +0000
Message-Id: <20260724151104.EAA651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Hardware blinking is not disabled when setting a solid brightnes=
s.
- [Medium] StatusLedHandler::blink_set does not update delay_on and delay_o=
ff when subled_intensity =3D=3D 0, causing incorrect sysfs blink rate repor=
ting.
--

--- Patch [2]: [PATCH v17 2/2] platform: Add initial synology microp driver=
 ---
commit 4d27f9676f69d36945bb122b6d9df48adadc7625
Author: Markus Probst <markus.probst@posteo.de>

platform: Add initial synology microp driver

This commit adds an initial Synology microp driver written in Rust to
control the power, status, alert, and USB LEDs on Synology NAS devices.
The driver targets a microcontroller found on these devices.

> diff --git a/drivers/platform/synology_microp/led.rs b/drivers/platform/s=
ynology_microp/led.rs
> new file mode 100644
> index 0000000000000..ce57adfd307f2
> --- /dev/null
> +++ b/drivers/platform/synology_microp/led.rs

[ ... ]

> +    fn brightness_set<'bound>(
> +        &self,
> +        dev: &'bound Self::Bus,
> +        _classdev: &led::Device<'bound, Self>,
> +        brightness: u32,
> +    ) -> Result<()> {
> +        let mut blink =3D self.blink.lock();
> +        (self.command)(if brightness =3D=3D 0 {
> +            *blink =3D false;
> +            State::Off
> +        } else if *blink {
> +            State::Blink

[Severity: Medium]
Does this prevent transitioning the LED from a blinking state to a solid ON
state?

If userspace sets a hardware blink, the blink variable becomes true. Later,=
 if
userspace writes a non-zero brightness to turn the LED solid ON, this code
path checks the blink variable and issues State::Blink instead of State::On,
leaving the hardware in a blinking state.

> +        } else {
> +            State::On
> +        })
> +        .write(dev)?;
> +
> +        Ok(())
> +    }

[ ... ]

> +    fn brightness_set<'bound>(
> +        &self,
> +        dev: &'bound Self::Bus,
> +        classdev: &led::MultiColorDevice<'bound, Self>,
> +        brightness: u32,
> +    ) -> Result<()> {
> +        let mut blink =3D self.blink.lock();
> +        if brightness =3D=3D 0 {
> +            *blink =3D false;
> +        }
> +
> +        let amber_brightness =3D classdev.subleds()[1].brightness();
> +
> +        let (color, subled_brightness) =3D if amber_brightness =3D=3D 0 {
> +            (StatusLedColor::Green, classdev.subleds()[0].brightness())
> +        } else {
> +            (StatusLedColor::Amber, amber_brightness)
> +        };
> +
> +        Command::StatusLed(
> +            color,
> +            if subled_brightness =3D=3D 0 {
> +                State::Off
> +            } else if *blink {
> +                State::Blink

[Severity: Medium]
Similarly here, does this prevent the multi-color status LED from being set=
 to
a solid ON state once it is blinking?

> +            } else {
> +                State::On
> +            },
> +        )
> +        .write(dev)
> +    }

[ ... ]

> +    fn blink_set<'bound>(
> +        &self,
> +        dev: &'bound Self::Bus,
> +        classdev: &led::MultiColorDevice<'bound, Self>,
> +        delay_on: &mut usize,
> +        delay_off: &mut usize,
> +    ) -> Result<()> {
> +        let mut blink =3D self.blink.lock();
> +        *blink =3D true;
> +
> +        let amber_intensity =3D classdev.subleds()[1].intensity();
> +
> +        let (color, subled_intensity) =3D if amber_intensity =3D=3D 0 {
> +            (StatusLedColor::Green, classdev.subleds()[0].intensity())
> +        } else {
> +            (StatusLedColor::Amber, amber_intensity)
> +        };
> +        Command::StatusLed(
> +            color,
> +            if *delay_on =3D=3D 0 && *delay_off !=3D 0 {
> +                *blink =3D false;
> +                State::Off
> +            } else if subled_intensity =3D=3D 0 {
> +                State::Off

[Severity: Medium]
Are delay_on and delay_off left un-updated when subled_intensity is 0?

If userspace configures a blink rate while the multi-color LED intensity is=
 0,
this returns State::Off to the hardware but successfully returns to the LED
core without updating the delay values to the fixed hardware blink rate.
This can cause sysfs to report the user-provided values rather than the act=
ual
hardware rate.

> +            } else if *delay_on !=3D 0 && *delay_off =3D=3D 0 {
> +                *blink =3D false;
> +                State::On
> +            } else {
> +                *delay_on =3D BLINK_DELAY.as_millis() as usize;
> +                *delay_off =3D BLINK_DELAY.as_millis() as usize;
> +
> +                State::Blink
> +            },
> +        )
> +        .write(dev)
> +    }
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-synology_m=
icrop_initial-v17-0-e2f70b4dc691@posteo.de?part=3D2

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DF73002DD
	for <linux-leds@vger.kernel.org>; Fri, 21 Aug 2026 08:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787301984; cv=none; b=OZF/tQYAqne6ab6XTymecMrdAn1g0tWgtsPV9bqvqflH27V3y7Se7n+4u28wEUoZGaUSJTchsqS8MCY51mpRfe8JbiPfK5b2Xg/fqeGkOV/qPX51Rb1Zrsb7K/ne4SHEkPx1hLMYd73DZwqKs2WwoH/SJNoiaaxJPpyPBY32W20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787301984; c=relaxed/simple;
	bh=vQV4h3WBX3XJ/uhQNwaTzWsk0X55i7SER3vCBi5FbKk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yi18Fq/ujCQc40nOQ/GPmJ3IV+CFEV2wd45ynaN4YTKm2pU2nIWwNwwSyv7FyQzlRJUKWMkC+pHl4CIZQ+6YDkTlx+Z7I3Bv0G0X/WoWaKg/bQZ2dkcAQRrIawjI6/JUe0Lzav7wEdmKmoo+9qq6IAYXFZPoeufdDbv3AR3OirI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5Q26j4v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5Q26j4v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77771F000E9;
	Fri, 21 Aug 2026 08:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787301982;
	bh=P5DmjEoHLAHTdBwEXvkE4VyIG6rjQbtkKLbBAyYhmEo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V5Q26j4vVo/9CnMG3ZHUAEUwjQI0rR1p9RuhPlO35zLETi33E/QshooPcpwQ1QiiN
	 I//pj8qIPn3sljxu0ntgSSAPz1KbtuKsmTGHYbSkntV4YzSJWyMyyn+Wt8k6fVHuud
	 oI6r6kYwOHxl5t1bDch1JeM8tWIJAQPCsLos2J9257rV8rTBSRIjsV8KF47ohpdt+B
	 F0BL9jzwznvF1IVGpsQSxISA/qpE1IOpgQRmf0Zj3KuUz8Mzg6JK3fAXcDkb99Oy1D
	 0xhUY2ZH4onpA4RRJb2cHBGVlmnSUMbP7aAqnRAIohAG/vTBq6a/X3x9QCPxemf2x+
	 pW/PT3pn+QZxg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/2] leds: flash: Add support for the TI LM3643 dual
 LED flash driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rillian Grant" <rillian.grant@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260821083620.68324-3-rillian.grant@gmail.com>
References: <20260821083620.68324-1-rillian.grant@gmail.com>
 <20260821083620.68324-3-rillian.grant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 08:46:22 +0000
Message-Id: <20260821084622.B77771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Turning off an LED fails to clear the chip mode bits, causing powe=
r drain and breaking flash strobe teardown.
--

--- Patch [2]: [RFC PATCH 2/2] leds: flash: Add support for the TI LM3643 d=
ual LED flash driver ---
commit bdf1945ab184ca005c2f401ecd5408571ece1de3
Author: Rillian Grant <rillian.grant@gmail.com>

leds: flash: Add support for the TI LM3643 dual LED flash driver
   =20
The LM3643 is an I2C dual LED flash driver. Its two high-side current
sources share a synchronous boost converter and each supports torch and
flash modes with programmable current and flash timeout alongside fault
reporting.

> diff --git a/drivers/leds/flash/leds-lm3643.c b/drivers/leds/flash/leds-l=
m3643.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/leds/flash/leds-lm3643.c

[ ... ]

> +static int lm3643_torch_set_brightness(struct led_classdev *led_cdev,
> +				       enum led_brightness brightness)
> +{

[ ... ]

> +	if (brightness =3D=3D 0)
> +		return regmap_update_bits(led->regmap, LM3643_REG_ENABLE,
> +				chan->enable_bit, 0);

[Severity: High]
When brightness is 0, this only clears the channel's enable bit but leaves
the LM3643_MODE_MASK bits intact. If no other LEDs are active, does this
leave the chip in an active power state (Torch or Flash mode) instead of
transitioning to LM3643_MODE_STANDBY, potentially causing continuous battery
drain?

[ ... ]

> +static int lm3643_flash_strobe_set(struct led_classdev_flash *fled_cdev,=
 bool state)
> +{

[ ... ]

> +	if (!state) {
> +		if (mode !=3D LM3643_MODE_FLASH || !(enable_reg & chan->enable_bit))
> +			return 0;
> +
> +		return regmap_update_bits(led->regmap, LM3643_REG_ENABLE,
> +			LM3643_MODE_MASK, LM3643_MODE_STANDBY);
> +	}

[Severity: High]
If the torch brightness was set to 0 during a flash, the channel's enable
bit will have been cleared. During the subsequent teardown call to
lm3643_flash_strobe_set() with state =3D false, does this early return trig=
ger
because the enable bit is no longer set?

This would fail to restore the mode to LM3643_MODE_STANDBY, permanently
stranding the driver's state machine in Flash mode.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821083620.6832=
4-1-rillian.grant@gmail.com?part=3D2

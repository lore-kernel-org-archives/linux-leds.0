Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AD4320A37
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 17:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783014813; cv=none; b=qJbdbj6FcLc2TDMDO9ewXu1DfxO4doyFOdIN4GWC/Q5cuSh03A+PT5SnYbTDNpFWlQN9UlnzhcoLjzyvxbH5MyV4SnaxTVvCJsTgjxdMhRT9T47gVp5LbOQT0P4msOp+X1bFOee70W45YqB2bz6hJ4wUztPmkKVu0va61ILuPgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783014813; c=relaxed/simple;
	bh=zA5ocuY0iuUcYUPmjumM+MRC6O+th0xq8T4H5VjyrOs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QCEbtc8mTZp0zC1CAYvQmIYBdbRLwHWb+sRoG/NCR3DN9jfbQ7HqK8gJz2RBWmv5YEAzHxegQf5SL78L5NHX/YbTaDaS0yeuU9OAiRWdSE8CH7mGUdCLzqaAgZsa9IjtJ3Xp4hNs4cprH4X1MxUsr0A2nbPIRn7IISbOu5fuibE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=btOd/dw/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="btOd/dw/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9081F000E9;
	Thu,  2 Jul 2026 17:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783014811;
	bh=rkmUk2k5MQPKpdq8wtHSBISdZq0xmpIMyZomutCG+64=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=btOd/dw/G58Tmbn1bTAt0uAEgy54/nTj7VO9TTxBMYOngFyhg4iwtAQDWNLv5S22x
	 E4ppQeE+0QTE0Zu1xwzry8mURL3bvOC/EWvwAbgA9nNXhC0TXpj+p+WegZkxDPFPmr
	 ayIDIchElVmIhmlrqMB+GjbdTuLJPXFS0sstcQaIgSATEY0W6oSnH4B9dZB4yDxQ8H
	 t6Qvuu7WXlPqOb14jIymZTcGDE/oOnhL0xxAGPgsFhylRndZscqz1VFPjZbKFJ974a
	 kchJXUEGU4esAGbFaf0M+GPhedWzygbgdQd84hlVCyU7snxqjIFwSYD2kD6mTPPXoO
	 xPdPbhDspg+jQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/9] leds: st1202: fix spurious pattern sequence
 start in setup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <GV1PR08MB8497ECDF070E9D82D0D2E983C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497ECDF070E9D82D0D2E983C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 17:53:31 +0000
Message-Id: <20260702175331.8C9081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The non-blocking `brightness_set` callback is assigned to a sleepi=
ng function, and `brightness_set_blocking` improperly discards brightness v=
alues.
- [High] Per-LED pattern callbacks inappropriately modify global chip seque=
ncer registers, corrupting state for other channels.
- [High] Device tree node `fwnode` pointer is saved without incrementing it=
s reference count, resulting in a dangling pointer.
--

commit 0028567786c848c91c978540c9eaefe27ea93565
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: fix spurious pattern sequence start in setup

This patch removes a final write to the configuration register in
st1202_setup(). The removal prevents the hardware pattern sequencer from
starting prematurely during device probe before any patterns have been
programmed.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index 3203b3768ec52..b8a5712829009 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
> @@ -333,11 +333,6 @@ static int st1202_setup(struct st1202_chip *chip)
>  	if (ret < 0)
>  		return ret;
> =20
> -	ret =3D st1202_write_reg(chip, ST1202_CONFIG_REG,
> -				ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_PATSR);
> -	if (ret < 0)
> -		return ret;
> -
>  	return 0;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does st1202_dt_init() create=
 a
dangling fwnode pointer?

When retrieving the child nodes via for_each_available_child_of_node_scoped=
(),
the node reference is dropped automatically at the end of the loop:

st1202_dt_init() {
    ...
    for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
        ...
        led->fwnode =3D of_fwnode_handle(child);
    }
    ...
}

Because fwnode_handle_get() is not used before assigning to led->fwnode, th=
is
pointer becomes dangling after the loop ends and is later dereferenced in
st1202_probe() when calling devm_led_classdev_register_ext().

Can this lead to a use-after-free, especially if dynamic device trees or
overlays are used?

[Severity: High]
This is a pre-existing issue, but are the blocking and non-blocking brightn=
ess
callbacks swapped in st1202_dt_init()?

st1202_dt_init() {
    ...
    led->led_cdev.brightness_set_blocking =3D st1202_led_set;
    ...
    led->led_cdev.brightness_set =3D st1202_brightness_set;
    ...
}

The non-blocking brightness_set callback is assigned to
st1202_brightness_set(), which takes a mutex and performs I2C transactions
that can sleep:

st1202_brightness_set() {
    ...
    guard(mutex)(&chip->lock);
    st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
}

Could this cause a scheduling while atomic bug if triggered from an atomic
context like a software timer?

At the same time, the blocking callback is assigned to st1202_led_set(),
which completely discards intermediate brightness values and only toggles
the channel on or off:

st1202_led_set() {
    ...
    return st1202_channel_set(led->chip, led->led_num, !!value);
}

[Severity: High]
This isn't a bug introduced by this patch, but do the per-LED pattern
callbacks corrupt global sequencer registers for other LEDs?

In st1202_led_pattern_clear(), the function unconditionally zeroes out the
global pattern duration registers:

st1202_led_pattern_clear() {
    ...
    for (int patt =3D 0; patt < ST1202_MAX_PATTERNS; patt++) {
        ...
        ret =3D st1202_write_reg(chip, ST1202_PATTERN_DUR + patt, 0);
    }
    ...
}

Similarly, st1202_led_pattern_set() resets the global sequence enable bits
for the whole chip:

st1202_led_pattern_set() {
    ...
    ret =3D st1202_write_reg(chip, ST1202_CONFIG_REG, (ST1202_CONFIG_REG_PA=
TSR |
                            ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_SHFT=
));
    ...
}

Since these registers are shared across all channels on the chip, will clea=
ring
or setting a pattern on one LED arbitrarily destroy the pattern state of
another LED running simultaneously?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB84972A16ED=
557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D5

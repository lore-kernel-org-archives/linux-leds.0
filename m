Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600337;
	b=mGOJQiedQbUZthbYN6QFYksvZsIhP3S3rxMyV7eGZaPc7aRkePS8KNdDILhDHuosaUtn
	 cBehFVcM5Cph9aKPIt4rxqOYgkkxjt0tJaaZchPXo6cB5c1zEkP3wte+uUG4Vf6XWAlBT
	 6Zn8sn7p5/hjvcTkqMe0J2CY2Egiu0sN6XjoTXsVjgqR4/3jpArsXCSlXom1jY8uvoU4+
	 6pKooJaEipb4Hb+mSvWYKDWQcwptvbqinl623e6HNnVjH77DtiN7SNohx97ZfFZ/uAu9p
	 n+Cfmm1Abo9y4I2MuO8K2rcusKTvig2Q95L0bQ7SRMO7HUlNgoki2F2MJgNG8KBvp2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600337;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=UQtEtINa9PCkeAJfrH8v1QZGUwgFpwbuvRFLidulpYI=;
	b=ngdUcZlByynF49OrtMB/1AbWFNBusi0tZOAXGT5eVKf4Ir4Gvzn8c05+k7Ugp3mdL995
	 xNwffGli+p17cD2nCpXHuaPvYw8k6yHk36E9txyYbkMJQGH52fkhcVeUV9LH+AqtXkUMM
	 VSc5iN5AQJQ6IWah0/bXqrbUOaZWSxwl6vQsR0Ay7qW1K+gkeSAcNXrstctsO7+3MUVDR
	 HfdRSVmc6Zn948AS/U2ZL1rh2t/pGaShXEIKKBfl7SBI4lFHVIPI/ttpMMnPPitz9HdGg
	 jok7SKDiT6uPhVcpjsIg4lmLkKfDfjFg1bbsUulda7HLlpatHsOp+VYpw25XwzzU/Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nx08xx2N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4FA606A321;
	Wed, 25 Nov 2026 09:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nx08xx2N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906831F000ED;
	Wed, 25 Nov 2026 09:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795600337;
	bh=UQtEtINa9PCkeAJfrH8v1QZGUwgFpwbuvRFLidulpYI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=nx08xx2NF1zPsS3CtNubp9nK+oLyGErFpI9Nr+2dmJoJG76Xo48Q4NdKSoYBEBUJN
	 4hXdyjeC6LRShkL6jCzRQxJm4SecTKs5aOCaYcgTFDqY+hoPN0f6w2UdgETmZXmeJ2
	 xLLyVmW1t6OpgIWUZelj4QHvkTwoVffCXE5jeXTtvPso1urymnEsO05NruDgTKN768
	 BJX1MKS+Z5Zpd/i1tzrUwNflP8rGHyomyXCbI9kchPZyBt67O9NqkRQ62R6wv4w5ba
	 JZTntTm8pHrC4wSUZcXcmKDZxh7XQjVSCXDhRvG6vQzoCbg4mP+DVoJtCth9GP1BYq
	 BpGopFj8cfMIA==
Subject:
 Re: [PATCH net-next v5 3/3] net: phy: dap8211r: add PHY LED control support
From: netdev-bot+sashiko@kernel.org
To: a.shimko.dev@gmail.com
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 maxime.chevallier@bootlin.com, pavel@ucw.cz, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
 netdev@vger.kernel.org
Date: Wed, 25 Nov 2026 09:52:16 +0000
Message-ID: <179560033613.3135.13122318439070700886@kernel.org>
In-Reply-To: <20261124094914.2993988-4-a.shimko.dev@gmail.com>
References: <20261124094914.2993988-4-a.shimko.dev@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] dap8211r_led_hw_control_get()
  (drivers/net/phy/dap8211r.c:322-369) returns 0 with an incomplete rule…

--

net: phy: dap8211r: add PHY LED control support

This commit adds LED support for the three LEDs on the DAP8211R PHY. It
adds a dap8211r_write_ext() helper and implements the led_brightness_set,
led_hw_is_supported, led_hw_control_set and led_hw_control_get callbacks.

> diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
> index 1fe20efd394d7..9b65b5c57de81 100644
> --- a/drivers/net/phy/dap8211r.c
> +++ b/drivers/net/phy/dap8211r.c

[ ... ]

> +/**
> + * dap8211r_led_hw_control_set() - Write the LED control register
> + * @phydev: PHY device structure
> + * @index: LED index
> + * @rules: Bitmask of requested netdev trigger rules
> + *
> + * Disables force mode and translates the requested trigger rules into
> + * the corresponding bit positions of the LED control register and writes
> + * the resulting value to the PHY.
> + *
> + * Note that the ACT_BLINK bit (13) must be set together with TX/RX rules,
> + * otherwise the LED will not blink on traffic if no other rule (such as
> + * link or duplex) is active.

[ ... ]

> +	ret = dap8211r_write_ext(phydev, led_reg, led_mode);
> +	if (ret)
> +		return ret;

[ ... ]

> +/**
> + * dap8211r_led_hw_control_get() - Read the current LED configuration

[ ... ]

> + * Return: 0 on success, -EINVAL for an invalid LED index, -EOPNOTSUPP if the
> + *         current hardware configuration cannot be represented in rules, or a
> + *         negative error code
> + */
> +static int dap8211r_led_hw_control_get(struct phy_device *phydev, u8 index, unsigned long *rules)
> +{

[ ... ]

> +	led_mode = dap8211r_read_ext(phydev, led_reg);
> +	if (led_mode < 0)
> +		return led_mode;
> +
> +	if (led_mode & ~DAP8211R_LED_SUPPORTED_MASK)
> +		return -EOPNOTSUPP;

[ ... ]

> +	if ((led_mode & DAP8211R_LED_RX) &&
> +	    (led_mode & DAP8211R_LED_ACT_BLINK))
> +		__set_bit(TRIGGER_NETDEV_RX, rules);
> +
> +	if ((led_mode & DAP8211R_LED_TX) &&
> +	    (led_mode & DAP8211R_LED_ACT_BLINK))
> +		__set_bit(TRIGGER_NETDEV_TX, rules);

[Severity: Medium]
Should dap8211r_led_hw_control_get() return -EOPNOTSUPP when LED_n_CON
holds a state that can't be expressed as rules?

The only check that rejects a state is led_mode & ~DAP8211R_LED_SUPPORTED_MASK.
That mask includes ACT_BLINK, TX and RX. As a result, two register states
pass the check, get reported incompletely, and the function still returns 0:

  - RX and/or TX set without ACT_BLINK. For example, LINK_1000 | RX | TX
    is reported as only TRIGGER_NETDEV_LINK_1000. The comment above
    dap8211r_led_hw_control_set() describes this as a working hardware
    mode when a link or duplex rule is active.

  - ACT_BLINK set on its own, which is reported as no rules at all.

The kernel-doc for this function says -EOPNOTSUPP is returned if "the
current hardware configuration cannot be represented in rules". The
led_hw_control_get contract in include/linux/phy.h says the same.

netdev_trig_activate() trusts a 0 return:

drivers/leds/trigger/ledtrig-netdev.c:netdev_trig_activate() {
    ...
			rc = led_cdev->hw_control_get(led_cdev, &mode);
			if (!rc)
				trigger_data->mode = mode;
    ...
}

After that, either the NETDEV_REGISTER replay from
register_netdevice_notifier() or a later NETDEV_UP/CHANGE event runs:

netdev_trig_notify()
  set_baseline_state()
    phy_led_hw_control_set()
      dap8211r_led_hw_control_set()
        dap8211r_write_ext(phydev, led_reg, led_mode)

This writes the whole register with the reduced rules. Would that clear
the RX/TX activity bits set by the reset defaults or the bootloader? It
would also leave sysfs reporting a different mode from the one the LED
was running before the trigger was activated.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124094914.2993988-1-a.shimko.dev%40gmail.com

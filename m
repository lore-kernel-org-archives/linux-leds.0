Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439985;
	b=R028Ga7Nwf9gfESkdjPUU55JpSn97pn02aYXyvx02VeDSoYgE7Iu+7fxBU+dz19fHcwl
	 UkzzgoWMYeelYWrUSw0MuAHFRZSAY/IcLU6VodVCKQEo4FYpiZDKo/9QWOUpRY4LMBAbJ
	 XryXCjNGnfZ8a+7NcS/GU3j16//YJxpsHlCtcf/MrQLFF8aalbrycUlivY//xT7+K0+m3
	 TPxkEcv2W+tp2kCoZQxThm6S1DhIFaC8Okr0gGUgykHCdr34CDSLIlxuD0xZLA0XYQf/j
	 2ndQeC4Sz/9cboXGfGUCP958St0cEOh1Cqe/tn50RG1BtZUSmi41AfNLS0srhYJR1pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439985;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=JUjC5bDxeIH6pgJsh82wcERmlUdpDgIUO8ZfYtwi9FE=;
	b=o7FNHf11FxVqFeCSttp+WmNL5G1dcuNQIAuZ8oJaWvaDTaoezqKatD7XyQ30O3OE8w+W
	 DHvzf5icrU0vLvDlY7PZ5eiyujnGWlhOrYSOGWd43Lxhgk9mQzPRY/pMjWzOVkgaLjaMU
	 w3Cd3nAEJ/XFA7KmoJ2xvXk4+tkWBPP6CzqX3J4kbfc3gEYFmyLoZh7mhaiQSwWG2SPT8
	 AuzLTWRsJi0dET0RVJsLsk/smDfahUHhiqNggqbj9RJDZWX56tHbwHkE+TPxDrYrHcvIe
	 nqrDUANcTr8cV8+sXixZzgoCzpLQB82/REUUfcTsrhsi9fDJ+Z9S7rAjxzVkAT/1aOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qm2MIF6J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85395606A32C;
	Mon, 23 Nov 2026 13:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qm2MIF6J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 149E11F000C6;
	Mon, 23 Nov 2026 13:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795439984;
	bh=JUjC5bDxeIH6pgJsh82wcERmlUdpDgIUO8ZfYtwi9FE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Qm2MIF6JOtMUGepoWneMNnxa/+CsvGSK7CxWi3IB2OJNDYRB9ECR50NNmA4Nzo3Xd
	 dfhwH+EEXQ2BIgNpn16FDMV8exhnTPa7ZYAduhhy1ww9j0RUvo8P0BsGiyjelnrPYB
	 sY1sVBQkT6H4yYfR4QOgcIASixesMQbePfLXwfewfnp7aLJrlpslB5tpyBp4WICyUC
	 s0dxdFUeUYk5Z7npV6A4ivrqS0qj7CjTnd65NSqTc+o6WJcx+pRvb74jHWN/NYpn1r
	 ZwvRc1h03Uo62W6aoeR6kQYzVzbXR2IcO1Y5bPhJz7I4trUEKCbuipSA8PNSKB7/pW
	 JmBXQSwLIyeEQ==
Subject:
 Re: [PATCH net-next v4 3/3] net: phy: dap8211r: add PHY LED control support
From: netdev-bot+sashiko@kernel.org
To: a.shimko.dev@gmail.com
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 maxime.chevallier@bootlin.com, pavel@ucw.cz, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
 netdev@vger.kernel.org
Date: Mon, 23 Nov 2026 13:19:43 +0000
Message-ID: <179543998366.3135.8537500779592480863@kernel.org>
In-Reply-To: <20261122131900.2951586-4-a.shimko.dev@gmail.com>
References: <20261122131900.2951586-4-a.shimko.dev@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In drivers/net/phy/dap8211r.c, dap8211r_led_hw_control_get()
  (lines 312-351) does not undo what dap8211r_led_hw_control_set()…
- [Low] dap8211r_led_hw_control_set() in drivers/net/phy/dap8211r.c first
  clears FORCE_EN(index) in LED_COMCON (0xA00B) with…

--

net: phy: dap8211r: add PHY LED control support

This adds PHY LED support for the three LEDs on the DAP8211R. It adds a
dap8211r_write_ext() helper for indirect extended register writes. It also
implements the led_brightness_set, led_hw_is_supported, led_hw_control_set
and led_hw_control_get callbacks, using force mode for brightness and the
LED_x_CON registers for hardware triggers.

> diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
> index 1fe20efd394d7..b0fb3cf89b55a 100644
> --- a/drivers/net/phy/dap8211r.c
> +++ b/drivers/net/phy/dap8211r.c

[ ... ]

> +static int dap8211r_led_hw_control_set(struct phy_device *phydev, u8 index, unsigned long rules)
> +{
> +	u16 led_mode = 0, led_reg;
> +	int ret;
> +
> +	switch (index) {
> +	case DAP8211R_LED_ID_0 ... DAP8211R_LED_ID_2:
> +		led_reg = DAP8211R_LED_0_CON + index;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	ret = dap8211r_modify_ext(phydev, DAP8211R_LED_COMCON, DAP8211R_LED_FORCE_EN(index), 0);
> +	if (ret)
> +		return ret;

[Severity: Low]

Force mode is cleared in LED_COMCON here, but the new rules are only
written to LED_x_CON later by a separate dap8211r_write_ext() call. Each
helper takes and drops the MDIO bus lock on its own. In between, won't the
LED follow whatever LED_x_CON held before (power-on, bootloader, or
previous trigger rules)?

If the final dap8211r_write_ext() fails, the function returns an error but
leaves force mode off and the stale rules active. set_baseline_state() in
drivers/leds/trigger/ledtrig-netdev.c ignores the return value:

    led_cdev->hw_control_set(led_cdev, trigger_data->mode);

so the trigger would assume the new mode is in effect.

Would it work to write LED_x_CON first and clear FORCE_EN afterwards? The
rule register has no visible effect while force mode is on.

> +
> +	if (test_bit(TRIGGER_NETDEV_LINK, &rules))
> +		led_mode |= DAP8211R_LED_LINK;
> +

[ ... ]

> +	if (test_bit(TRIGGER_NETDEV_RX, &rules))
> +		led_mode |= DAP8211R_LED_RX | DAP8211R_LED_ACT_BLINK;
> +
> +	if (test_bit(TRIGGER_NETDEV_TX, &rules))
> +		led_mode |= DAP8211R_LED_TX | DAP8211R_LED_ACT_BLINK;
> +

[ ... ]

> +	return dap8211r_write_ext(phydev, led_reg, led_mode);
> +}

[ ... ]

> +static int dap8211r_led_hw_control_get(struct phy_device *phydev, u8 index, unsigned long *rules)
> +{

[ ... ]

> +	led_mode = dap8211r_read_ext(phydev, led_reg);
> +	if (led_mode < 0)
> +		return led_mode;
> +
> +	if (led_mode & DAP8211R_LED_LINK_10)
> +		__set_bit(TRIGGER_NETDEV_LINK_10, rules);
> +
> +	if (led_mode & DAP8211R_LED_LINK_100)
> +		__set_bit(TRIGGER_NETDEV_LINK_100, rules);
> +
> +	if (led_mode & DAP8211R_LED_LINK_1000)
> +		__set_bit(TRIGGER_NETDEV_LINK_1000, rules);
> +
> +	if (led_mode & DAP8211R_LED_RX)
> +		__set_bit(TRIGGER_NETDEV_RX, rules);
> +
> +	if (led_mode & DAP8211R_LED_TX)
> +		__set_bit(TRIGGER_NETDEV_TX, rules);
> +
> +	if (led_mode & DAP8211R_LED_HALF_DUPLEX)
> +		__set_bit(TRIGGER_NETDEV_HALF_DUPLEX, rules);
> +
> +	if (led_mode & DAP8211R_LED_FULL_DUPLEX)
> +		__set_bit(TRIGGER_NETDEV_FULL_DUPLEX, rules);
> +
> +	return 0;
> +}

[Severity: Medium]

Does dap8211r_led_hw_control_get() return the same rules that
dap8211r_led_hw_control_set() writes? I see three mismatches.

First, hw_control_set() turns TRIGGER_NETDEV_LINK into LINK_10 | LINK_100 |
LINK_1000. This function only reports the three speed bits and never
reports TRIGGER_NETDEV_LINK.

Second, hw_control_set() always sets DAP8211R_LED_ACT_BLINK along with
TX/RX, but bit 13 is never checked here. The kernel-doc on hw_control_set()
says the LED does not blink on traffic without ACT_BLINK unless another
rule is active. A register with TX/RX set, ACT_BLINK clear and no
link/duplex bit would still be reported as tx/rx offload.

Third, any other LED_x_CON bits are silently ignored, and 0 is returned
anyway.

The led_hw_control_get kernel-doc in include/linux/phy.h says:

    Set *@rules to how the HW is currently blinking. Returns 0
    on success, or a error code if the current blinking cannot
    be represented in rules, or some other error happens.

Should this return an error when the register holds bits that cannot be
expressed as rules?

This matters because the netdev trigger reads the rules and then writes
them back:

netdev_trig_activate()
    led_cdev->hw_control_get(led_cdev, &mode)
    trigger_data->mode = mode
    register_netdevice_notifier()
        netdev_trig_notify(NETDEV_REGISTER)
            set_baseline_state()
                led_cdev->hw_control_set(led_cdev, trigger_data->mode)

hw_control_set() rebuilds led_mode from 0 and writes the whole register
with dap8211r_write_ext(), not a masked modify. Any hardware setting that
hw_control_get() could not express would then be lost just by activating
the trigger, for example via linux,default-trigger = "netdev".

In the ACT_BLINK case, the LED could start blinking on traffic when it did
not before. Whether this happens in practice depends on the power-on or
strap values of LED_x_CON.

In the LINK case, after the trigger is re-activated, sysfs would show
link=0 and link_10=link_100=link_1000=1. Writing link=1 is then rejected
with -EINVAL by this check in netdev_led_attr_store():

    if (test_bit(TRIGGER_NETDEV_LINK, &mode) &&
        (test_bit(TRIGGER_NETDEV_LINK_10, &mode) ||
         test_bit(TRIGGER_NETDEV_LINK_100, &mode) ||
         test_bit(TRIGGER_NETDEV_LINK_1000, &mode) ||

until the speed bits are cleared by hand.

rtl8211f_led_hw_control_get() in the realtek driver reports
TRIGGER_NETDEV_LINK when all three speed bits are set. Could the same
approach be used here?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261122131900.2951586-1-a.shimko.dev%40gmail.com

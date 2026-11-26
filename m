Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718394;
	b=MSctGsE7UjU84/bnHdIJD6XrPJ7Ew6/gkZ6FhyvsS6IcSN/N03nlXjT1IuPXk3OPIESF
	 ze2EEiwX8GtDOtYbEECSVr1X4C9rDSW1yL5VGw3QCFPIaiWOeqFdWEyNxaZX7lACDtXW6
	 GCik/NCFA8y5AN0JNRteUd5XqVF2aXyVHiRYo40W5qxFrPvhSgr2dcaAIbFxWp3VCku3z
	 n8bIxEeRuhrdFk9dxWIQJx30dqoU9liBo+oUpimN2SxQdgVlkDXiLeCOLTYJqSwSN6LpU
	 OcOiNiwJkiVKyAF1tZei6JEOz7NVoXPaDDrxYU60VGIKQX3Vajyt1xy7V+YR7+E5/1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718394;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=YSTzqRwhJELRsBttl0aXsnSnkGgl9o+9N6c89t9SOdc=;
	b=eR8bjzs3CnQTepoAx5i9GfPgmWP4djP4qSSM7Ja4zituHBKjifD7cJUlMFdbwtUfJr8H
	 gI3W0Xogz3WuuNCNA1KyoAKkIQuwxqOP4py2cslo67Z497VBYBuPj0uGYj2UPKN1P3AzY
	 E6DKYxONyZEwnQTK0YS3mbjbHRsH5830tyz/x/uRKKHQxvh88pObBGRsorpqaTJTTJEPa
	 wp4Ta3WeCMhyM/0pDh2tKAntsF2df8IRqiC6wVMsw9NbaxT/sEiBvTfbSrSRxTozvMX+k
	 i0YpV4jw22BQ/VraWDDoHUn7xPv3jOZcN/QHxLWzLih1ZwjbmkeHSmYZ4tyNQX2g6DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UdwaDnjP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AE7606A31C;
	Thu, 26 Nov 2026 18:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UdwaDnjP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174701F000C0;
	Thu, 26 Nov 2026 18:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795718393;
	bh=YSTzqRwhJELRsBttl0aXsnSnkGgl9o+9N6c89t9SOdc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UdwaDnjPGZvf8z73Rf0Dsyl1eO9t1u2CZq+QPxqNMz6P8icWAyxOcT3CgZt5DobFg
	 T0TJcK4TCh8QfpreXQHh3aOUmOEDq/LZZ8IrWd33hyxVRkOFHVRA8EySgwf3JWga8h
	 NiJNRBheXyUnpNThBwUuqShPUidg+Xg+f+OjAcJKCclS8yQp6oNZw5nhYpsfIBeOJM
	 839h33IXwnz8sB1GtEc8bXGPlxdpu01KamUHYxv0+VaPbos02oZEyMrzXwimnl9OJq
	 V3sJ6+1NbO7Z8zjvURLXbo3D2G6wwjC6/9YbJrexCyAydwSF8h0KvUZIolEkXruvj4
	 1HRx0zqE8ls2g==
Subject:
 Re: [PATCH net-next v6 3/3] net: phy: dap8211r: add PHY LED control support
From: netdev-bot+sashiko@kernel.org
To: a.shimko.dev@gmail.com
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 maxime.chevallier@bootlin.com, pavel@ucw.cz, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
 netdev@vger.kernel.org
Date: Thu, 26 Nov 2026 18:39:52 +0000
Message-ID: <179571839263.3135.10510245952431569206@kernel.org>
In-Reply-To: <20261125183742.3039752-4-a.shimko.dev@gmail.com>
References: <20261125183742.3039752-4-a.shimko.dev@gmail.com>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] dap8211r_led_hw_control_get() (drivers/net/phy/dap8211r.c:322)
  builds its rules only from LED_x_CON (0xA00C + index, read at line…
- [Medium] Speculative, because it depends on the reset scope of
  DAP8211R_PHY_CON (0xA001) bit 15, which the code cannot show.

--

net: phy: dap8211r: add PHY LED control support

This commit adds LED support for the three LEDs on the DAP8211R PHY. It
adds a dap8211r_write_ext() helper and implements the led_brightness_set,
led_hw_is_supported, led_hw_control_set and led_hw_control_get callbacks.

> diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
> index 1fe20efd394d7..b029b53dc7ba2 100644
> --- a/drivers/net/phy/dap8211r.c
> +++ b/drivers/net/phy/dap8211r.c

[ ... ]

> @@ -114,6 +190,189 @@ static int dap8211r_modify_ext(struct phy_device *phydev, u16 reg, u16 mask, u16
>  	return ret;
>  }
>  
> +/**
> + * dap8211r_led_brightness_set() - Modify the LEDs common control register
> + * @phydev: PHY device structure
> + * @index: LED index
> + * @value: ON/OFF value for force mode of the LED
> + *
> + * Enables force mode and sets the LED to ON/OFF state.
> + * It will be disabled when hardware LED control is requested.

[ ... ]

> +	if (value != LED_OFF)
> +		set |= DAP8211R_LED_FORCE_ON(index);
> +
> +	return dap8211r_modify_ext(phydev, DAP8211R_LED_COMCON, mask, set);
> +}

[ ... ]

> +static int dap8211r_led_hw_control_set(struct phy_device *phydev, u8 index, unsigned long rules)
> +{

[ ... ]

> +	ret = dap8211r_write_ext(phydev, led_reg, led_mode);
> +	if (ret)
> +		return ret;
> +
> +	return dap8211r_modify_ext(phydev, DAP8211R_LED_COMCON,
> +				   DAP8211R_LED_FORCE_EN(index), 0);
> +}

[Severity: Medium]
Will this LED setup survive the next call to dap8211r_config_init()? The
driver keeps no copy of LED_COMCON or LED0..2_CON. config_init does a chip
software reset and then reprograms only RGMII_CON:

drivers/net/phy/dap8211r.c:dap8211r_config_init() {
    ...
	ret = dap8211r_modify_ext(phydev, DAP8211R_PHY_CON, DAP8211R_PHY_SW_RST, 0);
    ...
	ret = dap8211r_modify_ext(phydev, DAP8211R_RGMII_CON, DAP8211R_RGMII_CONFIG_MASK, set);
    ...
}

config_init runs again from phy_init_hw(). phy_attach_direct() calls
phy_init_hw(), so for MAC drivers that connect the PHY in ndo_open this
happens on every ifup. mdio_bus_phy_resume() calls it too. The LED
classdevs are registered only once, at probe.

DAP8211R_PHY_SW_RST might also reset 0xA00B-0xA00E to their defaults. In
that case the LEDs would go back to power-on behaviour after an
ifdown/ifup or a suspend/resume. Meanwhile ledtrig-netdev would keep
hw_control=true and its cached mode, or the LED core would keep its cached
brightness.

This depends on the reset scope of PHY_CON bit 15, and the code doesn't
show it. If the LED registers survive the reset, this doesn't apply.

Can the reset scope be confirmed? If the LED registers are cleared, could
they be restored after the reset?

> +static int dap8211r_led_hw_control_get(struct phy_device *phydev, u8 index, unsigned long *rules)
> +{

[ ... ]

> +	led_mode = dap8211r_read_ext(phydev, led_reg);
> +	if (led_mode < 0)
> +		return led_mode;

[Severity: Medium]
Should this also check DAP8211R_LED_FORCE_EN(index) in DAP8211R_LED_COMCON?

dap8211r_led_brightness_set() sets that bit and leaves LED_x_CON alone.
The old rules stay in the register while the LED is forced on or off. Only
dap8211r_led_hw_control_set() clears FORCE_EN.

Consider switching the trigger from netdev to none:

echo none > trigger
  led_trigger_remove()
    led_trigger_set(led_cdev, NULL)
      __led_trigger_set()
        led_set_brightness(led_cdev, LED_OFF)
          ...
            dap8211r_led_brightness_set()   <- FORCE_EN set, forced off

In the same way, writing a non-zero value to brightness while no trigger
is set leaves the LED forced on.

Then switch back to netdev:

echo netdev > trigger
  __led_trigger_set()
    flush_work(&led_cdev->set_brightness_work);
    netdev_trig_activate()

When the PHY has an attached netdev, netdev_trig_activate() does:

    trigger_data->hw_control = true;
    set_device_name(trigger_data, name, strlen(name));

    rc = led_cdev->hw_control_get(led_cdev, &mode);
    if (!rc)
        trigger_data->mode = mode;

On this path, set_device_name() skips set_baseline_state():

    /* Skip if we're called from netdev_trig_activate() and hw_control is true */
    if (!trigger_data->hw_control || led_get_trigger_data(trigger_data->led_cdev))
        set_baseline_state(trigger_data);

hw_control_set() is never called, so FORCE_EN stays set. hw_control_get()
then returns 0 with the stale LED_x_CON rules.

Does the LED then stay forced off (or on) while sysfs shows netdev as
offloaded with link/rx/tx set? It looks like it only recovers when a mode
attribute or device_name is written again.

That doesn't match the kernel-doc above either, which says force mode
"will be disabled when hardware LED control is requested".

For comparison, gpy_led_brightness_set() in mxl-gpy.c clears the hardware
rule register on LED_OFF:

	if (value == LED_OFF)
		return phy_write_mmd(phydev, MDIO_MMD_VEND1, VSPEC1_LED(index), 0);

One option is for hw_control_get() to return no rules or an error when
FORCE_EN(index) is set. Another is for brightness_set() to clear LED_x_CON.
Would either of those work here?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125183742.3039752-1-a.shimko.dev%40gmail.com

From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/8] mfd: axp20x: Add axp20x-led cell
Date: Mon, 25 Mar 2019 10:01:48 +0000
Message-ID: <20190325100148.GA4731@dell>
References: <20190215115013.11098-1-stefan@olimex.com>
 <20190215115013.11098-3-stefan@olimex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190215115013.11098-3-stefan@olimex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Mavrodiev <stefan@olimex.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:X-POWERS MULTIFUNCTION PMIC DEVICE DRIVERS" <linux-kernel@vger.kernel.org>, "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-leds@vger.kernel.org

On Fri, 15 Feb 2019, Stefan Mavrodiev wrote:

> Add axp20x-led cell for AXP20x, AXP221, AXP223, AXP228, AXP803, AXP809
> and AXP813.
> 
> Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
> ---
>  drivers/mfd/axp20x.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 3c97f2c0fdfe..e6ab078f0462 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -610,6 +610,9 @@ static const struct mfd_cell axp20x_cells[] = {
>  		.of_compatible	= "x-powers,axp202-usb-power-supply",
>  		.num_resources	= ARRAY_SIZE(axp20x_usb_power_supply_resources),
>  		.resources	= axp20x_usb_power_supply_resources,
> +	}, {
> +		.name		= "axp20x-led",
> +		.of_compatible	= "x-powers,axp20x-led",
>  	},
>  };
>  
> @@ -636,6 +639,9 @@ static const struct mfd_cell axp221_cells[] = {
>  		.of_compatible	= "x-powers,axp221-usb-power-supply",
>  		.num_resources	= ARRAY_SIZE(axp22x_usb_power_supply_resources),
>  		.resources	= axp22x_usb_power_supply_resources,
> +	}, {
> +		.name		= "axp20x-led",
> +		.of_compatible	= "x-powers,axp20x-led",
>  	},
>  };
>  
> @@ -662,6 +668,9 @@ static const struct mfd_cell axp223_cells[] = {
>  		.of_compatible	= "x-powers,axp223-usb-power-supply",
>  		.num_resources	= ARRAY_SIZE(axp22x_usb_power_supply_resources),
>  		.resources	= axp22x_usb_power_supply_resources,
> +	}, {
> +		.name		= "axp20x-led",
> +		.of_compatible	= "x-powers,axp20x-led",
>  	},
>  };
>  
> @@ -719,6 +728,9 @@ static const struct mfd_cell axp288_cells[] = {
>  		.resources	= axp288_power_button_resources,
>  	}, {
>  		.name		= "axp288_pmic_acpi",
> +	}, {
> +		.name		= "axp20x-led",
> +		.of_compatible	= "x-powers,axp20x-led",
>  	},
>  };
>  
> @@ -741,8 +753,12 @@ static const struct mfd_cell axp803_cells[] = {
>  		.of_compatible	= "x-powers,axp813-ac-power-supply",
>  		.num_resources	= ARRAY_SIZE(axp20x_ac_power_supply_resources),
>  		.resources	= axp20x_ac_power_supply_resources,
> +	}, {
> +		.name		= "axp20x-regulator"
> +	}, {
> +		.name		= "axp20x-led",
> +		.of_compatible	= "x-powers,axp20x-led",
>  	},
> -	{	.name		= "axp20x-regulator" },

Nit: Please keep this at the bottom and as a one line entry.

Once fixed, please submit with my:

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

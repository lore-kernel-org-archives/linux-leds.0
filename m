From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: Modify PC Engines apu/apu2 driver to support apu3
Date: Mon, 25 Jun 2018 21:43:45 +0200
Message-ID: <ff2d3a46-d425-3963-8353-c1a7c78788de@gmail.com>
References: <5b30f692.1c69fb81.dbc7.ac34SMTPIN_ADDED_MISSING@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5b30f692.1c69fb81.dbc7.ac34SMTPIN_ADDED_MISSING@mx.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Raffaello D. Di Napoli" <rafdev@dinapo.li>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Raffaello,

Thank you for the patch.

On 06/25/2018 02:50 PM, Raffaello D. Di Napoli wrote:
> PC Engines apu3 is an improved version of the apu2, using the same SoC
> and almost everything else.
> 
> This patch reuses as much as possible from the apu2 definitions, to
> avoid redundancy.
> 
> Signed-off-by: Raffaello D. Di Napoli <rafdev@dinapo.li>
> ---
>   drivers/leds/Kconfig    |  5 +++--
>   drivers/leds/leds-apu.c | 44 +++++++++++++++++++++++++++++++++++++++++++-
>   2 files changed, 46 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 6e3a998f..44097a3e 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -57,12 +57,13 @@ config LEDS_AAT1290
>   	depends on PINCTRL
>   	help
>   	 This option enables support for the LEDs on the AAT1290.
> +
>   config LEDS_APU
> -	tristate "Front panel LED support for PC Engines APU/APU2 boards"
> +	tristate "Front panel LED support for PC Engines APU/APU2/APU3 boards"
>   	depends on LEDS_CLASS
>   	depends on X86 && DMI
>   	help
> -	  This driver makes the PC Engines APU/APU2 front panel LEDs
> +	  This driver makes the PC Engines APU/APU2/APU3 front panel LEDs
>   	  accessible from userspace programs through the LED subsystem.
>   
>   	  To compile this driver as a module, choose M here: the
> diff --git a/drivers/leds/leds-apu.c b/drivers/leds/leds-apu.c
> index 8c93d689..8d42e46e 100644
> --- a/drivers/leds/leds-apu.c
> +++ b/drivers/leds/leds-apu.c
> @@ -102,6 +102,13 @@ static const struct apu_led_profile apu2_led_profile[] = {
>   	{ "apu2:green:3", LED_OFF, APU2_FCH_GPIO_BASE + 70 * APU2_IOSIZE },
>   };
>   
> +/* Same as apu2_led_profile, but with "3" in the LED names. */
> +static const struct apu_led_profile apu3_led_profile[] = {
> +	{ "apu3:green:1", LED_ON,  APU2_FCH_GPIO_BASE + 68 * APU2_IOSIZE },
> +	{ "apu3:green:2", LED_OFF, APU2_FCH_GPIO_BASE + 69 * APU2_IOSIZE },
> +	{ "apu3:green:3", LED_OFF, APU2_FCH_GPIO_BASE + 70 * APU2_IOSIZE },
> +};
> +
>   static const struct dmi_system_id apu_led_dmi_table[] __initconst = {
>   	{
>   		.ident = "apu",
> @@ -134,6 +141,30 @@ static const struct dmi_system_id apu_led_dmi_table[] __initconst = {
>   			DMI_MATCH(DMI_BOARD_NAME, "PC Engines apu2")
>   		}
>   	},
> +	/* PC Engines APU3 with "Legacy" bios < 4.0.8 */
> +	{
> +		.ident = "apu3",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
> +			DMI_MATCH(DMI_BOARD_NAME, "APU3")
> +		}
> +	},
> +	/* PC Engines APU3 with "Legacy" bios >= 4.0.8 */
> +	{
> +		.ident = "apu3",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
> +			DMI_MATCH(DMI_BOARD_NAME, "apu3")
> +		}
> +	},
> +	/* PC Engines APU2 with "Mainline" bios */
> +	{
> +		.ident = "apu3",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
> +			DMI_MATCH(DMI_BOARD_NAME, "PC Engines apu3")
> +		}
> +	},
>   	{}
>   };
>   MODULE_DEVICE_TABLE(dmi, apu_led_dmi_table);
> @@ -235,6 +266,14 @@ static int __init apu_led_probe(struct platform_device *pdev)
>   		apu_led->platform = APU2_LED_PLATFORM;
>   		apu_led->num_led_instances = ARRAY_SIZE(apu2_led_profile);
>   		apu_led->iosize = APU2_IOSIZE;
> +	} else if (dmi_match(DMI_BOARD_NAME, "APU3") ||
> +		   dmi_match(DMI_BOARD_NAME, "apu3") ||
> +		   dmi_match(DMI_BOARD_NAME, "PC Engines apu3")) {
> +		apu_led->profile = apu3_led_profile;
> +		/* Otherwise identical to APU2. */
> +		apu_led->platform = APU2_LED_PLATFORM;
> +		apu_led->num_led_instances = ARRAY_SIZE(apu3_led_profile);
> +		apu_led->iosize = APU2_IOSIZE;
>   	}
>   
>   	spin_lock_init(&apu_led->lock);
> @@ -259,7 +298,10 @@ static int __init apu_led_init(void)
>   	if (!(dmi_match(DMI_PRODUCT_NAME, "APU") ||
>   	      dmi_match(DMI_PRODUCT_NAME, "APU2") ||
>   	      dmi_match(DMI_PRODUCT_NAME, "apu2") ||
> -	      dmi_match(DMI_PRODUCT_NAME, "PC Engines apu2"))) {
> +	      dmi_match(DMI_PRODUCT_NAME, "PC Engines apu2") ||
> +	      dmi_match(DMI_PRODUCT_NAME, "APU3") ||
> +	      dmi_match(DMI_PRODUCT_NAME, "apu3") ||
> +	      dmi_match(DMI_PRODUCT_NAME, "PC Engines apu3"))) {
>   		pr_err("Unknown PC Engines board: %s\n",
>   				dmi_get_system_info(DMI_PRODUCT_NAME));
>   		return -ENODEV;
> 

Applied.

-- 
Best regards,
Jacek Anaszewski

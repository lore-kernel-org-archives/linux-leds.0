From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: Add more product/board names for PC Engines APU2
Date: Sat, 17 Feb 2018 23:06:55 +0100
Message-ID: <d234bb00-41fe-d12f-2d38-5d5d3fd70e18@gmail.com>
References: <416353feea21248a8e3de5a91c5349a4e9047519.1518690096.git.tredaelli@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:55229 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751213AbeBQWIJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 17 Feb 2018 17:08:09 -0500
Received: by mail-wm0-f65.google.com with SMTP id z81so8899977wmb.4
        for <linux-leds@vger.kernel.org>; Sat, 17 Feb 2018 14:08:08 -0800 (PST)
In-Reply-To: <416353feea21248a8e3de5a91c5349a4e9047519.1518690096.git.tredaelli@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Timothy Redaelli <tredaelli@redhat.com>, linux-leds@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>, Richard Purdie <rpurdie@rpsys.net>

Hi Timothy,

Thank you for the patch.

On 02/15/2018 11:21 AM, Timothy Redaelli wrote:
> PC Engines "legacy" coreboot 4.0.8 changed the product/board name from "APU2"
> to "apu2".
> PC Engines "mainline" coreboot uses, instead, "PC Engines apu2" as
> product/board name.
> 
> This commit adds the 2 variants ("apu2" and "PC Engines apu2") of product/board
> name to be compatible with all the APU2 BIOSes.
> 
> Fixes: 3faee9423ce0 ("leds: Add driver for PC Engines APU/APU2 LEDs")
> Signed-off-by: Timothy Redaelli <tredaelli@redhat.com>
> ---
>  drivers/leds/leds-apu.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-apu.c b/drivers/leds/leds-apu.c
> index 74820aab9497..311e98b1823f 100644
> --- a/drivers/leds/leds-apu.c
> +++ b/drivers/leds/leds-apu.c
> @@ -110,6 +110,7 @@ static const struct dmi_system_id apu_led_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "APU")
>  		}
>  	},
> +	/* PC Engines APU2 with "Legacy" bios < 4.0.8 */
>  	{
>  		.ident = "apu2",
>  		.matches = {
> @@ -117,6 +118,22 @@ static const struct dmi_system_id apu_led_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_BOARD_NAME, "APU2")
>  		}
>  	},
> +	/* PC Engines APU2 with "Legacy" bios >= 4.0.8 */
> +	{
> +		.ident = "apu2",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
> +			DMI_MATCH(DMI_BOARD_NAME, "apu2")
> +		}
> +	},
> +	/* PC Engines APU2 with "Mainline" bios */
> +	{
> +		.ident = "apu2",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
> +			DMI_MATCH(DMI_BOARD_NAME, "PC Engines apu2")
> +		}
> +	},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(dmi, apu_led_dmi_table);
> @@ -211,7 +228,9 @@ static int __init apu_led_probe(struct platform_device *pdev)
>  		apu_led->platform = APU1_LED_PLATFORM;
>  		apu_led->num_led_instances = ARRAY_SIZE(apu1_led_profile);
>  		apu_led->iosize = APU1_IOSIZE;
> -	} else if (dmi_match(DMI_BOARD_NAME, "APU2")) {
> +	} else if (dmi_match(DMI_BOARD_NAME, "APU2") ||
> +		   dmi_match(DMI_BOARD_NAME, "apu2") ||
> +		   dmi_match(DMI_BOARD_NAME, "PC Engines apu2")) {
>  		apu_led->profile = apu2_led_profile;
>  		apu_led->platform = APU2_LED_PLATFORM;
>  		apu_led->num_led_instances = ARRAY_SIZE(apu2_led_profile);
> @@ -237,7 +256,10 @@ static int __init apu_led_init(void)
>  		pr_err("No PC Engines board detected\n");
>  		return -ENODEV;
>  	}
> -	if (!(dmi_match(DMI_PRODUCT_NAME, "APU") || dmi_match(DMI_PRODUCT_NAME, "APU2"))) {
> +	if (!(dmi_match(DMI_PRODUCT_NAME, "APU") ||
> +	      dmi_match(DMI_PRODUCT_NAME, "APU2") ||
> +	      dmi_match(DMI_PRODUCT_NAME, "apu2") ||
> +	      dmi_match(DMI_PRODUCT_NAME, "PC Engines apu2"))) {
>  		pr_err("Unknown PC Engines board: %s\n",
>  				dmi_get_system_info(DMI_PRODUCT_NAME));
>  		return -ENODEV;
> 

Applied to the for-next branch of linux-leds.git.

-- 
Best regards,
Jacek Anaszewski

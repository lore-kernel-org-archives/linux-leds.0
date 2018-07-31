From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: add APU3 dmi information to leds-apu
Date: Tue, 31 Jul 2018 13:06:20 +0200
Message-ID: <fd75e782-c18d-d1b8-981b-714f2b1080f3@gmail.com>
References: <20180730091108.30098-1-fe@dev.tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180730091108.30098-1-fe@dev.tdt.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Eckert <fe@dev.tdt.de>
Cc: pavel@ucw.cz, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Eckert.Florian@googlemail.com
List-Id: linux-leds@vger.kernel.org

Hi Florian,

Thank you for the patch.

Please check the patch, which is in linux-next already:

https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git/commit/?h=for-next&id=8cb21086cc6359c6d4f003a788050308afb211ad

It seems to have added the support you want.

Best regards,
Jacek Anaszewski

On 07/30/2018 11:11 AM, Florian Eckert wrote:
> This driver should also get loaded if this is a APU3 from PC Engines.
> It has the same pin layout for leds.
> 
> Signed-off-by: Florian Eckert <fe@dev.tdt.de>
> ---
>  drivers/leds/leds-apu.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/leds/leds-apu.c b/drivers/leds/leds-apu.c
> index 8c93d68964c7..1ed1c5a5dc77 100644
> --- a/drivers/leds/leds-apu.c
> +++ b/drivers/leds/leds-apu.c
> @@ -134,6 +134,14 @@ static const struct dmi_system_id apu_led_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_BOARD_NAME, "PC Engines apu2")
>  		}
>  	},
> +	/* PC Engines APU3 with "Legancy" bios >= 4.0.7 */
> +	{
> +		.ident = "apu3",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
> +			DMI_MATCH(DMI_BOARD_NAME, "APU3")
> +		}
> +	},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(dmi, apu_led_dmi_table);
> @@ -229,6 +237,7 @@ static int __init apu_led_probe(struct platform_device *pdev)
>  		apu_led->num_led_instances = ARRAY_SIZE(apu1_led_profile);
>  		apu_led->iosize = APU1_IOSIZE;
>  	} else if (dmi_match(DMI_BOARD_NAME, "APU2") ||
> +		   dmi_match(DMI_BOARD_NAME, "APU3") ||
>  		   dmi_match(DMI_BOARD_NAME, "apu2") ||
>  		   dmi_match(DMI_BOARD_NAME, "PC Engines apu2")) {
>  		apu_led->profile = apu2_led_profile;
> @@ -258,6 +267,7 @@ static int __init apu_led_init(void)
>  	}
>  	if (!(dmi_match(DMI_PRODUCT_NAME, "APU") ||
>  	      dmi_match(DMI_PRODUCT_NAME, "APU2") ||
> +	      dmi_match(DMI_PRODUCT_NAME, "APU3") ||
>  	      dmi_match(DMI_PRODUCT_NAME, "apu2") ||
>  	      dmi_match(DMI_PRODUCT_NAME, "PC Engines apu2"))) {
>  		pr_err("Unknown PC Engines board: %s\n",
> 

From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: fix wrong dmi_match on PC Engines APU LEDs
Date: Sat, 10 Mar 2018 22:13:55 +0100
Message-ID: <b51f1f41-e06e-25e6-30f8-a2b9f7e8ffb8@gmail.com>
References: <20180305170910.8905-1-ulli.kroll@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180305170910.8905-1-ulli.kroll@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, Alan Mizrahi <alan@mizrahi.com.ve>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Hans,

Thank you for the patch.

On 03/05/2018 06:09 PM, Hans Ulli Kroll wrote:
> APU has compared to APU2 no DMI_BOARD_NAME.
> Use DMI_PRODUCT_NAME instead.

Could we have the commit message more expressive?

Is it that now this driver doesn't work for APU board?

> Signed-off-by: Hans Ulli Kroll <ulli.kroll@googlemail.com>
> ---
>  drivers/leds/leds-apu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-apu.c b/drivers/leds/leds-apu.c
> index 74820aab9497..5bbf5c31413e 100644
> --- a/drivers/leds/leds-apu.c
> +++ b/drivers/leds/leds-apu.c
> @@ -206,7 +206,7 @@ static int __init apu_led_probe(struct platform_device *pdev)
>  
>  	apu_led->pdev = pdev;
>  
> -	if (dmi_match(DMI_BOARD_NAME, "APU")) {
> +	if (dmi_match(DMI_PRODUCT_NAME, "APU")) {
>  		apu_led->profile = apu1_led_profile;
>  		apu_led->platform = APU1_LED_PLATFORM;
>  		apu_led->num_led_instances = ARRAY_SIZE(apu1_led_profile);
> 

If it fails here, then how it is possible that it succeeds
in the apu_led_init() ?

-- 
Best regards,
Jacek Anaszewski

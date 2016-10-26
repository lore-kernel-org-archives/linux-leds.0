From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] led: pca9532: Use default trigger value from platform data
Date: Wed, 26 Oct 2016 16:45:14 +0200
Message-ID: <d0151f25-8156-b09c-4e44-b9f7e5a911f7@samsung.com>
References: <CGME20161026140813eucas1p2bd4e4dc825badc0538f8d074056444c2@eucas1p2.samsung.com>
 <2ba1ca4c-23c5-fb0e-10ce-4e25edcd197f@ltec.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <2ba1ca4c-23c5-fb0e-10ce-4e25edcd197f@ltec.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Felix Brack <fb@ltec.ch>, riku.voipio@iki.fi, linux-leds@vger.kernel.org
Cc: "rpurdie@rpsys.net" <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Felix,

Thanks for the patch. Applied.

On 10/26/2016 04:08 PM, Felix Brack wrote:
> The value for a led's default_trigger should come from platform data
> instead of data (which is always 0).
>
> Signed-off-by: Felix Brack <fb@ltec.ch>
> ---
>
> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index 09a7cffb..06e6310 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c
> @@ -369,7 +369,7 @@ static int pca9532_configure(struct i2c_client *client,
>  			led->state = pled->state;
>  			led->name = pled->name;
>  			led->ldev.name = led->name;
> -			led->ldev.default_trigger = led->default_trigger;
> +			led->ldev.default_trigger = pled->default_trigger;
>  			led->ldev.brightness = LED_OFF;
>  			led->ldev.brightness_set_blocking =
>  						pca9532_set_brightness;
>
>
>


-- 
Best regards,
Jacek Anaszewski

From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: leds-locomo.c: Use devm_led_classdev_register
Date: Mon, 19 Oct 2015 10:16:09 +0200
Message-ID: <5624A6C9.8080806@samsung.com>
References: <1445031183-25326-1-git-send-email-fmthoker@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1445031183-25326-1-git-send-email-fmthoker@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fida Mohammad <fmthoker@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Fida,

On 10/16/2015 11:33 PM, Fida Mohammad wrote:
> Use resource managed function devm_led_classdev_register to make
> initialisation path simpler.
> Also removed redundant led_classdev_unregister function.
>
> Signed-off-by: Fida Mohammad <fmthoker@gmail.com>
> ---
>   drivers/leds/leds-locomo.c | 15 ++-------------
>   1 file changed, 2 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/leds/leds-locomo.c b/drivers/leds/leds-locomo.c
> index 80ba048..24c4b53 100644
> --- a/drivers/leds/leds-locomo.c
> +++ b/drivers/leds/leds-locomo.c
> @@ -59,23 +59,13 @@ static int locomoled_probe(struct locomo_dev *ldev)
>   {
>   	int ret;
>
> -	ret = led_classdev_register(&ldev->dev, &locomo_led0);
> +	ret = devm_led_classdev_register(&ldev->dev, &locomo_led0);
>   	if (ret < 0)
>   		return ret;
>
> -	ret = led_classdev_register(&ldev->dev, &locomo_led1);
> -	if (ret < 0)
> -		led_classdev_unregister(&locomo_led0);
> -
> -	return ret;
> +	return  devm_led_classdev_register(&ldev->dev, &locomo_led1);
>   }
>
> -static int locomoled_remove(struct locomo_dev *dev)
> -{
> -	led_classdev_unregister(&locomo_led0);
> -	led_classdev_unregister(&locomo_led1);
> -	return 0;
> -}
>
>   static struct locomo_driver locomoled_driver = {
>   	.drv = {
> @@ -83,7 +73,6 @@ static struct locomo_driver locomoled_driver = {
>   	},
>   	.devid	= LOCOMO_DEVID_LED,
>   	.probe	= locomoled_probe,
> -	.remove	= locomoled_remove,
>   };
>
>   static int __init locomoled_init(void)
>

Applied, thanks.

-- 
Best Regards,
Jacek Anaszewski

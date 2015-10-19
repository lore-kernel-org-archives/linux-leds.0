From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: leds-menf21bmc.c: Use devm_led_class_register
Date: Mon, 19 Oct 2015 10:15:46 +0200
Message-ID: <5624A6B2.4020005@samsung.com>
References: <1445026675-2171-1-git-send-email-falakreyaz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1445026675-2171-1-git-send-email-falakreyaz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Muhammad Falak R Wani <falakreyaz@gmail.com>
Cc: Anreas Werner <andreas.werner@men.de>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Muhammad,

On 10/16/2015 10:17 PM, Muhammad Falak R Wani wrote:
> Use resource-managed function devm_led_classdev_register instead
> of led_classdev_register, consequently remove redundant
> menf21bmc_led_remove function.
> Also drop the unneeded label err_free_leds.
>
> Signed-off-by: Muhammad Falak R Wani <falakreyaz@gmail.com>
> ---
>   drivers/leds/leds-menf21bmc.c | 26 +++++---------------------
>   1 file changed, 5 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/leds/leds-menf21bmc.c b/drivers/leds/leds-menf21bmc.c
> index 4b9eea8..dec2a6e 100644
> --- a/drivers/leds/leds-menf21bmc.c
> +++ b/drivers/leds/leds-menf21bmc.c
> @@ -87,36 +87,20 @@ static int menf21bmc_led_probe(struct platform_device *pdev)
>   		leds[i].cdev.name = leds[i].name;
>   		leds[i].cdev.brightness_set = menf21bmc_led_set;
>   		leds[i].i2c_client = i2c_client;
> -		ret = led_classdev_register(&pdev->dev, &leds[i].cdev);
> -		if (ret < 0)
> -			goto err_free_leds;
> +		ret = devm_led_classdev_register(&pdev->dev, &leds[i].cdev);
> +		if (ret < 0) {
> +			dev_err(&pdev->dev, "failed to register LED device\n");
> +			return ret;
> +		}
>   	}
>   	dev_info(&pdev->dev, "MEN 140F21P00 BMC LED device enabled\n");
>
>   	return 0;
>
> -err_free_leds:
> -	dev_err(&pdev->dev, "failed to register LED device\n");
> -
> -	for (i = i - 1; i >= 0; i--)
> -		led_classdev_unregister(&leds[i].cdev);
> -
> -	return ret;
> -}
> -
> -static int menf21bmc_led_remove(struct platform_device *pdev)
> -{
> -	int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(leds); i++)
> -		led_classdev_unregister(&leds[i].cdev);
> -
> -	return 0;
>   }
>
>   static struct platform_driver menf21bmc_led = {
>   	.probe		= menf21bmc_led_probe,
> -	.remove		= menf21bmc_led_remove,
>   	.driver		= {
>   		.name		= "menf21bmc_led",
>   	},
>

Applied, thanks.

-- 
Best Regards,
Jacek Anaszewski

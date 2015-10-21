From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: leds-netxbig.c: Use devm_led_classdev_register
Date: Wed, 21 Oct 2015 09:01:00 +0200
Message-ID: <5627382C.4040207@samsung.com>
References: <1445371592-24228-1-git-send-email-fmthoker@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1445371592-24228-1-git-send-email-fmthoker@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fida Mohammad <fmthoker@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Muhammad Falak <falakreyaz@gmail.com>, Simon Guinot <sguinot@lacie.com>
List-Id: linux-leds@vger.kernel.org

Hi Fida,

On 10/20/2015 10:06 PM, Fida Mohammad wrote:
> Use resource managed function devm_led_classdev_register to make
> error path simpler. Consequently, removed a goto call and
> remove function made simpler.
>
> Signed-off-by: Fida Mohammad <fmthoker@gmail.com>
> ---
>   drivers/leds/leds-netxbig.c | 25 +++++--------------------
>   1 file changed, 5 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
> index 25e4197..639f8bd 100644
> --- a/drivers/leds/leds-netxbig.c
> +++ b/drivers/leds/leds-netxbig.c
> @@ -299,10 +299,6 @@ static struct attribute *netxbig_led_attrs[] = {
>   };
>   ATTRIBUTE_GROUPS(netxbig_led);
>
> -static void delete_netxbig_led(struct netxbig_led_data *led_dat)
> -{
> -	led_classdev_unregister(&led_dat->cdev);
> -}
>
>   static int
>   create_netxbig_led(struct platform_device *pdev,
> @@ -343,7 +339,7 @@ create_netxbig_led(struct platform_device *pdev,
>   	if (led_dat->mode_val[NETXBIG_LED_SATA] != NETXBIG_LED_INVALID_MODE)
>   		led_dat->cdev.groups = netxbig_led_groups;
>
> -	return led_classdev_register(&pdev->dev, &led_dat->cdev);
> +	return devm_led_classdev_register(&pdev->dev, &led_dat->cdev);
>   }
>
>   static int netxbig_led_probe(struct platform_device *pdev)
> @@ -367,32 +363,21 @@ static int netxbig_led_probe(struct platform_device *pdev)
>
>   	for (i = 0; i < pdata->num_leds; i++) {
>   		ret = create_netxbig_led(pdev, &leds_data[i], &pdata->leds[i]);
> -		if (ret < 0)
> -			goto err_free_leds;
> +		if (ret < 0) {
> +			gpio_ext_free(pdata->gpio_ext);
> +			return ret;
> +		}
>   	}
>
>   	platform_set_drvdata(pdev, leds_data);
>
>   	return 0;
>
> -err_free_leds:
> -	for (i = i - 1; i >= 0; i--)
> -		delete_netxbig_led(&leds_data[i]);
> -
> -	gpio_ext_free(pdata->gpio_ext);
> -	return ret;
>   }
>
>   static int netxbig_led_remove(struct platform_device *pdev)
>   {
>   	struct netxbig_led_platform_data *pdata = dev_get_platdata(&pdev->dev);
> -	struct netxbig_led_data *leds_data;
> -	int i;
> -
> -	leds_data = platform_get_drvdata(pdev);
> -
> -	for (i = 0; i < pdata->num_leds; i++)
> -		delete_netxbig_led(&leds_data[i]);
>
>   	gpio_ext_free(pdata->gpio_ext);
>
>

Thanks for the patch.

Always when submitting patches please cc also the author.
I know that this is a simple optimization, but nevertheless
an ack from the author, who can test the patch on the hardware,
is valuable. Cc Simon.
-- 
Best Regards,
Jacek Anaszewski

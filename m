From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: leds-gpio: add shutdown function
Date: Tue, 13 Oct 2015 11:13:33 +0200
Message-ID: <561CCB3D.3020801@samsung.com>
References: <1444713432-24433-1-git-send-email-hs@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:55666 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751298AbbJMJNi (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 13 Oct 2015 05:13:38 -0400
In-reply-to: <1444713432-24433-1-git-send-email-hs@denx.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiko Schocher <hs@denx.de>
Cc: linux-kernel@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, Georg.Soffel@bosch-si.com

Hi Heiko,

On 10/13/2015 07:17 AM, Heiko Schocher wrote:
> add a shutdown function for setting the gpio-leds
> into off state when shuting down.
>
> Signed-off-by: Heiko Schocher <hs@denx.de>
> ---
>
>   drivers/leds/leds-gpio.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index af1876a..5db4515 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -291,9 +291,22 @@ static int gpio_led_remove(struct platform_device *pdev)
>   	return 0;
>   }
>
> +static void gpio_led_shutdown(struct platform_device *pdev)
> +{
> +	struct gpio_leds_priv *priv = platform_get_drvdata(pdev);
> +	int i;
> +
> +	for (i = 0; i < priv->num_leds; i++) {
> +		struct gpio_led_data *led = &priv->leds[i];
> +
> +		gpio_led_set(&led->cdev, LED_OFF);
> +	}
> +}
> +
>   static struct platform_driver gpio_led_driver = {
>   	.probe		= gpio_led_probe,
>   	.remove		= gpio_led_remove,
> +	.shutdown	= gpio_led_shutdown,
>   	.driver		= {
>   		.name	= "leds-gpio",
>   		.of_match_table = of_gpio_leds_match,
>

Merged, thanks.

-- 
Best Regards,
Jacek Anaszewski

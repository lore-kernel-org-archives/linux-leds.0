From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: gpio: Add pinctrl PM select sleep,default state in
 suspend/resume
Date: Fri, 20 Jan 2017 22:59:38 +0100
Message-ID: <dba34fd0-acd2-6b18-364b-882ec85764fd@gmail.com>
References: <20170120164553.27565-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170120164553.27565-1-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Enric,

LED subsystem core already registers its pm ops.
(see drivers/leds/led-class.c and leds_class_dev_pm_ops).
It results in setting brightness of all LED class devices marked
with LED_CORE_SUSPENDRESUME flag to 0 on suspend and bringing
back previous brightness on resume.

In this case you would have to track the state of all LED
class devices exposed by leds-gpio and call
pinctrl_pm_select_sleep_state() when they all are off.
Now, if in this state and turning any of the LEDs on,
then pinctrl_pm_select_default_state() would have to be called.

Compare the following patch:

commit a8c170b015ff6695641bdfbdb74729411ba1e9e5
Author: Matt Ranostay <mranostay@gmail.com>
Date:   Fri Oct 28 18:20:42 2016 -0700

    leds: pca963x: enable low-power state

    Allow chip to enter low power state when no LEDs are being lit or in
    blink mode.


On 01/20/2017 05:45 PM, Enric Balletbo i Serra wrote:
> This patch allows users to use an alternate pinctrl "sleep" in order to
> clamp outputs to a wanted state at suspend.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>  drivers/leds/leds-gpio.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index d400dca..a2e9bdb 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -20,6 +20,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/slab.h>
> +#include <linux/pm.h>
>  
>  struct gpio_led_data {
>  	struct led_classdev cdev;
> @@ -269,12 +270,31 @@ static void gpio_led_shutdown(struct platform_device *pdev)
>  	}
>  }
>  
> +#ifdef CONFIG_PM_SLEEP
> +static int gpio_led_suspend(struct device *dev)
> +{
> +	pinctrl_pm_select_sleep_state(dev);
> +
> +	return 0;
> +}
> +
> +static int gpio_led_resume(struct device *dev)
> +{
> +	pinctrl_pm_select_default_state(dev);
> +
> +	return 0;
> +}
> +#endif
> +
> +static SIMPLE_DEV_PM_OPS(gpio_led_pm, gpio_led_suspend, gpio_led_resume);
> +
>  static struct platform_driver gpio_led_driver = {
>  	.probe		= gpio_led_probe,
>  	.shutdown	= gpio_led_shutdown,
>  	.driver		= {
>  		.name	= "leds-gpio",
>  		.of_match_table = of_gpio_leds_match,
> +		.pm	= &gpio_led_pm,
>  	},
>  };
>  
> 

-- 
Best regards,
Jacek Anaszewski

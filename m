From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: pwm: Allow changing the pinctrl state
Date: Fri, 17 Nov 2017 21:51:03 +0100
Message-ID: <05a98e78-0773-7108-6d42-4c680002a7ad@gmail.com>
References: <1510929126-9813-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:33586 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761759AbdKQUwC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Nov 2017 15:52:02 -0500
Received: by mail-wr0-f196.google.com with SMTP id 4so3156997wrt.0
        for <linux-leds@vger.kernel.org>; Fri, 17 Nov 2017 12:52:01 -0800 (PST)
In-Reply-To: <1510929126-9813-1-git-send-email-festevam@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: rpurdie@rpsys.net, pavel@ucw.cz, linux@arm.linux.org.uk, linux-leds@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>

Hi Fabio,

Thanks for the patch.

On 11/17/2017 03:32 PM, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Add suspend/resume pm hooks, so that the pinctrl state could be changed.
> 
> The motivation for doing this was to solve a problem on a imx6-cubox-i
> board, where there is a GPIO controlled via pwm-leds that keeps turned on
> when the system goes into suspend. Such behaviour is not what we expect
> from a system going into suspend.
> 
> In order to solve this problem add the suspend/resume pm hooks where
> the pinctrl state can be changed accordingly.
> 
> This allows to add an extra 'sleep' entry into the pinctrl node, where
> the pinctrl can be changed from PWM to GPIO and pull up/pull down can be
> configured to turn off the LED during suspend mode.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  drivers/leds/leds-pwm.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> index 8d456dc6..ff21aa2 100644
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -14,6 +14,7 @@
>  
>  #include <linux/module.h>
>  #include <linux/kernel.h>
> +#include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
>  #include <linux/of_platform.h>
>  #include <linux/fb.h>
> @@ -210,6 +211,20 @@ static int led_pwm_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static int __maybe_unused led_pwm_suspend(struct device *dev)
> +{
> +	return pinctrl_pm_select_sleep_state(dev);
> +}
> +
> +static int __maybe_unused led_pwm_resume(struct device *dev)
> +{
> +	return pinctrl_pm_select_default_state(dev);
> +}
> +
> +static const struct dev_pm_ops led_pwm_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(led_pwm_suspend, led_pwm_resume)
> +};
> +
>  static const struct of_device_id of_pwm_leds_match[] = {
>  	{ .compatible = "pwm-leds", },
>  	{},
> @@ -222,6 +237,7 @@ static struct platform_driver led_pwm_driver = {
>  	.driver		= {
>  		.name	= "leds_pwm",
>  		.of_match_table = of_pwm_leds_match,
> +		.pm = &led_pwm_pm_ops,

LED subsystem has its global pm_ops handler - see
drivers/leds/led-class.c:

static int __init leds_init(void)
{
        leds_class = class_create(THIS_MODULE, "leds");
        if (IS_ERR(leds_class))
                return PTR_ERR(leds_class);
        leds_class->pm = &leds_class_dev_pm_ops; <--------------
        leds_class->dev_groups = led_groups;
        return 0;
}

On power down event brightness is set to 0 on each registered
LED class device that set LED_CORE_SUSPENDRESUME flag (leds-pwm does).

It may be the case that pwm subsystem (or underlaying bus used by
particular controller) is suspended before LED subsystem, or the
culprit is the generic LED subsystem workqueue in which brightness
setting events are queued for drivers that use brightness_set_blocking
op (leds-pwm case).

Probably we will have to get rid of global handling of pm ops in
led-class.c due to possible asynchronous brightness setting.

Could you please verify if the led_pwm_set is called with brightness
0 on suspend or not?

If not, then probably replacing pinctrl_pm_select_sleep_state(dev)
in your patch  with a loop iterating through all LED class devices
registered by the driver and calling pwm_disable(led_dat->pwm) should
fix the problem.

pinctrl_pm_select_sleep_state(dev) would not work for all pwm
devices (think of pwm controllers driven through e.g. I2C bus).

-- 
Best regards,
Jacek Anaszewski

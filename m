From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 1/1] leds: call led_pwm_set() in leds-pwm to enforce
 default LED_OFF
Date: Mon, 16 Nov 2015 12:20:19 +0100
Message-ID: <5649BBF3.6050104@samsung.com>
References: <1447242029-29335-1-git-send-email-markus.hofstaetter@ait.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:65017 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751465AbbKPLUW (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 16 Nov 2015 06:20:22 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXW004IUNHW6I30@mailout4.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 16 Nov 2015 11:20:20 +0000 (GMT)
In-reply-to: <1447242029-29335-1-git-send-email-markus.hofstaetter@ait.ac.at>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Markus Hofstaetter <markus.hofstaetter@ait.ac.at>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

Hi Markus,

On 11/11/2015 12:40 PM, Markus Hofstaetter wrote:
> Some PWMs are disabled by default or the default pin setting
> does not match the LED_OFF state (e.g., active-low leds).
> Hence, the driver may end up reporting 0 brightness, but
> the leds are actually on using full brightness, because
> it never enforces its default configuration.

AFAICS default brightness is hard coded to LED_OFF, so this
will turn active-low LEDs on.

> So enforce it by calling led_pwm_set() after successfully
> registering the device.
>
> Tested on a Phytec phyFLEX i.MX6Q board based on kernel
> v3.19.5.
>
> Signed-off-by: Markus Hofstaetter <markus.hofstaetter@ait.ac.at>
> Tested-by: Markus Hofstaetter <markus.hofstaetter@ait.ac.at>
> ---
>   drivers/leds/leds-pwm.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> index 1d07e3e..3149dbe 100644
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -132,6 +132,7 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
>   	ret = led_classdev_register(dev, &led_data->cdev);
>   	if (ret == 0) {
>   		priv->num_leds++;
> +		led_pwm_set(&led_data->cdev, led_data->cdev.brightness);
>   	} else {
>   		dev_err(dev, "failed to register PWM led for %s: %d\n",
>   			led->name, ret);
>


-- 
Best Regards,
Jacek Anaszewski

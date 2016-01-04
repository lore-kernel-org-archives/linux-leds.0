From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: core: add managed version of led_trigger_register
Date: Mon, 04 Jan 2016 10:17:21 +0100
Message-ID: <568A38A1.5000103@samsung.com>
References: <56871B99.1080103@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:27028 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751308AbcADJR3 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 4 Jan 2016 04:17:29 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O0F004Y78H2Y740@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 04 Jan 2016 09:17:26 +0000 (GMT)
In-reply-to: <56871B99.1080103@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org

Hi Heiner,

On 01/02/2016 01:36 AM, Heiner Kallweit wrote:
> Complementing devm_led_classdev_register add a managed version of
> led_trigger_register.
>
> I omit a managed version of led_classdev_unregister as the equivalent
> devm_led_classdev_unregister isn't used in the kernel as of today.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   drivers/leds/led-triggers.c | 28 ++++++++++++++++++++++++++++
>   include/linux/leds.h        |  2 ++
>   2 files changed, 30 insertions(+)
>
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index e8b1120..e1e9334 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -249,6 +249,34 @@ void led_trigger_unregister(struct led_trigger *trig)
>   }
>   EXPORT_SYMBOL_GPL(led_trigger_unregister);
>
> +static void devm_led_trigger_release(struct device *dev, void *res)
> +{
> +	led_trigger_unregister(*(struct led_trigger **)res);
> +}
> +
> +int devm_led_trigger_register(struct device *dev,
> +			      struct led_trigger *trig)
> +{
> +	struct led_trigger **dr;
> +	int rc;
> +
> +	dr = devres_alloc(devm_led_trigger_release, sizeof(*dr),
> +			  GFP_KERNEL);
> +	if (!dr)
> +		return -ENOMEM;
> +
> +	*dr = trig;
> +
> +	rc = led_trigger_register(trig);
> +	if (rc)
> +		devres_free(dr);
> +	else
> +		devres_add(dev, dr);
> +
> +	return rc;
> +}
> +EXPORT_SYMBOL_GPL(devm_led_trigger_register);
> +
>   /* Simple LED Tigger Interface */
>
>   void led_trigger_event(struct led_trigger *trig,
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index fa359c7..3db0654 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -231,6 +231,8 @@ ssize_t led_trigger_show(struct device *dev, struct device_attribute *attr,
>   /* Registration functions for complex triggers */
>   extern int led_trigger_register(struct led_trigger *trigger);
>   extern void led_trigger_unregister(struct led_trigger *trigger);
> +extern int devm_led_trigger_register(struct device *dev,
> +				     struct led_trigger *trigger);
>
>   extern void led_trigger_register_simple(const char *name,
>   				struct led_trigger **trigger);
>

Applied, thanks.

-- 
Best Regards,
Jacek Anaszewski

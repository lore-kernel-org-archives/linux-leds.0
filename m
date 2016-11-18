From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v5 3/6] leds: triggers: Add support for read-only triggers
Date: Fri, 18 Nov 2016 09:52:59 +0100
Message-ID: <b44e1e67-d609-5876-b79b-c28d2093c50e@samsung.com>
References: <20161117222441.31464-1-hdegoede@redhat.com>
 <CGME20161117222452epcas4p43b390da988281f298b01c5dae1425469@epcas4p4.samsung.com>
 <20161117222441.31464-3-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-reply-to: <20161117222441.31464-3-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Hans,

Thanks for the new patch set.

On 11/17/2016 11:24 PM, Hans de Goede wrote:
> In some cases an LED is controlled through a hardwired (taken care of
> in firmware outside of the kernels control) trigger.
>
> Add an LED_TRIGGER_READ_ONLY flag for this and disallow user-space
> changing the trigger when this flag is set.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v5:
> -This is a new patch in v5 of this patch-set
> ---
>  drivers/leds/led-class.c    | 2 +-
>  drivers/leds/led-triggers.c | 5 +++++
>  include/linux/leds.h        | 1 +
>  3 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 326ee6e..56f32cc 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -54,7 +54,7 @@ static ssize_t brightness_store(struct device *dev,
>  	if (ret)
>  		goto unlock;
>
> -	if (state == LED_OFF)
> +	if (state == LED_OFF && !(led_cdev->flags & LED_TRIGGER_READ_ONLY))
>  		led_trigger_remove(led_cdev);
>  	led_set_brightness(led_cdev, state);
>
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index d2ed9c2..9669104 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -37,6 +37,11 @@ ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
>  	struct led_trigger *trig;
>  	int ret = count;
>
> +	if (led_cdev->flags & LED_TRIGGER_READ_ONLY) {
> +		dev_err(led_cdev->dev, "Error this led triggers is hardwired and cannot be changed\n");
> +		return -EINVAL;

It means that after a trigger is once assigned to a LED class device
it will be impossible to deactivate it. Why not leaving it to the
user's decision whether they want to have hw brightness changes
notifications? This way we disable the possibility to set different
trigger like e.g. timer, after this one is set, which is not
a non-realistic scenario.

Generally it is quite odd to add a functionality that once
set is latched. If one will set such a trigger by mistake, then
system restart will be required to reset this (unless the driver
is built as a module).

> +	}
> +
>  	mutex_lock(&led_cdev->led_access);
>
>  	if (led_sysfs_is_disabled(led_cdev)) {
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 870b8c2..e076b74 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -47,6 +47,7 @@ struct led_classdev {
>  #define LED_DEV_CAP_FLASH	(1 << 18)
>  #define LED_HW_PLUGGABLE	(1 << 19)
>  #define LED_PANIC_INDICATOR	(1 << 20)
> +#define LED_TRIGGER_READ_ONLY   (1 << 21)
>
>  	/* set_brightness_work / blink_timer flags, atomic, private. */
>  	unsigned long		work_flags;
>


-- 
Best regards,
Jacek Anaszewski

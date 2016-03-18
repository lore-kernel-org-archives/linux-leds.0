From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 3/3] leds: triggers: heartbeat: add RGB version of the
 trigger
Date: Fri, 18 Mar 2016 14:08:47 +0100
Message-ID: <56EBFDDF.7000008@samsung.com>
References: <56E5A0DA.1000700@gmail.com> <56EAB40A.3030004@samsung.com>
 <56EB0DBC.7030005@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:58913 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756949AbcCRNIw (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 18 Mar 2016 09:08:52 -0400
In-reply-to: <56EB0DBC.7030005@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 03/17/2016 09:04 PM, Heiner Kallweit wrote:
> Am 17.03.2016 um 14:41 schrieb Jacek Anaszewski:
>> Hi Heiner,
>>
>> Thanks for the patch. I have a few questions:
>>
>> 1. Why do you want to register another trigger in
>>     a ledtrig-heartbeat.c?
>       The existing trigger uses the heartbeat and can be used with RGB
>       and non-RGB LED's. The new trigger uses color to visualize the load
>       and can be used with RGB LED's only.
>
>> 2. heartbeat trigger implements LED blinking timing that
>>     resembles human heart beat rhythm, whereas heartbeat_led_rgb_trigger
>>     seems not to reuse led_heartbeat_function code, but instead
>>     led_heartbeat_rgb_function() sets timer interval to 500ms, after
>>     doing some color magic in led_trigger_range_event(). Where is the
>>     heartbeat rhythm implemented here?
>       It uses a color to display the load instead of a rhythm.
>       I have to admit that this trigger might not perfectly fit here as it
>       doesn't actually implement a heartbeat. However it visualizes the same
>       parameter (system load). If preferrable I can make it a separate trigger.

Having it in the ledtrig-heartbeat.c would make sense if we you applied
also the same blinking pattern. Is there some specific reason for which
you didn't reuse heartbeat blinking pattern, but instead used fixed
period?

>> 3. Why heartbeat_range.end is somehow related to num_online_cpus()?
>       Because e.g. 5 is a high load on a single CPU system but more or less
>       idle on a 64 CPU system.

I see, thanks for the explanation.

I have also few comments below.

>>
>> On 03/13/2016 06:18 PM, Heiner Kallweit wrote:
>>> Add a RGB version of the heartbeat trigger (heartbeat-rgb). This version of
>>> the trigger can only be used with LED devices supporting the RGB extension.
>>>
>>> It maps the load [0 .. num_online_cpus] to a color between green and red.
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>> ---
>>>    drivers/leds/trigger/ledtrig-heartbeat.c | 64 +++++++++++++++++++++++++++++++-
>>>    1 file changed, 63 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/leds/trigger/ledtrig-heartbeat.c b/drivers/leds/trigger/ledtrig-heartbeat.c
>>> index 410c39c..510a3c9 100644
>>> --- a/drivers/leds/trigger/ledtrig-heartbeat.c
>>> +++ b/drivers/leds/trigger/ledtrig-heartbeat.c
>>> @@ -22,6 +22,7 @@
>>>    #include "../leds.h"
>>>
>>>    static int panic_heartbeats;
>>> +static struct led_trigger heartbeat_led_rgb_trigger;
>>>
>>>    struct heartbeat_trig_data {
>>>        unsigned int phase;
>>> @@ -30,6 +31,14 @@ struct heartbeat_trig_data {
>>>        unsigned int invert;
>>>    };
>>>
>>> +static struct led_trigger_range led_heartbeat_range = {
>>> +    .start = 0,
>>> +    /* default, overridden by module init function */
>>> +    .end = 4 * FIXED_1,
>>> +    .color_start = 0x54ffff, /* GREEN */
>>> +    .color_end = 0x00ffff, /* RED */
>>> +};
>>> +
>>>    static void led_heartbeat_function(unsigned long data)
>>>    {
>>>        struct led_classdev *led_cdev = (struct led_classdev *) data;
>>> @@ -85,6 +94,15 @@ static void led_heartbeat_function(unsigned long data)
>>>        mod_timer(&heartbeat_data->timer, jiffies + delay);
>>>    }
>>>
>>> +static void led_heartbeat_rgb_function(unsigned long data)
>>> +{
>>> +    struct led_classdev *led_cdev = (struct led_classdev *) data;
>>> +    struct heartbeat_trig_data *heartbeat_data = led_cdev->trigger_data;
>>> +
>>> +    led_trigger_range_event(&heartbeat_led_rgb_trigger, avenrun[0]);
>>> +    mod_timer(&heartbeat_data->timer, jiffies + msecs_to_jiffies(500));
>>> +}

This function could reuse the code from led_heartbeat_function(), that
calculates timer delay. That code could be made reusable by
both monochrome and rgb heartbeat trigger.

>>>    static ssize_t led_invert_show(struct device *dev,
>>>            struct device_attribute *attr, char *buf)
>>>    {
>>> @@ -136,6 +154,22 @@ static void heartbeat_trig_activate(struct led_classdev *led_cdev)
>>>        led_cdev->activated = true;
>>>    }
>>>
>>> +static void heartbeat_trig_rgb_activate(struct led_classdev *led_cdev)
>>> +{
>>> +    struct heartbeat_trig_data *heartbeat_data;
>>> +
>>> +    heartbeat_data = kzalloc(sizeof(*heartbeat_data), GFP_KERNEL);
>>> +    if (!heartbeat_data)
>>> +        return;
>>> +
>>> +    led_cdev->trigger_data = heartbeat_data;

How about adding struct rgb_heartbeat_trig_data comprising
two properties of types struct heartbeat_trig_data and
struct led_trigger_range respectively?
It would be used by the new led_heartbeat_rgb_function to
store blinking and color related data.

>>> +    setup_timer(&heartbeat_data->timer,
>>> +            led_heartbeat_rgb_function, (unsigned long) led_cdev);
>>> +    led_heartbeat_rgb_function(heartbeat_data->timer.data);
>>> +    led_cdev->activated = true;
>>> +}
>>> +
>>>    static void heartbeat_trig_deactivate(struct led_classdev *led_cdev)
>>>    {
>>>        struct heartbeat_trig_data *heartbeat_data = led_cdev->trigger_data;
>>> @@ -148,12 +182,31 @@ static void heartbeat_trig_deactivate(struct led_classdev *led_cdev)
>>>        }
>>>    }
>>>
>>> +static void heartbeat_trig_rgb_deactivate(struct led_classdev *led_cdev)
>>> +{
>>> +    struct heartbeat_trig_data *heartbeat_data = led_cdev->trigger_data;
>>> +
>>> +    if (led_cdev->activated) {
>>> +        del_timer_sync(&heartbeat_data->timer);
>>> +        kfree(heartbeat_data);
>>> +        led_cdev->activated = false;
>>> +    }
>>> +}
>>> +
>>>    static struct led_trigger heartbeat_led_trigger = {
>>>        .name     = "heartbeat",
>>>        .activate = heartbeat_trig_activate,
>>>        .deactivate = heartbeat_trig_deactivate,
>>>    };
>>>
>>> +static struct led_trigger heartbeat_led_rgb_trigger = {
>>> +    .flags    = LED_TRIG_CAP_RGB,
>>> +    .name     = "heartbeat-rgb",
>>> +    .range    = &led_heartbeat_range,
>>> +    .activate = heartbeat_trig_rgb_activate,
>>> +    .deactivate = heartbeat_trig_rgb_deactivate,
>>> +};
>>> +
>>>    static int heartbeat_reboot_notifier(struct notifier_block *nb,
>>>                         unsigned long code, void *unused)
>>>    {
>>> @@ -178,9 +231,17 @@ static struct notifier_block heartbeat_panic_nb = {
>>>
>>>    static int __init heartbeat_trig_init(void)
>>>    {
>>> -    int rc = led_trigger_register(&heartbeat_led_trigger);
>>> +    int rc;
>>> +
>>> +    led_heartbeat_range.end = num_online_cpus() * FIXED_1;
>>> +
>>> +    rc = led_trigger_register(&heartbeat_led_rgb_trigger);
>>> +    if (rc)
>>> +        return rc;

With inherited blinking pattern rgb version will also have to
register the same notifiers as the monochrome one.

>>> +    rc = led_trigger_register(&heartbeat_led_trigger);
>>>        if (!rc) {
>>> +        led_trigger_unregister(&heartbeat_led_rgb_trigger);
>>>            atomic_notifier_chain_register(&panic_notifier_list,
>>>                               &heartbeat_panic_nb);
>>>            register_reboot_notifier(&heartbeat_reboot_nb);
>>> @@ -194,6 +255,7 @@ static void __exit heartbeat_trig_exit(void)
>>>        atomic_notifier_chain_unregister(&panic_notifier_list,
>>>                         &heartbeat_panic_nb);
>>>        led_trigger_unregister(&heartbeat_led_trigger);
>>> +    led_trigger_unregister(&heartbeat_led_rgb_trigger);
>>>    }
>>>
>>>    module_init(heartbeat_trig_init);
>>>
>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-leds" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
>
>


-- 
Best regards,
Jacek Anaszewski

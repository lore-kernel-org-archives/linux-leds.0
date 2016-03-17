From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 1/3] leds: triggers: add support for RGB triggers
Date: Thu, 17 Mar 2016 20:53:49 +0100
Message-ID: <56EB0B4D.6040809@gmail.com>
References: <56E59FFE.8040203@googlemail.com> <56EAB407.60904@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34240 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932085AbcCQUE1 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 17 Mar 2016 16:04:27 -0400
In-Reply-To: <56EAB407.60904@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Am 17.03.2016 um 14:41 schrieb Jacek Anaszewski:
> Hi Heiner,
> 
> On 03/13/2016 06:14 PM, Heiner Kallweit wrote:
>> Add basic support for RGB triggers. Triggers with flag LED_TRIG_CAP_RGB
>> set are available to RGB LED devices only.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>   drivers/leds/led-triggers.c | 15 ++++++++++++---
>>   include/linux/leds.h        |  3 +++
>>   2 files changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
>> index 2181581..3ccf88b 100644
>> --- a/drivers/leds/led-triggers.c
>> +++ b/drivers/leds/led-triggers.c
>> @@ -30,6 +30,13 @@ static LIST_HEAD(trigger_list);
>>
>>    /* Used by LED Class */
>>
>> +static inline bool led_trig_check_rgb(struct led_trigger *trig,
>> +                      struct led_classdev *led_cdev)
>> +{
>> +    return !(trig->flags & LED_TRIG_CAP_RGB) ||
>> +           led_cdev->flags & LED_DEV_CAP_RGB;
>> +}
> 
> Could you explain what is the purpose of this function?
> What actually do we want to check here?
> 
Triggers using RGB functionality can't be used with non-RGB LED's.
This check checks for such unsupported combinations:
It returns false if the trigger uses RGB functionality but LED doesn't
support the RGB extension.

>>   ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
>>           const char *buf, size_t count)
>>   {
>> @@ -52,12 +59,12 @@ ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
>>       down_read(&triggers_list_lock);
>>       list_for_each_entry(trig, &trigger_list, next_trig) {
>>           if (sysfs_streq(buf, trig->name)) {
>> +            if (!led_trig_check_rgb(trig, led_cdev))
>> +                break;

Check for the case that userspace wants to set a RGB trigger for a non-RGB LED via sysfs.

>>               down_write(&led_cdev->trigger_lock);
>>               led_trigger_set(led_cdev, trig);
>>               up_write(&led_cdev->trigger_lock);
>> -
>> -            up_read(&triggers_list_lock);
>> -            goto unlock;
>> +            break;
>>           }
>>       }
>>       up_read(&triggers_list_lock);
>> @@ -84,6 +91,8 @@ ssize_t led_trigger_show(struct device *dev, struct device_attribute *attr,
>>           len += sprintf(buf+len, "none ");
>>
>>       list_for_each_entry(trig, &trigger_list, next_trig) {
>> +        if (!led_trig_check_rgb(trig, led_cdev))
>> +            continue;

Omit RGB triggers when listing the available triggers for a non-RGB LED via sysfs.

>>           if (led_cdev->trigger && !strcmp(led_cdev->trigger->name,
>>                               trig->name))
>>               len += sprintf(buf+len, "[%s] ", trig->name);
>> diff --git a/include/linux/leds.h b/include/linux/leds.h
>> index 58e22e6..07eb074 100644
>> --- a/include/linux/leds.h
>> +++ b/include/linux/leds.h
>> @@ -248,6 +248,9 @@ enum led_brightness led_hsv_to_rgb(enum led_brightness hsv);
>>   struct led_trigger {
>>       /* Trigger Properties */
>>       const char     *name;
>> +    u8        flags;
>> +#define LED_TRIG_CAP_RGB    BIT(0)
>> +
>>       void        (*activate)(struct led_classdev *led_cdev);
>>       void        (*deactivate)(struct led_classdev *led_cdev);
>>
>>
> 
> 

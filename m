From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v4 1/2] leds: core: Introduce generic pattern interface
Date: Sat, 14 Jul 2018 10:44:40 +0800
Message-ID: <CAMz4kuLAJuK-eok6vJFLt4=S_9rnF3JniNVexXLbNTuHvbXsCA@mail.gmail.com>
References: <a0b874372f9ccd0491b54c79ac63b41812efef56.1531460834.git.baolin.wang@linaro.org>
 <7263fcd3-4bd0-d3b1-5468-5bd6234fbd53@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7263fcd3-4bd0-d3b1-5468-5bd6234fbd53@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Jacek,

On 14 July 2018 at 04:07, Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
> Hi Baolin,
>
> Thank you for the update.
>
>
> On 07/13/2018 08:21 AM, Baolin Wang wrote:
>>
>> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>>
>> Some LED controllers have support for autonomously controlling
>> brightness over time, according to some preprogrammed pattern or
>> function.
>>
>> This adds a new optional operator that LED class drivers can implement
>> if they support such functionality as well as a new device attribute to
>> configure the pattern for a given LED.
>>
>> [Baolin Wang did some improvements.]
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
>> ---
>> Changes from v3:
>>   - Move the check in pattern_show() to of_led_classdev_register().
>>   - Add more documentation to explain how to set/clear one pattern.
>>
>> Changes from v2:
>>   - Change kernel version to 4.19.
>>   - Force user to return error pointer if failed to issue pattern_get().
>>   - Use strstrip() to trim trailing newline.
>>   - Other optimization.
>>
>> Changes from v1:
>>   - Add some comments suggested by Pavel.
>>   - Change 'delta_t' can be 0.
>>
>> Note: I removed the pattern repeat check and will get the repeat number by
>> adding
>> one extra file named 'pattern_repeat' according to previous discussion.
>> ---
>>   Documentation/ABI/testing/sysfs-class-led |   20 +++++
>>   drivers/leds/led-class.c                  |  118
>> +++++++++++++++++++++++++++++
>>   include/linux/leds.h                      |   19 +++++
>>   3 files changed, 157 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-led
>> b/Documentation/ABI/testing/sysfs-class-led
>> index 5f67f7a..f4b73ad 100644
>> --- a/Documentation/ABI/testing/sysfs-class-led
>> +++ b/Documentation/ABI/testing/sysfs-class-led
>> @@ -61,3 +61,23 @@ Description:
>>                 gpio and backlight triggers. In case of the backlight
>> trigger,
>>                 it is useful when driving a LED which is intended to
>> indicate
>>                 a device in a standby like state.
>> +
>> +What: /sys/class/leds/<led>/pattern
>> +Date:          July 2018
>> +KernelVersion: 4.19
>> +Description:
>> +               Specify a pattern for the LED, for LED hardware that
>> support
>> +               altering the brightness as a function of time.
>> +
>> +               The pattern is given by a series of tuples, of brightness
>> and
>> +               duration (ms). The LED is expected to traverse the series
>> and
>> +               each brightness value for the specified duration. Duration
>> of
>> +               0 means brightness should immediately change to new value.
>> +
>> +               As LED hardware might have different capabilities and
>> precision
>> +               the requested pattern might be slighly adjusted by the
>> driver
>> +               and the resulting pattern of such operation should be
>> returned
>> +               when this file is read.
>> +
>> +               Writing non-empty string to this file will active the
>> pattern,
>
>
> s/active/activate/

Will fix the typo.

>
>
>> +               and empty string will disable the pattern.
>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>> index 3c7e348..0992a0e 100644
>> --- a/drivers/leds/led-class.c
>> +++ b/drivers/leds/led-class.c
>> @@ -74,6 +74,119 @@ static ssize_t max_brightness_show(struct device *dev,
>>   }
>>   static DEVICE_ATTR_RO(max_brightness);
>>   +static ssize_t pattern_show(struct device *dev,
>> +                           struct device_attribute *attr, char *buf)
>> +{
>> +       struct led_classdev *led_cdev = dev_get_drvdata(dev);
>> +       struct led_pattern *pattern;
>> +       size_t offset = 0;
>> +       int count, n, i;
>> +
>> +       pattern = led_cdev->pattern_get(led_cdev, &count);
>> +       if (IS_ERR(pattern))
>> +               return PTR_ERR(pattern);
>> +
>> +       for (i = 0; i < count; i++) {
>> +               n = snprintf(buf + offset, PAGE_SIZE - offset, "%d %d ",
>> +                            pattern[i].brightness, pattern[i].delta_t);
>> +
>> +               if (offset + n >= PAGE_SIZE)
>> +                       goto err_nospc;
>> +
>> +               offset += n;
>> +       }
>> +
>> +       buf[offset - 1] = '\n';
>> +
>> +       kfree(pattern);
>> +       return offset;
>> +
>> +err_nospc:
>> +       kfree(pattern);
>> +       return -ENOSPC;
>> +}
>> +
>> +static ssize_t pattern_store(struct device *dev,
>> +                            struct device_attribute *attr,
>> +                            const char *buf, size_t size)
>> +{
>> +       struct led_classdev *led_cdev = dev_get_drvdata(dev);
>> +       struct led_pattern *pattern = NULL;
>> +       char *sbegin, *elem, *s;
>> +       unsigned long val;
>> +       int ret = 0, len = 0;
>> +       bool odd = true;
>> +
>> +       sbegin = kstrndup(buf, size, GFP_KERNEL);
>> +       if (!sbegin)
>> +               return -ENOMEM;
>> +
>> +       /*
>> +        * Trim trailing newline, if the remaining string is empty,
>> +        * clear the pattern.
>> +        */
>> +       s = strstrip(sbegin);
>> +       if (!*s) {
>> +               if (led_cdev->pattern_clear)
>> +                       ret = led_cdev->pattern_clear(led_cdev);
>
>
> Why you don't require pattern_clear op to be initialized?
> Without it there seems to be no other way to disable the pattern.
>
> Please fail in led_classdev_register() if it is NULL, similarly
> as when pattern_get is NULL.

Ah, I misunderstood your previous comments. Yes, we can ceck it in
led_classdev_register().

>
>
>> +               goto out;
>> +       }
>> +
>> +       pattern = kcalloc(size, sizeof(*pattern), GFP_KERNEL);
>> +       if (!pattern) {
>> +               ret = -ENOMEM;
>> +               goto out;
>> +       }
>> +
>> +       /* Parse out the brightness & delta_t touples */
>> +       while ((elem = strsep(&s, " ")) != NULL) {
>> +               ret = kstrtoul(elem, 10, &val);
>> +               if (ret)
>> +                       goto out;
>> +
>> +               if (odd) {
>> +                       pattern[len].brightness = val;
>> +               } else {
>> +                       pattern[len].delta_t = val;
>> +                       len++;
>> +               }
>> +
>> +               odd = !odd;
>> +       }
>> +
>> +       /*
>> +        * Fail if we didn't find any data points or last data point was
>> partial
>> +        */
>> +       if (!len || !odd) {
>> +               ret = -EINVAL;
>> +               goto out;
>> +       }
>> +
>> +       ret = led_cdev->pattern_set(led_cdev, pattern, len);
>> +
>> +out:
>> +       kfree(pattern);
>> +       kfree(sbegin);
>> +       return ret < 0 ? ret : size;
>> +}
>> +static DEVICE_ATTR_RW(pattern);
>> +
>> +static umode_t led_class_attrs_mode(struct kobject *kobj,
>> +                                   struct attribute *attr, int index)
>> +{
>> +       struct device *dev = container_of(kobj, struct device, kobj);
>> +       struct led_classdev *led_cdev = dev_get_drvdata(dev);
>> +
>> +       if (attr == &dev_attr_brightness.attr)
>> +               return attr->mode;
>> +       if (attr == &dev_attr_max_brightness.attr)
>> +               return attr->mode;
>> +       if (attr == &dev_attr_pattern.attr && led_cdev->pattern_set)
>> +               return attr->mode;
>> +
>> +       return 0;
>> +}
>> +
>>   #ifdef CONFIG_LEDS_TRIGGERS
>>   static DEVICE_ATTR(trigger, 0644, led_trigger_show, led_trigger_store);
>>   static struct attribute *led_trigger_attrs[] = {
>> @@ -88,11 +201,13 @@ static ssize_t max_brightness_show(struct device
>> *dev,
>>   static struct attribute *led_class_attrs[] = {
>>         &dev_attr_brightness.attr,
>>         &dev_attr_max_brightness.attr,
>> +       &dev_attr_pattern.attr,
>>         NULL,
>>   };
>>     static const struct attribute_group led_group = {
>>         .attrs = led_class_attrs,
>> +       .is_visible = led_class_attrs_mode,
>>   };
>>     static const struct attribute_group *led_groups[] = {
>> @@ -256,6 +371,9 @@ int of_led_classdev_register(struct device *parent,
>> struct device_node *np,
>>         char name[LED_MAX_NAME_SIZE];
>>         int ret;
>>   +     if (led_cdev->pattern_set && !led_cdev->pattern_get)
>
>
> if (led_cdev->pattern_set && (!led_cdev->pattern_get ||
>                               !led_cdev->pattern_clear)

Sure. Thanks for your help.

>
>
>> +               return -EINVAL;
>> +
>>         ret = led_classdev_next_name(led_cdev->name, name, sizeof(name));
>>         if (ret < 0)
>>                 return ret;
>> diff --git a/include/linux/leds.h b/include/linux/leds.h
>> index b7e8255..acdbb2f 100644
>> --- a/include/linux/leds.h
>> +++ b/include/linux/leds.h
>> @@ -22,6 +22,7 @@
>>   #include <linux/workqueue.h>
>>     struct device;
>> +struct led_pattern;
>>   /*
>>    * LED Core
>>    */
>> @@ -88,6 +89,14 @@ struct led_classdev {
>>                                      unsigned long *delay_on,
>>                                      unsigned long *delay_off);
>>   +     int (*pattern_set)(struct led_classdev *led_cdev,
>> +                          struct led_pattern *pattern, int len);
>> +
>> +       int (*pattern_clear)(struct led_classdev *led_cdev);
>> +
>> +       struct led_pattern *(*pattern_get)(struct led_classdev *led_cdev,
>> +                                          int *len);
>> +
>>         struct device           *dev;
>>         const struct attribute_group    **groups;
>>   @@ -446,4 +455,14 @@ static inline void
>> led_classdev_notify_brightness_hw_changed(
>>         struct led_classdev *led_cdev, enum led_brightness brightness) { }
>>   #endif
>>   +/**
>> + * struct led_pattern - brigheness value in a pattern
>> + * @delta_t: delay until next entry, in milliseconds
>> + * @brightness: brightness at time = 0
>> + */
>> +struct led_pattern {
>> +       int delta_t;
>> +       int brightness;
>> +};
>> +
>>   #endif                /* __LINUX_LEDS_H_INCLUDED */
>>
>
> --
> Best regards,
> Jacek Anaszewski



-- 
Baolin Wang
Best Regards

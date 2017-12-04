From: Ben Whitten <ben.whitten@gmail.com>
Subject: Re: [PATCH] leds: trigger: Introduce a NETDEV trigger
Date: Mon, 4 Dec 2017 16:25:57 +0000
Message-ID: <CAF3==isGXFeyBVQQEj5XpenEWbZv16MPP=bce8uWUEWKs-yucg@mail.gmail.com>
References: <1511906058-30649-1-git-send-email-ben.whitten@gmail.com>
 <1511906058-30649-2-git-send-email-ben.whitten@gmail.com> <fdc16216-4acc-b87b-1d75-6db33c3fb389@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:40353 "EHLO
        mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752588AbdLDQZ7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Dec 2017 11:25:59 -0500
In-Reply-To: <fdc16216-4acc-b87b-1d75-6db33c3fb389@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: rpurdie@rpsys.net, pavel@ucw.cz, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org

Hi Jacek,

Thank you for the review, trimmed and comments inline.

On 3 December 2017 at 21:09, Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
>> + * link -  LED's normal state reflects whether the link is up
>> + *         (has carrier) or not
>> + * tx -  LED blinks on transmitted data
>> + * rx -  LED blinks on receive data
>> + *
>> + */
>> +
>> +struct led_netdev_data {
>> +     spinlock_t lock;
>> +
>> +     struct delayed_work work;
>> +     struct notifier_block notifier;
>> +
>> +     struct led_classdev *led_cdev;
>> +     struct net_device *net_dev;
>> +
>> +     char device_name[IFNAMSIZ];
>> +     atomic_t interval;
>> +     unsigned int last_activity;
>> +
>> +     unsigned long mode;
>> +#define LED_BLINK_link       0
>> +#define LED_BLINK_tx 1
>> +#define LED_BLINK_rx 2
>
> LED core already has LED_BLINK* family of macros. Please come up
> with the prefix specific for this trigger e.g. NETDEV_LED.
> Also let's use uppercase for the whole macro name.
>
>> +#define LED_MODE_LINKUP      3
>
> s/LED/NETDEV_LED/
>

Sorted.

>> +};
>> +
>> +static void set_baseline_state(struct led_netdev_data *trigger_data)
>> +{
>> +     if (!test_bit(LED_MODE_LINKUP, &trigger_data->mode))
>> +             led_set_brightness(trigger_data->led_cdev, LED_OFF);
>> +     else {
>> +             if (test_bit(LED_BLINK_link, &trigger_data->mode))
>> +                     led_set_brightness(trigger_data->led_cdev, LED_FULL);
>> +
>> +             if (test_bit(LED_BLINK_tx, &trigger_data->mode) ||
>> +                 test_bit(LED_BLINK_rx, &trigger_data->mode))
>> +                     schedule_delayed_work(&trigger_data->work,
>> +                             atomic_read(&trigger_data->interval));
>
> Now we have blink support in the LED core. Please use
> led_blink_set_oneshot() instead.
>
> Generally you can compare how ledtrig-timer is now implemented.
>

I have cleaned up and converted to led_blink_set_oneshot in the work function
as suggested however it doesn't quite 'look' right yet. So there is something
wrong with my implementation.

When setting blink on RX then initiating a download I find these differences:
Old mechanism, an 'interval' setting of 50ms results in a 100ms period with
50% duty cycle, 50ms on 50ms off.
New mechanism, an 'interval' setting of 10ms resulting in 110ms period with
18% duty cycle, 20ms on 90ms off. Appears to be quite a delay getting the
blink queued up again.

The oneshot is set in the worker function tasked with gathering netdev stats.
I'll keep exploring.

>> +#define led_mode_flags_attr(field)                                   \
>> +static ssize_t field##_show(struct device *dev,                              \
>> +     struct device_attribute *attr, char *buf)                       \
>> +{                                                                    \
>> +     struct led_classdev *led_cdev = dev_get_drvdata(dev);           \
>> +     struct led_netdev_data *trigger_data = led_cdev->trigger_data;  \
>> +                                                                     \
>> +     return sprintf(buf, "%u\n", test_bit(LED_BLINK_##field,         \
>> +                                     &trigger_data->mode));          \
>> +}                                                                    \
>> +static ssize_t field##_store(struct device *dev,                     \
>> +     struct device_attribute *attr, const char *buf, size_t size)    \
>> +{                                                                    \
>> +     struct led_classdev *led_cdev = dev_get_drvdata(dev);           \
>> +     struct led_netdev_data *trigger_data = led_cdev->trigger_data;  \
>> +     unsigned long state;                                            \
>> +     int ret;                                                        \
>> +                                                                     \
>> +     ret = kstrtoul(buf, 0, &state);                                 \
>> +     if (ret)                                                        \
>> +             return ret;                                             \
>> +                                                                     \
>> +     cancel_delayed_work_sync(&trigger_data->work);                  \
>> +                                                                     \
>> +     if (state)                                                      \
>> +             set_bit(LED_BLINK_##field, &trigger_data->mode);        \
>> +     else                                                            \
>> +             clear_bit(LED_BLINK_##field, &trigger_data->mode);      \
>> +                                                                     \
>> +     set_baseline_state(trigger_data);                               \
>> +                                                                     \
>> +     return size;                                                    \
>> +}                                                                    \
>> +static DEVICE_ATTR_RW(field);
>
> In order to get rid of this macro and avoid the need for camel case
> macro name we could have one function that would accept an enum e.g.
>
> enum netdev_led_attr {
>         NETDEV_ATTR_LINK,
>         NETDEV_ATTR_RX,
>         NETDEV_ATTR_TX
> };
>
> The function would be called from each sysfs attr callback with the
> related enum, and would alter the state of the related bit.
>

I was aiming for a bit of code de duplication, but it ended up a mess.
Fixed as per your suggestion.

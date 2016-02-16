From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 2/2] leds: core: add support for RGB LED's
Date: Tue, 16 Feb 2016 10:09:11 +0100
Message-ID: <56C2E737.1090607@samsung.com>
References: <56B72064.9010708@gmail.com> <56BE0480.6090108@samsung.com>
 <56BF768B.2090004@gmail.com> <56C1A643.5000004@samsung.com>
 <56C237C0.8060907@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:52041 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754277AbcBPJJP (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 16 Feb 2016 04:09:15 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O2M00J6FURCJW60@mailout3.w1.samsung.com> for
 linux-leds@vger.kernel.org; Tue, 16 Feb 2016 09:09:12 +0000 (GMT)
In-reply-to: <56C237C0.8060907@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org

On 02/15/2016 09:40 PM, Heiner Kallweit wrote:
> Am 15.02.2016 um 11:19 schrieb Jacek Anaszewski:
>> On 02/13/2016 07:31 PM, Heiner Kallweit wrote:
>>> Am 12.02.2016 um 17:12 schrieb Jacek Anaszewski:
>>>> On 02/07/2016 11:45 AM, Heiner Kallweit wrote:
>>>>> Add support for RGB LED's. Flag LED_DEV_CAP_RGB is used to instruct
>>>>> the core to convert HSV to RGB on output.
>>>>>
>>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>>> ---
>>>>>     drivers/leds/led-class.c |  3 +++
>>>>>     drivers/leds/led-core.c  | 48 +++++++++++++++++++++++++++++++++++++++++++++++-
>>>>>     include/linux/leds.h     |  1 +
>>>>>     3 files changed, 51 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>>>>> index 18a4558..f04efd2 100644
>>>>> --- a/drivers/leds/led-class.c
>>>>> +++ b/drivers/leds/led-class.c
>>>>> @@ -193,6 +193,9 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
>>>>>         char name[64];
>>>>>         int ret;
>>>>>
>>>>> +    if (led_cdev->flags & LED_DEV_CAP_RGB)
>>>>> +        led_cdev->flags |= LED_DEV_CAP_COLOR;
>>>>> +
>>>>>         ret = led_classdev_next_name(led_cdev->name, name, sizeof(name));
>>>>>         if (ret < 0)
>>>>>             return ret;
>>>>> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
>>>>> index 798e31e..6e1adc5 100644
>>>>> --- a/drivers/leds/led-core.c
>>>>> +++ b/drivers/leds/led-core.c
>>>>> @@ -45,12 +45,50 @@ static inline enum led_brightness to_hsv(struct led_classdev *cdev,
>>>>>         return ret | min(value & LED_BRIGHTNESS_MASK, cdev->max_brightness);
>>>>>     }
>>>>>
>>>>> +static enum led_brightness hsv_to_rgb(enum led_brightness hsv)
>>>>> +{
>>>>> +    int h = min_t(int, (hsv >> 16) & 0xff, 251);
>>>>> +    int s = (hsv >> 8) & 0xff;
>>>>> +    int v = hsv & 0xff;
>>>>> +    int f, p, q, t, r, g, b;
>>>>> +
>>>>> +    if (!v)
>>>>> +        return 0;
>>>>> +    if (!s)
>>>>> +        return (v << 16) + (v << 8) + v;
>>>>> +
>>>>> +    f = DIV_ROUND_CLOSEST((h % 42) * 255, 42);
>>>>> +    p = v - DIV_ROUND_CLOSEST(s * v, 255);
>>>>> +    q = v - DIV_ROUND_CLOSEST(f * s * v, 255 * 255);
>>>>> +    t = v - DIV_ROUND_CLOSEST((255 - f) * s * v, 255 * 255);
>>>>> +
>>>>> +    switch (h / 42) {
>>>>> +    case 0:
>>>>> +        r = v; g = t; b = p; break;
>>>>> +    case 1:
>>>>> +        r = q; g = v; b = p; break;
>>>>> +    case 2:
>>>>> +        r = p; g = v; b = t; break;
>>>>> +    case 3:
>>>>> +        r = p; g = q; b = v; break;
>>>>> +    case 4:
>>>>> +        r = t; g = p; b = v; break;
>>>>> +    case 5:
>>>>> +        r = v; g = p; b = q; break;
>>>>> +    }
>>>>> +
>>>>> +    return (r << 16) + (g << 8) + b;
>>>>> +}
>>>>> +
>>>>
>>>> This can be moved to led-hvs-core.c. Could you also share a reference
>>>> to the algorithm of hsv -> rgb conversion you implemented here?
>>>>
>>> OK, will move it. The HSV -> RGB algorithm is the one from Gonzalez / Woods
>>> and I took it from the German wikipedia.
>>> https://de.wikipedia.org/wiki/HSV-Farbraum#Umrechnung_HSV_in_RGB
>>> The calculation was slightly adjusted to deal with intervals
>>> 0-255 instead of [0,1] and for hue 0-251 instead of [0, 360)
>>
>> Thanks for the link. It is possible that I'll have some comments to this
>> piece of code after getting acquainted with the subject, but it
>> may take a while.
>>
>>>>>     static int led_set_output(struct led_classdev *cdev,
>>>>>                   enum led_brightness value)
>>>>>     {
>>>>>         if (!cdev->brightness_set)
>>>>>             return -ENOTSUPP;
>>>>>
>>>>> +    if (cdev->flags & LED_DEV_CAP_RGB)
>>>>> +        value = hsv_to_rgb(value);
>>>>> +
>>>>>         cdev->brightness_set(cdev, value);
>>>>>
>>>>>         return 0;
>>>>> @@ -62,6 +100,9 @@ static int led_set_output_blocking(struct led_classdev *cdev,
>>>>>         if (!cdev->brightness_set_blocking)
>>>>>             return -ENOTSUPP;
>>>>>
>>>>> +    if (cdev->flags & LED_DEV_CAP_RGB)
>>>>> +        value = hsv_to_rgb(value);
>>>>> +
>>>>>         return cdev->brightness_set_blocking(cdev, value);
>>>>>     }
>>>>>
>>>>> @@ -320,7 +361,12 @@ int led_update_brightness(struct led_classdev *led_cdev)
>>>>>     {
>>>>>         int ret = 0;
>>>>>
>>>>> -    if (led_cdev->brightness_get) {
>>>>> +    /*
>>>>> +     * for now reading back the color is not supported as multiple
>>>>> +     * HSV -> RGB -> HSV conversions may distort the color due to
>>>>> +     * rounding issues in the conversion algorithm
>>>>> +     */
>>>>> +    if (led_cdev->brightness_get && !(led_cdev->flags & LED_DEV_CAP_RGB)) {
>>>>>             ret = led_cdev->brightness_get(led_cdev);
>>>>>             if (ret >= 0) {
>>>>>                 led_cdev->brightness = ret;
>>>>> diff --git a/include/linux/leds.h b/include/linux/leds.h
>>>>> index 8e7db72..24eae4b 100644
>>>>> --- a/include/linux/leds.h
>>>>> +++ b/include/linux/leds.h
>>>>> @@ -51,6 +51,7 @@ struct led_classdev {
>>>>>     #define LED_DEV_CAP_FLASH    (1 << 23)
>>>>>     #define LED_HW_PLUGGABLE    (1 << 24)
>>>>>     #define LED_DEV_CAP_COLOR    (1 << 25)
>>>>> +#define LED_DEV_CAP_RGB        (1 << 26)
>>>>
>>>> Why two flags - COLOR and RGB? Their meaning is ambiguous.
>>>>
>>> There might be color LED's with HSV interface and setting the COLOR flag
>>> but not the RGB flag would support such LED's w/o additional code.
>>> Not sure whether such devices exist, but one additional flag might be a
>>> small enough price for decoupling internal color handling and RGB output
>>> conversion.
>>
>> For now let's keep the code as simple as possible. We can always add
>> the flag when needed.
>>
>> Please also rename LED_DEV_CAP_COLOR to LED_DEV_CAP_HSV.
>>
>> We'll also have to change the type of brightness and max_brightness
>> properties of struct led_classdev to u32. By default it is signed int
>> type, but using -fshort-enums GCC option causes the smallest possible
>> type to be used [1].
>>
> Interesting. I think we want to avoid having to change existing drivers,
> therefore the callbacks in struct led_classdev will have to take enum
> led_brightness arguments also further on.
> But we need it to be at least 32 bit for the hsv extension. To ensure this
> (even if short-enums is used) we could add a dummy value of 0x70000000
> to the enum. What do you think?

Originally the type was int. It was changed to enum led_brightness
with patch [1], but it wasn't a good move, which turns out now.
With -fshort-enums and current definition of enum led_brightness gcc
can choose char for brightness type.

This is clear bug because default maximum allowed brightness value can
be overridden with max_brightness property. With -fshort-enums we end
up with truncated brightness for levels over 255. Brightness value can
be truncated also when passing to LED API.

I agree that adding an enum value requiring four bytes seems to be the
best solution. I'd prefer that the value was 0xffffffff, and a
suitable comment should be placed next to it, explaining why LED_FULL
is not the last value in the enum.

[1] http://www.spinics.net/lists/linux-leds/msg02070.html
-- 
Best regards,
Jacek Anaszewski

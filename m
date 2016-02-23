From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3 4/4] leds: core: add support for RGB LED's
Date: Tue, 23 Feb 2016 21:27:37 +0100
Message-ID: <56CCC0B9.2080108@gmail.com>
References: <56C6381A.7060209@gmail.com> <56C71FBB.7080901@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:33928 "EHLO
	mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753888AbcBWU1p (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 23 Feb 2016 15:27:45 -0500
Received: by mail-wm0-f49.google.com with SMTP id b205so8397565wmb.1
        for <linux-leds@vger.kernel.org>; Tue, 23 Feb 2016 12:27:44 -0800 (PST)
In-Reply-To: <56C71FBB.7080901@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org

Am 19.02.2016 um 14:59 schrieb Jacek Anaszewski:
> Hi Heiner,
> 
> On 02/18/2016 10:31 PM, Heiner Kallweit wrote:
>> Add support for RGB LED's. Flag LED_DEV_CAP_HSV is used to instruct
>> the core to convert HSV to RGB on output.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>> v2:
>> - move hsv -> rgb conversion to separate file
>> - remove flag LED_DEV_CAP_RGB
>> v3:
>> - call led_hsv_to_rgb only if LED_DEV_CAP_HSV is set
>>    This is needed in cases when we have monochrome and color LEDs
>>    as well in a system.
>> ---
>>   drivers/leds/led-color-core.c | 35 +++++++++++++++++++++++++++++++++++
>>   drivers/leds/led-core.c       | 17 ++++++++++++++++-
>>   drivers/leds/leds.h           |  1 +
>>   3 files changed, 52 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/leds/led-color-core.c b/drivers/leds/led-color-core.c
>> index b101f73..467beeb 100644
>> --- a/drivers/leds/led-color-core.c
>> +++ b/drivers/leds/led-color-core.c
>> @@ -31,3 +31,38 @@ enum led_brightness led_confine_brightness(struct led_classdev *led_cdev,
>>       return brightness |
>>              min(value & LED_BRIGHTNESS_MASK, led_cdev->max_brightness);
>>   }
>> +
>> +enum led_brightness led_hsv_to_rgb(enum led_brightness hsv)
>> +{
>> +    int h = min_t(int, (hsv >> 16) & 0xff, 251);
>> +    int s = (hsv >> 8) & 0xff;
>> +    int v = hsv & 0xff;
>> +    int f, p, q, t, r, g, b;
>> +
>> +    if (!v)
>> +        return 0;
>> +    if (!s)
>> +        return (v << 16) + (v << 8) + v;
>> +
>> +    f = DIV_ROUND_CLOSEST((h % 42) * 255, 42);
>> +    p = v - DIV_ROUND_CLOSEST(s * v, 255);
>> +    q = v - DIV_ROUND_CLOSEST(f * s * v, 255 * 255);
>> +    t = v - DIV_ROUND_CLOSEST((255 - f) * s * v, 255 * 255);
>> +
>> +    switch (h / 42) {
>> +    case 0:
>> +        r = v; g = t; b = p; break;
>> +    case 1:
>> +        r = q; g = v; b = p; break;
>> +    case 2:
>> +        r = p; g = v; b = t; break;
>> +    case 3:
>> +        r = p; g = q; b = v; break;
>> +    case 4:
>> +        r = t; g = p; b = v; break;
>> +    case 5:
>> +        r = v; g = p; b = q; break;
>> +    }
>> +
>> +    return (r << 16) + (g << 8) + b;
>> +}
> 
> Do you plan to add a driver using Color LEDs Support?
> If so, it would be good to add it to this patch set,
> which would make testing this code easier.
> 
I own a Thingm Blink(1) dual RGB LED USB device which I use for testing.
With the RGB extension in the kernel the driver could be significantly simplified
so that the changes are more or less a rewrite of the driver.
Because the USB device uses a HID interface the driver currently is located
under drivers/hid. IMHO that's questionable because the driver implements
LED functionality only. Moving this driver to drivers/leds could be an option.
When sending the patches for this driver to you for testing I'll set the maintainer
of the HID subsystem on cc.

>> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
>> index 525d566..255bdd7 100644
>> --- a/drivers/leds/led-core.c
>> +++ b/drivers/leds/led-core.c
>> @@ -31,6 +31,11 @@ static int __led_set_brightness(struct led_classdev *led_cdev,
>>       if (!led_cdev->brightness_set)
>>           return -ENOTSUPP;
>>
>> +#if IS_ENABLED(CONFIG_LEDS_COLOR)
>> +    if (led_cdev->flags & LED_DEV_CAP_HSV)
>> +        value = led_hsv_to_rgb(value);
>> +#endif
>> +
> 
> Please drop this changes. led_hsv_to_rgb() can be used internally
> by RGB LED class drivers.
> 
OK

>>       led_cdev->brightness_set(led_cdev, value);
>>
>>       return 0;
>> @@ -42,6 +47,11 @@ static int __led_set_brightness_blocking(struct led_classdev *led_cdev,
>>       if (!led_cdev->brightness_set_blocking)
>>           return -ENOTSUPP;
>>
>> +#if IS_ENABLED(CONFIG_LEDS_COLOR)
>> +    if (led_cdev->flags & LED_DEV_CAP_HSV)
>> +        value = led_hsv_to_rgb(value);
>> +#endif
>> +
> 
> Ditto.
> 
>>       return led_cdev->brightness_set_blocking(led_cdev, value);
>>   }
>>
>> @@ -294,7 +304,12 @@ int led_update_brightness(struct led_classdev *led_cdev)
>>   {
>>       int ret = 0;
>>
>> -    if (led_cdev->brightness_get) {
>> +    /*
>> +     * for now reading back the color is not supported as multiple
>> +     * HSV -> RGB -> HSV conversions may distort the color due to
>> +     * rounding issues in the conversion algorithm
>> +     */
>> +    if (led_cdev->brightness_get && !(led_cdev->flags & LED_DEV_CAP_HSV)) {
>>           ret = led_cdev->brightness_get(led_cdev);
>>           if (ret >= 0) {
>>               led_cdev->brightness = ret;
>> diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
>> index 094707f..763f19a 100644
>> --- a/drivers/leds/leds.h
>> +++ b/drivers/leds/leds.h
>> @@ -37,6 +37,7 @@ void led_set_brightness_nosleep(struct led_classdev *led_cdev,
>>   #if IS_ENABLED(CONFIG_LEDS_COLOR)
>>   enum led_brightness led_confine_brightness(struct led_classdev *led_cdev,
>>                           enum led_brightness value);
>> +enum led_brightness led_hsv_to_rgb(enum led_brightness hsv);
>>   #else
>>   static inline enum led_brightness led_confine_brightness(
>>           struct led_classdev *led_cdev, enum led_brightness value)
>>
> 
> 

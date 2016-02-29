From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v4 4/4] leds: core: add support for HSV to RGB conversion
Date: Mon, 29 Feb 2016 21:00:17 +0100
Message-ID: <56D4A351.2000806@gmail.com>
References: <56CF7D6D.50001@gmail.com> <56D46E0F.5080806@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34860 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752678AbcB2UZI (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 29 Feb 2016 15:25:08 -0500
Received: by mail-wm0-f66.google.com with SMTP id 1so683632wmg.2
        for <linux-leds@vger.kernel.org>; Mon, 29 Feb 2016 12:25:07 -0800 (PST)
In-Reply-To: <56D46E0F.5080806@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org

Am 29.02.2016 um 17:13 schrieb Jacek Anaszewski:
> Hi Heiner,
> 
> On 02/25/2016 11:17 PM, Heiner Kallweit wrote:
>> Export a function to convert HSV color values to RGB.
>> It's intended to be called by drivers for RGB LEDs.
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
>> v4:
>> - Export led_hsv_to_rgb and let the device driver call it instead
>>    of doing the conversion in the core
>> ---
>>   drivers/leds/led-core.c     |  7 ++++++-
>>   drivers/leds/led-rgb-core.c | 36 ++++++++++++++++++++++++++++++++++++
>>   include/linux/leds.h        |  8 ++++++++
>>   3 files changed, 50 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
>> index e75b0c8..e3ee971 100644
>> --- a/drivers/leds/led-core.c
>> +++ b/drivers/leds/led-core.c
>> @@ -295,7 +295,12 @@ int led_update_brightness(struct led_classdev *led_cdev)
>>   {
>>       int ret = 0;
>>
>> -    if (led_cdev->brightness_get) {
>> +    /*
>> +     * for now reading back the color is not supported as multiple
>> +     * HSV -> RGB -> HSV conversions may distort the color due to
>> +     * rounding issues in the conversion algorithm
>> +     */
> 
> This is very unpleasant. Is it really not feasible to work this around?
> 
With the 8 bit granularity of the color components it's not possible to guarantee
that a conversion followed by its reverse operation always results in the same value.
(at least for the H and S component, for V it's no problem)

Just one example: H=1 S=1 V=3 converted to RGB will result in R=G=B=3 and the reverse
conversion will result in H=0 S=0 V=3

I think there's only a theoretical impact of not supporting reading from the device
because who except the driver should access the device. If you think it is relevant
then I could think of something like this:
Overwrite the stored brightness value only if the value read from the device differs
"significantly" from the stored value. This would indicate that somebody outside
the driver changed the LED value and we should reflect this in the stored value.
What do you think?

>> +    if (led_cdev->brightness_get && !(led_cdev->flags & LED_DEV_CAP_HSV)) {
>>           ret = led_cdev->brightness_get(led_cdev);
>>           if (ret >= 0) {
>>               led_cdev->brightness = ret;
>> diff --git a/drivers/leds/led-rgb-core.c b/drivers/leds/led-rgb-core.c
>> index b81daeb..4691795 100644
>> --- a/drivers/leds/led-rgb-core.c
>> +++ b/drivers/leds/led-rgb-core.c
>> @@ -40,3 +40,39 @@ enum led_brightness led_confine_brightness(struct led_classdev *led_cdev,
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
>> +EXPORT_SYMBOL_GPL(led_hsv_to_rgb);
>> diff --git a/include/linux/leds.h b/include/linux/leds.h
>> index 1e98b2e..27725c6 100644
>> --- a/include/linux/leds.h
>> +++ b/include/linux/leds.h
>> @@ -226,6 +226,14 @@ static inline bool led_sysfs_is_disabled(struct led_classdev *led_cdev)
>>       return led_cdev->flags & LED_SYSFS_DISABLE;
>>   }
>>
>> +/**
>> + * led_hsv_to_rgb - convert a hsv color value to rgb color model
>> + * @hsv: the hsv value to convert
>> + *
>> + * Returns: the resulting rgb value
>> + */
>> +enum led_brightness led_hsv_to_rgb(enum led_brightness hsv);
>> +
>>   /*
>>    * LED Triggers
>>    */
>>
> 
> 

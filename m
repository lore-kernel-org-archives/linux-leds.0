From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] led: core: RfC - add RGB LED handling to the core
Date: Fri, 29 Jan 2016 09:24:07 +0100
Message-ID: <56AB21A7.5070505@samsung.com>
References: <5692BEB6.6040807@gmail.com> <56978FB0.4080700@samsung.com>
 <5699539F.5030102@gmail.com> <569C1655.1030700@gmail.com>
 <56A4D3ED.1000002@gmail.com> <56A5DFBC.2020509@samsung.com>
 <CAFSsGVshPt=-2z=+GFP+H6JNUwE8eh+ANib7jue22Mxy41x_KQ@mail.gmail.com>
 <56A5FE82.4030103@samsung.com> <56A672EF.8080107@gmail.com>
 <56A73E68.4040804@samsung.com> <56A7D248.1020307@gmail.com>
 <56A87F7B.2030806@samsung.com> <56AB0E10.7060405@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:38625 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753576AbcA2IYM (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 29 Jan 2016 03:24:12 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O1P00DF9GO9M990@mailout4.w1.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 29 Jan 2016 08:24:09 +0000 (GMT)
In-reply-to: <56AB0E10.7060405@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org

On 01/29/2016 08:00 AM, Heiner Kallweit wrote:
> Am 27.01.2016 um 09:27 schrieb Jacek Anaszewski:
>> On 01/26/2016 09:08 PM, Heiner Kallweit wrote:
>>> Am 26.01.2016 um 10:37 schrieb Jacek Anaszewski:
>>>> On 01/25/2016 08:09 PM, Heiner Kallweit wrote:
>>>>> Am 25.01.2016 um 11:52 schrieb Jacek Anaszewski:
>>>>>> On 01/25/2016 10:51 AM, Heiner Kallweit wrote:
>>>>>>> On Mon, Jan 25, 2016 at 9:41 AM, Jacek Anaszewski
>>>>>>> <j.anaszewski@samsung.com> wrote:
>>>>>>>> Hi Heiner,
>>>>>>>>
>>>>>>>>
>>>>>>>> On 01/24/2016 02:38 PM, Heiner Kallweit wrote:
>>>>>>>>>
>>>>>>>>> Am 17.01.2016 um 23:31 schrieb Jacek Anaszewski:
>>>>>>>>>>
>>>>>>>>>> On 01/15/2016 09:16 PM, Heiner Kallweit wrote:
>>>>>>>>>>>
>>>>>>>>>>> Am 14.01.2016 um 13:08 schrieb Jacek Anaszewski:
>>>>>>>>>>>>
>>>>>>>>>>>> On 01/10/2016 09:27 PM, Heiner Kallweit wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>> When playing with a ThingM Blink(1) USB RGB LED device I found that
>>>>>>>>>>>>> there
>>>>>>>>>>>>> are few drivers for RGB LED's spread across the kernel and each one
>>>>>>>>>>>>> implements the RGB functionality in its own way.
>>>>>>>>>>>>> Some examples:
>>>>>>>>>>>>> - drivers/hid/hid-thingm.c
>>>>>>>>>>>>> - drivers/usb/misc/usbled.c
>>>>>>>>>>>>> - drivers/leds/leds-bd2802.c
>>>>>>>>>>>>> - drivers/leds/leds-blinkm.c
>>>>>>>>>>>>> ...
>>>>>>>>>>>>> IMHO it would make sense to add generic RGB functionality to the LED
>>>>>>>>>>>>> core.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Things I didn't like too much in other driver implementations:
>>>>>>>>>>>>> - one led_classdev per color or at least
>>>>>>>>>>>>> - one sysfs attribute per color
>>>>>>>>>>>>> Colors are not really independent therefore I'd prefer one
>>>>>>>>>>>>> led_classdev
>>>>>>>>>>>>> per RGB LED. Also userspace should be able to change the color with
>>>>>>>>>>>>> one
>>>>>>>>>>>>> call -> therefore only one sysfs attribute for the RGB values.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Also the current brightness-related functionality should not be
>>>>>>>>>>>>> effected
>>>>>>>>>>>>> by the RGB extension.
>>>>>>>>>>>>>
>>>>>>>>>>>>> This patch is intended to demonstrate the idea of the extension. Most
>>>>>>>>>>>>> likely
>>>>>>>>>>>>> it's not ready yet for submission.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Main idea is to base the effective RGB value on a combination of
>>>>>>>>>>>>> brightness
>>>>>>>>>>>>> and a scaled-to-max RGB value.
>>>>>>>>>>>>> The RGB-related callbacks are basically the same as for brightness.
>>>>>>>>>>>>> RGB functionally can be switched on with a new flag in the
>>>>>>>>>>>>> led_classdev.flags
>>>>>>>>>>>>> bitmap.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Experimentally I changed the thingm driver to use this extension and
>>>>>>>>>>>>> it works
>>>>>>>>>>>>> quite well. As one result the driver could be very much simplified.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Any feedback is appreciated.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>>         drivers/leds/led-class.c |  62 +++++++++++++++++++++++++++
>>>>>>>>>>>>>         drivers/leds/led-core.c  | 106
>>>>>>>>>>>>> +++++++++++++++++++++++++++++++++++++++++++++++
>>>>>>>>>>>>>         drivers/leds/leds.h      |  12 ++++++
>>>>>>>>>>>>>         include/linux/leds.h     |  13 ++++++
>>>>>>>>>>>>>         4 files changed, 193 insertions(+)
>>>>>>>>>>>>>
>>>>>>>> [...]
>>>>>>>>
>>>>>>>>>>>>> +static void led_set_rgb_raw(struct led_classdev *cdev, u32 rgb)
>>>>>>>>>>>>> +{
>>>>>>>>>>>>> +    u32 red_raw = (rgb >> 16) & 0xff;
>>>>>>>>>>>>> +    u32 green_raw = (rgb >> 8) & 0xff;
>>>>>>>>>>>>> +    u32 blue_raw = rgb & 0xff;
>>>>>>>>>>>>> +    u32 max_raw, red, green, blue;
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    max_raw = max(red_raw, green_raw);
>>>>>>>>>>>>> +    if (blue_raw > max_raw)
>>>>>>>>>>>>> +        max_raw = blue_raw;
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    if (!max_raw) {
>>>>>>>>>>>>> +        cdev->brightness = 0;
>>>>>>>>>>>>> +        cdev->rgb_val = 0;
>>>>>>>>>>>>> +        return;
>>>>>>>>>>>>> +    }
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    red = DIV_ROUND_CLOSEST(red_raw * LED_FULL, max_raw);
>>>>>>>>>>>>> +    green = DIV_ROUND_CLOSEST(green_raw * LED_FULL, max_raw);
>>>>>>>>>>>>> +    blue = DIV_ROUND_CLOSEST(blue_raw * LED_FULL, max_raw);
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    cdev->brightness = max_raw;
>>>>>>>>>>>>> +    cdev->rgb_val = (red << 16) + (green << 8) + blue;
>>>>>>>>>>>>> +}
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> I think that we shouldn't impose specific way of calculating brightness
>>>>>>>>>>>> depending on the rgb value set. We should just pass value from
>>>>>>>>>>>> userspace
>>>>>>>>>>>> to the driver.
>>>>>>>>>>>>
>>>>>>>>>>> Right, setting brightness from userspace is no problem.
>>>>>>>>>>> But how about led_update_brightness? It's supposed to update the
>>>>>>>>>>> brightness
>>>>>>>>>>> value in led_cdev with the actual value. And for a RGB LED we have only
>>>>>>>>>>> the RGB values, so we need to calculate the brightness based on RGB
>>>>>>>>>>> values.
>>>>>>>>>>> Or do you see a better way?
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> I thought that you had some device using both brightness and rgb
>>>>>>>>>> components settings (no idea if this could be sane in any way).
>>>>>>>>>> If there are only three color components, then why not just redefine
>>>>>>>>>> brightness to store three components in case of the LEDs with
>>>>>>>>>> LED_DEV_CAP_RGB flags set?
>>>>>>>>>>
>>>>>>>>> My devices just have the three color components (normal 8 bits per color).
>>>>>>>>> Even in the new RGB mode I don't want to break the current
>>>>>>>>> brightness-based API
>>>>>>>>> but extend it with RGB functionality. Therefore I think it's best to store
>>>>>>>>> brightness and color separately.
>>>>>>>>> Just one argument: If we store the color components only then we'll
>>>>>>>>> lose the color information if the brightness is set to 0.
>>>>>>>>> And I would like to support e.g. software blink in whatever color.
>>>>>>>>
>>>>>>>>
>>>>>>>> Currently blinking works properly and brightness value isn't being lost.
>>>>>>>> We store it in the led_cdev->blink_brightness property. Could you
>>>>>>>> present exact use case you'd like to support and which is not feasible
>>>>>>>> with current LED core design?
>>>>>>>>
>>>>>>> I didn't have a closer look on how soft blinking works and you're right,
>>>>>>> this was a bad example.
>>>>>>> It's not about that something is wrong with the current LED core design
>>>>>>> but that IMHO storing just the raw RGB values wouldn't be a good idea
>>>>>>> and we should store brightness and color separately.
>>>>>>>
>>>>>>> So let's take another example:
>>>>>>> I set a color via sysfs and a trigger is controling the LED. Once the LED
>>>>>>> brightness is set to LED_OFF by the trigger and e.g. a sysfs read triggers
>>>>>>> an update the stored RGB value is 0,0,0.
>>>>>>> If the LED is switched on again, then which color to choose?
>>>>>>
>>>>>> The one stored in blink_brightness. I don't get how changing the
>>>>>> interpretation of brightness value can affect anything here.
>>>>>>
>>>>> But blink_brightness is used in case of soft blink only.
>>>>
>>>> In case of hardware blinking it is driver's responsibility to report
>>>> current brightness while blinking is on. It is hardware specific whether
>>>> it allows to read current LED state during blinking. Nevertheless
>>>> I don't see where is the problem here either.
>>>>
>>>>> If a trigger or userspace sets the brightness to zero then blink_brightness
>>>>> isn't used.
>>>>
>>>> Setting brightness to 0 disables trigger. Excerpt from leds-class.txt:
>>>>
>>>> "However, if you set the brightness value to LED_OFF it will
>>>> also disable the timer trigger."
>>>>
>>>> Now I see that documentation is inexact here. The paragraph says
>>>> about triggers, using timer trigger as an example. This trigger
>>>> is specific because of the software fallback implemented in the core.
>>>>
>>>> Setting brightness to LED_OFF disables any trigger only when set from
>>>> sysfs (in drivers/leds/led-class.c brightness_store calls
>>>> led_trigger_remove if passed brightness is LED_OFF).
>>>>
>>>> However, when setting brightness to LED_OFF directly through LED API,
>>>> and not through sysfs, only blink_timer is being disabled, but trigger
>>>> isn't being removed. Probably we'd have to remove trigger
>>>> from set_brightness_delayed(), in case LED_BLINK_DISABLE is set,
>>>> to make implementation in line with the documentation.
>>>>
>>> Sorry, I'm afraid we lost track of the original subject.
>>> At least I'm a little lost ..
>>> My understanding is that this discussion is about whether:
>>> - use current brightness member of led_classdev to store brightness and color
>>>     (change semantics of brightness to hold a <00000000><RRRRRRRR><GGGGGGGG><BBBBBBBB> value) or
>>> - store brightness and color separately (introduce a new member for the color)
>>>
>>> Is this also your understanding? Or are you focussing on a different aspect
>>> and I missed something?
>>
>> Yes it is. I intended to explain that setting brightness to 0 is
>> supposed to turn the trigger off. In effect the brightness information
>> is not required afterwards because trigger is disabled.
>>
>> During the analysis I realized about little discrepancy between the documentation and the implementation and proposed potential fix.
>>
>> I analyzed this basing on the current interpretation of
>> brightness. I think we need to focus on your following requirement:
>>
>> "And I would like to support e.g. software blink in whatever color"
>>
>> Could you provide more details?
>>
> Basically I want color and brightness to be independent.
>
> One example: If a trigger is switching a LED on and off, then I want to be able to change the color
> from userspace (even if the LED is off in that moment) w/o affecting the trigger operation.

It is possible even now - brightness can be changed during blinking, but
it is applied from the next transition to "on" state.

> Or another one: If the brightness is changed from 255 to 1 and back to 255 then we'd partially lose
> the color information if color and brightness are stored together.
> Partially because we'd not lose it if e.g. pure blue is set.
> But if the RGB value was let's say (255, 240, 17) before then we'd not be able to restore this value.

It would suffice to implement dedicated trigger for this. IMO it would
be an over engineering, though. We can support what you want by
exposing each color as a separate LED class device and adding a means
for LED class device synchronization, I was proposing in the beginning.

It would be convenient because it would allow to avoid code duplication
in the LED core. I think that gathering all the colors in the single
functionality could be a task for the user space.

-- 
Best Regards,
Jacek Anaszewski

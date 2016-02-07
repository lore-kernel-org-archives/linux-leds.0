From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] led: core: RfC - add RGB LED handling to the core
Date: Sun, 7 Feb 2016 01:18:18 +0100
Message-ID: <56B68D4A.9010200@gmail.com>
References: <5692BEB6.6040807@gmail.com> <56978FB0.4080700@samsung.com>
 <5699539F.5030102@gmail.com> <569C1655.1030700@gmail.com>
 <56A4D3ED.1000002@gmail.com> <56A5DFBC.2020509@samsung.com>
 <CAFSsGVshPt=-2z=+GFP+H6JNUwE8eh+ANib7jue22Mxy41x_KQ@mail.gmail.com>
 <56A5FE82.4030103@samsung.com> <56A672EF.8080107@gmail.com>
 <56A73E68.4040804@samsung.com> <56A7D248.1020307@gmail.com>
 <56A87F7B.2030806@samsung.com> <56AB0E10.7060405@gmail.com>
 <56AB21A7.5070505@samsung.com> <56AEFEAE.20407@gmail.com>
 <56AF16B2.80708@samsung.com> <56AFD108.9060902@gmail.com>
 <56B06FB8.1010507@samsung.com> <56B1A164.7060109@gmail.com>
 <56B1BA2A.3000207@samsung.com> <56B27A59.6040501@gmail.com>
 <56B30C20.2030204@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:35008 "EHLO
	mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750948AbcBGAU1 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 6 Feb 2016 19:20:27 -0500
Received: by mail-wm0-f50.google.com with SMTP id r129so71186187wmr.0
        for <linux-leds@vger.kernel.org>; Sat, 06 Feb 2016 16:20:26 -0800 (PST)
In-Reply-To: <56B30C20.2030204@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org

Am 04.02.2016 um 09:30 schrieb Jacek Anaszewski:
> On 02/03/2016 11:08 PM, Heiner Kallweit wrote:
>> Am 03.02.2016 um 09:28 schrieb Jacek Anaszewski:
>>> On 02/03/2016 07:42 AM, Heiner Kallweit wrote:
>>>> Am 02.02.2016 um 09:58 schrieb Jacek Anaszewski:
>>>>> On 02/01/2016 10:41 PM, Heiner Kallweit wrote:
>>>>>> Am 01.02.2016 um 09:26 schrieb Jacek Anaszewski:
>>>>>>> On 02/01/2016 07:43 AM, Heiner Kallweit wrote:
>>>>>>>> Am 29.01.2016 um 09:24 schrieb Jacek Anaszewski:
>>>>>>>>> On 01/29/2016 08:00 AM, Heiner Kallweit wrote:
>>>>>>>>>> Am 27.01.2016 um 09:27 schrieb Jacek Anaszewski:
>>>>>>>>>>> On 01/26/2016 09:08 PM, Heiner Kallweit wrote:
>>>>>>>>>>>> Am 26.01.2016 um 10:37 schrieb Jacek Anaszewski:
>>>>>>>>>>>>> On 01/25/2016 08:09 PM, Heiner Kallweit wrote:
>>>>>>>>>>>>>> Am 25.01.2016 um 11:52 schrieb Jacek Anaszewski:
>>>>>>>>>>>>>>> On 01/25/2016 10:51 AM, Heiner Kallweit wrote:
>>>>>>>>>>>>>>>> On Mon, Jan 25, 2016 at 9:41 AM, Jacek Anaszewski
>>>>>>>>>>>>>>>> <j.anaszewski@samsung.com> wrote:
>>>>>>>>>>>>>>>>> Hi Heiner,
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> On 01/24/2016 02:38 PM, Heiner Kallweit wrote:
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Am 17.01.2016 um 23:31 schrieb Jacek Anaszewski:
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> On 01/15/2016 09:16 PM, Heiner Kallweit wrote:
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> Am 14.01.2016 um 13:08 schrieb Jacek Anaszewski:
>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>> On 01/10/2016 09:27 PM, Heiner Kallweit wrote:
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> When playing with a ThingM Blink(1) USB RGB LED device I found that
>>>>>>>>>>>>>>>>>>>>>> there
>>>>>>>>>>>>>>>>>>>>>> are few drivers for RGB LED's spread across the kernel and each one
>>>>>>>>>>>>>>>>>>>>>> implements the RGB functionality in its own way.
>>>>>>>>>>>>>>>>>>>>>> Some examples:
>>>>>>>>>>>>>>>>>>>>>> - drivers/hid/hid-thingm.c
>>>>>>>>>>>>>>>>>>>>>> - drivers/usb/misc/usbled.c
>>>>>>>>>>>>>>>>>>>>>> - drivers/leds/leds-bd2802.c
>>>>>>>>>>>>>>>>>>>>>> - drivers/leds/leds-blinkm.c
>>>>>>>>>>>>>>>>>>>>>> ...
>>>>>>>>>>>>>>>>>>>>>> IMHO it would make sense to add generic RGB functionality to the LED
>>>>>>>>>>>>>>>>>>>>>> core.
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> Things I didn't like too much in other driver implementations:
>>>>>>>>>>>>>>>>>>>>>> - one led_classdev per color or at least
>>>>>>>>>>>>>>>>>>>>>> - one sysfs attribute per color
>>>>>>>>>>>>>>>>>>>>>> Colors are not really independent therefore I'd prefer one
>>>>>>>>>>>>>>>>>>>>>> led_classdev
>>>>>>>>>>>>>>>>>>>>>> per RGB LED. Also userspace should be able to change the color with
>>>>>>>>>>>>>>>>>>>>>> one
>>>>>>>>>>>>>>>>>>>>>> call -> therefore only one sysfs attribute for the RGB values.
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> Also the current brightness-related functionality should not be
>>>>>>>>>>>>>>>>>>>>>> effected
>>>>>>>>>>>>>>>>>>>>>> by the RGB extension.
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> This patch is intended to demonstrate the idea of the extension. Most
>>>>>>>>>>>>>>>>>>>>>> likely
>>>>>>>>>>>>>>>>>>>>>> it's not ready yet for submission.
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> Main idea is to base the effective RGB value on a combination of
>>>>>>>>>>>>>>>>>>>>>> brightness
>>>>>>>>>>>>>>>>>>>>>> and a scaled-to-max RGB value.
>>>>>>>>>>>>>>>>>>>>>> The RGB-related callbacks are basically the same as for brightness.
>>>>>>>>>>>>>>>>>>>>>> RGB functionally can be switched on with a new flag in the
>>>>>>>>>>>>>>>>>>>>>> led_classdev.flags
>>>>>>>>>>>>>>>>>>>>>> bitmap.
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> Experimentally I changed the thingm driver to use this extension and
>>>>>>>>>>>>>>>>>>>>>> it works
>>>>>>>>>>>>>>>>>>>>>> quite well. As one result the driver could be very much simplified.
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> Any feedback is appreciated.
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>>>>>>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>>>>>>>>             drivers/leds/led-class.c |  62 +++++++++++++++++++++++++++
>>>>>>>>>>>>>>>>>>>>>>             drivers/leds/led-core.c  | 106
>>>>>>>>>>>>>>>>>>>>>> +++++++++++++++++++++++++++++++++++++++++++++++
>>>>>>>>>>>>>>>>>>>>>>             drivers/leds/leds.h      |  12 ++++++
>>>>>>>>>>>>>>>>>>>>>>             include/linux/leds.h     |  13 ++++++
>>>>>>>>>>>>>>>>>>>>>>             4 files changed, 193 insertions(+)
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> [...]
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> +static void led_set_rgb_raw(struct led_classdev *cdev, u32 rgb)
>>>>>>>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>>>>>>>> +    u32 red_raw = (rgb >> 16) & 0xff;
>>>>>>>>>>>>>>>>>>>>>> +    u32 green_raw = (rgb >> 8) & 0xff;
>>>>>>>>>>>>>>>>>>>>>> +    u32 blue_raw = rgb & 0xff;
>>>>>>>>>>>>>>>>>>>>>> +    u32 max_raw, red, green, blue;
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +    max_raw = max(red_raw, green_raw);
>>>>>>>>>>>>>>>>>>>>>> +    if (blue_raw > max_raw)
>>>>>>>>>>>>>>>>>>>>>> +        max_raw = blue_raw;
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +    if (!max_raw) {
>>>>>>>>>>>>>>>>>>>>>> +        cdev->brightness = 0;
>>>>>>>>>>>>>>>>>>>>>> +        cdev->rgb_val = 0;
>>>>>>>>>>>>>>>>>>>>>> +        return;
>>>>>>>>>>>>>>>>>>>>>> +    }
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +    red = DIV_ROUND_CLOSEST(red_raw * LED_FULL, max_raw);
>>>>>>>>>>>>>>>>>>>>>> +    green = DIV_ROUND_CLOSEST(green_raw * LED_FULL, max_raw);
>>>>>>>>>>>>>>>>>>>>>> +    blue = DIV_ROUND_CLOSEST(blue_raw * LED_FULL, max_raw);
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +    cdev->brightness = max_raw;
>>>>>>>>>>>>>>>>>>>>>> +    cdev->rgb_val = (red << 16) + (green << 8) + blue;
>>>>>>>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>> I think that we shouldn't impose specific way of calculating brightness
>>>>>>>>>>>>>>>>>>>>> depending on the rgb value set. We should just pass value from
>>>>>>>>>>>>>>>>>>>>> userspace
>>>>>>>>>>>>>>>>>>>>> to the driver.
>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> Right, setting brightness from userspace is no problem.
>>>>>>>>>>>>>>>>>>>> But how about led_update_brightness? It's supposed to update the
>>>>>>>>>>>>>>>>>>>> brightness
>>>>>>>>>>>>>>>>>>>> value in led_cdev with the actual value. And for a RGB LED we have only
>>>>>>>>>>>>>>>>>>>> the RGB values, so we need to calculate the brightness based on RGB
>>>>>>>>>>>>>>>>>>>> values.
>>>>>>>>>>>>>>>>>>>> Or do you see a better way?
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> I thought that you had some device using both brightness and rgb
>>>>>>>>>>>>>>>>>>> components settings (no idea if this could be sane in any way).
>>>>>>>>>>>>>>>>>>> If there are only three color components, then why not just redefine
>>>>>>>>>>>>>>>>>>> brightness to store three components in case of the LEDs with
>>>>>>>>>>>>>>>>>>> LED_DEV_CAP_RGB flags set?
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> My devices just have the three color components (normal 8 bits per color).
>>>>>>>>>>>>>>>>>> Even in the new RGB mode I don't want to break the current
>>>>>>>>>>>>>>>>>> brightness-based API
>>>>>>>>>>>>>>>>>> but extend it with RGB functionality. Therefore I think it's best to store
>>>>>>>>>>>>>>>>>> brightness and color separately.
>>>>>>>>>>>>>>>>>> Just one argument: If we store the color components only then we'll
>>>>>>>>>>>>>>>>>> lose the color information if the brightness is set to 0.
>>>>>>>>>>>>>>>>>> And I would like to support e.g. software blink in whatever color.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> Currently blinking works properly and brightness value isn't being lost.
>>>>>>>>>>>>>>>>> We store it in the led_cdev->blink_brightness property. Could you
>>>>>>>>>>>>>>>>> present exact use case you'd like to support and which is not feasible
>>>>>>>>>>>>>>>>> with current LED core design?
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> I didn't have a closer look on how soft blinking works and you're right,
>>>>>>>>>>>>>>>> this was a bad example.
>>>>>>>>>>>>>>>> It's not about that something is wrong with the current LED core design
>>>>>>>>>>>>>>>> but that IMHO storing just the raw RGB values wouldn't be a good idea
>>>>>>>>>>>>>>>> and we should store brightness and color separately.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> So let's take another example:
>>>>>>>>>>>>>>>> I set a color via sysfs and a trigger is controling the LED. Once the LED
>>>>>>>>>>>>>>>> brightness is set to LED_OFF by the trigger and e.g. a sysfs read triggers
>>>>>>>>>>>>>>>> an update the stored RGB value is 0,0,0.
>>>>>>>>>>>>>>>> If the LED is switched on again, then which color to choose?
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> The one stored in blink_brightness. I don't get how changing the
>>>>>>>>>>>>>>> interpretation of brightness value can affect anything here.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>> But blink_brightness is used in case of soft blink only.
>>>>>>>>>>>>>
>>>>>>>>>>>>> In case of hardware blinking it is driver's responsibility to report
>>>>>>>>>>>>> current brightness while blinking is on. It is hardware specific whether
>>>>>>>>>>>>> it allows to read current LED state during blinking. Nevertheless
>>>>>>>>>>>>> I don't see where is the problem here either.
>>>>>>>>>>>>>
>>>>>>>>>>>>>> If a trigger or userspace sets the brightness to zero then blink_brightness
>>>>>>>>>>>>>> isn't used.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Setting brightness to 0 disables trigger. Excerpt from leds-class.txt:
>>>>>>>>>>>>>
>>>>>>>>>>>>> "However, if you set the brightness value to LED_OFF it will
>>>>>>>>>>>>> also disable the timer trigger."
>>>>>>>>>>>>>
>>>>>>>>>>>>> Now I see that documentation is inexact here. The paragraph says
>>>>>>>>>>>>> about triggers, using timer trigger as an example. This trigger
>>>>>>>>>>>>> is specific because of the software fallback implemented in the core.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Setting brightness to LED_OFF disables any trigger only when set from
>>>>>>>>>>>>> sysfs (in drivers/leds/led-class.c brightness_store calls
>>>>>>>>>>>>> led_trigger_remove if passed brightness is LED_OFF).
>>>>>>>>>>>>>
>>>>>>>>>>>>> However, when setting brightness to LED_OFF directly through LED API,
>>>>>>>>>>>>> and not through sysfs, only blink_timer is being disabled, but trigger
>>>>>>>>>>>>> isn't being removed. Probably we'd have to remove trigger
>>>>>>>>>>>>> from set_brightness_delayed(), in case LED_BLINK_DISABLE is set,
>>>>>>>>>>>>> to make implementation in line with the documentation.
>>>>>>>>>>>>>
>>>>>>>>>>>> Sorry, I'm afraid we lost track of the original subject.
>>>>>>>>>>>> At least I'm a little lost ..
>>>>>>>>>>>> My understanding is that this discussion is about whether:
>>>>>>>>>>>> - use current brightness member of led_classdev to store brightness and color
>>>>>>>>>>>>         (change semantics of brightness to hold a <00000000><RRRRRRRR><GGGGGGGG><BBBBBBBB> value) or
>>>>>>>>>>>> - store brightness and color separately (introduce a new member for the color)
>>>>>>>>>>>>
>>>>>>>>>>>> Is this also your understanding? Or are you focussing on a different aspect
>>>>>>>>>>>> and I missed something?
>>>>>>>>>>>
>>>>>>>>>>> Yes it is. I intended to explain that setting brightness to 0 is
>>>>>>>>>>> supposed to turn the trigger off. In effect the brightness information
>>>>>>>>>>> is not required afterwards because trigger is disabled.
>>>>>>>>>>>
>>>>>>>>>>> During the analysis I realized about little discrepancy between the documentation and the implementation and proposed potential fix.
>>>>>>>>>>>
>>>>>>>>>>> I analyzed this basing on the current interpretation of
>>>>>>>>>>> brightness. I think we need to focus on your following requirement:
>>>>>>>>>>>
>>>>>>>>>>> "And I would like to support e.g. software blink in whatever color"
>>>>>>>>>>>
>>>>>>>>>>> Could you provide more details?
>>>>>>>>>>>
>>>>>>>>>> Basically I want color and brightness to be independent.
>>>>>>>>>>
>>>>>>>>>> One example: If a trigger is switching a LED on and off, then I want to be able to change the color
>>>>>>>>>> from userspace (even if the LED is off in that moment) w/o affecting the trigger operation.
>>>>>>>>>
>>>>>>>>> It is possible even now - brightness can be changed during blinking, but
>>>>>>>>> it is applied from the next transition to "on" state.
>>>>>>>>>
>>>>>>>>>> Or another one: If the brightness is changed from 255 to 1 and back to 255 then we'd partially lose
>>>>>>>>>> the color information if color and brightness are stored together.
>>>>>>>>>> Partially because we'd not lose it if e.g. pure blue is set.
>>>>>>>>>> But if the RGB value was let's say (255, 240, 17) before then we'd not be able to restore this value.
>>>>>>>>>
>>>>>>>>> It would suffice to implement dedicated trigger for this. IMO it would
>>>>>>>>> be an over engineering, though. We can support what you want by
>>>>>>>>> exposing each color as a separate LED class device and adding a means
>>>>>>>>> for LED class device synchronization, I was proposing in the beginning.
>>>>>>>>>
>>>>>>>>> It would be convenient because it would allow to avoid code duplication
>>>>>>>>> in the LED core. I think that gathering all the colors in the single
>>>>>>>>> functionality could be a task for the user space.
>>>>>>>>>
>>>>>>>> By chance I had to deal with HSV color scheme in another project and
>>>>>>>> using this color scheme core-internally for color LED's might help us to
>>>>>>>> facilitate backwards compatibility and reduce the needed changes to the core.
>>>>>>>> It would also allow to easily solve the question we're discussing here.
>>>>>>>>
>>>>>>>> The brightness is part of the HSV model anyway so we would just have to
>>>>>>>> add hue / saturation. Conversion to / from RGB would be done on demand.
>>>>>>>> I have a small prototype that needs much less changes to the core logic.
>>>>>>>> I'll come up with a re-worked proposal for handling color LED's.
>>>>>>>
>>>>>>> At first let's consider if LED synchronization doesn't fit your needs.
>>>>>>> I am very much in favour of this solution since it would address also
>>>>>>> other use cases. On the other hand I am opposed to adding any mechanisms
>>>>>>> for color scheme conversion to the LED core since it can be covered by
>>>>>>> the user space.
>>>>>>>
>>>>>> LED synchronization would be an option. So far I've seen it being implemented
>>>>>> directly in drivers like hid-thingm.
>>>>>> Where I see potential issues with LED synchronization:
>>>>>> - It changes the semantics of the entries /sys/class/leds from physical LED's
>>>>>>      to logical LED's. The grouping of LED's might be recognizable by the name.
>>>>>>      However a sub-structure like /sys/class/leds/<group>/<member> might be
>>>>>>      desirable.
>>>>>
>>>>> Not necessarily. Actually similar functionality was present in the
>>>>> mainline for a short time, but was reverted [1], due to the objections
>>>>> raised in the discussion [2].
>>>>>
>>>>> The idea to follow is to have a sysfs attribute which would indicate
>>>>> the other LED class device to synchronize with. This way it is possible
>>>>> to define a chain of LEDs to synchronize and whole chain could be driven
>>>>> with any of chain's elements. On the led-class side we would need only
>>>>> two additional sysfs attributes - one for defining the LED class device
>>>>> to synchronize with and the other one for listing LED class devices
>>>>> available for synchronization.
>>>>>
>>>>> The rest of synchronization job will be done by the LED class driver,
>>>>> basing on the sysfs settings of the LED class devices it exposes per
>>>>> sub-LED.
>>>>>
>>>>>> - Users of the LED core (userspace + kernel triggers) may need more than one
>>>>>>      call to set a LED to a requested state.
>>>>>
>>>>> Not necessarily as stated above.
>>>>>
>>>> In the case of RGB LED's the brightness can't be synchronized and the
>>>> caller needs three calls to set the R/G/B values.
>>>
>>> Right. But this is not a big problem I think. It is just a part of
>>> user space work that needs to be done to configure the device.
>>
>> Fair enough for userspace.
>> When working on the RGB stuff one of my ideas was to support trigger actions
>> for color LEDs in the future.
>> Either to signal whatever multi-state information or to visualize a value
>> in a range (e.g. some temperature monitoring driver might want to map a
>> temperature into the color range from green to red).
>>
>> And a trigger most likely has to set a color with one call.
>>
>>> In case of V4L2 media controllers we also have to configure connections
>>> between platform sub-devices.
>>>
>>> One thing could be improved - we'd have to add a reservation to the
>>> brightness attribute semantics. saying that any transition of
>>> brightness attribute value from 0 to non-zero turns the LED on only
>>> if it isn't synchronized with any other LED class device, i.e. it is
>>> a master LED or a single LED. It would allow to avoid the risk of
>>> noticeable delays between activation of a number of synchronized LEDs.
>>>
>>> Effectively, the whole group would have to be controlled by a single
>>> master sub-LED and all group members would have to synchronize with
>>> the master.
>>>
>>>>>> What would need to be synchronized at a first glance:
>>>>>> - assigning triggers to a LED
>>>>>> - brightness_set/_get
>>>>>> - blinking
>>>>>
>>>>> Any change of a single LED chain element state would propagate to all
>>>>> other elements (LED class devices).
>>>
>>> In view of the above let's forget about this "chain" approach.
>>>
>>>>>>
>>>>>> What "other use cases" are you thinking of?
>>>>>
>>>>> E.g. synchronous blinking of a number of sub-LEDs.
>>>>>
>>>> Do you mean that just the blinking frequency is synchronized in case the respective
>>>> LED is switched on and that it still should be possible to switch on / off LEDs
>>>> individually?
>>>
>>> This is how I see it:
>>> 1. LED1 selects LED4 as a master LED
>>> 2. LED1 sets brightness to 10
>>> 3. LED2 selects LED4 as a master LED
>>> 4. LED2 sets brightness to 150
>>> 5. LED3 selects LED4 as a master LED
>>> 6. LED3 sets brightness to 255
>>> 7. LED4 sets brightness to 200
>>>     //which turns LED1, LED2, LED3 and LED4 on,
>>>     //each of them with their own brightness
>>> 8. LED4 enables timer triger
>>>     //LED1, LED2, LED3 and LED4 blink simultaneously
>>>     //of course some devices may introduce little delays
>>>     //due to the I2C transmission delays, it depends on
>>>     //the particular device register design
>>> 9. LED2 sets brightness to 100
>>>     //LED2 brightness is changed upon next transition
>>>     //to "LED on" state
>>> 10. LED2 sets brightness to 0
>>>      //LED2 is turned off and removed from the group
>>> 11. LED4 sets brightness to 0
>>>      //LED1, LED3 and LED4 are turned off
>>>
>> I understand the idea, still it's not clear to me what benefit would justify
>> the effort to implement such a feature.
>> What kind of practical use case do you imagine (maybe except synchronuous blinking) ?
> 
> I've just realized that the approach I proposed is based on wrong
> assumptions. It is not guaranteed that the instructions issued from
> user space will be executed in the same order by kernel, since they are
> different processes.
> 
> It seems that we could try your HSV approach. Nonetheless, I'd prefer
> to implement it as a wrapper of LED class, similarly to
> led-class-flash.c. It could be named led-class-hsv.c.
> 
I'll submit a proposal for the HSV extension. I thought about making it
a wrapper but that doesn't really fit. Instead of adding code to the existing
one I have to touch few parts in the existing core.
Appreciate your comments onec I send the HSV proposal.

Upfront I'll send a patch for adding helpers for brightness_set(_blocking).
This makes code more readable anyway and allows to keep the HSV extension simpler.

> 
>> For sync blinking I could imagine a less flexible, but maybe simpler solution:
>> Set up a timer (independent of a led_classdev) that controls for every led_classdev
>> that wants to use this feature the on/off blink transitions.
>> After a brief look at ledtrig-timer.c this trigger seems to provide a similar
>> (or even equal) functionality already.
> 
> Timer trigger uses either hardware blinking feature provided by a device
> or software blinking based on blink_timer, where each LED class device
> has a separate instance thereof.
> 
I see, thanks for the explanation.

>> Drawback is that all LED's share the same blink frequency (globally, not only
>> per LED group). But that may be acceptable or even desirable.
>>
>>>
>>>> If not than what's the benefit of x LED's doing something synchronously?
>>>> The information I get from it is the same as from one LED.
>>>>
>>>> As the original synchronization idea was intended for the flash functionality,
>>>> I assume it could primarily make sense there.
>>>> (But I have to admit that I have no real idea of the flash functionality.)
>>>>
>>>>>>> Drivers should expose device capabilities and not impose the policy on
>>>>>>> how those capabilities can be used. If with slight modifications we
>>>>>>> could stick to this rule, we should go in this direction.
>>>>>>>
>>>>>> With regard to my HSV proposal I agree that having HSV/RGB conversion in the
>>>>>> kernel is not necessarily desirable. HSV just fits very well into the current
>>>>>> implementation of the LED core.
>>>>>> Color LED's might have different native color schemes (although so far I know
>>>>>> no color LED using another than RGB). If the LED core wants to provide a
>>>>>> unified interface to its users some transformation between core color scheme
>>>>>> and native color scheme (as exposed by the driver) might be needed eventually?
>>>>>
>>>>> IMO the synchronization mechanism design I described above is much
>>>>> neater. The design of sysfs synchronization API seems to be the only
>>>>> vital problem here. To be more precise the problem is: how to represent,
>>>>> in an unambiguous and easy to parse way, the LED class devices available
>>>>> for synchronization. The list of space separated LED class device
>>>>> names is not an option since we cannot guarantee names without spaces.
>>>>> The design requiring more complicated parsing was refused [2].
>>>>>
>>>>> As a last resort we'd probably need to consult linux-api guys.
>>>>>
>>>>>
>>>>> [1] https://lkml.org/lkml/2015/3/4/952
>>>>> [2] http://www.spinics.net/lists/linux-leds/msg02995.html
>>>>>
>>>> Thanks for the links. Let me try to summarize some requirements + some inquiries:
>>>> - By synchronizing LEDs all main properties are synchronized
>>>>     - Should it be configurable which properties should be synchronized?
>>>>       E.g. in case of RGB LED's the brightness should not be synchronized, however
>>>>       there might be use cases where synchronizing brightness makes sense.
>>>
>>> I think that synchronization should apply to simultaneous
>>> activation/deactivation and triggers.
>>>
>>>> - Should defining and changing groups of synchronized LEDs be possible dynamically?
>>>>     Based on the history of this synchronization proposal I guess so.
>>>>     Alternatively it could be possible only when registering the led_classdev's,
>>>>     e.g. by passing a reference to a "master LED" which acts as group id.
>>>>     (But this might restrict the mechanism to LED's created by the same driver instance.)
>>>>     Or both methods ..
>>>
>>> Reliable synchronization is possible only for the sub-LEDs of the same
>>> device. All LED class devices exposed by an instance of a driver should
>>> register with the predefined scope of the LED class devices available
>>> for synchronization, the devices exposed by this driver.
>>>
>>
>>
>>
> 
> 

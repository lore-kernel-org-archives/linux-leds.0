From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: Brightness control irrespective of blink state.
Date: Wed, 11 May 2016 11:41:56 +0200
Message-ID: <5732FE64.6000907@samsung.com>
References: <1461881020-13964-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1461881020-13964-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <57230B26.9010300@samsung.com> <572C5DEE.3070307@samsung.com>
 <CAAEAJfD_U1Z=wXQbK+DNdhZj5KEDkd3sK8mbBLNOvtKbZd1zYg@mail.gmail.com>
 <572CE1B0.8040001@daqri.com> <572CE715.6060504@gmail.com>
 <57309039.3060305@daqri.com> <5730A293.9050209@samsung.com>
 <5731ABB6.10607@daqri.com> <5731E194.1010004@samsung.com>
 <57321299.8090603@daqri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:52637 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932081AbcEKJmB (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 11 May 2016 05:42:01 -0400
In-reply-to: <57321299.8090603@daqri.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Tony Makkiel <tony.makkiel@daqri.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Pavel Machek <pavel@ucw.cz>, lkml <linux-kernel@vger.kernel.org>

On 05/10/2016 06:55 PM, Tony Makkiel wrote:
>
>
> On 10/05/16 14:26, Jacek Anaszewski wrote:
>> On 05/10/2016 11:36 AM, Tony Makkiel wrote:
>>>
>>>
>>> On 09/05/16 15:45, Jacek Anaszewski wrote:
>>>> Hi Tony,
>>>>
>>>> On 05/09/2016 03:27 PM, Tony Makkiel wrote:
>>>>> Hi Jacek,
>>>>>      Thank you for getting back. I updated my kernel to 4.5 and have
>>>>> the
>>>>> updated "led_set_brightness" now.
>>>>>
>>>>> It sets
>>>>>          led_cdev->flags |= LED_BLINK_BRIGHTNESS_CHANGE;
>>>>>          led_cdev->blink_brightness = brightness;
>>>>>
>>>>>      The new implementation requires hardware specific drivers to poll
>>>>> for flag change. Shouldn't the led-core driver be calling the hardware
>>>>> specific brightness_set (led_set_brightness_nosleep) irrespective of
>>>>> the
>>>>> blink settings?
>>>>>
>>>>> Unfortunately, it place additional requirement on drivers, to
>>>>> implement
>>>>> a polling mechanism which won't be needed otherwise. Why are the
>>>>> brightness calls dependent on blink settings?
>>>>
>>>> If your question is still:
>>>>
>>>> "Is there a reason for rejecting brightness change requests when
>>>> either of the blink_delays are set?"
>>>>
>>>> then the answer is: yes, brightness setting is deferred until
>>>> the next timer tick to avoid avoid problems in case we are called
>>>> from hard irq context. It should work fine for software blinking.
>>>
>>>
>>> Sorry, was focused debugging 'hardware accelerated blink' on the driver
>>> I am working on, I missed the software blinking implementation.
>>>
>>>>
>>>> Nonetheless, your question, made it obvious that we have a problem
>>>> here in case of hardware accelerated blinking, i.e. drivers that
>>>> implement blink_set op. Is this your use case?
>>>>
>>>
>>> Yes, the brightness requests from user space
>>> (/sys/class/leds/*/brightness) does not get passed to hardware specific
>>> driver via the blink_set implemented, unless led_cdev->flags is polled.
>>>
>>>> Anyway, I've noticed a discrepancy between the LED core code and
>>>> both Documentation/leds/leds-class.txt and comment over blink_set() op
>>>> in include/linux/leds.h, which say that blinking is deactivated
>>>> upon setting the brightness again. Many drivers apply this rule.
>>>>
>>>> In effect, LED_BLINK_BRIGHTNESS_CHANGE will have to be removed,
>>>> and your question will be groundless, as changing the blink
>>>> brightness should be impossible by design.
>>>>
>>> In my opinion, disabling blink, when brightness change requested doesn't
>>> sound like the right thing to do. There could be cases in which the
>>> brightness of the blinking LED needs to be changed.
>>
>> It could be accomplished with following sequence:
>>
>> $ echo LED_FULL > brightness //set brightness
>> $ echo "timer" > trigger     //enable blinking with brightness=LED_FULL
>> $ echo 1 > brightness        //stop blinking and set brightness to 1
>> $ echo "timer" > trigger     //enable blinking with brightness=1
>>
>> The only drawback here would be interfered blinking rhythm while
>> resetting blink brightness. Most drivers that implement blink_set
>> op observe what documentation says and disable blinking when
>> new brightness is set. Unfortunately, led_set_brightness() after
>> modifications doesn't take into account drivers that implement
>> blink_set op. It needs to be fixed, i.e. made compatible with
>> the docs.
>>
>>> Maybe we can let the
>>> hardware driver deal with the blink request if it has implemented
>>> brightness_set? The change below seem to work.
>>>
>>>
>>> Subject: [PATCH] led-core: Use hardware blink when available
>>>
>>> At present hardware implemented brightness is not called
>>> if blink delays are set.
>>>
>>> Signed-off-by: Tony Makkiel <tony.makkiel@daqri.com>
>>> ---
>>>   drivers/leds/led-core.c | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
>>> index 19e1e60d..02dd0f6 100644
>>> --- a/drivers/leds/led-core.c
>>> +++ b/drivers/leds/led-core.c
>>> @@ -208,8 +208,10 @@ void led_set_brightness(struct led_classdev
>>> *led_cdev,
>>>       /*
>>>        * In case blinking is on delay brightness setting
>>>        * until the next timer tick.
>>> +     * Or if brightness_set is defined, use the associated
>>> implementation.
>>>        */
>>> -    if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
>>> +    if ((!led_cdev->brightness_set) &&
>>
>> s/brightness_set/blink_set/ AFAICT
>>
>> It wouldn't cover all cases as the fact that a driver implements
>> blink_set doesn't necessarily mean that hardware blinking is used
>> for current blinking parameters. There are drivers that resort to
>> using software fallback in case the LED controller device doesn't
>> support requested blink intervals.
>>
>> I'm planning on addition of a LED_BLINKING_HW flag, that would
>> be set after successful execution of blink_set op. It would allow to
>> distinguish between hardware and software blinking modes reliably.
>>
>
> Did you mean something like
>
>
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index 19e1e60d..4a8b46d 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -210,6 +210,13 @@ void led_set_brightness(struct led_classdev *led_cdev,
>           * until the next timer tick.
>           */
>          if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
> +               if (led_cdev->brightness_set)
> +                       led_set_brightness_nosleep(led_cdev, brightness);

brightness_set is always initialized, probably you meant blink_set.

> +
> +               if (led_cdev->flags & LED_BLINKING_HW) {
> +                       led_cdev->flags &= ~LED_BLINKING_HW;
> +                       return;
> +               }

The dependencies are quite versatile if we wanted to properly implement
what documentation claims. Setting brightness to any value while
blinking is on should stop blinking. It was so before the commit:

76931edd5 ('leds: fix brightness changing when software blinking is active')

The problem was that timer trigger remained active after stopping
blinking, which led us to changing the semantics on new brightness
set, rather than solving the problem with unregistered trigger.
This was also against documentation claims, which was overlooked.

I tried yesterday to deactivate trigger on brightness set
executed during blinking, but there are circular dependencies,
since led_set_brightness(led_cdev, LED_OFF) is called on deactivation.
It is also called from led_trigger_set in the trigger removal path.
Generally it seems non-trivial to enforce current documentation claims
in case of software blinking.

The easiest thing to do now would be changing the semantics, so that 
only setting brightness to LED_OFF would disable the trigger, which
in fact is true since few releases. The problem is that many drivers
that implement hardware blinking resets it on any brightness change.
We would have to left them intact, but apply a new semantics in the
LED core, that would allow for new drivers to just update hardware
blinking brightness upon updating the brightness.

If we followed this path then the LED_BLINKING_HW flag would have to
be set in led_blink_setup() after blink_set op returns 0. Thanks to
that, we could distinguish in led_set_brightness whether hardware
or software blinking is enabled. For !LED_BLINKING_HW case we would
proceed as currently, i.e. set the LED_BLINK_BRIGHTNESS_CHANGE flag
and defer brightness setting until next timer tick. For the opposite
case we wouldn't do anything and let the led_set_brightness_nosleep()
to call the appropriate brightness_set/brightness_set_blocking op.
Old drivers would proceed as currently, by disabling blinking
on brightness change, and new ones could apply new semantics by
changing brightness but leaving hardware blinking active.

I wonder if it would be safe to rely on timer_pending() instead of
introducing LED_BLINKING_HW flag...

>                  /*
>                   * If we need to disable soft blinking delegate this to
> the
>                   * work queue task to avoid problems in case we are called
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index bc1476f..f5fa566 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -48,6 +48,7 @@ struct led_classdev {
>   #define LED_BLINK_DISABLE      (1 << 21)
>   #define LED_SYSFS_DISABLE      (1 << 22)
>   #define LED_DEV_CAP_FLASH      (1 << 23)
> +#define LED_BLINKING_HW        (1 << 24)
>
>          /* Set LED brightness level */
>          /* Must not sleep, use a workqueue if needed */
>
>>
>>> +        (led_cdev->blink_delay_on || led_cdev->blink_delay_off)) {
>>>           /*
>>>            * If we need to disable soft blinking delegate this to the
>>>            * work queue task to avoid problems in case we are called
>>
>>
>
>


-- 
Best regards,
Jacek Anaszewski

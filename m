From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: Brightness control irrespective of blink state.
Date: Mon, 16 May 2016 16:23:08 +0200
Message-ID: <5739D7CC.4040205@samsung.com>
References: <1461881020-13964-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1461881020-13964-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <57230B26.9010300@samsung.com> <572C5DEE.3070307@samsung.com>
 <CAAEAJfD_U1Z=wXQbK+DNdhZj5KEDkd3sK8mbBLNOvtKbZd1zYg@mail.gmail.com>
 <572CE1B0.8040001@daqri.com> <572CE715.6060504@gmail.com>
 <57309039.3060305@daqri.com> <5730A293.9050209@samsung.com>
 <5731ABB6.10607@daqri.com> <5731E194.1010004@samsung.com>
 <57321299.8090603@daqri.com> <5732FE64.6000907@samsung.com>
 <573336D9.7040105@daqri.com> <57345A59.5010607@samsung.com>
 <5735E2BD.4070405@daqri.com> <57399129.3020602@samsung.com>
 <5739CE75.80608@daqri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <5739CE75.80608@daqri.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Makkiel <tony.makkiel@daqri.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Pavel Machek <pavel@ucw.cz>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 05/16/2016 03:43 PM, Tony Makkiel wrote:
>
>
> On 16/05/16 10:21, Jacek Anaszewski wrote:
>> Hi Tony,
>>
>> On 05/13/2016 04:20 PM, Tony Makkiel wrote:
>>>
>>>
>>> On 12/05/16 11:26, Jacek Anaszewski wrote:
>>>> On 05/11/2016 03:42 PM, Tony Makkiel wrote:
>>>>>
>>>>>
>>>>> On 11/05/16 10:41, Jacek Anaszewski wrote:
>>>>>> On 05/10/2016 06:55 PM, Tony Makkiel wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 10/05/16 14:26, Jacek Anaszewski wrote:
>>>>>>>> On 05/10/2016 11:36 AM, Tony Makkiel wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 09/05/16 15:45, Jacek Anaszewski wrote:
>>>>>>>>>> Hi Tony,
>>>>>>>>>>
>>>>>>>>>> On 05/09/2016 03:27 PM, Tony Makkiel wrote:
>>>>>>>>>>> Hi Jacek,
>>>>>>>>>>>      Thank you for getting back. I updated my kernel to 4.5 and
>>>>>>>>>>> have
>>>>>>>>>>> the
>>>>>>>>>>> updated "led_set_brightness" now.
>>>>>>>>>>>
>>>>>>>>>>> It sets
>>>>>>>>>>>          led_cdev->flags |= LED_BLINK_BRIGHTNESS_CHANGE;
>>>>>>>>>>>          led_cdev->blink_brightness = brightness;
>>>>>>>>>>>
>>>>>>>>>>>      The new implementation requires hardware specific
>>>>>>>>>>> drivers to
>>>>>>>>>>> poll
>>>>>>>>>>> for flag change. Shouldn't the led-core driver be calling the
>>>>>>>>>>> hardware
>>>>>>>>>>> specific brightness_set (led_set_brightness_nosleep)
>>>>>>>>>>> irrespective of
>>>>>>>>>>> the
>>>>>>>>>>> blink settings?
>>>>>>>>>>>
>>>>>>>>>>> Unfortunately, it place additional requirement on drivers, to
>>>>>>>>>>> implement
>>>>>>>>>>> a polling mechanism which won't be needed otherwise. Why are the
>>>>>>>>>>> brightness calls dependent on blink settings?
>>>>>>>>>>
>>>>>>>>>> If your question is still:
>>>>>>>>>>
>>>>>>>>>> "Is there a reason for rejecting brightness change requests when
>>>>>>>>>> either of the blink_delays are set?"
>>>>>>>>>>
>>>>>>>>>> then the answer is: yes, brightness setting is deferred until
>>>>>>>>>> the next timer tick to avoid avoid problems in case we are called
>>>>>>>>>> from hard irq context. It should work fine for software blinking.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Sorry, was focused debugging 'hardware accelerated blink' on the
>>>>>>>>> driver
>>>>>>>>> I am working on, I missed the software blinking implementation.
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Nonetheless, your question, made it obvious that we have a
>>>>>>>>>> problem
>>>>>>>>>> here in case of hardware accelerated blinking, i.e. drivers that
>>>>>>>>>> implement blink_set op. Is this your use case?
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Yes, the brightness requests from user space
>>>>>>>>> (/sys/class/leds/*/brightness) does not get passed to hardware
>>>>>>>>> specific
>>>>>>>>> driver via the blink_set implemented, unless led_cdev->flags is
>>>>>>>>> polled.
>>>>>>>>>
>>>>>>>>>> Anyway, I've noticed a discrepancy between the LED core code and
>>>>>>>>>> both Documentation/leds/leds-class.txt and comment over
>>>>>>>>>> blink_set() op
>>>>>>>>>> in include/linux/leds.h, which say that blinking is deactivated
>>>>>>>>>> upon setting the brightness again. Many drivers apply this rule.
>>>>>>>>>>
>>>>>>>>>> In effect, LED_BLINK_BRIGHTNESS_CHANGE will have to be removed,
>>>>>>>>>> and your question will be groundless, as changing the blink
>>>>>>>>>> brightness should be impossible by design.
>>>>>>>>>>
>>>>>>>>> In my opinion, disabling blink, when brightness change requested
>>>>>>>>> doesn't
>>>>>>>>> sound like the right thing to do. There could be cases in which
>>>>>>>>> the
>>>>>>>>> brightness of the blinking LED needs to be changed.
>>>>>>>>
>>>>>>>> It could be accomplished with following sequence:
>>>>>>>>
>>>>>>>> $ echo LED_FULL > brightness //set brightness
>>>>>>>> $ echo "timer" > trigger     //enable blinking with
>>>>>>>> brightness=LED_FULL
>>>>>>>> $ echo 1 > brightness        //stop blinking and set brightness
>>>>>>>> to 1
>>>>>>>> $ echo "timer" > trigger     //enable blinking with brightness=1
>>>>>>>>
>>>>>>>> The only drawback here would be interfered blinking rhythm while
>>>>>>>> resetting blink brightness. Most drivers that implement blink_set
>>>>>>>> op observe what documentation says and disable blinking when
>>>>>>>> new brightness is set. Unfortunately, led_set_brightness() after
>>>>>>>> modifications doesn't take into account drivers that implement
>>>>>>>> blink_set op. It needs to be fixed, i.e. made compatible with
>>>>>>>> the docs.
>>>>>>>>
>>>>>>>>> Maybe we can let the
>>>>>>>>> hardware driver deal with the blink request if it has implemented
>>>>>>>>> brightness_set? The change below seem to work.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Subject: [PATCH] led-core: Use hardware blink when available
>>>>>>>>>
>>>>>>>>> At present hardware implemented brightness is not called
>>>>>>>>> if blink delays are set.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Tony Makkiel <tony.makkiel@daqri.com>
>>>>>>>>> ---
>>>>>>>>>   drivers/leds/led-core.c | 4 +++-
>>>>>>>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
>>>>>>>>> index 19e1e60d..02dd0f6 100644
>>>>>>>>> --- a/drivers/leds/led-core.c
>>>>>>>>> +++ b/drivers/leds/led-core.c
>>>>>>>>> @@ -208,8 +208,10 @@ void led_set_brightness(struct led_classdev
>>>>>>>>> *led_cdev,
>>>>>>>>>       /*
>>>>>>>>>        * In case blinking is on delay brightness setting
>>>>>>>>>        * until the next timer tick.
>>>>>>>>> +     * Or if brightness_set is defined, use the associated
>>>>>>>>> implementation.
>>>>>>>>>        */
>>>>>>>>> -    if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
>>>>>>>>> +    if ((!led_cdev->brightness_set) &&
>>>>>>>>
>>>>>>>> s/brightness_set/blink_set/ AFAICT
>>>>>>>>
>>>>>>>> It wouldn't cover all cases as the fact that a driver implements
>>>>>>>> blink_set doesn't necessarily mean that hardware blinking is used
>>>>>>>> for current blinking parameters. There are drivers that resort to
>>>>>>>> using software fallback in case the LED controller device doesn't
>>>>>>>> support requested blink intervals.
>>>>>>>>
>>>>>>>> I'm planning on addition of a LED_BLINKING_HW flag, that would
>>>>>>>> be set after successful execution of blink_set op. It would
>>>>>>>> allow to
>>>>>>>> distinguish between hardware and software blinking modes reliably.
>>>>>>>>
>>>>>>>
>>>>>>> Did you mean something like
>>>>>>>
>>>>>>>
>>>>>>> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
>>>>>>> index 19e1e60d..4a8b46d 100644
>>>>>>> --- a/drivers/leds/led-core.c
>>>>>>> +++ b/drivers/leds/led-core.c
>>>>>>> @@ -210,6 +210,13 @@ void led_set_brightness(struct led_classdev
>>>>>>> *led_cdev,
>>>>>>>           * until the next timer tick.
>>>>>>>           */
>>>>>>>          if (led_cdev->blink_delay_on ||
>>>>>>> led_cdev->blink_delay_off) {
>>>>>>> +               if (led_cdev->brightness_set)
>>>>>>> +                       led_set_brightness_nosleep(led_cdev,
>>>>>>> brightness);
>>>>>>
>>>>>> brightness_set is always initialized, probably you meant blink_set.
>>>>>
>>>>> Your solution from your last comment below sounds better (so probably
>>>>> can skip reading this section).
>>>>>
>>>>> But no, It was not a mistake. Actually, copied from
>>>>> 'led_set_brightness_nopm' in case to protect from any drivers which
>>>>> doesn't define it. The change should follow existing architecture, and
>>>>> was hoping to work for both existing and new drivers.
>>>>
>>>> Right, brightness_set can remain uninitialized while
>>>> brightness_set_blocking is provided.
>>>>
>>>>> Existing Chip drivers:  Note, the added brightness_set is called only
>>>>> when the blink is active. The flag LED_BLINKING_HW won't be set,
>>>>> either
>>>>> because driver is not updated to include the flag, or driver wants
>>>>> software fallback to deal with it. The problems I can think of is
>>>>>
>>>>> -  the software flow will also call brightness_set later when the task
>>>>> is serviced. But that is with the same values. So shouldn't make
>>>>> difference to the user.
>>>>>
>>>>> New Drivers with brightness support while blinking:- They set
>>>>> brightness
>>>>> and the flag. They wont need the software fallback. If for any reason
>>>>> brightness couldn't be set, flag is not set and normal procedure
>>>>> applies. Again problem I see here is
>>>>>
>>>>> -    Additional responsibility on chip drivers to set the flag, if
>>>>
>>>> Ah, now I understand your approach.
>>>>
>>>>> successfully managed to set brightness while blink is active. This
>>>>> shouldn't be a problem on new drivers, as they might just set the flag
>>>>> every time brightness change is requested, irrespective of blink
>>>>> settings. If they don't set the flag, it falls back to the software
>>>>> flow
>>>>> as in existing architecture.
>>>>>
>>>>>>
>>>>>>> +
>>>>>>> +               if (led_cdev->flags & LED_BLINKING_HW) {
>>>>>>> +                       led_cdev->flags &= ~LED_BLINKING_HW;
>>>>>>> +                       return;
>>>>>>> +               }
>>>>>>
>>>>>> The dependencies are quite versatile if we wanted to properly
>>>>>> implement
>>>>>> what documentation claims. Setting brightness to any value while
>>>>>> blinking is on should stop blinking. It was so before the commit:
>>>>>>
>>>>>> 76931edd5 ('leds: fix brightness changing when software blinking is
>>>>>> active')
>>>>>>
>>>>>> The problem was that timer trigger remained active after stopping
>>>>>> blinking, which led us to changing the semantics on new brightness
>>>>>> set, rather than solving the problem with unregistered trigger.
>>>>>> This was also against documentation claims, which was overlooked.
>>>>>>
>>>>>> I tried yesterday to deactivate trigger on brightness set
>>>>>> executed during blinking, but there are circular dependencies,
>>>>>> since led_set_brightness(led_cdev, LED_OFF) is called on
>>>>>> deactivation.
>>>>>> It is also called from led_trigger_set in the trigger removal path.
>>>>>> Generally it seems non-trivial to enforce current documentation
>>>>>> claims
>>>>>> in case of software blinking.
>>>>>>
>>>>>> The easiest thing to do now would be changing the semantics, so that
>>>>>> only setting brightness to LED_OFF would disable the trigger, which
>>>>>> in fact is true since few releases. The problem is that many drivers
>>>>>> that implement hardware blinking resets it on any brightness change.
>>>>>> We would have to left them intact, but apply a new semantics in the
>>>>>> LED core, that would allow for new drivers to just update hardware
>>>>>> blinking brightness upon updating the brightness.
>>>>>>
>>>>>> If we followed this path then the LED_BLINKING_HW flag would have to
>>>>>> be set in led_blink_setup() after blink_set op returns 0. Thanks to
>>>>>> that, we could distinguish in led_set_brightness whether hardware
>>>>>> or software blinking is enabled. For !LED_BLINKING_HW case we would
>>>>>> proceed as currently, i.e. set the LED_BLINK_BRIGHTNESS_CHANGE flag
>>>>>> and defer brightness setting until next timer tick. For the opposite
>>>>>> case we wouldn't do anything and let the led_set_brightness_nosleep()
>>>>>> to call the appropriate brightness_set/brightness_set_blocking op.
>>>>>> Old drivers would proceed as currently, by disabling blinking
>>>>>> on brightness change, and new ones could apply new semantics by
>>>>>> changing brightness but leaving hardware blinking active.
>>>>>>
>>>>>
>>>>> This sounds better as we do not have to rely on drivers to set the
>>>>> flag
>>>>> and does not have the problems mentioned above. I tried the following
>>>>> and works for my set up :) .
>>>>>
>>>>>
>>>>> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
>>>>> index 19e1e60d..3698b67 100644
>>>>> --- a/drivers/leds/led-core.c
>>>>> +++ b/drivers/leds/led-core.c
>>>>> @@ -141,8 +141,10 @@ static void led_blink_setup(struct led_classdev
>>>>> *led_cdev,
>>>>>   {
>>>>>          if (!(led_cdev->flags & LED_BLINK_ONESHOT) &&
>>>>>              led_cdev->blink_set &&
>>>>> -           !led_cdev->blink_set(led_cdev, delay_on, delay_off))
>>>>> +           !led_cdev->blink_set(led_cdev, delay_on, delay_off)){
>>>>> +               led_cdev->flags |= LED_BLINKING_HW;
>>>>>                  return;
>>>>> +       }
>>>>>
>>>>>          /* blink with 1 Hz as default if nothing specified */
>>>>>          if (!*delay_on && !*delay_off)
>>>>> @@ -209,7 +211,8 @@ void led_set_brightness(struct led_classdev
>>>>> *led_cdev,
>>>>>           * In case blinking is on delay brightness setting
>>>>>           * until the next timer tick.
>>>>>           */
>>>>> -       if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
>>>>> +       if (!(led_cdev->flags & LED_BLINKING_HW) &&
>>>>> +           (led_cdev->blink_delay_on || led_cdev->blink_delay_off)) {
>>>>>                  /*
>>>>>                   * If we need to disable soft blinking delegate
>>>>> this to
>>>>> the
>>>>>                   * work queue task to avoid problems in case we are
>>>>> called
>>>>
>>>> We would have to also clear the flag upon blink deactivation, i.e.
>>>> when brightness to be set equals LED_OFF. Existing drivers that
>>>> implement blink_set op and deactivate blinking on any brightness set
>>>> would have to be modified to clear the LED_BLINKING_HW flag in their
>>>> brightness_{set|set_blocking} ops.
>>>>
>>>
>>>
>>> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
>>> index 19e1e60d..7a15035 100644
>>> --- a/drivers/leds/led-core.c
>>> +++ b/drivers/leds/led-core.c
>>> @@ -98,6 +98,9 @@ static void set_brightness_delayed(struct work_struct
>>> *ws)
>>>
>>> led_cdev->delayed_set_value);
>>>          else
>>>                  ret = -ENOTSUPP;
>>> +
>>> +       if (led_cdev->delayed_set_value == LED_OFF)
>>> +               led_cdev->flags &= ~LED_BLINKING_HW;
>>>          if (ret < 0)
>>>                  dev_err(led_cdev->dev,
>>>                          "Setting an LED's brightness failed (%d)\n",
>>> ret);
>>> @@ -141,8 +144,10 @@ static void led_blink_setup(struct led_classdev
>>> *led_cdev,
>>>   {
>>>          if (!(led_cdev->flags & LED_BLINK_ONESHOT) &&
>>>              led_cdev->blink_set &&
>>> -           !led_cdev->blink_set(led_cdev, delay_on, delay_off))
>>> +           !led_cdev->blink_set(led_cdev, delay_on, delay_off)){
>>> +               led_cdev->flags |= LED_BLINKING_HW;
>>>                  return;
>>> +       }
>>>
>>>          /* blink with 1 Hz as default if nothing specified */
>>>          if (!*delay_on && !*delay_off)
>>> @@ -209,7 +214,8 @@ void led_set_brightness(struct led_classdev
>>> *led_cdev,
>>>           * In case blinking is on delay brightness setting
>>>           * until the next timer tick.
>>>           */
>>> -       if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
>>> +       if (!(led_cdev->flags & LED_BLINKING_HW) &&
>>> +           (led_cdev->blink_delay_on || led_cdev->blink_delay_off)) {
>>>                  /*
>>>                   * If we need to disable soft blinking delegate this to
>>> the
>>>                   * work queue task to avoid problems in case we are
>>> called
>>> @@ -235,6 +241,8 @@ void led_set_brightness_nopm(struct led_classdev
>>> *led_cdev,
>>>          /* Use brightness_set op if available, it is guaranteed not to
>>> sleep */
>>>          if (led_cdev->brightness_set) {
>>>                  led_cdev->brightness_set(led_cdev, value);
>>> +               if (value == LED_OFF)
>>> +                       led_cdev->flags &= ~LED_BLINKING_HW;
>>>                  return;
>>>          }
>>>
>>> @@ -267,6 +275,9 @@ int led_set_brightness_sync(struct led_classdev
>>> *led_cdev,
>>>          if (led_cdev->flags & LED_SUSPENDED)
>>>                  return 0;
>>>
>>> +       if (value == LED_OFF)
>>> +               led_cdev->flags &= ~LED_BLINKING_HW;
>>> +
>>>          if (led_cdev->brightness_set_blocking)
>>>                  return led_cdev->brightness_set_blocking(led_cdev,
>>>
>>> led_cdev->brightness);
>>> diff --git a/include/linux/leds.h b/include/linux/leds.h
>>> index bc1476f..f5fa566 100644
>>> --- a/include/linux/leds.h
>>> +++ b/include/linux/leds.h
>>> @@ -48,6 +48,7 @@ struct led_classdev {
>>>   #define LED_BLINK_DISABLE      (1 << 21)
>>>   #define LED_SYSFS_DISABLE      (1 << 22)
>>>   #define LED_DEV_CAP_FLASH      (1 << 23)
>>> +#define LED_BLINKING_HW        (1 << 24)
>>>
>>>          /* Set LED brightness level */
>>>          /* Must not sleep, use a workqueue if needed */
>>> ~
>>>
>>>
>>>>> diff --git a/include/linux/leds.h b/include/linux/leds.h
>>>>> index bc1476f..f5fa566 100644
>>>>> --- a/include/linux/leds.h
>>>>> +++ b/include/linux/leds.h
>>>>> @@ -48,6 +48,7 @@ struct led_classdev {
>>>>>   #define LED_BLINK_DISABLE      (1 << 21)
>>>>>   #define LED_SYSFS_DISABLE      (1 << 22)
>>>>>   #define LED_DEV_CAP_FLASH      (1 << 23)
>>>>> +#define LED_BLINKING_HW        (1 << 24)
>>>>>
>>>>>          /* Set LED brightness level */
>>>>>          /* Must not sleep, use a workqueue if needed */
>>>>>
>>>>>> I wonder if it would be safe to rely on timer_pending() instead of
>>>>>> introducing LED_BLINKING_HW flag...
>>>>>>
>>>>> How would that work? I am assuming this has something to do with
>>>>> software blink? Does it take hardware blink to account?
>>>>
>>>> This way we could distinguish between software and hardware blinking.
>>>> It wouldn't require modifications in drivers:
>>>>
>>>> -       if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
>>>> +       if (timer_pending(&led_cdev->blink_timer) &&
>>>> +           (led_cdev->blink_delay_on || led_cdev->blink_delay_off)) {
>>>>                   /*
>>>>                    * If we need to disable soft blinking delegate this
>>>>
>>>> It'd must be verified however if it isn't possible that
>>>> led_set_brightness is called when timer is already expired,
>>>> between two ticks.
>>>
>>> if blink_set is successful, would work without problem,
>>>
>>> When blink_set successful : The timer wont be triggered resulting the
>>> function to return null all the time. --> No problem here
>>>
>>> Software blink : I do not have hardware to actually test this case. I
>>> tried simulating the case.But going through the code. Following are my
>>> understanding.
>>
>> You can test it by leaving blink_set op uninitialized in your driver.
>>
>>>
>>> Timer Active (Most of the time) : Work as normal. --> No problem here
>>>
>>> Timer Expired :led_set_brightness_nopm called.
>>> - Case in which brightness == LED_OFF, LED will be turned off.
>>> led_cdev->blink_delay_on and delay_off will retain its value. The timer
>>> will keep on running. So it will re-enable back blink. --> LED_OFF will
>>> be ignored.
>>>
>>> - Case in which brightness != LED_OFF, new brightness set and resume
>>> normal operation.  --> No problem here
>>>
>>
>> Thanks for this analysis. I have a new idea - wouldn't it be more robust
>> if we added LED_BLINKING_SW flag and set it in led_set_software_blink()?
>>
>> The line
>>
>> if (led_cdev->blink_delay_on || led_cdev->blink_delay_off)
>>
>> in led_set_brightness() could be then changed to
>>
>> if (led_cdev->flags & LED_BLINK_SW) .
>>
>> LED_BLINK_SW flag would have to be cleared in led_stop_software_blink()
>> and in the first two conditions in the led_timer_function().
>>
>
> Yes, that will do with minimal changes. I tested the following, and works.

Fine, so could you please submit the patch officially?
Before that, please rebase your code on top of LED tree or linux-next
and change LED_BLINKING_SW to LED_BLINK_SW, to keep the same prefix for
each blinking related definition.

> Date: Mon, 16 May 2016 14:18:42 +0100
> Subject: [PATCH 1/1]  Allow chip-driver to set brightness if, software
> blink not used.
>
> If software blink were active any brightness change request
>   were not sent to the chip driver.
>
> Signed-off-by: Tony Makkiel <tony.makkiel@daqri.com>
> ---
>   drivers/leds/led-core.c | 7 +++++--
>   include/linux/leds.h    | 1 +
>   2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index 19e1e60d..376b5ea 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -33,11 +33,12 @@ static void led_timer_function(unsigned long data)
>
>       if (!led_cdev->blink_delay_on || !led_cdev->blink_delay_off) {
>           led_set_brightness_nosleep(led_cdev, LED_OFF);
> +        led_cdev->flags &= ~LED_BLINKING_SW;
>           return;
>       }
>
>       if (led_cdev->flags & LED_BLINK_ONESHOT_STOP) {
> -        led_cdev->flags &= ~LED_BLINK_ONESHOT_STOP;
> +        led_cdev->flags &= ~(LED_BLINK_ONESHOT_STOP | LED_BLINKING_SW);
>           return;
>       }
>
> @@ -131,6 +132,7 @@ static void led_set_software_blink(struct
> led_classdev *led_cdev,
>           return;
>       }
>
> +    led_cdev->flags |= LED_BLINKING_SW;
>       mod_timer(&led_cdev->blink_timer, jiffies + 1);
>   }
>
> @@ -199,6 +201,7 @@ void led_stop_software_blink(struct led_classdev
> *led_cdev)
>       del_timer_sync(&led_cdev->blink_timer);
>       led_cdev->blink_delay_on = 0;
>       led_cdev->blink_delay_off = 0;
> +    led_cdev->flags &= ~LED_BLINKING_SW;
>   }
>   EXPORT_SYMBOL_GPL(led_stop_software_blink);
>
> @@ -209,7 +212,7 @@ void led_set_brightness(struct led_classdev *led_cdev,
>        * In case blinking is on delay brightness setting
>        * until the next timer tick.
>        */
> -    if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
> +    if (led_cdev->flags & LED_BLINKING_SW) {
>           /*
>            * If we need to disable soft blinking delegate this to the
>            * work queue task to avoid problems in case we are called
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index bc1476f..08ef6f4 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -48,6 +48,7 @@ struct led_classdev {
>   #define LED_BLINK_DISABLE    (1 << 21)
>   #define LED_SYSFS_DISABLE    (1 << 22)
>   #define LED_DEV_CAP_FLASH    (1 << 23)
> +#define LED_BLINKING_SW     (1 << 24)
>
>       /* Set LED brightness level */
>       /* Must not sleep, use a workqueue if needed */

The above line looks different in the recent code.


-- 
Best regards,
Jacek Anaszewski

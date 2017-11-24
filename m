From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: Bug when using both "set" and "blink" functions
Date: Fri, 24 Nov 2017 21:13:47 +0100
Message-ID: <29cfe034-d741-d45b-d960-47ff2294f724@gmail.com>
References: <5c59633100dd45e2b28e46d78cbf930c@innerrange.com.au>
 <0d0eb82e-0391-b033-9275-0e7673a76072@gmail.com>
 <ffca936ebd3e4b219d817c598a726c3b@innerrange.com.au>
 <b25742e7-0be1-7046-7074-27363b5c4cf8@gmail.com>
 <bd8073d70b574452a7335f4f8a40a4b3@innerrange.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:36436 "EHLO
        mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753647AbdKXUOr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 24 Nov 2017 15:14:47 -0500
Received: by mail-wm0-f51.google.com with SMTP id r68so24763267wmr.1
        for <linux-leds@vger.kernel.org>; Fri, 24 Nov 2017 12:14:47 -0800 (PST)
In-Reply-To: <bd8073d70b574452a7335f4f8a40a4b3@innerrange.com.au>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Craig McQueen <craig.mcqueen@innerrange.com.au>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

On 11/24/2017 06:23 AM, Craig McQueen wrote:
> Jacek Anaszewski wrote:
>> On 11/23/2017 01:55 AM, Craig McQueen wrote:
>>> Jacek Anaszewski wrote:
>>>> Hi Craig,
>>>>
>>>> On 11/22/2017 01:55 AM, Craig McQueen wrote:
>>>>> I'd like to control a LED to possibly be any of:
>>>>>
>>>>> * Off
>>>>> * On
>>>>> * Blinking
>>>>>
>>>>> I've had this working fine in 3.14.x kernel.
>>>>>
>>>>> But when upgrading to 4.4.x, I found that the transition from
>>>>> "blinking" to
>>>> "on" didn't work. Namely, if it's blinking and then I call
>>>> led_set_brightness(led_cdev, LED_FULL), then it wouldn't work (I
>>>> can't remember if it turned off, or remained blinking; it wasn't on
>>>> anyway). I worked around it by calling led_set_brightness(led_cdev,
>>>> LED_OFF) just before led_set_brightness(led_cdev, LED_FULL).
>>>>
>>>> This is by design. Setting brightness to LED_OFF deactivates any
>>>> active trigger. There were some inconsistencies in the API semantics
>>>> and it was fixed.
>>>>
>>>> See Documentation/ABI/testing/sysfs-class-led
>>>>
>>>> What:           /sys/class/leds/<led>/brightness
>>>> Date:           March 2006
>>>> KernelVersion:  2.6.17
>>>> Contact:        Richard Purdie <rpurdie@rpsys.net>
>>>> Description:
>>>>                 Set the brightness of the LED. Most LEDs don't
>>>>                 have hardware brightness support, so will just be turned on for
>>>>                 non-zero brightness settings. The value is between 0 and
>>>>                 /sys/class/leds/<led>/max_brightness.
>>>>
>>>>                 Writing 0 to this file clears active trigger.
>>>>
>>>>                 Writing non-zero to this file while trigger is active changes the
>>>>                 top brightness trigger is going to use.
>>>
>>> That makes sense. Which is why, when I changed to kernel 4.4.x, I made
>> the "on" case do led_set_brightness(led_cdev, LED_OFF);
>> led_set_brightness(led_cdev, LED_FULL);. As I described in another email, I
>> am actually creating LED triggers, so my code calls led_trigger_event(trigger,
>> LED_OFF); led_trigger_event(trigger, LED_FULL);. That seems to meet the
>> design intent of the API.
>>>
>>>>> Now I have upgraded to 4.9.x, and found that the transition from
>> "blinking"
>>>> to "on" again isn't working. The LED ends up being off instead of on.
>>>>>
>>>>> Examining the code of led_set_brightness():
>>>>>
>>>>> * Behaviour is different depending on whether the brightness is
>>>>> LED_OFF
>>>> (it schedules the blink to be turned off "soon") or other (it alters
>>>> the brightness of subsequent blinks).
>>>>> * It looks as though there are race conditions in the transition
>>>>> from blinking
>>>> to steady off -- it schedules the blink to be turned off "soon", so
>>>> it's difficult to guarantee a reliable transition from blinking to on/off.
>>>>>
>>>>> The combination of the above two points makes it seem difficult to
>>>> robustly go from blinking to off/on.
>>>>
>>>> Please make sure you have the following patch:
>>>>
>>>> Author: Hans de Goede <hdegoede@redhat.com>  2016-11-08 14:38:46
>>>> Committer: Jacek Anaszewski <j.anaszewski@samsung.com>  2016-11-22
>>>> 12:07:05
>>>> Parent: 8338eab50ffb3399a938d723f9605383ed9f8473 (leds: Add user LED
>>>> driver for NIC78bx device)
>>>> Follows: v4.9-rc1
>>>> Precedes: leds_for_4.10
>>>>
>>>>     led: core: Use atomic bit-field for the blink-flags
>>>>
>>>>     All the LED_BLINK* flags are accessed read-modify-write from e.g.
>>>>     led_set_brightness and led_blink_set_oneshot while both
>>>>     set_brightness_work and the blink_timer may be running.
>>>>
>>>>     If these race then the modify step done by one of them may be lost,
>>>>     switch the LED_BLINK* flags to a new atomic work_flags bit-field
>>>>     to avoid this race.
>>>
>>> I don't have that patch, I don't think. I see it in commit
>> a9c6ce57ec2f136d08141e8220a0ffaca216f7b0 which goes into kernel 4.10. But
>> it looks as though that's not the essence of the issue.
>>
>> It's actually eb1610b4c273370f491c5e194e5a56e3470d81e8.
>>
>>>
>>>>> So, my questions are:
>>>>>
>>>>> * What is the correct way to use the API to reliably control an LED
>>>>> for a
>>>> combination of off/on/blinking?
>>>
>>> It sounds as though calling led_set_brightness(led_cdev, LED_OFF);
>> led_set_brightness(led_cdev, LED_FULL); in-principle should behave
>> according to API design intent.
>>>
>>>>> * Is my above analysis of the code correct, so that there are indeed
>>>>> race
>>>> conditions going from blinking to off, leading to undefined
>>>> behaviour? Can that be fixed?
>>>
>>> Looking at the code, it looks problematic that led_set_brightness(led_cdev,
>> LED_OFF) does not immediately disable soft blinking, but schedules it for
>> "soon in the future".
>>
>> Comments in led_set_brightness() explain the reason for which delaying
>> brightness setting is required, i.e. to avoid the problem when
>> led_set_brightness() is called from hard irq context with timer trigger
>> enabled in the same time. See the original patch introducing deferred
>> brightness setting:
>>
>> commit d23a22a74fded23a12434c9463fe66cec2b0afcd
>> Author: Fabio Baltieri <fabio.baltieri@gmail.com>
>> Date:   Wed Aug 15 21:44:34 2012 +0800
>>
>>     leds: delay led_set_brightness if stopping soft-blink
>>
>>     Delay execution of led_set_brightness() if need to stop soft-blink
>>     timer.
>>
>>     This allows led_set_brightness to be called in hard-irq context even if
>>     soft-blink was activated on that LED.
>>
>>     Signed-off-by: Fabio Baltieri <fabio.baltieri@gmail.com>
>>     Cc: Pawel Moll <pawel.moll@arm.com>
>>     Signed-off-by: Bryan Wu <bryan.wu@canonical.com>
>>
>>
>> In general it allows to avoid conflict explained in [0].
>>
>> [0]
>> https://www.kernel.org/pub/linux/kernel/people/rusty/kernel-
>> locking/c188.html
>>
>>> Then, when led_set_brightness(led_cdev, LED_FULL) is called, it is not
>>> effective because the previous call with LED_OFF has not actually done
>>> anything yet.
>>
>> You really should test your code with the patch
>> eb1610b4c27 ("led: core: Use atomic bit-field for the blink-flags').
>>
>> Changing the brightness to any non-zero value while blinking is on shouldn't
>> cause races after introducing flag LED_BLINK_BRIGHTNESS_CHANGE, which is
>> set in led_brightness_set() when blinking is on, and new brightness is applied
>> upon next blink transition to on. This doesn't stop blinking though, which is in
>> line with doc.
>>
>> Now I see that there can be a problem if you set brightness to 0 while
>> blinking and immediately set it to any non-zero value, before
>> LED_BLINK_DISABLE is handled. The last operation can have no effect then.
>> I'll check it.
> 
> I've considered the following fix:
> 
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index ef1360445413..5e60a6c3a52f 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -109,7 +109,6 @@ static void set_brightness_delayed(struct work_struct *ws)
>         int ret = 0;
>  
>         if (test_and_clear_bit(LED_BLINK_DISABLE, &led_cdev->work_flags)) {
> -               led_cdev->delayed_set_value = LED_OFF;
>                 led_stop_software_blink(led_cdev);
>         }
>  
> @@ -241,7 +240,10 @@ void led_set_brightness(struct led_classdev *led_cdev,
>                  */
>                 if (brightness == LED_OFF) {
>                         set_bit(LED_BLINK_DISABLE, &led_cdev->work_flags);
> +                       led_cdev->delayed_set_value = brightness;
>                         schedule_work(&led_cdev->set_brightness_work);
> +               } else if (test_bit(LED_BLINK_DISABLE, &led_cdev->work_flags)) {
> +                       led_cdev->delayed_set_value = brightness;
>                 } else {
>                         set_bit(LED_BLINK_BRIGHTNESS_CHANGE,
>                                 &led_cdev->work_flags);

Thanks, I'll test that.

> 
> However, I think it has problems with concurrency/race conditions. I'm having difficulty thinking of an elegant solution that is free of race conditions, without resorting to spinlocks etc. I'll be very interested to see what you propose.

spin_lock is not an option since some LED class drivers can sleep while
setting brightness, which is forbidden while holding a spin_lock.
That's why we have to resort to such convoluted constructions.

As a first shot, I'd try to debug your case in detail.
You could add logs to your brightness_set op and to the LED core
functions involved in the operations in question.

-- 
Best regards,
Jacek Anaszewski

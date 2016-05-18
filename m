From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] Let chip-driver set brightness if, software blink not used.
Date: Wed, 18 May 2016 16:34:56 +0200
Message-ID: <573C7D90.2020602@samsung.com>
References: <1463502505-31799-1-git-send-email-tony.makkiel@daqri.com>
 <573C2FF0.3050500@samsung.com> <573C44E0.8090706@daqri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:33805 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753346AbcEROfG (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 18 May 2016 10:35:06 -0400
In-reply-to: <573C44E0.8090706@daqri.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Tony Makkiel <tony.makkiel@daqri.com>
Cc: linux-leds@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>, Stas Sergeev <stsp@users.sourceforge.net>, Andrew Lunn <andrew@lunn.ch>, Sakari Ailus <sakari.ailus@linux.intel.com>, =?windows-1252?Q?=C1lvaro_Fern=E1ndez_Rojas?= <noltari@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, Simon Guinot <simon.guinot@sequanux.org>

On 05/18/2016 12:33 PM, Tony Makkiel wrote:
>
>
> On 18/05/16 10:03, Jacek Anaszewski wrote:
>> Hi Tony,
>>
>> Thanks for the patch. I'd like to improve the commit message.
>>
>> Please let me know if you have any suggestions related to the below:
>>
>>      led: core: Fix brightness setting upon hardware blinking enabled
>>
>>      Commit 76931edd54 ('leds: fix brightness changing when software blinking
>>      is active') changed the semantics of led_set_brightness() which according
>>      to the documentation should disable blinking on any brightness setting.
>>      Moreover it made it different for soft blink case, where it was allowed
>>      for blink brightness change, and for hardware blink case, where setting
>>      any brightness greater than 0 was ignored.
>>
>>      While the change itself is against the documentation claims, it was driven
>>      also by the fact that timer trigger remained active after turning blinking
>>      off. Fixing that would have required major refactoring in the led-core,
>>      led-class, and led-triggers because of cyclic dependencies.
>>
>>      Finally, it has been decided that allowing for brightness change during
>>      blinking is beneficial as it can be accomplished without disturbing
>>      blink rhythm.
>>
>>      The change in brightness setting semantics will not affect existing
>>      LED class drivers that implement blink_set op thanks to the LED_BLINK_SW
>>      flag introduced by this patch. The flag state will be from now on checked
>>      in led_set_brightness() which will allow to distinguish between hardware
>>      and software blink mode. In the former case the control will be passed
>>      directly to the drivers which apply their semantics on brightness set,
>>      which is disable the blinking in case of most such drivers. New drivers
>>      will apply new semantics and just change the brightness while hardware
>>      blinking is on, if possible.
>>
>>      Due to the later LED core improvements this patch can't be applied directly
>>      on the patch that originally introduced the problem, but to the later one,
>>      that touched the affected code.
>>
>>      Fixes: f1e80c07416a ("leds: core: Add two new LED_BLINK_ flags")
>>      Signed-off-by: Tony Makkiel <tony.makkiel@daqri.com>
>>      Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>>
>>
> It looks good to me. Do you want me to resubmit the patch with new commit message?
>   Or can you edit it while merging the patch.

Yes please, if it's not a problem.

>> We will need also to modify the documentation, but this can
>> be done in a separate patch.
>
> Will make another patch for it. Does the following look ok?
>
> diff --git a/Documentation/leds/leds-class.txt b/Documentation/leds/leds-class.txt
> index d406d98..44f5e6b 100644
> --- a/Documentation/leds/leds-class.txt
> +++ b/Documentation/leds/leds-class.txt
> @@ -74,8 +74,8 @@ blink_set() function (see <linux/leds.h>). To set an LED to blinking,
>   however, it is better to use the API function led_blink_set(), as it
>   will check and implement software fallback if necessary.
>
> -To turn off blinking again, use the API function led_brightness_set()
> -as that will not just set the LED brightness but also stop any software
> +To turn off blinking, use the API function led_brightness_set()
> +with brightness value LED_OFF, which should stop any software
>   timers that may have been required for blinking.

Seems good.

>   The blink_set() function should choose a user friendly blinking value
>
>>
>> On 05/17/2016 06:28 PM, Tony Makkiel wrote:
>>> With this patch, chip drivers will be given option to
>>> set brightness while, blink is active.
>>>
>>> Signed-off-by: Tony Makkiel <tony.makkiel@daqri.com>
>>> ---
>>>    drivers/leds/led-core.c |  7 +++++--
>>>    include/linux/leds.h    | 19 ++++++++++---------
>>>    2 files changed, 15 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
>>> index 3495d5d..b595eb9 100644
>>> --- a/drivers/leds/led-core.c
>>> +++ b/drivers/leds/led-core.c
>>> @@ -53,11 +53,12 @@ static void led_timer_function(unsigned long data)
>>>
>>>        if (!led_cdev->blink_delay_on || !led_cdev->blink_delay_off) {
>>>            led_set_brightness_nosleep(led_cdev, LED_OFF);
>>> +        led_cdev->flags &= ~LED_BLINK_SW;
>>>            return;
>>>        }
>>>
>>>        if (led_cdev->flags & LED_BLINK_ONESHOT_STOP) {
>>> -        led_cdev->flags &= ~LED_BLINK_ONESHOT_STOP;
>>> +        led_cdev->flags &=  ~(LED_BLINK_ONESHOT_STOP | LED_BLINK_SW);
>>>            return;
>>>        }
>>>
>>> @@ -151,6 +152,7 @@ static void led_set_software_blink(struct led_classdev *led_cdev,
>>>            return;
>>>        }
>>>
>>> +    led_cdev->flags |= LED_BLINK_SW;
>>>        mod_timer(&led_cdev->blink_timer, jiffies + 1);
>>>    }
>>>
>>> @@ -219,6 +221,7 @@ void led_stop_software_blink(struct led_classdev *led_cdev)
>>>        del_timer_sync(&led_cdev->blink_timer);
>>>        led_cdev->blink_delay_on = 0;
>>>        led_cdev->blink_delay_off = 0;
>>> +    led_cdev->flags &= ~LED_BLINK_SW;
>>>    }
>>>    EXPORT_SYMBOL_GPL(led_stop_software_blink);
>>>
>>> @@ -229,7 +232,7 @@ void led_set_brightness(struct led_classdev *led_cdev,
>>>         * In case blinking is on delay brightness setting
>>
>> We need to make this comment more precise:
>
> Will include the following along with documentation patch, unless require modification.
>
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index b595eb9..f3af7a6 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -229,7 +229,7 @@ void led_set_brightness(struct led_classdev *led_cdev,
>                          enum led_brightness brightness)
>   {
>          /*
> -        * In case blinking is on delay brightness setting
> +        * If software blink active, delay brightness setting

s/active/is active/

>           * until the next timer tick.
>           */
>          if (led_cdev->flags & LED_BLINK_SW) {
>
>>
>> s/blinking/soft blink/g
>>
>>>         * until the next timer tick.
>>>         */
>>> -    if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
>>> +    if (led_cdev->flags & LED_BLINK_SW) {
>>>            /*
>>>             * If we need to disable soft blinking delegate this to the
>>>             * work queue task to avoid problems in case we are called
>>> diff --git a/include/linux/leds.h b/include/linux/leds.h
>>> index d2b1306..99b1f0b 100644
>>> --- a/include/linux/leds.h
>>> +++ b/include/linux/leds.h
>>> @@ -42,15 +42,16 @@ struct led_classdev {
>>>    #define LED_UNREGISTERING    (1 << 1)
>>>        /* Upper 16 bits reflect control information */
>>>    #define LED_CORE_SUSPENDRESUME    (1 << 16)
>>> -#define LED_BLINK_ONESHOT    (1 << 17)
>>> -#define LED_BLINK_ONESHOT_STOP    (1 << 18)
>>> -#define LED_BLINK_INVERT    (1 << 19)
>>> -#define LED_BLINK_BRIGHTNESS_CHANGE (1 << 20)
>>> -#define LED_BLINK_DISABLE    (1 << 21)
>>> -#define LED_SYSFS_DISABLE    (1 << 22)
>>> -#define LED_DEV_CAP_FLASH    (1 << 23)
>>> -#define LED_HW_PLUGGABLE    (1 << 24)
>>> -#define LED_PANIC_INDICATOR    (1 << 25)
>>> +#define LED_BLINK_SW        (1 << 17)
>>> +#define LED_BLINK_ONESHOT    (1 << 18)
>>> +#define LED_BLINK_ONESHOT_STOP    (1 << 19)
>>> +#define LED_BLINK_INVERT    (1 << 20)
>>> +#define LED_BLINK_BRIGHTNESS_CHANGE (1 << 21)
>>> +#define LED_BLINK_DISABLE    (1 << 22)
>>> +#define LED_SYSFS_DISABLE    (1 << 23)
>>> +#define LED_DEV_CAP_FLASH    (1 << 24)
>>> +#define LED_HW_PLUGGABLE    (1 << 25)
>>> +#define LED_PANIC_INDICATOR    (1 << 26)
>>>
>>>        /* Set LED brightness level
>>>         * Must not sleep. Use brightness_set_blocking for drivers
>>>
>>
>>
>
>


-- 
Best regards,
Jacek Anaszewski

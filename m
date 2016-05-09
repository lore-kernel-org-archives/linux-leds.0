From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: Brightness control irrespective of blink state.
Date: Mon, 09 May 2016 16:45:39 +0200
Message-ID: <5730A293.9050209@samsung.com>
References: <1461881020-13964-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1461881020-13964-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <57230B26.9010300@samsung.com> <572C5DEE.3070307@samsung.com>
 <CAAEAJfD_U1Z=wXQbK+DNdhZj5KEDkd3sK8mbBLNOvtKbZd1zYg@mail.gmail.com>
 <572CE1B0.8040001@daqri.com> <572CE715.6060504@gmail.com>
 <57309039.3060305@daqri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:9610 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751071AbcEIOpo (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 9 May 2016 10:45:44 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O6W009JFZO4D470@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 09 May 2016 15:45:40 +0100 (BST)
In-reply-to: <57309039.3060305@daqri.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Tony Makkiel <tony.makkiel@daqri.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>

Hi Tony,

On 05/09/2016 03:27 PM, Tony Makkiel wrote:
> Hi Jacek,
>      Thank you for getting back. I updated my kernel to 4.5 and have the
> updated "led_set_brightness" now.
>
> It sets
>          led_cdev->flags |= LED_BLINK_BRIGHTNESS_CHANGE;
>          led_cdev->blink_brightness = brightness;
>
>      The new implementation requires hardware specific drivers to poll
> for flag change. Shouldn't the led-core driver be calling the hardware
> specific brightness_set (led_set_brightness_nosleep) irrespective of the
> blink settings?
>
> Unfortunately, it place additional requirement on drivers, to implement
> a polling mechanism which won't be needed otherwise. Why are the
> brightness calls dependent on blink settings?

If your question is still:

"Is there a reason for rejecting brightness change requests when
either of the blink_delays are set?"

then the answer is: yes, brightness setting is deferred until
the next timer tick to avoid avoid problems in case we are called
from hard irq context. It should work fine for software blinking.

Nonetheless, your question, made it obvious that we have a problem
here in case of hardware accelerated blinking, i.e. drivers that
implement blink_set op. Is this your use case?

Anyway, I've noticed a discrepancy between the LED core code and
both Documentation/leds/leds-class.txt and comment over blink_set() op
in include/linux/leds.h, which say that blinking is deactivated
upon setting the brightness again. Many drivers apply this rule.

In effect, LED_BLINK_BRIGHTNESS_CHANGE will have to be removed,
and your question will be groundless, as changing the blink
brightness should be impossible by design.

Best regards,
Jacek Anaszewski


> On 06/05/16 19:48, Jacek Anaszewski wrote:
>> Hi Tony,
>>
>> The code you are using is outdated. It is likely that the issue
>> you are referring to was addressed while improving LED core few
>> months ago.
>>
>> Best regards,
>> Jacek Anaszewski
>>
>> On 05/06/2016 08:25 PM, Tony Makkiel wrote:
>>> Hi All,
>>>      Is there a reason for rejecting brightness change requests when
>>> either of the blink_delays are set? Shouldn't the function be allowed to
>>> call "led_set_brightness_sync"?
>>>
>>> I am referring to "led_set_brightness" in led-core.c.
>>>
>>> With the following change, the brightness of led can be varied
>>> irrespective of blinking state. But wanted to check if that is a bad
>>> idea?
>>>
>>> Many Thanks,
>>> Tony
>>>
>>>
>>> --- a/drivers/leds/led-corgit e.c
>>> +++ b/drivers/leds/led-core.c
>>> @@ -190,7 +191,15 @@ EXPORT_SYMBOL_GPL(led_stop_software_blink);
>>>   void led_set_brightness(struct led_classdev *led_cdev,
>>>                          enum led_brightness brightness)
>>>   {
>>> -       int ret = 0;
>>> +       int ret = -EINVAL;
>>> +
>>> +       if (led_cdev->flags & SET_BRIGHTNESS_SYNC){
>>> +               ret = led_set_brightness_sync(led_cdev, brightness);
>>> +               if (ret < 0)
>>> +                       dev_dbg(led_cdev->dev,
>>> +                               "Setting LED brightness failed (%d)\n",
>>> ret);
>>> +               return;
>>> +       }
>>>
>>>          /* delay brightness if soft-blink is active */
>>>          if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
>>> @@ -203,14 +212,8 @@ void led_set_brightness(struct led_classdev
>>> *led_cdev,
>>>          if (led_cdev->flags & SET_BRIGHTNESS_ASYNC) {
>>>                  led_set_brightness_async(led_cdev, brightness);
>>>                  return;
>>> -       } else if (led_cdev->flags & SET_BRIGHTNESS_SYNC)
>>> -               ret = led_set_brightness_sync(led_cdev, brightness);
>>> -       else
>>> -               ret = -EINVAL;
>>> -
>>> -       if (ret < 0)
>>> -               dev_dbg(led_cdev->dev, "Setting LED brightness failed
>>> (%d)\n",
>>> -                       ret);
>>> +       }
>>> +       dev_dbg(led_cdev->dev, "Setting LED brightness failed (%d)\n",
>>> ret);
>>>   }
>>>   EXPORT_SYMBOL(led_set_brightness);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-leds" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>

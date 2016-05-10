From: Tony Makkiel <tony.makkiel@daqri.com>
Subject: Re: Brightness control irrespective of blink state.
Date: Tue, 10 May 2016 10:36:54 +0100
Message-ID: <5731ABB6.10607@daqri.com>
References: <1461881020-13964-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1461881020-13964-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <57230B26.9010300@samsung.com> <572C5DEE.3070307@samsung.com>
 <CAAEAJfD_U1Z=wXQbK+DNdhZj5KEDkd3sK8mbBLNOvtKbZd1zYg@mail.gmail.com>
 <572CE1B0.8040001@daqri.com> <572CE715.6060504@gmail.com>
 <57309039.3060305@daqri.com> <5730A293.9050209@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:37997 "EHLO
	mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751214AbcEJJg6 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 10 May 2016 05:36:58 -0400
Received: by mail-wm0-f41.google.com with SMTP id g17so16681511wme.1
        for <linux-leds@vger.kernel.org>; Tue, 10 May 2016 02:36:57 -0700 (PDT)
In-Reply-To: <5730A293.9050209@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>



On 09/05/16 15:45, Jacek Anaszewski wrote:
> Hi Tony,
>
> On 05/09/2016 03:27 PM, Tony Makkiel wrote:
>> Hi Jacek,
>>      Thank you for getting back. I updated my kernel to 4.5 and have the
>> updated "led_set_brightness" now.
>>
>> It sets
>>          led_cdev->flags |= LED_BLINK_BRIGHTNESS_CHANGE;
>>          led_cdev->blink_brightness = brightness;
>>
>>      The new implementation requires hardware specific drivers to poll
>> for flag change. Shouldn't the led-core driver be calling the hardware
>> specific brightness_set (led_set_brightness_nosleep) irrespective of the
>> blink settings?
>>
>> Unfortunately, it place additional requirement on drivers, to implement
>> a polling mechanism which won't be needed otherwise. Why are the
>> brightness calls dependent on blink settings?
>
> If your question is still:
>
> "Is there a reason for rejecting brightness change requests when
> either of the blink_delays are set?"
>
> then the answer is: yes, brightness setting is deferred until
> the next timer tick to avoid avoid problems in case we are called
> from hard irq context. It should work fine for software blinking.


Sorry, was focused debugging 'hardware accelerated blink' on the driver 
I am working on, I missed the software blinking implementation.

>
> Nonetheless, your question, made it obvious that we have a problem
> here in case of hardware accelerated blinking, i.e. drivers that
> implement blink_set op. Is this your use case?
>

Yes, the brightness requests from user space 
(/sys/class/leds/*/brightness) does not get passed to hardware specific 
driver via the blink_set implemented, unless led_cdev->flags is polled.

> Anyway, I've noticed a discrepancy between the LED core code and
> both Documentation/leds/leds-class.txt and comment over blink_set() op
> in include/linux/leds.h, which say that blinking is deactivated
> upon setting the brightness again. Many drivers apply this rule.
>
> In effect, LED_BLINK_BRIGHTNESS_CHANGE will have to be removed,
> and your question will be groundless, as changing the blink
> brightness should be impossible by design.
>
In my opinion, disabling blink, when brightness change requested doesn't 
sound like the right thing to do. There could be cases in which the 
brightness of the blinking LED needs to be changed. Maybe we can let the 
hardware driver deal with the blink request if it has implemented 
brightness_set? The change below seem to work.


Subject: [PATCH] led-core: Use hardware blink when available

At present hardware implemented brightness is not called
if blink delays are set.

Signed-off-by: Tony Makkiel <tony.makkiel@daqri.com>
---
  drivers/leds/led-core.c | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 19e1e60d..02dd0f6 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -208,8 +208,10 @@ void led_set_brightness(struct led_classdev *led_cdev,
  	/*
  	 * In case blinking is on delay brightness setting
  	 * until the next timer tick.
+	 * Or if brightness_set is defined, use the associated implementation.
  	 */
-	if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
+	if ((!led_cdev->brightness_set) &&
+	    (led_cdev->blink_delay_on || led_cdev->blink_delay_off)) {
  		/*
  		 * If we need to disable soft blinking delegate this to the
  		 * work queue task to avoid problems in case we are called
-- 
1.9.1




> Best regards,
> Jacek Anaszewski
>
>
>> On 06/05/16 19:48, Jacek Anaszewski wrote:
>>> Hi Tony,
>>>
>>> The code you are using is outdated. It is likely that the issue
>>> you are referring to was addressed while improving LED core few
>>> months ago.
>>>
>>> Best regards,
>>> Jacek Anaszewski
>>>
>>> On 05/06/2016 08:25 PM, Tony Makkiel wrote:
>>>> Hi All,
>>>>      Is there a reason for rejecting brightness change requests when
>>>> either of the blink_delays are set? Shouldn't the function be
>>>> allowed to
>>>> call "led_set_brightness_sync"?
>>>>
>>>> I am referring to "led_set_brightness" in led-core.c.
>>>>
>>>> With the following change, the brightness of led can be varied
>>>> irrespective of blinking state. But wanted to check if that is a bad
>>>> idea?
>>>>
>>>> Many Thanks,
>>>> Tony
>>>>
>>>>
>>>> --- a/drivers/leds/led-corgit e.c
>>>> +++ b/drivers/leds/led-core.c
>>>> @@ -190,7 +191,15 @@ EXPORT_SYMBOL_GPL(led_stop_software_blink);
>>>>   void led_set_brightness(struct led_classdev *led_cdev,
>>>>                          enum led_brightness brightness)
>>>>   {
>>>> -       int ret = 0;
>>>> +       int ret = -EINVAL;
>>>> +
>>>> +       if (led_cdev->flags & SET_BRIGHTNESS_SYNC){
>>>> +               ret = led_set_brightness_sync(led_cdev, brightness);
>>>> +               if (ret < 0)
>>>> +                       dev_dbg(led_cdev->dev,
>>>> +                               "Setting LED brightness failed (%d)\n",
>>>> ret);
>>>> +               return;
>>>> +       }
>>>>
>>>>          /* delay brightness if soft-blink is active */
>>>>          if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
>>>> @@ -203,14 +212,8 @@ void led_set_brightness(struct led_classdev
>>>> *led_cdev,
>>>>          if (led_cdev->flags & SET_BRIGHTNESS_ASYNC) {
>>>>                  led_set_brightness_async(led_cdev, brightness);
>>>>                  return;
>>>> -       } else if (led_cdev->flags & SET_BRIGHTNESS_SYNC)
>>>> -               ret = led_set_brightness_sync(led_cdev, brightness);
>>>> -       else
>>>> -               ret = -EINVAL;
>>>> -
>>>> -       if (ret < 0)
>>>> -               dev_dbg(led_cdev->dev, "Setting LED brightness failed
>>>> (%d)\n",
>>>> -                       ret);
>>>> +       }
>>>> +       dev_dbg(led_cdev->dev, "Setting LED brightness failed (%d)\n",
>>>> ret);
>>>>   }
>>>>   EXPORT_SYMBOL(led_set_brightness);
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-leds" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>
>
>

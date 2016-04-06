From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 2/5] leds: triggers: Add a led_trigger_event_nosleep API
Date: Wed, 6 Apr 2016 08:12:40 +0200
Message-ID: <5704A8D8.8090004@gmail.com>
References: <1459801326-5541-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1459801326-5541-3-git-send-email-ezequiel@vanguardiasur.com.ar>
 <57042FD8.1090100@gmail.com>
 <CAAEAJfCoJEM9+Y_=B=YKFG_zT5TMHEKqzrX-nns7L8Mx5WqSug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33436 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752097AbcDFGNL (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 6 Apr 2016 02:13:11 -0400
In-Reply-To: <CAAEAJfCoJEM9+Y_=B=YKFG_zT5TMHEKqzrX-nns7L8Mx5WqSug@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-leds@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>

On 04/06/2016 06:38 AM, Ezequiel Garcia wrote:
> On 5 April 2016 at 18:36, Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
>> Hi Ezequiel,
>>
>>
>> On 04/04/2016 10:22 PM, Ezequiel Garcia wrote:
>>>
>>> Now that we can mark any LED (even those in use by delayed blink
>>> triggers) to trigger on a kernel panic, let's introduce a nosleep
>>> led_trigger_event API.
>>>
>>> This API is needed to skip the delayed blink path on
>>> led_trigger_event. LEDs that are switched on a kernel panic,
>>> might be in use by a delayed blink trigger.
>>>
>>> This will be used by the panic LED trigger.
>>>
>>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>>> ---
>>>    drivers/leds/led-triggers.c | 26 ++++++++++++++++++++++----
>>>    include/linux/leds.h        |  4 ++++
>>>    2 files changed, 26 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
>>> index f5c9d7c4d181..00b9d8497777 100644
>>> --- a/drivers/leds/led-triggers.c
>>> +++ b/drivers/leds/led-triggers.c
>>> @@ -307,8 +307,9 @@ EXPORT_SYMBOL_GPL(devm_led_trigger_register);
>>>
>>>    /* Simple LED Tigger Interface */
>>>
>>> -void led_trigger_event(struct led_trigger *trig,
>>> -                       enum led_brightness brightness)
>>> +static void do_led_trigger_event(struct led_trigger *trig,
>>> +                                enum led_brightness brightness,
>>> +                                bool nosleep)
>>>    {
>>>          struct led_classdev *led_cdev;
>>>
>>> @@ -316,12 +317,29 @@ void led_trigger_event(struct led_trigger *trig,
>>>                  return;
>>>
>>>          read_lock(&trig->leddev_list_lock);
>>> -       list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list)
>>> -               led_set_brightness(led_cdev, brightness);
>>
>>
>> led_set_brightness() can gently disable blinking if passed 0 in the
>> brightness argument. IMHO this patch is not needed then.
>>
>>
>
> Yes, but the blinking disable is deferred, and so might never
> run (e.g. I'd say it won't run on a non-preemptible kernel).
>
> I think we need this API, or otherwise some way of circumventing
> the deferred path on led_set_brightness. For instance, we
> could turn off delay_on and delay_off in the panic atomic notifier.

Yes, I prefer the latter, as it requires less changes.

> I'm not strongly convinced by any approach, but this API seemed
> slightly cleaner.
>

-- 
Best regards,
Jacek Anaszewski

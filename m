From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: core: use deferred probing if default trigger isn't
 available yet
Date: Sun, 26 Feb 2017 18:09:52 +0100
Message-ID: <bce2bdc3-85df-fa5f-10ed-73907ae06460@gmail.com>
References: <39873979-0231-1605-1d37-9ee29c6a0286@gmail.com>
 <72e43bca-6b3d-8907-fdb3-d95c36d6f737@gmail.com>
 <2e89ab77-2e33-47dd-035e-a84f1885c554@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:33117 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751092AbdBZRRl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 26 Feb 2017 12:17:41 -0500
Received: by mail-wr0-f193.google.com with SMTP id g10so7497301wrg.0
        for <linux-leds@vger.kernel.org>; Sun, 26 Feb 2017 09:17:40 -0800 (PST)
In-Reply-To: <2e89ab77-2e33-47dd-035e-a84f1885c554@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

On 02/23/2017 10:25 PM, Heiner Kallweit wrote:
> Am 23.02.2017 um 22:04 schrieb Jacek Anaszewski:
>> Hi Heiner,
>>
>> Thanks for the patch. I have one comment below.
>>
>> On 02/22/2017 09:35 PM, Heiner Kallweit wrote:
>>> When registering a LED device we have the option to set a default trigger.
>>> Depending on load order of drivers this trigger may not be available yet.
>>> (affected LED device in my case: a DT-configured GPIO LED)
>>> So far if the default trigger can't be found this error is silently
>>> ignored.
>>>
>>> Let's change this to return EPROBE_DEFER if the default trigger can't be
>>> found. This gives the system the chance to probe the LED device later
>>> once the trigger is available.
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>> ---
>>> ---
>>>  drivers/leds/led-class.c    |  6 +++++-
>>>  drivers/leds/led-triggers.c | 11 ++++++++---
>>>  include/linux/leds.h        |  5 +++--
>>>  3 files changed, 16 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>>> index f2b0a80a..efe4f5a3 100644
>>> --- a/drivers/leds/led-class.c
>>> +++ b/drivers/leds/led-class.c
>>> @@ -295,7 +295,11 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
>>>  	led_init_core(led_cdev);
>>>  
>>>  #ifdef CONFIG_LEDS_TRIGGERS
>>> -	led_trigger_set_default(led_cdev);
>>> +	ret = led_trigger_set_default(led_cdev);
>>> +	if (ret) {
>>> +		led_classdev_unregister(led_cdev);
>>> +		return ret;
>>> +	}
>>>  #endif
>>>  
>>>  	dev_dbg(parent, "Registered led device: %s\n",
>>> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
>>> index 431123b0..bad9e986 100644
>>> --- a/drivers/leds/led-triggers.c
>>> +++ b/drivers/leds/led-triggers.c
>>> @@ -157,21 +157,26 @@ void led_trigger_remove(struct led_classdev *led_cdev)
>>>  }
>>>  EXPORT_SYMBOL_GPL(led_trigger_remove);
>>>  
>>> -void led_trigger_set_default(struct led_classdev *led_cdev)
>>> +int led_trigger_set_default(struct led_classdev *led_cdev)
>>>  {
>>>  	struct led_trigger *trig;
>>> +	int ret = -EPROBE_DEFER;
>>>  
>>>  	if (!led_cdev->default_trigger)
>>> -		return;
>>> +		return 0;
>>>  
>>>  	down_read(&triggers_list_lock);
>>>  	down_write(&led_cdev->trigger_lock);
>>>  	list_for_each_entry(trig, &trigger_list, next_trig) {
>>> -		if (!strcmp(led_cdev->default_trigger, trig->name))
>>> +		if (!strcmp(led_cdev->default_trigger, trig->name)) {
>>>  			led_trigger_set(led_cdev, trig);
>>> +			ret = 0;
>>
>> I wonder why we don't break the loop after matching the trigger?
>>
>> I think that we can add break here while we are at it since LED Trigger
>> core doesn't allow for registering two triggers with the same name.
>>
> Indeed.
> 
>> Would you mind sending an update and mention it also in the commit
>> message?
>>
> Fine with me if we can silently improve the existing code ..

We shouldn't enclose unrelated changes in a patch, but in this
case you're modifying the condition body anyway, so adding suitable
comment in the commit message should be enough.

-- 
Best regards,
Jacek Anaszewski

From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] leds: core: use deferred probing if default trigger isn't
 available yet
Date: Thu, 23 Feb 2017 22:23:02 +0100
Message-ID: <1f9ec7ec-b1ce-48ab-b0f0-dbdbf4e7e18f@gmail.com>
References: <39873979-0231-1605-1d37-9ee29c6a0286@gmail.com>
 <20170223210811.GC19376@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35477 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751170AbdBWV0B (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Feb 2017 16:26:01 -0500
Received: by mail-wm0-f67.google.com with SMTP id u63so52062wmu.2
        for <linux-leds@vger.kernel.org>; Thu, 23 Feb 2017 13:25:59 -0800 (PST)
In-Reply-To: <20170223210811.GC19376@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Am 23.02.2017 um 22:08 schrieb Pavel Machek:
> On Wed 2017-02-22 21:35:52, Heiner Kallweit wrote:
>> When registering a LED device we have the option to set a default trigger.
>> Depending on load order of drivers this trigger may not be available yet.
>> (affected LED device in my case: a DT-configured GPIO LED)
>> So far if the default trigger can't be found this error is silently
>> ignored.
>>
>> Let's change this to return EPROBE_DEFER if the default trigger can't be
>> found. This gives the system the chance to probe the LED device later
>> once the trigger is available.
> 
> I see a lot of EPROBE_DEFERs on N900, and it is quite nasty, as it
> spams a log a lot.
> 
Usually error messages are printed only if there is an error and it is not
EPROBE_DEFER. However indeed there still may be several drivers not
taking into account that a subsystem they depend on may return
EPROBE_DEFER and this should not be treated as "hard error".

> Rather then re-trying LED registration few times, could we make sure
> leds are always registered after triggers or something like that?
> 
I'm afraid if guaranteeing a particular order would be possible w/o
significant effort then the whole deferred probing concept wouldn't exist.

I could imagine that we can try reordering definitions in the DTS to
ensure a certain load order. But this might be somewhat fragile.
So using the existing concept of deferred probing seems to me to be
the cleaner solution.

Heiner

>      	 		   	 	     	       	    Pavel
> 
> 
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>> ---
>>  drivers/leds/led-class.c    |  6 +++++-
>>  drivers/leds/led-triggers.c | 11 ++++++++---
>>  include/linux/leds.h        |  5 +++--
>>  3 files changed, 16 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>> index f2b0a80a..efe4f5a3 100644
>> --- a/drivers/leds/led-class.c
>> +++ b/drivers/leds/led-class.c
>> @@ -295,7 +295,11 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
>>  	led_init_core(led_cdev);
>>  
>>  #ifdef CONFIG_LEDS_TRIGGERS
>> -	led_trigger_set_default(led_cdev);
>> +	ret = led_trigger_set_default(led_cdev);
>> +	if (ret) {
>> +		led_classdev_unregister(led_cdev);
>> +		return ret;
>> +	}
> 

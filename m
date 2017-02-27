From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2] leds: core: use deferred probing if default trigger
 isn't available yet
Date: Mon, 27 Feb 2017 20:55:41 +0100
Message-ID: <a5149ede-f0c3-2fba-54ce-b137fec96e94@gmail.com>
References: <001fb4b9-a83f-7b01-efb5-9fde715b35a1@gmail.com>
 <20170227111213.GA19403@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:37909 "EHLO
        mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751956AbdB0VgM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Feb 2017 16:36:12 -0500
Received: by mail-wm0-f45.google.com with SMTP id u199so29421745wmd.1
        for <linux-leds@vger.kernel.org>; Mon, 27 Feb 2017 13:36:06 -0800 (PST)
In-Reply-To: <20170227111213.GA19403@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

On 02/27/2017 12:12 PM, Pavel Machek wrote:
> On Fri 2017-02-24 07:41:48, Heiner Kallweit wrote:
>> When registering a LED device we have the option to set a default trigger.
>> Depending on load order of drivers this trigger may not be available yet.
>> (affected LED device in my case: a DT-configured GPIO LED)
>> So far if the default trigger can't be found this error is silently
>> ignored.
>>
>> Let's change this to return EPROBE_DEFER if the default trigger can't be
>> found. This gives the system the chance to probe the LED device later
>> once the trigger is available.
>>
>> In addition in led_trigger_set_default break out of the loop when trigger
>> has been found.
> 
> Hmm. Problem with this is that if the we configure non-existing
> trigger, or trigger not configured in current kernel, LED will
> disappear and user will have "fun" debugging why, right?

Right, so I propose to add suitable dev_err logging in
led_classdev_register() if led_trigger_set_default() returns
non-zero.

-- 
Best regards,
Jacek Anaszewski

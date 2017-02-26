From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: core: use deferred probing if default trigger isn't
 available yet
Date: Sun, 26 Feb 2017 23:07:26 +0100
Message-ID: <7610b68f-f756-11c6-81bb-760ded7a1b16@gmail.com>
References: <39873979-0231-1605-1d37-9ee29c6a0286@gmail.com>
 <20170223210811.GC19376@amd> <1f9ec7ec-b1ce-48ab-b0f0-dbdbf4e7e18f@gmail.com>
 <82111085-baf8-efb9-d195-47153aa3b918@gmail.com> <20170226210014.GA435@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f182.google.com ([209.85.128.182]:35593 "EHLO
        mail-wr0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751284AbdBZWId (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 26 Feb 2017 17:08:33 -0500
Received: by mail-wr0-f182.google.com with SMTP id g10so41091817wrg.2
        for <linux-leds@vger.kernel.org>; Sun, 26 Feb 2017 14:08:13 -0800 (PST)
In-Reply-To: <20170226210014.GA435@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

On 02/26/2017 10:00 PM, Pavel Machek wrote:
> On Sun 2017-02-26 18:10:56, Jacek Anaszewski wrote:
>> On 02/23/2017 10:23 PM, Heiner Kallweit wrote:
>>> Am 23.02.2017 um 22:08 schrieb Pavel Machek:
>>>> On Wed 2017-02-22 21:35:52, Heiner Kallweit wrote:
>>>>> When registering a LED device we have the option to set a default trigger.
>>>>> Depending on load order of drivers this trigger may not be available yet.
>>>>> (affected LED device in my case: a DT-configured GPIO LED)
>>>>> So far if the default trigger can't be found this error is silently
>>>>> ignored.
>>>>>
>>>>> Let's change this to return EPROBE_DEFER if the default trigger can't be
>>>>> found. This gives the system the chance to probe the LED device later
>>>>> once the trigger is available.
>>>>
>>>> I see a lot of EPROBE_DEFERs on N900, and it is quite nasty, as it
>>>> spams a log a lot.
>>>>
>>> Usually error messages are printed only if there is an error and it is not
>>> EPROBE_DEFER. However indeed there still may be several drivers not
>>> taking into account that a subsystem they depend on may return
>>> EPROBE_DEFER and this should not be treated as "hard error".
>>>
>>>> Rather then re-trying LED registration few times, could we make sure
>>>> leds are always registered after triggers or something like that?
>>>>
>>> I'm afraid if guaranteeing a particular order would be possible w/o
>>> significant effort then the whole deferred probing concept wouldn't exist.
>>>
>>> I could imagine that we can try reordering definitions in the DTS to
>>> ensure a certain load order. But this might be somewhat fragile.
>>> So using the existing concept of deferred probing seems to me to be
>>> the cleaner solution.
>>
>> We could go for a solution similar to v4l2-async.c mechanism which
>> allows for deferring video pipeline linking until all video pipeline
>> entities are probed, but in the LED subsystem case I think it would be
>> an overengineering. V4L2 media device has to wait for completion of
>> probing of several v4l2 drivers, whereas here we've got to wait for
>> a single driver. EPROBE_DEFER seems to fit for that ideally.
> 
> I was more thinking of ... just initialize all triggers earlier then
> all LEDs?
> 
> Initcalls do have few levels we could use..

All LED triggers are registered from initialization functions
(marked with __init), and there are some LED class drivers that
are also probed from similar functions. We could e.g. try to move
triggers to subsys_initcall, but it would require thorough testing
to assure that we're not breaking anything.

-- 
Best regards,
Jacek Anaszewski

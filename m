From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [[PATCH v2]] drivers: leds/trigger: system cannot enter suspend
Date: Wed, 7 Jun 2017 11:27:08 +0200
Message-ID: <CAPDyKFqdhWjRHfcWKcfnUmgZ0gkKOPHE9Ke2Zz7Gn44P+7SOBQ@mail.gmail.com>
References: <1496803810-57154-1-git-send-email-bo.zhang@nxp.com> <20170607071256.GA3230@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qk0-f181.google.com ([209.85.220.181]:35115 "EHLO
        mail-qk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751008AbdFGJ1K (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 7 Jun 2017 05:27:10 -0400
Received: by mail-qk0-f181.google.com with SMTP id a199so3179597qkb.2
        for <linux-leds@vger.kernel.org>; Wed, 07 Jun 2017 02:27:09 -0700 (PDT)
In-Reply-To: <20170607071256.GA3230@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Linus Walleij <linus.walleij@linaro.org>
Cc: Zhang Bo <bo.zhang@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, jacek.anaszewski@gmail.com, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

On 7 June 2017 at 09:12, Pavel Machek <pavel@ucw.cz> wrote:
> On Wed 2017-06-07 10:50:10, Zhang Bo wrote:
>> System cannot enter suspend mode because of heartbeat led trigger.
>> In autosleep_wq, try_to_suspend function will try to enter suspend
>> mode in specific period. it will get wakeup_count then call pm_notifier
>> chain callback function and freeze processes.
>> Heartbeat_pm_notifier is called and it call led_trigger_unregister to
>> change the trigger of led device to none. It will send uevent message
>> and the wakeup source count changed.
>>
>> Add suspend/resume ops to the struct led_trigger, implement these two ops
>> for ledtrig-heartbeat. Add led_trigger_suspend/led_trigger_resume funcitons
>> to iterate through all LED class devices registered on given trigger and
>> call their suspend/resume ops and disable/enable sysfs at the same time.
>>
>> Call led_trigger_suspend{resuem} API in pm_notifier function to
>> suspend/resume all led devices listed in given trigger.
>>
>> Signed-off-by: Zhang Bo <bo.zhang@nxp.com>
>
> NAK.
>
> led_trigger should not need special handling over suspend.
>
>> It can also fix my issue by reverting  the commit 5ab92a7cb. But this
>> action only does not make
>> led_set_brightness_nosleep function to set brightness. The heartbeat
>> trigger timer is still
>> running even though it is not harmful.
>
> Yes, timers can and should be active over suspend.
>
> Core reason is that 5ab92a7cb is wrong. (Very wrong; it papers over
> the issue for one trigger, but we have more than one... Even if
> special handling for heartbeat is warranted, that handling would be
> "turn the led off" not "unregister the trigger", which is
> userland-visible action.) That one should be reverted, then maybe the
> driver should be fixed to turn the led off during suspend.

I fully agree! However, I haven't yet figured out exactly how to solve
it yet. :-)

FYI, the same problem exist to for example ledtrig-cpu, which uses a
sycore_ops do deal with suspend/resume.
I think that is way too late, especially since it's not uncommon that
an i2c transfer needs to be done to change the led. Then as i2c is
suspended far earlier than when entering the syscore stages in
suspend, it breaks.

Kind regards
Uffe

From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH AUTOSEL for 4.14 065/110] led: core: Fix brightness
 setting when setting delay_off=0
Date: Tue, 13 Mar 2018 20:44:49 +0100
Message-ID: <7a59c129-60be-9c4b-6002-242b873e8468@gmail.com>
References: <20180204090531.GA29468@amd> <20180204111500.GB14797@kroah.com>
 <20180204171736.GA1388@amd> <20180206020210.m6gl7vai4p6azb6s@sasha-lappy>
 <713113d8-7662-d80c-c62f-af020469d0bf@gmail.com>
 <f072a5c1-95f1-e81b-c629-ebdea723e6f4@universe-factory.net>
 <20180312152811.GB16944@kroah.com>
 <5747831a-b237-aa2c-cb47-9773cd2b5956@universe-factory.net>
 <0cd72fe4-2b98-e6f7-6ae7-530524786cec@gmail.com>
 <20180313093703.GB27669@kroah.com> <20180313132748.GA20246@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180313132748.GA20246@amd>
Sender: stable-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Greg KH <gregkh@linuxfoundation.org>
Cc: Matthias Schiffer <mschiffer@universe-factory.net>, Sasha Levin <Alexander.Levin@microsoft.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Matthieu CASTET <matthieu.castet@parrot.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 03/13/2018 02:27 PM, Pavel Machek wrote:
> Hi!
> 
>>>> At least 7b6af2c531 ("leds: core: Fix regression caused by commit
>>>> 2b83ff96f51d") is missing, causing visible regressions (LEDs not working at
>>>> all) on some OpenWrt devices. This was fixed in 4.4.121 by reverting the
>>>> offending commit, but if I followed the discussion correctly, 4.9 should
>>>> get the follow-up commit 7b6af2c531 instead (like 4.14 already did).
>>>>
>>>> Jacek's mail I replied to mentions that eb1610b4c273 ("led: core: Fix
>>>> blink_brightness setting race") should be included in 4.9 as well, but I
>>>> don't know the impact of the issue it fixes.
>>>
>>> It doesn't fix any reported issue, but is just an improvement
>>> aiming at preventing potential races while changing blink brightness.
>>>
>>> After taking closer look it turns out that for the patches in question
>>> to apply cleanly we need in 4.9 also a patch which introduces atomic
>>> bit fields for blink flags.
>>>
>>> Effectively, here is the list of patches required in 4.9 stable:
>>>
>>> Revert "led: core: Fix brightness setting when setting delay_off=0"
>>>
>>> followed by:
>>>
>>> a9c6ce57ec ("led: core: Use atomic bit-field for the blink-flags")
>>> eb1610b4c2 ("led: core: Fix blink_brightness setting race")
>>> 2b83ff96f5 ("led: core: Fix brightness setting when setting delay_off=0")
>>> 7b6af2c531 ("leds: core: Fix regression caused by commit 2b83ff96f51d")
>>
>> Odd, I just got another report that the 4.9.87 release fixed some
>> reported LED issues, so why do I need all of these?

Because 2b83ff96f5 introduces another bug, fixed in 7b6af2c531.
7b6af2c531 in turn uses atomic blink flags introduced in a9c6ce57ec.

eb1610b4c2 fixes theoretical races, actually we can do without it
in stable.

In order to avoid applying patch a9c6ce57ec, we could come up with the
below change which does exactly what 7b6af2c531 intended, but without
atomic blink flags, which are irrelevant for this bug.


diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 3bce448..454ed4d 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -188,6 +188,7 @@ void led_blink_set(struct led_classdev *led_cdev,
 {
        del_timer_sync(&led_cdev->blink_timer);

+       led_cdev->flags &= ~LED_BLINK_SW;
        led_cdev->flags &= ~LED_BLINK_ONESHOT;
        led_cdev->flags &= ~LED_BLINK_ONESHOT_STOP;


I can submit it to stable if it is preferred.

In every case tha patch 2b83ff96f5 needs to be reverted beforehand,
since otherwise none of the discussed patches will apply cleanly
(besides the aforementioned reasoning it has a truncated commit
message).


>> Should I just revert the single 2b83ff96f51d commit here instead?
> 
> I believe so, yes.
> 
> I'm not aware of any _really bad_ issues with LED subsystem in
> 4.9. Take a look at changelog of
> 2b83ff96f51d0b039c4561b9f95c824d7bddb85c -- it fixes rather
> theoretical issue; user can reproduce it by hand in shell, but,
> well... don't do it then.

Greg mentioned that 4.9.87 release fixed some LED issue for someone,
and it was the only LED related patch in that release.

> The rest of fixes ... fix some more theoretical races. I don't think
> it is -stable material, as I pointed out before.

-- 
Best regards,
Jacek Anaszewski

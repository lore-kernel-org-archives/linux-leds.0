From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH AUTOSEL for 4.14 065/110] led: core: Fix brightness
 setting when setting delay_off=0
Date: Mon, 12 Mar 2018 21:20:48 +0100
Message-ID: <0cd72fe4-2b98-e6f7-6ae7-530524786cec@gmail.com>
References: <20180203180015.29073-1-alexander.levin@microsoft.com>
 <20180203180015.29073-65-alexander.levin@microsoft.com>
 <20180203203525.GA5860@amd> <20180204003029.2lkcmh6wvzpnlrls@sasha-lappy>
 <20180204090531.GA29468@amd> <20180204111500.GB14797@kroah.com>
 <20180204171736.GA1388@amd> <20180206020210.m6gl7vai4p6azb6s@sasha-lappy>
 <713113d8-7662-d80c-c62f-af020469d0bf@gmail.com>
 <f072a5c1-95f1-e81b-c629-ebdea723e6f4@universe-factory.net>
 <20180312152811.GB16944@kroah.com>
 <5747831a-b237-aa2c-cb47-9773cd2b5956@universe-factory.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5747831a-b237-aa2c-cb47-9773cd2b5956@universe-factory.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Schiffer <mschiffer@universe-factory.net>, Greg KH <gregkh@linuxfoundation.org>
Cc: Sasha Levin <Alexander.Levin@microsoft.com>, Pavel Machek <pavel@ucw.cz>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Matthieu CASTET <matthieu.castet@parrot.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 03/12/2018 04:45 PM, Matthias Schiffer wrote:
> On 03/12/2018 04:28 PM, Greg KH wrote:
>> On Mon, Mar 12, 2018 at 04:00:01PM +0100, Matthias Schiffer wrote:
>>> On 02/06/2018 09:44 PM, Jacek Anaszewski wrote:
>>>> On 02/06/2018 03:02 AM, Sasha Levin wrote:
>>>>> On Sun, Feb 04, 2018 at 06:17:36PM +0100, Pavel Machek wrote:
>>>>>>
>>>>>>>>>>> *** if brightness=0, led off
>>>>>>>>>>> *** else apply brightness if next timer <--- timer is stop, and will never apply new setting
>>>>>>>>>>> ** otherwise set led_set_brightness_nosleep
>>>>>>>>>>>
>>>>>>>>>>> To fix that, when we delete the timer, we should clear LED_BLINK_SW.
>>>>>>>>>>
>>>>>>>>>> Can you run the tests on the affected stable kernels? I have feeling
>>>>>>>>>> that the problem described might not be present there.
>>>>>>>>>
>>>>>>>>> Hm, I don't seem to have HW to test that out. Maybe someone else does?
>>>>>>>>
>>>>>>>> Why are you submitting patches you have no way to test?
>>>>>>>
>>>>>>> What?  This is stable tree backporting, why are you trying to make a
>>>>>>> requirement for something that we have never had before?
>>>>>>
>>>>>> I don't think random patches should be sent to stable just because
>>>>>> they appeared in mainline. Plus, I don't think I'm making new rules:
>>>>>>
>>>>>> submit-checklist.rst:
>>>>>>
>>>>>> 13) Has been build- and runtime tested with and without ``CONFIG_SMP``
>>>>>> and
>>>>>>    ``CONFIG_PREEMPT.``
>>>>>>
>>>>>> stable-kernel-rules.rst:
>>>>>>
>>>>>> Rules on what kind of patches are accepted, and which ones are not,
>>>>>> into the "-stable" tree:
>>>>>>
>>>>>> - It must be obviously correct and tested.
>>>>>> - It must fix a real bug that bothers people (not a, "This could be a
>>>>>>   problem..." type thing).
>>>>>
>>>>> So you're saying that this doesn't qualify as a bug?
>>>>>
>>>>>>> This is a backport of a patch that is already upstream.  If it doesn't
>>>>>>> belong in a stable tree, great, let us know that, saying why it is so.
>>>>>>
>>>>>> See jacek.anaszewski@gmail.com 's explanation.
>>>>>
>>>>> I might be missing something, but Jacek suggested I pull another patch
>>>>> before this one?
>>>>
>>>> Just to clarify:
>>>>
>>>> For 4.14 below patches are chosen correctly:
>>>>
>>>> [PATCH AUTOSEL for 4.14 065/110] led: core: Fix brightness setting when
>>>> setting delay_off=0
>>>> [PATCH AUTOSEL for 4.14 094/110] leds: core: Fix regression caused by
>>>> commit 2b83ff96f51d
>>>>
>>>> For 4.9 both above patches are needed preceded by:
>>>>
>>>> eb1610b4c273 ("led: core: Fix blink_brightness setting race")
>>>>
>>>> The issue the patch [PATCH AUTOSEL for 4.14 065/110] fixes was
>>>> introduced in 4.7, and thus it should be removed from the series
>>>> for 3.18 and 4.4.
>>>>
>>>
>>> It seems only "led: core: Fix brightness setting when setting delay_off=0"
>>> was applied to 4.9. Could we get the regression fixes backported to 4.9 as
>>> well?
>>
>> What exact fixes were they?  I'll be glad to apply them if I have a git
>> commit id.
>>
>> thanks,
>>
>> greg k-h
>>
> 
> At least 7b6af2c531 ("leds: core: Fix regression caused by commit
> 2b83ff96f51d") is missing, causing visible regressions (LEDs not working at
> all) on some OpenWrt devices. This was fixed in 4.4.121 by reverting the
> offending commit, but if I followed the discussion correctly, 4.9 should
> get the follow-up commit 7b6af2c531 instead (like 4.14 already did).
> 
> Jacek's mail I replied to mentions that eb1610b4c273 ("led: core: Fix
> blink_brightness setting race") should be included in 4.9 as well, but I
> don't know the impact of the issue it fixes.

It doesn't fix any reported issue, but is just an improvement
aiming at preventing potential races while changing blink brightness.

After taking closer look it turns out that for the patches in question
to apply cleanly we need in 4.9 also a patch which introduces atomic
bit fields for blink flags.

Effectively, here is the list of patches required in 4.9 stable:

Revert "led: core: Fix brightness setting when setting delay_off=0"

followed by:

a9c6ce57ec ("led: core: Use atomic bit-field for the blink-flags")
eb1610b4c2 ("led: core: Fix blink_brightness setting race")
2b83ff96f5 ("led: core: Fix brightness setting when setting delay_off=0")
7b6af2c531 ("leds: core: Fix regression caused by commit 2b83ff96f51d")

-- 
Best regards,
Jacek Anaszewski

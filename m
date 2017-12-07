From: Ben Whitten <ben.whitten@gmail.com>
Subject: Re: [PATCH/RFC v2] leds: trigger: Introduce a NETDEV trigger
Date: Thu, 7 Dec 2017 11:35:45 +0000
Message-ID: <CAF3==it1X9KD+x3t0McS6q1QuLsYjw2rNZK9KcK+5oOaLndEUg@mail.gmail.com>
References: <1512472751-10928-1-git-send-email-ben.whitten@lairdtech.com>
 <6cad314f-3cef-ec74-b55e-cccae28da4ab@gmail.com> <CAF3==iviGYd6q1FSjYarJ46ODgPMUN8dby==02Yk5fHztTdd5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAF3==iviGYd6q1FSjYarJ46ODgPMUN8dby==02Yk5fHztTdd5w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: rpurdie@rpsys.net, pavel@ucw.cz, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 6 December 2017 at 20:07, Ben Whitten <ben.whitten@gmail.com> wrote:
> Hi Jacek,
>
> On 5 December 2017 at 20:38, Jacek Anaszewski
> <jacek.anaszewski@gmail.com> wrote:
>> Hi Ben,
>>
>> On 12/05/2017 12:19 PM, Ben Whitten wrote:
>>> From: Ben Whitten <ben.whitten@gmail.com>
>>>
>>> The patch was converted to led_blink_oneshot, in doing so we find that the
>>> behaviour has changed. As I dont want to break 'userspace' led behaviour this
>>> patch shouldn't be merged as is. Open to suggestions.
>>>
>>> Given an interval of 50ms and heavy throughput, the previous implementation
>>> produced a blink with 100ms period and 50% dutycycle. The led_blink_oneshot
>>> version produces a blink with 140ms period and 57% dutycycle.
>>
>> Please check if the LED class driver you're testing the trigger with
>> implements blink_set op. If yes it would be good to check if it doesn't
>> align the delay intervals to the hardware capabilities instead of
>> failing and relying on a LED core software blink fallback.
>
> The led are using gpio-led set from device tree on an embedded system, sama5
> based. So as far as I can tell blink_op is NULL in this case and it
> then relies on
> software for the blink in the form of timers.
> I assume its the jiffies playing a part here, taking a jiffy or two to
> queue up a flash
> may add 10ms to the desired 50ms delay_on/delay_off that I am seeing. Then the
> extra time may be due to the stats workqueue not aligning with the
> blink timer to
> kick it off again.

I have found a solution. As oneshot appears run in software regardless
based on the
check in led_blink_setup, cancelling the software timer in the stats
worker allows for
an immidiate requeue. This brings the period back down to 110ms and looks
identical to the previous implementation.

Best regards,
Ben

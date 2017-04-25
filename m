From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] led: ledtrig-transient: replace timer_list with hrtimer
Date: Tue, 25 Apr 2017 22:15:18 +0200
Message-ID: <475626da-5fb2-c03c-cdf7-feb42ee6b672@gmail.com>
References: <20170424044254.145192-1-dtwlin@google.com>
 <d6b3d00b-938a-e61e-ce6d-96adacf73396@gmail.com>
 <CAPzFB+U3aLkM7Q2cubdMmtnJp-oCqGKGp2_Q-n2nkbyeh07JgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35235 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1948304AbdDYUQD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 25 Apr 2017 16:16:03 -0400
In-Reply-To: <CAPzFB+U3aLkM7Q2cubdMmtnJp-oCqGKGp2_Q-n2nkbyeh07JgA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: David Lin <dtwlin@google.com>
Cc: rpurdie@rpsys.net, pavel@ucw.cz, robh@kernel.org, Rom Lemarchand <romlem@google.com>, Joel Fernandes <joelaf@google.com>, stable@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi David,

On 04/25/2017 05:05 AM, David Lin wrote:
> Hi Jacek,
> 
> On Mon, Apr 24, 2017 at 12:59 PM, Jacek Anaszewski
> <jacek.anaszewski@gmail.com> wrote:
>>
>> Hi David,
>>
>> Thanks for the patch.
>>
>> Unfortunately we cannot switch to using hr timers just like that
>> without introducing side effects for many devices. We had similar
>> attempt of increasing timer tirgger accuracy two years ago [0].
>>
>> In short words, for drivers that can sleep while setting brightness
>> and/or are using a bus like I2C you will not be able to enforce
>> 1ms delay period.
>>
>> I recommend you to go through the thread [0] so that we had
>> a well defined ground for the discussion on how to address this
>> issue properly.
>>
> 
> I think I understand the background now, and would agree that not all
> the LED driver require hrtimer as human eye can't probably tell
> there's a 10ms variation in a blink.

The main problem are side effects occurring when an event
scheduled by hrtimer can't finish before the next one begins.
We get warnings like in the example below (copied from [0]) then,
and they have probably negative impact on the whole system performance.

echo "timer" > trigger
echo 1 > delay_on
echo 1 > delay_off
echo usec > delay_unit
[  178.584433] hrtimer: interrupt took 300747 ns

> However, there's a need to
> support hrtimer if the LED subsystem claims support the use case of
> vibrator (please see Documentation/leds/ledtrig-transient.txt) as even
> a 5ms of variation is perceivable to the user. I'm thinking if a
> better interim solution is to introduce a
> LEDS_TRIGGER_TRANSIENT_HRTIMER config to work with both timers in
> compile time. Would you agree?

I think that it would be better if LED class driver set a flag
marking itself as capable of setting brightness with high rate.
I'd limit that only to leds-gpio and devices driven through
memory mapped registers.

Having the flag e.g. LED_BRIGHTNESS_FAST, we could add support for
hr timers also to ledtrig-timer.

You can try also the other option mentioned by Pavel in [1].

[1] https://lkml.org/lkml/2017/4/24/881

-- 
Best regards,
Jacek Anaszewski

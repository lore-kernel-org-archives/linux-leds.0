From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] led: ledtrig-transient: replace timer_list with hrtimer
Date: Thu, 27 Apr 2017 20:37:10 +0200
Message-ID: <03dd4ff1-e605-07df-c826-2e13f4620e00@gmail.com>
References: <20170424044254.145192-1-dtwlin@google.com>
 <d6b3d00b-938a-e61e-ce6d-96adacf73396@gmail.com>
 <CAPzFB+U3aLkM7Q2cubdMmtnJp-oCqGKGp2_Q-n2nkbyeh07JgA@mail.gmail.com>
 <475626da-5fb2-c03c-cdf7-feb42ee6b672@gmail.com>
 <CAPzFB+XPO4rW58tksTah1j3mLHOBaLi4EECnNiO5kZqPsT356w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:33983 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1031807AbdD0Sh4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 27 Apr 2017 14:37:56 -0400
In-Reply-To: <CAPzFB+XPO4rW58tksTah1j3mLHOBaLi4EECnNiO5kZqPsT356w@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: David Lin <dtwlin@google.com>
Cc: rpurdie@rpsys.net, pavel@ucw.cz, robh@kernel.org, Rom Lemarchand <romlem@google.com>, Joel Fernandes <joelaf@google.com>, stable@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

On 04/27/2017 05:48 AM, David Lin wrote:
> On Tue, Apr 25, 2017 at 1:15 PM, Jacek Anaszewski
> <jacek.anaszewski@gmail.com> wrote:
>>> However, there's a need to
>>> support hrtimer if the LED subsystem claims support the use case of
>>> vibrator (please see Documentation/leds/ledtrig-transient.txt) as even
>>> a 5ms of variation is perceivable to the user. I'm thinking if a
>>> better interim solution is to introduce a
>>> LEDS_TRIGGER_TRANSIENT_HRTIMER config to work with both timers in
>>> compile time. Would you agree?
>>
>> I think that it would be better if LED class driver set a flag
>> marking itself as capable of setting brightness with high rate.
>> I'd limit that only to leds-gpio and devices driven through
>> memory mapped registers.
>>
>> Having the flag e.g. LED_BRIGHTNESS_FAST, we could add support for
>> hr timers also to ledtrig-timer.
> 
> Can I resubmit the patch implementing LED_BRIGHTNESS_FAST using hrtimer?

Yeah, but please split the changes into two patches:

1/2 - addition of a flag to linux/leds.h and corresponding update of
      Documentation/leds/leds-class.txt
2/2 - addition of hr timer support to ledtrig-transient.c

-- 
Best regards,
Jacek Anaszewski

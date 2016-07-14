From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [patch V2 43/67] leds/trigger/cpu: Convert to hotplug state machine
Date: Thu, 14 Jul 2016 13:23:44 +0200
Message-ID: <57877640.4020004@samsung.com>
References: <20160713153219.128052238@linutronix.de>
 <20160713153336.465496902@linutronix.de> <57873CFF.1010803@samsung.com>
 <20160714074713.GA17287@gmail.com> <5787490F.5000105@samsung.com>
 <20160714094154.GY30154@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:19048 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750739AbcGNLXt (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 14 Jul 2016 07:23:49 -0400
In-reply-to: <20160714094154.GY30154@twins.programming.kicks-ass.net>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Anna-Maria Gleixner <anna-maria@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, rt@linutronix.de, Richard Cochran <rcochran@linutronix.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

On 07/14/2016 11:41 AM, Peter Zijlstra wrote:
> On Thu, Jul 14, 2016 at 10:10:55AM +0200, Jacek Anaszewski wrote:
>> On 07/14/2016 09:47 AM, Ingo Molnar wrote:
>>>
>>> * Jacek Anaszewski <j.anaszewski@samsung.com> wrote:
>>>
>>>>> @@ -133,7 +125,13 @@ static int __init ledtrig_cpu_init(void)
>>>>>        }
>>>>>
>>>>>        register_syscore_ops(&ledtrig_cpu_syscore_ops);
>>>>> -     register_cpu_notifier(&ledtrig_cpu_nb);
>>>>> +
>>>>> +     /*
>>>>> +      * FIXME: Why needs this to happen in the interrupt disabled
>>>>> +      * low level bringup phase of a cpu?
>>>>> +      */
>
>> Thanks for the explanation. I'm OK with that approach.
>
> Since we have your attention, could you perhaps attempt to answer the
> question so we can fix the fixme?
>

This is the way how all led triggers are being registered.

Once a trigger module is loaded it needs to be registered in
the LED Trigger core.

-- 
Best regards,
Jacek Anaszewski

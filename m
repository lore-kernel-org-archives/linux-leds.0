From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [patch V2 43/67] leds/trigger/cpu: Convert to hotplug state machine
Date: Thu, 14 Jul 2016 10:10:55 +0200
Message-ID: <5787490F.5000105@samsung.com>
References: <20160713153219.128052238@linutronix.de>
 <20160713153336.465496902@linutronix.de> <57873CFF.1010803@samsung.com>
 <20160714074713.GA17287@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:64224 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750923AbcGNILA (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 14 Jul 2016 04:11:00 -0400
In-reply-to: <20160714074713.GA17287@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ingo Molnar <mingo@kernel.org>
Cc: Anna-Maria Gleixner <anna-maria@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, rt@linutronix.de, Richard Cochran <rcochran@linutronix.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

On 07/14/2016 09:47 AM, Ingo Molnar wrote:
>
> * Jacek Anaszewski <j.anaszewski@samsung.com> wrote:
>
>>> @@ -133,7 +125,13 @@ static int __init ledtrig_cpu_init(void)
>>>        }
>>>
>>>        register_syscore_ops(&ledtrig_cpu_syscore_ops);
>>> -     register_cpu_notifier(&ledtrig_cpu_nb);
>>> +
>>> +     /*
>>> +      * FIXME: Why needs this to happen in the interrupt disabled
>>> +      * low level bringup phase of a cpu?
>>> +      */
>>
>> Why wasn't it possible to clarify the issue before the
>> submission?
>
> Nothing has been applied yet (this submission is part of the clarification
> process), are you fine with this conversion as-is, with a separate patch doing any
> followup fixes - or would you prefer another approach?
>
> This CPU hotplug series tries to do straightforward conversions to the CPU hotplug
> state machine without changing behavior - while pointing out any problems that
> were found along the way.
>
> I agree that the addition of this FIXME should probably have been pointed out in
> the changelog as well, but this patch was submitted once already with no feedback
> received - and that's the historic pattern with such types of series: only a low
> percentage of all driver maintainers replies so we have to be proactive to a
> certain degree to have a chance of improving core kernel infrastructure. It's
> better to add FIXMEs with open questions that to introduce subtle problems.

Thanks for the explanation. I'm OK with that approach.

Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>

-- 
Best regards,
Jacek Anaszewski

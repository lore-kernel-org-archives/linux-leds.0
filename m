From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [patch V2 43/67] leds/trigger/cpu: Convert to hotplug state machine
Date: Mon, 18 Jul 2016 10:26:36 +0200
Message-ID: <578C92BC.2070603@samsung.com>
References: <20160713153219.128052238@linutronix.de>
 <20160713153336.465496902@linutronix.de> <57873CFF.1010803@samsung.com>
 <20160714074713.GA17287@gmail.com> <5787490F.5000105@samsung.com>
 <20160714094154.GY30154@twins.programming.kicks-ass.net>
 <57877640.4020004@samsung.com> <alpine.DEB.2.11.1607141331390.19117@nanos>
 <57877DAE.8080401@samsung.com> <20160715141026.GA16938@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20160715141026.GA16938@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Anna-Maria Gleixner <anna-maria@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, rt@linutronix.de, Richard Cochran <rcochran@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>
List-Id: linux-leds@vger.kernel.org

Hi Sebastian,

On 07/15/2016 04:10 PM, Sebastian Andrzej Siewior wrote:
> * Jacek Anaszewski | 2016-07-14 13:55:26 [+0200]:
>
>> On 07/14/2016 01:33 PM, Thomas Gleixner wrote:
>>> That does not explain WHY this needs to happen in the low level bringup phase
>>> of the CPU with interrupts disabled and can't be done from the normal ONLINE
>>> callbacks in thread context.
>>
>> It was before my time in kernel, so I can only suppose that it was
>> the easiest way. Does it introduce some problems?
>
> It was introduced by Pawel Moll in fba14ae8e924 ("ledtrig-cpu: Handle
> CPU hot(un)plugging"). It does not introduce any problems but those
> bring up / bring down levels are usually used by the core code. This
> does not look like it needs to be done _that_ early or late during the
> removal / addition of a CPU to the system.
>
> Which means this looks like it could be moved to CPU_ONLINE /
> CPU_DOWN_PREPARE which in turns means we could use dynamic IDs instead
> of those hardcoded ones since the LED subsystem does not depend on other
> components.

 From the LED subsystem perspective I don't see any particular reason
for which it couldn't be accomplished from the ONLINE callbacks.

-- 
Best regards,
Jacek Anaszewski

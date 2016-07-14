From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [patch V2 43/67] leds/trigger/cpu: Convert to hotplug state machine
Date: Thu, 14 Jul 2016 09:19:27 +0200
Message-ID: <57873CFF.1010803@samsung.com>
References: <20160713153219.128052238@linutronix.de>
 <20160713153336.465496902@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:35730 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750739AbcGNHTd (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 14 Jul 2016 03:19:33 -0400
In-reply-to: <20160713153336.465496902@linutronix.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Anna-Maria Gleixner <anna-maria@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, rt@linutronix.de, Richard Cochran <rcochran@linutronix.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

Hi Anna,

On 07/13/2016 07:16 PM, Anna-Maria Gleixner wrote:

 > -------- Original Message --------
 > Subject: [patch V2 43/67] leds/trigger/cpu: Convert to hotplug state 
machine
 > Date: Wed, 13 Jul 2016 17:16:45 +0000
 > From: Anna-Maria Gleixner <anna-maria@linutronix.de>
 > To: LKML <linux-kernel@vger.kernel.org>
 > CC: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar 
<mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
rt@linutronix.de, Richard Cochran <rcochran@linutronix.de>, Sebastian 
Andrzej Siewior <bigeasy@linutronix.de>, Jacek Anaszewski 
<j.anaszewski@samsung.com>, Linus Torvalds 
<torvalds@linux-foundation.org>, Linus Walleij 
<linus.walleij@linaro.org>, Paul Gortmaker 
<paul.gortmaker@windriver.com>, Richard Purdie <rpurdie@rpsys.net>, 
linux-leds@vger.kernel.org, Anna-Maria Gleixner <anna-maria@linutronix.de>
 >
 > From: Richard Cochran <rcochran@linutronix.de>
 >
 > This is a straightforward conversion. We place this callback last
 > in the list so that the LED illuminates only after a successful
 > bring up sequence.
 >
 > Signed-off-by: Richard Cochran <rcochran@linutronix.de>
 > Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
 > Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
 > Cc: Linus Torvalds <torvalds@linux-foundation.org>
 > Cc: Linus Walleij <linus.walleij@linaro.org>
 > Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
 > Cc: Peter Zijlstra <peterz@infradead.org>
 > Cc: Richard Purdie <rpurdie@rpsys.net>
 > Cc: Thomas Gleixner <tglx@linutronix.de>
 > Cc: linux-leds@vger.kernel.org
 > Signed-off-by: Anna-Maria Gleixner <anna-maria@linutronix.de>
 > ---
 >  drivers/leds/trigger/ledtrig-cpu.c | 32 +++++++++++++++-----------------
 >  include/linux/cpuhotplug.h         |  1 +
 >  2 files changed, 16 insertions(+), 17 deletions(-)
 >
 > diff --git a/drivers/leds/trigger/ledtrig-cpu.c 
b/drivers/leds/trigger/ledtrig-cpu.c
 > index 938467f..4a6a182 100644
 > --- a/drivers/leds/trigger/ledtrig-cpu.c
 > +++ b/drivers/leds/trigger/ledtrig-cpu.c
 > @@ -92,25 +92,17 @@ static struct syscore_ops ledtrig_cpu_syscore_ops = {
 >       .resume         = ledtrig_cpu_syscore_resume,
 >  };
 >
 > -static int ledtrig_cpu_notify(struct notifier_block *self,
 > -                                        unsigned long action, void 
*hcpu)
 > +static int ledtrig_starting_cpu(unsigned int cpu)
 >  {
 > -     switch (action & ~CPU_TASKS_FROZEN) {
 > -     case CPU_STARTING:
 > -             ledtrig_cpu(CPU_LED_START);
 > -             break;
 > -             break;
 > -     }
 > -
 > -     return NOTIFY_OK;
 > +     ledtrig_cpu(CPU_LED_START);
 > +     return 0;
 >  }
 >
 > -
 > -static struct notifier_block ledtrig_cpu_nb = {
 > -     .notifier_call = ledtrig_cpu_notify,
 > -};
 > +static int ledtrig_dying_cpu(unsigned int cpu)
 > +{
 > +     ledtrig_cpu(CPU_LED_STOP);
 > +     return 0;
 > +}
 >
 >  static int __init ledtrig_cpu_init(void)
 >  {
 > @@ -133,7 +125,13 @@ static int __init ledtrig_cpu_init(void)
 >       }
 >
 >       register_syscore_ops(&ledtrig_cpu_syscore_ops);
 > -     register_cpu_notifier(&ledtrig_cpu_nb);
 > +
 > +     /*
 > +      * FIXME: Why needs this to happen in the interrupt disabled
 > +      * low level bringup phase of a cpu?
 > +      */

Why wasn't it possible to clarify the issue before the
submission?

 > +     cpuhp_setup_state(CPUHP_AP_LEDTRIG_STARTING, "AP_LEDTRIG_STARTING",
 > +                       ledtrig_starting_cpu, ledtrig_dying_cpu);
 >
 >       pr_info("ledtrig-cpu: registered to indicate activity on CPUs\n");
 >
 > diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
 > index c052b04..ef7bfa6 100644
 > --- a/include/linux/cpuhotplug.h
 > +++ b/include/linux/cpuhotplug.h
 > @@ -43,6 +43,7 @@ enum cpuhp_state {
 >       CPUHP_AP_QCOM_TIMER_STARTING,
 >       CPUHP_AP_MIPS_GIC_TIMER_STARTING,
 >       CPUHP_AP_KVM_STARTING,
 > +     CPUHP_AP_LEDTRIG_STARTING,
 >       CPUHP_AP_NOTIFY_STARTING,
 >       CPUHP_AP_ONLINE,
 >       CPUHP_TEARDOWN_CPU,
 > --


-- 
Best regards,
Jacek Anaszewski

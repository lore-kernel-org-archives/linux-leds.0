From: Anna-Maria Gleixner <anna-maria@linutronix.de>
Subject: [patch 46/66] leds: trigger: cpu: Convert to hotplug state machine
Date: Mon, 11 Jul 2016 12:28:55 -0000
Message-ID: <20160711122534.517251620@linutronix.de>
References: <20160711122450.923603742@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:57453 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933950AbcGKMbR (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 11 Jul 2016 08:31:17 -0400
Content-Disposition: inline;
 filename=0046-leds-trigger-cpu-Convert-to-hotplug-state-machine.patch
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Richard Cochran <rcochran@linutronix.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, Anna-Maria Gleixner <anna-maria@linutronix.de>

From: Richard Cochran <rcochran@linutronix.de>

This is a straightforward conversion. We place this callback last
in the list so that the LED illuminates only after a successful
bring up sequence.

Signed-off-by: Richard Cochran <rcochran@linutronix.de>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Anna-Maria Gleixner <anna-maria@linutronix.de>
---
 drivers/leds/trigger/ledtrig-cpu.c |   32 +++++++++++++++-----------------
 include/linux/cpuhotplug.h         |    1 +
 2 files changed, 16 insertions(+), 17 deletions(-)

--- a/drivers/leds/trigger/ledtrig-cpu.c
+++ b/drivers/leds/trigger/ledtrig-cpu.c
@@ -92,25 +92,17 @@ static struct syscore_ops ledtrig_cpu_sy
 	.resume		= ledtrig_cpu_syscore_resume,
 };
 
-static int ledtrig_cpu_notify(struct notifier_block *self,
-					   unsigned long action, void *hcpu)
+static int ledtrig_starting_cpu(unsigned int cpu)
 {
-	switch (action & ~CPU_TASKS_FROZEN) {
-	case CPU_STARTING:
-		ledtrig_cpu(CPU_LED_START);
-		break;
-	case CPU_DYING:
-		ledtrig_cpu(CPU_LED_STOP);
-		break;
-	}
-
-	return NOTIFY_OK;
+	ledtrig_cpu(CPU_LED_START);
+	return 0;
 }
 
-
-static struct notifier_block ledtrig_cpu_nb = {
-	.notifier_call = ledtrig_cpu_notify,
-};
+static int ledtrig_dying_cpu(unsigned int cpu)
+{
+	ledtrig_cpu(CPU_LED_STOP);
+	return 0;
+}
 
 static int __init ledtrig_cpu_init(void)
 {
@@ -133,7 +125,13 @@ static int __init ledtrig_cpu_init(void)
 	}
 
 	register_syscore_ops(&ledtrig_cpu_syscore_ops);
-	register_cpu_notifier(&ledtrig_cpu_nb);
+
+	/*
+	 * FIXME: Why needs this to happen in the interrupt disabled
+	 * low level bringup phase of a cpu?
+	 */
+	cpuhp_setup_state(CPUHP_AP_LEDTRIG_STARTING, "AP_LEDTRIG_STARTING",
+			  ledtrig_starting_cpu, ledtrig_dying_cpu);
 
 	pr_info("ledtrig-cpu: registered to indicate activity on CPUs\n");
 
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -47,6 +47,7 @@ enum cpuhp_state {
 	CPUHP_AP_MARCO_TIMER_STARTING,
 	CPUHP_AP_MIPS_GIC_TIMER_STARTING,
 	CPUHP_AP_KVM_STARTING,
+	CPUHP_AP_LEDTRIG_STARTING,
 	CPUHP_AP_NOTIFY_STARTING,
 	CPUHP_AP_ONLINE,
 	CPUHP_TEARDOWN_CPU,

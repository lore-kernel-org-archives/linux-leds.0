From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH] leds/trigger/cpu: move from CPU_STARTING to ONLINE level
Date: Wed, 20 Jul 2016 17:24:55 +0200
Message-ID: <1469028295-14702-1-git-send-email-bigeasy@linutronix.de>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:59564 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753271AbcGTPZd (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 20 Jul 2016 11:25:33 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: mingo@kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Jacek Anaszewski <j.anaszewski@samsung.com>, Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Peter Zijlstra <peterz@infradead.org>, Richard Purdie <rpurdie@rpsys.net>, Thomas Gleixner <tglx@linutronix.de>, linux-leds@vger.kernel.org, rt@linutronix.de

There is no need the ledtriger to be called *that* early in the hotplug
process (+ with disabled interrupts). As explained by Jacek Anaszewski [0]
there is no need for it.
Therefore this patch moves it to the ONLINE/PREPARE_DOWN level using the
dynamic registration for the id.

[0] https://lkml.kernel.org/r/578C92BC.2070603@samsung.com

Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-leds@vger.kernel.org
Cc: rt@linutronix.de
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/leds/trigger/ledtrig-cpu.c | 16 ++++++++--------
 include/linux/cpuhotplug.h         |  1 -
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-cpu.c b/drivers/leds/trigger/ledtrig-cpu.c
index 4a6a182d0a88..22f0634dd3fa 100644
--- a/drivers/leds/trigger/ledtrig-cpu.c
+++ b/drivers/leds/trigger/ledtrig-cpu.c
@@ -92,13 +92,13 @@ static struct syscore_ops ledtrig_cpu_syscore_ops = {
 	.resume		= ledtrig_cpu_syscore_resume,
 };
 
-static int ledtrig_starting_cpu(unsigned int cpu)
+static int ledtrig_online_cpu(unsigned int cpu)
 {
 	ledtrig_cpu(CPU_LED_START);
 	return 0;
 }
 
-static int ledtrig_dying_cpu(unsigned int cpu)
+static int ledtrig_prepare_down_cpu(unsigned int cpu)
 {
 	ledtrig_cpu(CPU_LED_STOP);
 	return 0;
@@ -107,6 +107,7 @@ static int ledtrig_dying_cpu(unsigned int cpu)
 static int __init ledtrig_cpu_init(void)
 {
 	int cpu;
+	int ret;
 
 	/* Supports up to 9999 cpu cores */
 	BUILD_BUG_ON(CONFIG_NR_CPUS > 9999);
@@ -126,12 +127,11 @@ static int __init ledtrig_cpu_init(void)
 
 	register_syscore_ops(&ledtrig_cpu_syscore_ops);
 
-	/*
-	 * FIXME: Why needs this to happen in the interrupt disabled
-	 * low level bringup phase of a cpu?
-	 */
-	cpuhp_setup_state(CPUHP_AP_LEDTRIG_STARTING, "AP_LEDTRIG_STARTING",
-			  ledtrig_starting_cpu, ledtrig_dying_cpu);
+	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "AP_LEDTRIG_STARTING",
+				ledtrig_online_cpu, ledtrig_prepare_down_cpu);
+	if (ret < 0)
+		pr_err("CPU hotplug notifier for ledtrig-cpu could not be registered: %d\n",
+		       ret);
 
 	pr_info("ledtrig-cpu: registered to indicate activity on CPUs\n");
 
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 09ef54bcba39..282800b42627 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -65,7 +65,6 @@ enum cpuhp_state {
 	CPUHP_AP_ARM_CORESIGHT_STARTING,
 	CPUHP_AP_ARM_CORESIGHT4_STARTING,
 	CPUHP_AP_ARM64_ISNDEP_STARTING,
-	CPUHP_AP_LEDTRIG_STARTING,
 	CPUHP_AP_SMPCFD_DYING,
 	CPUHP_AP_X86_TBOOT_DYING,
 	CPUHP_AP_NOTIFY_STARTING,
-- 
2.8.1

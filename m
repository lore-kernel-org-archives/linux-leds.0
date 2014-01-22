From: Pawel Moll <pawel.moll@arm.com>
Subject: [PATCH] ledtrig-cpu: Handle CPU hot(un)plugging
Date: Wed, 22 Jan 2014 16:32:02 +0000
Message-ID: <1390408322-1284-1-git-send-email-pawel.moll@arm.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from fw-tnat.austin.arm.com ([217.140.110.23]:58725 "EHLO
	collaborate-mta1.arm.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751379AbaAVQcI (ORCPT
	<rfc822;linux-leds@vger.kernel.org>);
	Wed, 22 Jan 2014 11:32:08 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, Pawel Moll <pawel.moll@arm.com>

When CPU is hot(un)plugged, no syscore notification is being
generated, nor is cpuidle involved. This leaves the CPU LED
turned on, because the dying thread is doing some work (LED on)
and than it is... well, dying (LED still on :-)

Added notifier block for hot(un)plugging operations, generating
existing trigger events.

Signed-off-by: Pawel Moll <pawel.moll@arm.com>
---
 drivers/leds/trigger/ledtrig-cpu.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-cpu.c b/drivers/leds/trigger/ledtrig-cpu.c
index 118335e..1c3ee9f 100644
--- a/drivers/leds/trigger/ledtrig-cpu.c
+++ b/drivers/leds/trigger/ledtrig-cpu.c
@@ -26,6 +26,7 @@
 #include <linux/percpu.h>
 #include <linux/syscore_ops.h>
 #include <linux/rwsem.h>
+#include <linux/cpu.h>
 #include "../leds.h"
 
 #define MAX_NAME_LEN	8
@@ -92,6 +93,26 @@ static struct syscore_ops ledtrig_cpu_syscore_ops = {
 	.resume		= ledtrig_cpu_syscore_resume,
 };
 
+static int ledtrig_cpu_notify(struct notifier_block *self,
+					   unsigned long action, void *hcpu)
+{
+	switch (action & ~CPU_TASKS_FROZEN) {
+	case CPU_STARTING:
+		ledtrig_cpu(CPU_LED_START);
+		break;
+	case CPU_DYING:
+		ledtrig_cpu(CPU_LED_STOP);
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+
+static struct notifier_block ledtrig_cpu_nb = {
+	.notifier_call = ledtrig_cpu_notify,
+};
+
 static int __init ledtrig_cpu_init(void)
 {
 	int cpu;
@@ -113,6 +134,7 @@ static int __init ledtrig_cpu_init(void)
 	}
 
 	register_syscore_ops(&ledtrig_cpu_syscore_ops);
+	register_cpu_notifier(&ledtrig_cpu_nb);
 
 	pr_info("ledtrig-cpu: registered to indicate activity on CPUs\n");
 
@@ -124,6 +146,8 @@ static void __exit ledtrig_cpu_exit(void)
 {
 	int cpu;
 
+	unregister_cpu_notifier(&ledtrig_cpu_nb);
+
 	for_each_possible_cpu(cpu) {
 		struct led_trigger_cpu *trig = &per_cpu(cpu_trig, cpu);
 
-- 
1.8.3.2

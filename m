From: Paulo Costa <me@paulo.costa.nom.br>
Subject: [PATCH v2] leds/trigger/cpu: Add LED trigger for all CPUs aggregated
Date: Thu,  9 Feb 2017 21:07:35 -0200
Message-ID: <20170209230735.27007-1-me@paulo.costa.nom.br>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:33052 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751301AbdBIXKG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Feb 2017 18:10:06 -0500
Received: by mail-qk0-f195.google.com with SMTP id 11so2813951qkl.0
        for <linux-leds@vger.kernel.org>; Thu, 09 Feb 2017 15:09:27 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, Richard Purdie <rpurdie@rpsys.net>
Cc: Paulo Costa <me@paulo.costa.nom.br>

Currently there is one CPU led trigger per cpu ('cpu0', 'cpu1', ...)

This patch adds a new trigger, 'cpu', with brightness proportional to
the number of active CPUs.

If multiple brightness levels aren't supported on the LED,
it effectively indicates if there is any CPU active.

This is particularly useful on tiny linux boards with more CPU cores than LED pins.

Signed-off-by: Paulo Costa <me@paulo.costa.nom.br>
CC: Pavel Machek <pavel@ucw.cz>
---
v2:
* Fix concurrency issues during initialization
* Round up the division
---
 drivers/leds/trigger/ledtrig-cpu.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-cpu.c b/drivers/leds/trigger/ledtrig-cpu.c
index 22f0634..06ec733 100644
--- a/drivers/leds/trigger/ledtrig-cpu.c
+++ b/drivers/leds/trigger/ledtrig-cpu.c
@@ -31,12 +31,16 @@
 #define MAX_NAME_LEN	8
 
 struct led_trigger_cpu {
+	bool is_active;
 	char name[MAX_NAME_LEN];
 	struct led_trigger *_trig;
 };
 
 static DEFINE_PER_CPU(struct led_trigger_cpu, cpu_trig);
 
+static struct led_trigger *trig_cpu_all;
+static atomic_t num_active_cpus = ATOMIC_INIT(0);
+
 /**
  * ledtrig_cpu - emit a CPU event as a trigger
  * @evt: CPU event to be emitted
@@ -47,26 +51,46 @@ static DEFINE_PER_CPU(struct led_trigger_cpu, cpu_trig);
 void ledtrig_cpu(enum cpu_led_event ledevt)
 {
 	struct led_trigger_cpu *trig = this_cpu_ptr(&cpu_trig);
+	bool is_active = trig->is_active;
 
 	/* Locate the correct CPU LED */
 	switch (ledevt) {
 	case CPU_LED_IDLE_END:
 	case CPU_LED_START:
 		/* Will turn the LED on, max brightness */
-		led_trigger_event(trig->_trig, LED_FULL);
+		is_active = true;
 		break;
 
 	case CPU_LED_IDLE_START:
 	case CPU_LED_STOP:
 	case CPU_LED_HALTED:
 		/* Will turn the LED off */
-		led_trigger_event(trig->_trig, LED_OFF);
+		is_active = false;
 		break;
 
 	default:
 		/* Will leave the LED as it is */
 		break;
 	}
+
+	if (is_active != trig->is_active) {
+		unsigned int active_cpus;
+		unsigned int total_cpus;
+
+		/* Update trigger state */
+		trig->is_active = is_active;
+		atomic_add(is_active ? 1 : -1, &num_active_cpus);
+		active_cpus = atomic_read(&num_active_cpus);
+		total_cpus = num_present_cpus();
+
+		led_trigger_event(trig->_trig,
+			is_active ? LED_FULL : LED_OFF);
+
+
+		led_trigger_event(trig_cpu_all,
+			DIV_ROUND_UP(LED_FULL * active_cpus, total_cpus));
+
+	}
 }
 EXPORT_SYMBOL(ledtrig_cpu);
 
@@ -113,6 +137,11 @@ static int __init ledtrig_cpu_init(void)
 	BUILD_BUG_ON(CONFIG_NR_CPUS > 9999);
 
 	/*
+	 * Registering a trigger for all CPUs.
+	 */
+	led_trigger_register_simple("cpu", &trig_cpu_all);
+
+	/*
 	 * Registering CPU led trigger for each CPU core here
 	 * ignores CPU hotplug, but after this CPU hotplug works
 	 * fine with this trigger.
-- 
2.9.3

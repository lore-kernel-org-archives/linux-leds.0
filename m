From: Paulo Costa <me@paulo.costa.nom.br>
Subject: [PATCH] leds/trigger/cpu: Add LED trigger for all CPUs aggregated
Date: Tue,  7 Feb 2017 22:02:39 -0200
Message-ID: <20170208000239.29152-1-me@paulo.costa.nom.br>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:36178 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754240AbdBHADO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Feb 2017 19:03:14 -0500
Received: by mail-qt0-f194.google.com with SMTP id h53so21182615qth.3
        for <linux-leds@vger.kernel.org>; Tue, 07 Feb 2017 16:03:14 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Pavel Machek <pavel@ucw.cz>
Cc: Paulo Costa <me@paulo.costa.nom.br>

Currently there is one CPU led trigger per cpu ('cpu0', 'cpu1', ...)

This patch adds a new trigger, 'cpu', with brightness proportional to
 the number of active CPUs.

If multiple brightness levels aren't supported on the LED,
it effectively indicates if there is any CPU active.

This is particularly useful on tiny linux boards with more CPU cores than LED pins.

Signed-off-by: Paulo Costa <me@paulo.costa.nom.br>
---
 drivers/leds/trigger/ledtrig-cpu.c | 40 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-cpu.c b/drivers/leds/trigger/ledtrig-cpu.c
index 22f0634..3b171ce 100644
--- a/drivers/leds/trigger/ledtrig-cpu.c
+++ b/drivers/leds/trigger/ledtrig-cpu.c
@@ -31,12 +31,22 @@
 #define MAX_NAME_LEN	8
 
 struct led_trigger_cpu {
+	bool cpu_is_active;
 	char name[MAX_NAME_LEN];
 	struct led_trigger *_trig;
 };
 
 static DEFINE_PER_CPU(struct led_trigger_cpu, cpu_trig);
 
+struct led_trigger_cpu_all {
+	atomic_t num_active;
+	struct led_trigger *_trig;
+};
+
+static struct led_trigger_cpu_all all_trig;
+
+static bool ledtrig_cpu_initialized;
+
 /**
  * ledtrig_cpu - emit a CPU event as a trigger
  * @evt: CPU event to be emitted
@@ -47,26 +57,44 @@ static DEFINE_PER_CPU(struct led_trigger_cpu, cpu_trig);
 void ledtrig_cpu(enum cpu_led_event ledevt)
 {
 	struct led_trigger_cpu *trig = this_cpu_ptr(&cpu_trig);
+	bool is_active = trig->cpu_is_active;
+
+	/* Ignore if this is being called before initialization. */
+	if (!ledtrig_cpu_initialized)
+		return;
 
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
+	if (is_active != trig->cpu_is_active) {
+		// Update trigger state
+		trig->cpu_is_active = is_active;
+		atomic_add(is_active ? 1 : -1, &all_trig.num_active);
+
+		led_trigger_event(all_trig._trig,
+			LED_FULL * atomic_read(&all_trig.num_active) /
+			num_present_cpus());
+
+		led_trigger_event(trig->_trig,
+			is_active ? LED_FULL : LED_OFF);
+	}
 }
 EXPORT_SYMBOL(ledtrig_cpu);
 
@@ -113,6 +141,12 @@ static int __init ledtrig_cpu_init(void)
 	BUILD_BUG_ON(CONFIG_NR_CPUS > 9999);
 
 	/*
+	 * Registering a trigger for all CPUs.
+	 */
+	atomic_set(&all_trig.num_active, 0);
+	led_trigger_register_simple("cpu", &all_trig._trig);
+
+	/*
 	 * Registering CPU led trigger for each CPU core here
 	 * ignores CPU hotplug, but after this CPU hotplug works
 	 * fine with this trigger.
@@ -120,6 +154,7 @@ static int __init ledtrig_cpu_init(void)
 	for_each_possible_cpu(cpu) {
 		struct led_trigger_cpu *trig = &per_cpu(cpu_trig, cpu);
 
+		trig->cpu_is_active = false;
 		snprintf(trig->name, MAX_NAME_LEN, "cpu%d", cpu);
 
 		led_trigger_register_simple(trig->name, &trig->_trig);
@@ -135,6 +170,7 @@ static int __init ledtrig_cpu_init(void)
 
 	pr_info("ledtrig-cpu: registered to indicate activity on CPUs\n");
 
+	ledtrig_cpu_initialized = true;
 	return 0;
 }
 device_initcall(ledtrig_cpu_init);
-- 
2.9.3

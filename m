From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH] leds: trigger: Fix sleeping function called from invalid context
Date: Wed,  7 Nov 2018 13:42:58 +0800
Message-ID: <5f1cfb9c87f591b12efa2e7a0063f15532649634.1541563908.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: rteysseyre@gmail.com, baolin.wang@linaro.org, broonie@kernel.org, geert@linux-m68k.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

We will meet below issue due to mutex_lock() is called in interrupt context.
The mutex lock is used to protect the pattern trigger data, but before changing
new pattern trigger data (pattern values or repeat value) by users, we always
cancel the timer firstly to clear previous patterns' performance. That means
there is no race in pattern_trig_timer_function(), so we can drop the mutex
lock in pattern_trig_timer_function() to avoid this issue.

Moreover we can move the timer cancelling into mutex protection, since there
is no deadlock risk if we remove the mutex lock in pattern_trig_timer_function().

BUG: sleeping function called from invalid context at kernel/locking/mutex.c:254
in_atomic(): 1, irqs_disabled(): 0, pid: 0, name: swapper/1
CPU: 1 PID: 0 Comm: swapper/1 Not tainted
4.20.0-rc1-koelsch-00841-ga338c8181013c1a9 #171
Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
[<c020f19c>] (unwind_backtrace) from [<c020aecc>] (show_stack+0x10/0x14)
[<c020aecc>] (show_stack) from [<c07affb8>] (dump_stack+0x7c/0x9c)
[<c07affb8>] (dump_stack) from [<c02417d4>] (___might_sleep+0xf4/0x158)
[<c02417d4>] (___might_sleep) from [<c07c92c4>] (mutex_lock+0x18/0x60)
[<c07c92c4>] (mutex_lock) from [<c067b28c>] (pattern_trig_timer_function+0x1c/0x11c)
[<c067b28c>] (pattern_trig_timer_function) from [<c027f6fc>] (call_timer_fn+0x1c/0x90)
[<c027f6fc>] (call_timer_fn) from [<c027f944>] (expire_timers+0x94/0xa4)
[<c027f944>] (expire_timers) from [<c027fc98>] (run_timer_softirq+0x108/0x15c)
[<c027fc98>] (run_timer_softirq) from [<c02021cc>] (__do_softirq+0x1d4/0x258)
[<c02021cc>] (__do_softirq) from [<c0224d24>] (irq_exit+0x64/0xc4)
[<c0224d24>] (irq_exit) from [<c0268dd0>] (__handle_domain_irq+0x80/0xb4)
[<c0268dd0>] (__handle_domain_irq) from [<c045e1b0>] (gic_handle_irq+0x58/0x90)
[<c045e1b0>] (gic_handle_irq) from [<c02019f8>] (__irq_svc+0x58/0x74)
Exception stack(0xeb483f60 to 0xeb483fa8)
3f60: 00000000 00000000 eb9afaa0 c0217e80 00000000 ffffe000 00000000 c0e06408
3f80: 00000002 c0e0647c c0c6a5f0 00000000 c0e04900 eb483fb0 c0207ea8 c0207e98
3fa0: 60020013 ffffffff
[<c02019f8>] (__irq_svc) from [<c0207e98>] (arch_cpu_idle+0x1c/0x38)
[<c0207e98>] (arch_cpu_idle) from [<c0247ca8>] (do_idle+0x138/0x268)
[<c0247ca8>] (do_idle) from [<c0248050>] (cpu_startup_entry+0x18/0x1c)
[<c0248050>] (cpu_startup_entry) from [<402022ec>] (0x402022ec)

Fixes: 5fd752b6b3a2 ("leds: core: Introduce LED pattern trigger")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/leds/trigger/ledtrig-pattern.c |   20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-pattern.c b/drivers/leds/trigger/ledtrig-pattern.c
index 174a298..1870cf8 100644
--- a/drivers/leds/trigger/ledtrig-pattern.c
+++ b/drivers/leds/trigger/ledtrig-pattern.c
@@ -75,8 +75,6 @@ static void pattern_trig_timer_function(struct timer_list *t)
 {
 	struct pattern_trig_data *data = from_timer(data, t, timer);
 
-	mutex_lock(&data->lock);
-
 	for (;;) {
 		if (!data->is_indefinite && !data->repeat)
 			break;
@@ -117,8 +115,6 @@ static void pattern_trig_timer_function(struct timer_list *t)
 
 		break;
 	}
-
-	mutex_unlock(&data->lock);
 }
 
 static int pattern_trig_start_pattern(struct led_classdev *led_cdev)
@@ -177,14 +173,10 @@ static ssize_t repeat_store(struct device *dev, struct device_attribute *attr,
 	if (res < -1 || res == 0)
 		return -EINVAL;
 
-	/*
-	 * Clear previous patterns' performence firstly, and remove the timer
-	 * without mutex lock to avoid dead lock.
-	 */
-	del_timer_sync(&data->timer);
-
 	mutex_lock(&data->lock);
 
+	del_timer_sync(&data->timer);
+
 	if (data->is_hw_pattern)
 		led_cdev->pattern_clear(led_cdev);
 
@@ -235,14 +227,10 @@ static ssize_t pattern_trig_store_patterns(struct led_classdev *led_cdev,
 	struct pattern_trig_data *data = led_cdev->trigger_data;
 	int ccount, cr, offset = 0, err = 0;
 
-	/*
-	 * Clear previous patterns' performence firstly, and remove the timer
-	 * without mutex lock to avoid dead lock.
-	 */
-	del_timer_sync(&data->timer);
-
 	mutex_lock(&data->lock);
 
+	del_timer_sync(&data->timer);
+
 	if (data->is_hw_pattern)
 		led_cdev->pattern_clear(led_cdev);
 
-- 
1.7.9.5

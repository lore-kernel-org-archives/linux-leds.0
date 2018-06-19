From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] [v2] leds: ledtrig-activity: use ktime_get_boot_ns()
Date: Tue, 19 Jun 2018 10:18:56 +0200
Message-ID: <20180619082215.2990745-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: y2038@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>, Willy Tarreau <w@1wt.eu>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

get_monotonic_boottime() is deprecated, so let's convert this to
the simpler ktime_get_boot_ns().

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: don't drop 'cpus' multiplication, as Pavel and Willy point out
    that needs to be kept
---
 drivers/leds/trigger/ledtrig-activity.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-activity.c b/drivers/leds/trigger/ledtrig-activity.c
index 5081894082bd..6c6f8a9b8d9a 100644
--- a/drivers/leds/trigger/ledtrig-activity.c
+++ b/drivers/leds/trigger/ledtrig-activity.c
@@ -37,7 +37,6 @@ static void led_activity_function(struct timer_list *t)
 	struct activity_data *activity_data = from_timer(activity_data, t,
 							 timer);
 	struct led_classdev *led_cdev = activity_data->led_cdev;
-	struct timespec boot_time;
 	unsigned int target;
 	unsigned int usage;
 	int delay;
@@ -57,8 +56,6 @@ static void led_activity_function(struct timer_list *t)
 		return;
 	}
 
-	get_monotonic_boottime(&boot_time);
-
 	cpus = 0;
 	curr_used = 0;
 
@@ -76,7 +73,7 @@ static void led_activity_function(struct timer_list *t)
 	 * down to 16us, ensuring we won't overflow 32-bit computations below
 	 * even up to 3k CPUs, while keeping divides cheap on smaller systems.
 	 */
-	curr_boot = timespec_to_ns(&boot_time) * cpus;
+	curr_boot = ktime_get_boot_ns() * cpus;
 	diff_boot = (curr_boot - activity_data->last_boot) >> 16;
 	diff_used = (curr_used - activity_data->last_used) >> 16;
 	activity_data->last_boot = curr_boot;
-- 
2.9.0

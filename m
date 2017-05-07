From: sanshan zhang <sanshan.zhang@nxp.com>
Subject: [PATCH] leds/trigger: system can't enter suspend.
Date: Sun, 7 May 2017 10:01:21 +0800
Message-ID: <1494122481-15228-1-git-send-email-sanshan.zhang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-leds@vger.kernel.org, pavel@ucw.cz, j.anaszewski@samsung.com, rpurdie@rpsys.net
List-Id: linux-leds@vger.kernel.org

From: zhang sanshan <sanshan.zhang@nxp.com>

system can't enter suspend when enable led heartbeat.

pm will call heartbeat_pm_notifier when suspend.
system will prepare led states, and led_trigger_unregister
will use led_trigger_set to set trigger.
kobject_uevent_env will send event,it will call ep_poll_callback
to hold a wakeup source if we enable wakelock in kernel.
So that system can't enter suspend.

If we set led device tigger to NONE, there is not need to
send notification to user space.

Change-Id: I9f7ee5764d7e31b9a225dae5517cb36137675f9d
Signed-off-by: zhang sanshan <sanshan.zhang@nxp.com>
Signed-off-by: Zhang Bo <bo.zhang@nxp.com>
---
 drivers/leds/led-triggers.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 431123b..f03c2bd1 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -108,13 +108,10 @@ void led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 	unsigned long flags;
 	char *event = NULL;
 	char *envp[2];
-	const char *name;
 
 	if (!led_cdev->trigger && !trig)
 		return;
 
-	name = trig ? trig->name : "none";
-	event = kasprintf(GFP_KERNEL, "TRIGGER=%s", name);
 
 	/* Remove any existing trigger */
 	if (led_cdev->trigger) {
@@ -138,6 +135,10 @@ void led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 			trig->activate(led_cdev);
 	}
 
+	if (NULL != trig)
+		event = kasprintf(GFP_KERNEL, "TRIGGER=%s", trig->name);
+	else
+		return;
 	if (event) {
 		envp[0] = event;
 		envp[1] = NULL;
-- 
1.9.1

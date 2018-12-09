From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH 1/2] led: triggers: Break the for loop after default trigger is found
Date: Sun,  9 Dec 2018 19:49:41 +0100
Message-ID: <20181209184942.22391-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, jacek.anaszewski@gmail.com, krzk@kernel.org
List-Id: linux-leds@vger.kernel.org

It is of no avail to continue iterating through registered
triggers in the led_trigger_set_default() after the trigger to set
has been found. Add "break" statement to fix this omission.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---
 drivers/leds/led-triggers.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 17d73db1456e..52b12e601ebe 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -200,8 +200,10 @@ void led_trigger_set_default(struct led_classdev *led_cdev)
 	down_read(&triggers_list_lock);
 	down_write(&led_cdev->trigger_lock);
 	list_for_each_entry(trig, &trigger_list, next_trig) {
-		if (!strcmp(led_cdev->default_trigger, trig->name))
+		if (!strcmp(led_cdev->default_trigger, trig->name)) {
 			led_trigger_set(led_cdev, trig);
+			break;
+		}
 	}
 	up_write(&led_cdev->trigger_lock);
 	up_read(&triggers_list_lock);
-- 
2.11.0

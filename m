From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH] leds: triggers: Return from led_trigger_set() if there is
 nothing to do
Date: Mon, 19 Sep 2016 10:23:45 +0200
Message-ID: <1474273425-6670-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, daniel.gorsulowski@esd.eu, danielromell@gmail.com, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org

From: Jacek Anaszewski <jacek.anaszewski@gmail.com>

If led_trigger_set() is called with "trig" argument set to NULL, and there
is no trigger to remove then the function should return immediately so
as to avoid doing unnecessary allocation and sending uevent.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Reported-by: Daniel Romell <daro@hms.se>
---
 drivers/leds/led-triggers.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 59d6a3e..c7a38d4 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -110,6 +110,9 @@ void led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 	char *envp[2];
 	const char *name;
 
+	if (!led_cdev->trigger && !trig)
+		return;
+
 	name = trig ? trig->name : "none";
 	event = kasprintf(GFP_KERNEL, "TRIGGER=%s", name);
 
-- 
1.9.1

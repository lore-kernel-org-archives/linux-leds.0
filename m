From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 2/5] led: triggers: Add LED_INIT_DEFAULT_TRIGGER flag
Date: Mon, 10 Dec 2018 10:29:58 +0100
Message-ID: <1544434201-14190-3-git-send-email-krzk@kernel.org>
References: <1544434201-14190-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544434201-14190-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Baolin Wang <baolin.wang@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

From: Jacek Anaszewski <jacek.anaszewski@gmail.com>

Add the flag LED_INIT_DEFAULT_TRIGGER for indicating that trigger
being set is a default trigger for the LED class device, and
thus it should be initialized with settings provided in the fwnode.

Set the flag in the led_trigger_set_default(). It is expected to be
cleared in the activate() op of a trigger after trigger fwnode
initialization data is parsed and applied. This should happen only
once after LED class device registration, to allow leaving triggers
in the idle state on re-apply and let the users apply their own
settings without being interfered with the default ones.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/leds/led-triggers.c | 2 ++
 include/linux/leds.h        | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 52b12e601ebe..9421222ca7a0 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -201,10 +201,12 @@ void led_trigger_set_default(struct led_classdev *led_cdev)
 	down_write(&led_cdev->trigger_lock);
 	list_for_each_entry(trig, &trigger_list, next_trig) {
 		if (!strcmp(led_cdev->default_trigger, trig->name)) {
+			led_cdev->flags |= LED_INIT_DEFAULT_TRIGGER;
 			led_trigger_set(led_cdev, trig);
 			break;
 		}
 	}
+
 	up_write(&led_cdev->trigger_lock);
 	up_read(&triggers_list_lock);
 }
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 580cbaef789a..5263f87e1d2c 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -51,6 +51,7 @@ struct led_classdev {
 #define LED_PANIC_INDICATOR	BIT(20)
 #define LED_BRIGHT_HW_CHANGED	BIT(21)
 #define LED_RETAIN_AT_SHUTDOWN	BIT(22)
+#define LED_INIT_DEFAULT_TRIGGER BIT(23)
 
 	/* set_brightness_work / blink_timer flags, atomic, private. */
 	unsigned long		work_flags;
-- 
2.7.4

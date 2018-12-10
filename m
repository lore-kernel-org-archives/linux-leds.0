From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 3/5] led: triggers: Initialize LED_INIT_DEFAULT_TRIGGER if trigger is brought after class
Date: Mon, 10 Dec 2018 10:29:59 +0100
Message-ID: <1544434201-14190-4-git-send-email-krzk@kernel.org>
References: <1544434201-14190-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544434201-14190-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Baolin Wang <baolin.wang@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Trigger driver can be initialized after the LED class device driver.  In
such case led_trigger_set_default() won't be called and flag
LED_INIT_DEFAULT_TRIGGER should be set from led_trigger_register().

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/leds/led-triggers.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 9421222ca7a0..c67b044ae0af 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -252,8 +252,10 @@ int led_trigger_register(struct led_trigger *trig)
 	list_for_each_entry(led_cdev, &leds_list, node) {
 		down_write(&led_cdev->trigger_lock);
 		if (!led_cdev->trigger && led_cdev->default_trigger &&
-			    !strcmp(led_cdev->default_trigger, trig->name))
+			    !strcmp(led_cdev->default_trigger, trig->name)) {
+			led_cdev->flags |= LED_INIT_DEFAULT_TRIGGER;
 			led_trigger_set(led_cdev, trig);
+		}
 		up_write(&led_cdev->trigger_lock);
 	}
 	up_read(&leds_list_lock);
-- 
2.7.4

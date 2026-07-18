Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB852F3C13;
	Sat, 18 Jul 2026 17:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784394721; cv=pass; b=qfZMDlzqIjju4WpT1Oko9Hj7gnRrdp8AAxZGXfFbA7sGDskE/ZZS4QKII9hi18Bp76y8//L511EtKI4+sb+mhs2HZxPH/xty1uYSoAvStrrz8RH0S12FSrLto9tXfYzT9EXr7jppK2s9Sk0jqhHn2JLRBwyvBaRDJfeVF8XnHCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784394721; c=relaxed/simple;
	bh=2OWihFvvggiYQs78T/F9z+LoDm38UPfu54llV3EgWiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZqUn/A5if4FuMJ/PUXbZPUTyvF8+3KdjAn8k6ZVjt4KdECavAzqOfl2zlv4KJiNjYcnAQ1Nhdx7SIewIGWuffL8l/h4KnL9xjjx78Qe+K4WF1uosTP76VBzEBRe4UanIDG7D+A7JsjwvV3czKIxYigPDV1p18Cwm1W27qUIXwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=GrpI2oTb; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="GrpI2oTb"
ARC-Seal: i=1; a=rsa-sha256; t=1784394573; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dCJfPMvtZDEKP8h/A8LPBhR5F9K9h/wuMvTVmyl+C2MPSWAfpuUYrJZczJAC1Sizsp3qpiuKU2bv5jgnJllqACa0p/dyXeiyrf+8AH5pEuW9RRtMoJTn1UAhbZeyhxBU7of2O77zC2A2Vf5vUPdJX1aSwMrn0Ar/TXztYZV6e0I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784394573; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SJ3xvKFlIzPaCFL/Xmz2CoqSlATafTeB5OQGACwgtNQ=; 
	b=nEIWFkaluYkO4fg+dr91jUDTv9It4/ECwkVrcsb9VVy9TopiM0uEhloDPUYKBZNmiR2KseyarYNnZe/gVliU1J/p8FWgqTFLEiYvVA0mcxHVo62FK6U4Ar9JMO3/nHpxs7zeqLfdqzX3Hf6qSpyChmcwA9tIBJLMJuoAughM934=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784394573;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=SJ3xvKFlIzPaCFL/Xmz2CoqSlATafTeB5OQGACwgtNQ=;
	b=GrpI2oTbrhv2rSsi9J0pcutDxsLNm3Galn3pHnmPsLAjHygzaML6+sC6DvSttQCV
	+0RI5vk/u/V4CRPbmaLDrItsxxdXuwwlpXyI2CN3x3PJSe2TPXyNGJkFctxnvSA9uX+
	Qc97FDjzoJrVnaUZYi8XWuoT7OAPvh5IV9h0ctIPDHRNMiTZ+T4mzWcXSA23D+jQDgV
	HLBxjK+gXr/u0onwaqxnwqQBARLpd8PxpveL8xl1MvncYjb0oKxeHCyejuyp9GRQg5v
	gM1iW6DF+BMfZJn+ewkHQQa+hRZFZSDas96H/6CxO79w1Gob41RkTF/Y7I5vfGHO1BT
	QU6RtJjUwA==
Received: by mx.zohomail.com with SMTPS id 1784394569554688.9236596937429;
	Sat, 18 Jul 2026 10:09:29 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 19 Jul 2026 01:05:25 +0800
Subject: [PATCH RFC v3 08/11] leds: trigger: Add
 led_trigger_notify_hw_control_changed() interface
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260719-leds-trigger-hw-changed-v3-8-5fb55722e36e@rong.moe>
References: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe>
In-Reply-To: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Ike Panhc <ikepanhc@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
 Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, 
 linux-leds@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-4217c
X-ZohoMailClient: External

Some hardware can autonomously activate/deactivate hardware control.
After that, the LED hardware notifies the LED driver. Currently, there
is no mechanism for LED drivers to notify the LED core about such events
and initiate a trigger transition to reflect the hardware state.

Add a new interface called led_trigger_notify_hw_control_changed(), so
that LED drivers can call it to notify the LED core about the
transition.

The interface only allows two transitions:

1. "none" => private trigger
2. private trigger => "none"

If the current trigger is neither the private trigger nor "none", no
transition will be made. This protects the currently selected software
trigger.

Note that LED_OFF won't be emitted during the #2 transition, as some
hardware may have selected a new brightness level during its hardware
state transition (e.g., laptop keyboards with a shortcut cycling through
different backlight brightnesses and auto mode).

The interface is designed as a void function as any failure should be
non-fatal and the result of transition should not have any impact on the
LED drivers' event handling procedures.

To use the interface, LEDS_TRIGGERS_HW_CHANGED must be enabled in
Kconfig, and the LED driver must set the LED_TRIG_HW_CHANGED flag for
the classdev.

Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v3:
- Adopt guard() (Thanks Thomas Weißschuh)
- Reword documentations
---
 Documentation/leds/leds-class.rst | 52 +++++++++++++++++++++++++
 drivers/leds/led-triggers.c       | 82 ++++++++++++++++++++++++++++++++++++++-
 drivers/leds/trigger/Kconfig      |  9 +++++
 include/linux/leds.h              |  8 ++++
 4 files changed, 149 insertions(+), 2 deletions(-)

diff --git a/Documentation/leds/leds-class.rst b/Documentation/leds/leds-class.rst
index 2d41a6db602c..adbc57b9f49c 100644
--- a/Documentation/leds/leds-class.rst
+++ b/Documentation/leds/leds-class.rst
@@ -334,6 +334,58 @@ not necessary for them to coordinate via `hw_control_*` callbacks.
 When the LED is in hw control, no software blink is possible and doing so
 will effectively disable hw control.
 
+Hardware-initiated trigger transition
+=====================================
+
+Some hardware can autonomously activate/deactivate hardware control. After that,
+the LED hardware notifies the LED driver.
+
+If the driver can detect such transitions and thus wants to notify the LED core
+to update the current trigger then the `LED_TRIG_HW_CHANGED` flag must be set in
+flags before registering. To update the current trigger accordingly, call
+`led_trigger_notify_hw_control_changed` on the LED classdev.
+
+This capability is restricted to the LED device's private trigger. The private
+trigger must have been properly registered (see above) and named after
+`hw_control_trigger`.
+
+Only two transitions are defined:
+
+- "none" => private trigger:
+        This happens when the hardware autonomously activates hardware control
+        and when "none" (i.e., no trigger) is currently active. If the private
+        trigger is already active when the method is called, this is essentially
+        a no-op.
+
+        The activation sequence for the private trigger will be executed as
+        normal.
+
+        The LED driver and its private trigger must be able to handle the
+        activation sequence even if the hardware is currently in hardware
+        control.
+
+        If error occurs in the activation sequence, the LED Trigger core reverts
+        the effective trigger to "none".
+
+- private trigger => "none"
+        This happens when the hardware autonomously deactivates hardware control
+        and when the private trigger is currently active. If "none" (i.e., no
+        trigger) is active when the method is called, this is essentially a
+        no-op.
+
+        The deactivation sequence for the private trigger will be executed as
+        normal, except that the current LED brightness is retained. The reason
+        for keeping the brightness unchanged is that some hardware may choose a
+        specific brightness instead of simply turning off the LED after
+        autonomously deactivating hardware control.
+
+        The LED driver and its private trigger must be able to handle the
+        deactivation sequence even if the hardware is not currently in hardware
+        control.
+
+If the current trigger is neither the private trigger nor "none", no transition
+will be made.
+
 Known Issues
 ============
 
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 726fa7bf88cf..6ae28cbd1c77 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -7,6 +7,7 @@
  * Author: Richard Purdie <rpurdie@openedhand.com>
  */
 
+#include <linux/bug.h>
 #include <linux/cleanup.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
@@ -192,7 +193,8 @@ ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
 EXPORT_SYMBOL_GPL(led_trigger_read);
 
 /* Caller must ensure led_cdev->trigger_lock held */
-int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
+static int __led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig,
+			     bool hw_triggered)
 {
 	char *event = NULL;
 	char *envp[2];
@@ -223,7 +225,21 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 		led_cdev->trigger_data = NULL;
 		led_cdev->activated = false;
 		led_cdev->flags &= ~LED_INIT_DEFAULT_TRIGGER;
-		led_set_brightness(led_cdev, LED_OFF);
+
+		/*
+		 * Hardware may have selected a new brightness level during its
+		 * hardware control transition, so only reset brightness if we
+		 * are switching to another trigger or if the switching is not
+		 * hardware triggered.
+		 *
+		 * Note that this does not apply to the error path, as running
+		 * into the error path implies a none => private trigger
+		 * transition. This hints that the LED driver and its private
+		 * trigger must have some fundamental bugs, so don't bother
+		 * leaving the LED in an undefined state.
+		 */
+		if (trig || !hw_triggered)
+			led_set_brightness(led_cdev, LED_OFF);
 	}
 	if (trig) {
 		spin_lock(&trig->leddev_list_lock);
@@ -287,6 +303,11 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 
 	return ret;
 }
+
+int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
+{
+	return __led_trigger_set(led_cdev, trig, false);
+}
 EXPORT_SYMBOL_GPL(led_trigger_set);
 
 void led_trigger_remove(struct led_classdev *led_cdev)
@@ -467,6 +488,63 @@ int devm_led_trigger_register(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_led_trigger_register);
 
+#ifdef CONFIG_LEDS_TRIGGERS_HW_CHANGED
+static void led_trigger_do_hw_control_transition(struct led_classdev *led_cdev, bool activate,
+						 struct led_trigger *hc_trig)
+{
+	int err = 0;
+
+	if (!led_cdev->trigger) {
+		/* "none" => private trigger. */
+		if (activate)
+			err = __led_trigger_set(led_cdev, hc_trig, true);
+	} else if (led_cdev->trigger == hc_trig) {
+		/* private trigger => "none". */
+		if (!activate)
+			err = __led_trigger_set(led_cdev, NULL, true);
+	} else {
+		/* Other trigger is active. */
+		dev_dbg(led_cdev->dev,
+			"Ignoring hw control transition (%s %s) while %s is active",
+			activate ? "activate" : "deactivate", hc_trig->name,
+			led_cdev->trigger->name);
+
+		return;
+	}
+
+	if (err)
+		dev_warn(led_cdev->dev, "Failed to %s %s in hw control transition: %d",
+			 activate ? "activate" : "deactivate", hc_trig->name, err);
+}
+
+void led_trigger_notify_hw_control_changed(struct led_classdev *led_cdev, bool activate)
+{
+	struct led_trigger *trig;
+
+	/* Restricted to private triggers. */
+	if (WARN_ON(!(led_cdev->flags & LED_TRIG_HW_CHANGED) ||
+		    !led_cdev->hw_control_trigger || !led_cdev->trigger_type))
+		return;
+
+	scoped_guard(rwsem_read, &triggers_list_lock) {
+		list_for_each_entry(trig, &trigger_list, next_trig) {
+			if (trig->trigger_type == led_cdev->trigger_type &&
+			    !strcmp(trig->name, led_cdev->hw_control_trigger)) {
+				guard(rwsem_write)(&led_cdev->trigger_lock);
+
+				led_trigger_do_hw_control_transition(led_cdev, activate, trig);
+				return;
+			}
+		}
+	}
+
+	dev_err(led_cdev->dev,
+		"%s() is called, but the private trigger (%s) is not properly registered\n",
+		__func__, led_cdev->hw_control_trigger);
+}
+EXPORT_SYMBOL_GPL(led_trigger_notify_hw_control_changed);
+#endif /* CONFIG_LEDS_TRIGGERS_HW_CHANGED */
+
 /* Simple LED Trigger Interface */
 
 void led_trigger_event(struct led_trigger *trig,
diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
index c11282a74b5a..798122154049 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -9,6 +9,15 @@ menuconfig LEDS_TRIGGERS
 
 if LEDS_TRIGGERS
 
+config LEDS_TRIGGERS_HW_CHANGED
+	bool "LED hardware-initiated trigger transition support"
+	help
+	  This option enables support for hardware initiated hardware control
+	  transitions, where the LED hardware autonomously switches between
+	  "none" (i.e., no trigger) and its private trigger.
+
+	  See Documentation/leds/leds-class.rst for details.
+
 config LEDS_TRIGGER_TIMER
 	tristate "LED Timer Trigger"
 	help
diff --git a/include/linux/leds.h b/include/linux/leds.h
index cc664da33e94..167598962b73 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -109,6 +109,7 @@ struct led_classdev {
 #define LED_INIT_DEFAULT_TRIGGER BIT(23)
 #define LED_REJECT_NAME_CONFLICT BIT(24)
 #define LED_MULTI_COLOR		BIT(25)
+#define LED_TRIG_HW_CHANGED	BIT(26)
 
 	/* set_brightness_work / blink_timer flags, atomic, private. */
 	unsigned long		work_flags;
@@ -609,6 +610,13 @@ led_trigger_get_brightness(const struct led_trigger *trigger)
 
 #endif /* CONFIG_LEDS_TRIGGERS */
 
+#ifdef CONFIG_LEDS_TRIGGERS_HW_CHANGED
+void led_trigger_notify_hw_control_changed(struct led_classdev *led_cdev, bool activate);
+#else
+static inline void led_trigger_notify_hw_control_changed(struct led_classdev *led_cdev,
+							 bool activate) {}
+#endif
+
 /* Trigger specific enum */
 enum led_trigger_netdev_modes {
 	TRIGGER_NETDEV_LINK = 0,

-- 
2.53.0


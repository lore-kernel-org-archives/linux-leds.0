Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4624756C3;
	Sun, 20 Sep 2026 19:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933484; cv=pass; b=RL3DTcznlqFsziOJ9IOoE3ocpPL5HfgwTXeQsFd30HDAkAcV05RyXzyZPcR8J40HRtdIcX/U4mnknHGuWS2A8I2XPFwuqa0mCIeDUxXLwyfGaQAAJcmfwx5GAhVfzJs7Is028FJ0Ckwjn0DDz14YB6D8RVAvIXXAKuowQWYb2Ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933484; c=relaxed/simple;
	bh=runTBY2NNn9QueCTTyhYuL5oHzS8Lp5Ff1DsV2L/M2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AO+zy/nUzVvh9VtzA7mkyHJbp8el0DzfeI5+yjwKNCuaJ6zYWTQ4b17e3dhvNaGOIVf540l1EVHsITk6j224L+6dPGwnHT3ipkkdcOUY/GOQNc7Pm4tAQRwJ3vDbAbl7xt3g9ZjzswuRIbfsfnAjgEomgKtEZuMulNWFWpplFpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=L2En/sgd; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="L2En/sgd"
ARC-Seal: i=1; a=rsa-sha256; t=1789933275; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=N8rCbipr8LoXq4qKj1a9SNHnIYsGpKBcsV0XL5zcLYVlV7DOlhWktXoOaKyGSRGQG0IFD55WarUcXK1u2jeTaECN84c/D2uBZZI/ONwSr3aGqgG7sn8Y8vye8JI+N3aRALjptvojcc9ZhOw31FDEPdtfA6Z/Dk1cMgNgP96TUNA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789933275; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/HgdVTj/PT8YV7K36sl8SXkauJ4S64cxi7yuBQyXDd8=; 
	b=oGMfexjUowP3TRWudD77Ofs7KVHnitBdoab91MpM9ZjHc1S6uiSMQywTnf+kW/33pMSLkR/p/NMhVspXpiGuk2dB3ZsO+E3jcjG+CSeaef4NDsAstKNBofUxSTC1fJzAIwMh9W1cZZfJaPRXQe3WNxlutaed0igzX7c3kCHelLk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789933275;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=/HgdVTj/PT8YV7K36sl8SXkauJ4S64cxi7yuBQyXDd8=;
	b=L2En/sgdj4w2emUrWiCfheJRyxr084KiKmh6xUlGO+WOkZn7asIBTaG8f9EqAkvP
	//vBy+lWijzgU7vjQNxYcy9hKZj0BrYPsafgoPTEusFImvvchCIwI1i/cJxIrWn0qEY
	8heWVR8GcfyvkaJ1j4c2ToIUHp6hE8Y5panznpMIx+ClBUqf1GD+KHe2pdpiqArxcKN
	jObAT1gDQ9pfGeZ50ZLanl4FHgS7qHIktfFs8Qyi8lgXIfYFIUAh/9xDKoXi1OiH5CQ
	+ckTtt5bM9V95twIVmO4fb9jD9pYRA47xOHlADiu/Rkz/ifdEMQc+AVywHwsOEwGHfO
	sQcpCEn+QQ==
Received: by smtp.zohomail.com with SMTPS id 1789933273169617.1755194883555;
	Sun, 20 Sep 2026 12:41:13 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 21 Sep 2026 03:40:24 +0800
Subject: [PATCH v7 10/13] leds: trigger: Add
 led_trigger_notify_hw_control_changed() interface
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260921-leds-trigger-hw-changed-v7-10-fe3cdb6dec51@rong.moe>
References: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
In-Reply-To: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
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
X-Mailer: b4 0.17-dev-1f2f7
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

To use the interface, the config LEDS_TRIGGERS_HW_CHANGED must be
enabled, and the LED driver must set the LED_TRIG_HW_CHANGED flag for
the classdev.

By default, the config is enabled when LEDS_BRIGHTNESS_HW_CHANGED is
enabled.

Acked-by: Ike Panhc <ikepanhc@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v7:
- Remove messages mainly for debugging (thanks Lee Jones)
- Inline led_trigger_{init,destroy}_hw_changed() into led-class.c by
  exporting led_trigger_hw_control_changed_worker() (ditto)
- Rephrase some comments and messages (ditto)

Changes in v6:
- Implement workqueue deferal mechanism
  - https://msgid.link/e2b081dfd8f96511a73b86ab3ec75e5cd759b79b.camel@rong.moe

Changes in v5:
- Address a concern from Sashiko:
  - led_trigger_notify_hw_control_changed() might sleep, but without any
    internal deferral mechanism or annotation
  - Annotate the method with might_sleep(), since the very first users
    of the interface, i.e., ideapad-laptop and (supposedly)
    thinkpad_acpi, will call the interface from work contexts. It does
    not deserve the overhead of internal deferral mechanism
  - https://sashiko.dev/#/patchset/20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe?part=9

Changes in v4:
- Enable LEDS_TRIGGERS_HW_CHANGED by default when
  LEDS_BRIGHTNESS_HW_CHANGED is enabled

Changes in v3:
- Adopt guard() (Thanks Thomas Weißschuh)
- Reword documentations
---
 Documentation/leds/leds-class.rst | 52 +++++++++++++++++++++++++
 drivers/leds/led-class.c          | 10 +++++
 drivers/leds/led-triggers.c       | 80 ++++++++++++++++++++++++++++++++++++++-
 drivers/leds/leds.h               |  1 +
 drivers/leds/trigger/Kconfig      | 10 +++++
 include/linux/leds.h              | 13 +++++++
 6 files changed, 164 insertions(+), 2 deletions(-)

diff --git a/Documentation/leds/leds-class.rst b/Documentation/leds/leds-class.rst
index ea478989aae2..464e54cabf52 100644
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
 
diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 7f51715fac69..00be3cb96c00 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -559,6 +559,11 @@ int led_classdev_register_ext(struct device *parent,
 #endif
 #ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
 	led_cdev->brightness_hw_changed = -1;
+#endif
+#ifdef CONFIG_LEDS_TRIGGERS_HW_CHANGED
+	if (led_cdev->flags & LED_TRIG_HW_CHANGED)
+		INIT_WORK(&led_cdev->trigger_hw_changed_work,
+			  led_trigger_hw_control_changed_worker);
 #endif
 	if (!led_cdev->max_brightness)
 		led_cdev->max_brightness = LED_FULL;
@@ -598,6 +603,11 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
 	if (IS_ERR_OR_NULL(led_cdev->dev))
 		return;
 
+#ifdef CONFIG_LEDS_TRIGGERS_HW_CHANGED
+	if (led_cdev->flags & LED_TRIG_HW_CHANGED)
+		disable_work_sync(&led_cdev->trigger_hw_changed_work);
+#endif
+
 #ifdef CONFIG_LEDS_TRIGGERS
 	down_write(&led_cdev->trigger_lock);
 	if (led_cdev->trigger)
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 6fee3145caab..f16603b5ff44 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -7,7 +7,9 @@
  * Author: Richard Purdie <rpurdie@openedhand.com>
  */
 
+#include <linux/bug.h>
 #include <linux/cleanup.h>
+#include <linux/compiler.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
@@ -235,7 +237,8 @@ const struct attribute_group led_trigger_group = {
 EXPORT_SYMBOL_GPL(led_trigger_group);
 
 /* Caller must ensure led_cdev->trigger_lock held */
-int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
+static int __led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig,
+			     bool hw_triggered)
 {
 	char *event = NULL;
 	char *envp[2];
@@ -266,7 +269,21 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
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
+		 * trigger must have some fundamental bugs, so the error path
+		 * always turns off the LED to reset it to a certain state.
+		 */
+		if (trig || !hw_triggered)
+			led_set_brightness(led_cdev, LED_OFF);
 	}
 	if (trig) {
 		spin_lock(&trig->leddev_list_lock);
@@ -330,6 +347,11 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 
 	return ret;
 }
+
+int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
+{
+	return __led_trigger_set(led_cdev, trig, false);
+}
 EXPORT_SYMBOL_GPL(led_trigger_set);
 
 void led_trigger_remove(struct led_classdev *led_cdev)
@@ -484,6 +506,60 @@ int devm_led_trigger_register(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_led_trigger_register);
 
+#ifdef CONFIG_LEDS_TRIGGERS_HW_CHANGED
+
+static void led_trigger_do_hw_control_transition(struct led_classdev *led_cdev, bool activate,
+						 struct led_trigger *hc_trig)
+{
+	if (activate && !led_cdev->trigger) /* "none" => private trigger. */
+		__led_trigger_set(led_cdev, hc_trig, true);
+	else if (!activate && led_cdev->trigger == hc_trig) /* private trigger => "none". */
+		__led_trigger_set(led_cdev, NULL, true);
+
+	/* Already in the desired state, or another trigger is active, ignore. */
+}
+
+void led_trigger_hw_control_changed_worker(struct work_struct *work)
+{
+	struct led_classdev *led_cdev =
+		container_of(work, struct led_classdev, trigger_hw_changed_work);
+	bool activate = READ_ONCE(led_cdev->trigger_hw_changed);
+
+	scoped_guard(rwsem_read, &triggers_list_lock) {
+		struct led_trigger *trig;
+
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
+	dev_warn(led_cdev->dev,
+		 "Private trigger %s is not registered, can't toggle hardware control\n",
+		 led_cdev->hw_control_trigger);
+}
+EXPORT_SYMBOL_GPL(led_trigger_hw_control_changed_worker);
+
+void led_trigger_notify_hw_control_changed(struct led_classdev *led_cdev, bool activate)
+{
+	/* Restricted to private triggers. */
+	if (WARN_ON(!(led_cdev->flags & LED_TRIG_HW_CHANGED) ||
+		    !led_cdev->hw_control_trigger || !led_cdev->trigger_type))
+		return;
+
+	WRITE_ONCE(led_cdev->trigger_hw_changed, activate);
+
+	schedule_work(&led_cdev->trigger_hw_changed_work);
+}
+EXPORT_SYMBOL_GPL(led_trigger_notify_hw_control_changed);
+
+#endif /* CONFIG_LEDS_TRIGGERS_HW_CHANGED */
+
 /* Simple LED Trigger Interface */
 
 void led_trigger_event(struct led_trigger *trig,
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index c1db21e943b0..6d00e6f44126 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -21,6 +21,7 @@ void led_init_core(struct led_classdev *led_cdev);
 void led_stop_software_blink(struct led_classdev *led_cdev);
 void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value);
 void led_set_brightness_nosleep(struct led_classdev *led_cdev, unsigned int value);
+void led_trigger_hw_control_changed_worker(struct work_struct *work);
 
 extern struct rw_semaphore leds_list_lock;
 extern struct list_head leds_list;
diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
index c11282a74b5a..a11d04ce4ab2 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -9,6 +9,16 @@ menuconfig LEDS_TRIGGERS
 
 if LEDS_TRIGGERS
 
+config LEDS_TRIGGERS_HW_CHANGED
+	bool "LED hardware-initiated trigger transition support"
+	default LEDS_BRIGHTNESS_HW_CHANGED
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
index 9a0bfd985b46..beaf23993063 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -109,6 +109,7 @@ struct led_classdev {
 #define LED_INIT_DEFAULT_TRIGGER BIT(23)
 #define LED_REJECT_NAME_CONFLICT BIT(24)
 #define LED_MULTI_COLOR		BIT(25)
+#define LED_TRIG_HW_CHANGED	BIT(26)
 
 	/* set_brightness_work / blink_timer flags, atomic, private. */
 	unsigned long		work_flags;
@@ -239,6 +240,11 @@ struct led_classdev {
 	struct kernfs_node	*brightness_hw_changed_kn;
 #endif
 
+#ifdef CONFIG_LEDS_TRIGGERS_HW_CHANGED
+	bool			trigger_hw_changed;
+	struct work_struct	trigger_hw_changed_work;
+#endif
+
 	/* Ensures consistent access to the LED class device */
 	struct mutex		led_access;
 };
@@ -609,6 +615,13 @@ led_trigger_get_brightness(const struct led_trigger *trigger)
 
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
2.55.0


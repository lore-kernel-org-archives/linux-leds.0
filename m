Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E26481A86;
	Thu, 20 Aug 2026 17:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246846; cv=pass; b=n+d+CNVK1uZc/d6QQFLk3tI03LNFJIBRr1maNZ3oj6WwCwYdHdo5bb6L03TfUHUKs49pemQAWdDb6DmkcmZb9IC0FJadhuYPL0mNjYzzTQX5zSRKWroHOhoDjnyHNnGo56gQe98IBMpnVZa8RYAuVbSayA5+wKkT9u4HeyhIdRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246846; c=relaxed/simple;
	bh=SIgUU2g+wRGUVC/iM+KPIgqUXNpt65Gh+mPBN8UcdLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cgV94Y7N8g8EvrboS9BZFPEJyBCc+7mI17Fd26knzSXGcDgWluOdzrrjjd/k9KT6i1CcgWjWg9JVknl0nDfnBF+LEwdEv+9m7rTiLMasot8/5mOIvLSdNvPjI91qePwZ/iWR3lqtbZMqCDIFogL/6wSACyc0rGSneCYcm0oipoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=VgvaIzvb; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="VgvaIzvb"
ARC-Seal: i=1; a=rsa-sha256; t=1787246693; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YUGq+zf9n6j2uUAJ1PL6g2K0/wKwV2LIduaROzrTv/0eYUKDec1MUEqpfzptUhOs4J6h//VTHOYdZnfpa/d5Mcz2hZseF9VbrEDoIKxEYlij3kBsfeyEeGjRxKwX2vfWjZizDkW69U5xKZkUTeBIO2Q/v8IBxD+oezD7Qd2I2nQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787246693; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=N3vNIvKqhaUBaz2tqWp/9QmmFKTbjP42K+MawvJXb/Q=; 
	b=HxLe+3wePp8ZULsfUfjZimtrvEAMXw3lfZVkLLnZ+OtiB8jsKTRJQcrxlhAaQi5OHXlkt6+NuOHt5N5AAhAQtWkTUAobkHKqeGvStGm5YAUXSm4nEGcYN6/Ndce0uT8YF1mJT0O2klQUAVt+nZgizKbYKzCD0pCnmZJkWQ8dQhA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787246693;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=N3vNIvKqhaUBaz2tqWp/9QmmFKTbjP42K+MawvJXb/Q=;
	b=VgvaIzvbMT5y6v8tdUmnutRtJgKzwgIpG8OfeH7fKj+m9YL/qSWRM0NbGa+GNIVp
	Q3rU2WUPuG6eYVIu0pgHLboOng61K+MsHELxiXzR/16RVQ/e4SeQu+SDkJLblnHlQUH
	D50up5ajxUG6W012zpPnluAePVk3K2g5Oet82xLMaSZRaUGxrZmz/T/YgTLihmwhM4B
	xuB7Pkh4SieFv05k/XV8n+K6oMCdAGgXFdxXjllCfTk7ev9xV2Rufw7GUU59r0docon
	iC0/36b6fUx68NXHf08hPvIx5NQFUkJ8GUWrCueIxoNsH9eJD6AzfTDW6LARv9rgfMw
	Ps5stvON2Q==
Received: by mx.zohomail.com with SMTPS id 1787246692155846.0229063511888;
	Thu, 20 Aug 2026 10:24:52 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Fri, 21 Aug 2026 01:22:07 +0800
Subject: [PATCH v5 12/12] platform/x86: ideapad-laptop: Fully support auto
 keyboard backlight
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260821-leds-trigger-hw-changed-v5-12-3e00d6c4a936@rong.moe>
References: <20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe>
In-Reply-To: <20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe>
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

Currently, the auto brightness mode of keyboard backlight maps to
brightness=0 in LED classdev. The only method to switch to such a mode
is by pressing the manufacturer-defined shortcut (Fn+Space). However, 0
is a multiplexed brightness value; writing 0 simply results in the
backlight being turned off.

With brightness processing code decoupled from LED classdev, we can now
fully support the auto brightness mode. In this mode, the keyboard
backlight is controlled by the EC according to the ambient light sensor
(ALS).

To utilize this, a private hardware control trigger "ideapad-auto" is
added, with the event handling procedure calling the
led_trigger_notify_hw_control_changed() interface to activate/deactivate
the private trigger according to the current LED trigger state. To align
with LEDS_BRIGHTNESS_HW_CHANGED, the driver neither depends on
LEDS_TRIGGERS_HW_CHANGED nor selects it.

Meanwhile, block brightness changes on exit to prevent the side effect
of LED device unregistration when the private trigger is active from
resetting the brightness to zero, so that we can retain the state of
auto mode among boots.

Acked-by: Ike Panhc <ikepanhc@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v4:
- Add missing #include (Thanks Ilpo Järvinen)
- Remove needless code alignment (ditto)
- Address concerns from Sashiko
  - Do not notify the LED trigger core when the registration of the
    private trigger has failed
  - https://sashiko.dev/#/patchset/20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe?part=11

Changes in v3:
- Address concerns from Sashiko
  - Fix a race condition in ideapad_kbd_bl_led_cdev_brightness_set()
  - Fix trigger re-registration of ideapad_kbd_bl_auto_trigger
  - https://sashiko.dev/#/patchset/20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3%40rong.moe
- Make registration failures of ideapad_kbd_bl_auto_trigger non-fatal
---
 drivers/platform/x86/lenovo/Kconfig          |   1 +
 drivers/platform/x86/lenovo/ideapad-laptop.c | 114 ++++++++++++++++++++++++---
 2 files changed, 106 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index 4443f40ef8aa..e92b1e900795 100644
--- a/drivers/platform/x86/lenovo/Kconfig
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -16,6 +16,7 @@ config IDEAPAD_LAPTOP
 	select INPUT_SPARSEKMAP
 	select NEW_LEDS
 	select LEDS_CLASS
+	select LEDS_TRIGGERS
 	help
 	  This is a driver for Lenovo IdeaPad netbooks contains drivers for
 	  rfkill switch, hotkey, fan control and backlight control.
diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 7f7b1e30c326..5442cbfe3969 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -16,6 +16,7 @@
 #include <linux/bug.h>
 #include <linux/cleanup.h>
 #include <linux/compiler.h>
+#include <linux/container_of.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -33,6 +34,7 @@
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
 #include <linux/power_supply.h>
+#include <linux/printk.h>
 #include <linux/rfkill.h>
 #include <linux/seq_file.h>
 #include <linux/string_choices.h>
@@ -1715,9 +1717,58 @@ static int ideapad_kbd_bl_led_cdev_brightness_set(struct led_classdev *led_cdev,
 {
 	struct ideapad_private *priv = container_of(led_cdev, struct ideapad_private, kbd_bl.led);
 
+	/*
+	 * When deinitializing: It must be the side effect of led_cdev
+	 * unregistration when our private trigger is active. We've set
+	 * LED_RETAIN_AT_SHUTDOWN to retain led_cdev brightness level.
+	 * To do the same for auto mode, gate changes and return early.
+	 */
+	if (unlikely(!priv->kbd_bl.initialized))
+		return 0;
+
 	return ideapad_kbd_bl_brightness_set(priv, brightness);
 }
 
+static bool ideapad_kbd_bl_auto_trigger_offloaded(struct led_classdev *led_cdev)
+{
+	struct ideapad_private *priv = container_of(led_cdev, struct ideapad_private, kbd_bl.led);
+
+	return atomic_read(&priv->kbd_bl.last_hw_brightness) == KBD_BL_AUTO_MODE_HW_BRIGHTNESS;
+}
+
+static int ideapad_kbd_bl_auto_trigger_activate(struct led_classdev *led_cdev)
+{
+	struct ideapad_private *priv = container_of(led_cdev, struct ideapad_private, kbd_bl.led);
+
+	return ideapad_kbd_bl_hw_brightness_set(priv, KBD_BL_AUTO_MODE_HW_BRIGHTNESS);
+}
+
+static struct led_hw_trigger_type ideapad_kbd_bl_auto_trigger_type;
+
+static struct led_trigger ideapad_kbd_bl_auto_trigger = {
+	.name = "ideapad-auto",
+	.trigger_type = &ideapad_kbd_bl_auto_trigger_type,
+	.activate = ideapad_kbd_bl_auto_trigger_activate,
+	.offloaded = ideapad_kbd_bl_auto_trigger_offloaded,
+};
+
+static bool ideapad_kbd_bl_auto_trigger_registered;
+
+static void ideapad_kbd_bl_notify_hw_control(struct ideapad_private *priv,
+					     int hw_brightness, int last_hw_brightness)
+{
+	bool hw_control, last_hw_control;
+
+	if (!ideapad_kbd_bl_auto_trigger_registered || priv->kbd_bl.type != KBD_BL_TRISTATE_AUTO)
+		return;
+
+	hw_control = hw_brightness == KBD_BL_AUTO_MODE_HW_BRIGHTNESS;
+	last_hw_control = last_hw_brightness == KBD_BL_AUTO_MODE_HW_BRIGHTNESS;
+
+	if (hw_control != last_hw_control)
+		led_trigger_notify_hw_control_changed(&priv->kbd_bl.led, hw_control);
+}
+
 static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
 {
 	int hw_brightness, brightness, last_hw_brightness;
@@ -1739,6 +1790,8 @@ static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
 	if (hw_brightness == last_hw_brightness)
 		return;
 
+	ideapad_kbd_bl_notify_hw_control(priv, hw_brightness, last_hw_brightness);
+
 	led_classdev_notify_brightness_hw_changed(&priv->kbd_bl.led, brightness);
 }
 
@@ -1769,6 +1822,24 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 
 	switch (priv->kbd_bl.type) {
 	case KBD_BL_TRISTATE_AUTO:
+		priv->kbd_bl.led.max_brightness = 2;
+
+		if (!ideapad_kbd_bl_auto_trigger_registered) {
+			dev_warn(&priv->platform_device->dev,
+				 "Could not provide LED trigger %s for keyboard backlight\n",
+				 ideapad_kbd_bl_auto_trigger.name);
+			break;
+		}
+
+		priv->kbd_bl.led.flags |= LED_TRIG_HW_CHANGED;
+		priv->kbd_bl.led.trigger_type = &ideapad_kbd_bl_auto_trigger_type;
+		priv->kbd_bl.led.hw_control_trigger = ideapad_kbd_bl_auto_trigger.name;
+
+		/* Hardware remembers the last brightness level, including auto mode. */
+		if (hw_brightness == KBD_BL_AUTO_MODE_HW_BRIGHTNESS)
+			priv->kbd_bl.led.default_trigger = ideapad_kbd_bl_auto_trigger.name;
+
+		break;
 	case KBD_BL_TRISTATE:
 		priv->kbd_bl.led.max_brightness = 2;
 		break;
@@ -1785,13 +1856,22 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 	if (err < 0)
 		return err;
 
-	err = led_classdev_register(&priv->platform_device->dev, &priv->kbd_bl.led);
-	if (err)
-		return err;
+	/* Queue notifications, as kbd_bl.initialized is about to be set. */
+	guard(mutex)(&priv->kbd_bl.notif_mutex);
 
+	/*
+	 * Setting kbd_bl.initialized after led_classdev_register() could lead
+	 * to race conditions in ideapad_kbd_bl_led_cdev_brightness_set() where
+	 * kbd_bl.initialized is checked, so set it now. It can be reverted back
+	 * if the LED classdev failed to register.
+	 */
 	priv->kbd_bl.initialized = true;
 
-	return 0;
+	err = led_classdev_register(&priv->platform_device->dev, &priv->kbd_bl.led);
+	if (err)
+		priv->kbd_bl.initialized = false;
+
+	return err;
 }
 
 static void ideapad_kbd_bl_exit(struct ideapad_private *priv)
@@ -2618,17 +2698,30 @@ static int __init ideapad_laptop_init(void)
 {
 	int err;
 
+	err = led_trigger_register(&ideapad_kbd_bl_auto_trigger);
+	if (err) {
+		pr_warn("Failed to register LED trigger %s: %d\n",
+			ideapad_kbd_bl_auto_trigger.name, err);
+	} else {
+		ideapad_kbd_bl_auto_trigger_registered = true;
+	}
+
 	err = ideapad_wmi_driver_register();
 	if (err)
-		return err;
+		goto err_ledtrig;
 
 	err = platform_driver_register(&ideapad_acpi_driver);
-	if (err) {
-		ideapad_wmi_driver_unregister();
-		return err;
-	}
+	if (err)
+		goto err_wmi;
 
 	return 0;
+
+err_wmi:
+	ideapad_wmi_driver_unregister();
+err_ledtrig:
+	if (ideapad_kbd_bl_auto_trigger_registered)
+		led_trigger_unregister(&ideapad_kbd_bl_auto_trigger);
+	return err;
 }
 module_init(ideapad_laptop_init)
 
@@ -2636,6 +2729,9 @@ static void __exit ideapad_laptop_exit(void)
 {
 	platform_driver_unregister(&ideapad_acpi_driver);
 	ideapad_wmi_driver_unregister();
+
+	if (ideapad_kbd_bl_auto_trigger_registered)
+		led_trigger_unregister(&ideapad_kbd_bl_auto_trigger);
 }
 module_exit(ideapad_laptop_exit)
 

-- 
2.55.0


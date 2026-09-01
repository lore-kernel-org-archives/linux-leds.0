Received: from sender6-op-o12.zoho.com (sender6-op-o12.zoho.com [165.173.180.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EB230FF31;
	Tue,  1 Sep 2026 18:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286544; cv=pass; b=CANjtSm8RaCYCScIPy3/7FcweZ5+opMUuDxyXZvHUDoPBS3U4U6m3nILHB2SAY7zr1mRQ1uquddfpt7cQNXujlyA6Bf7o4aLUm5phS+KDFJVEoF5XFa3hnbkVlNDbQz9bb6NXTObjBhfdD5iMjl+q/16IlbTlnlVrmui6jVZUp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286544; c=relaxed/simple;
	bh=1f0zvOu2jPLDdWuGAPb50wvl7cCDd8FWormwkoeNw3g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iIsTifedW0LemgC1hXGkGAG1+f8HCyBDiCo5zxbRAl8vlGMtVcHhLw+mzAMEP6w/lvl0UXiWL4RlJ2AIt0pEPLq0lpfUYEZu3GZ0U/SjwusyV1PKK0tPhfCf68qD4N46s+No9v3U78GPdNgfXIW5/fGqIcL6KXQF97eMwKqVgu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=ahK7dsdV; arc=pass smtp.client-ip=165.173.180.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="ahK7dsdV"
ARC-Seal: i=1; a=rsa-sha256; t=1788286316; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a6tzy+htiy5BOXZO1u0QV7BsU4e4jC0+AfdVOW2RWO1J3rC3H9DKyWXTXRQtb5YhU8+Onr9i5KW5JNJ1SocJ1sXlIm7CptT1YI7DaEAbQf1fGgHyQfsjtP4kq9Vr7bj78L3uAx6fFCif5tp0qJbnL+SsqZyQeWdWNGyCCSfjsf4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788286316; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ry2Ca6eVIobbdb3mjvfI+PPMW1jezxUtVw9TJE04NiQ=; 
	b=cOgQ/C68LGJa5ncmZrENa1d5gNzQWcQQK7cZIIPfA2zjpAELWJm10aU64/ysNRMbhRUmiH9zN1/+Wrv6sIgMyaCrOJVE96W3smLgp7J7ZZoE2QJowHJUlTuhLpV0XfTUnpf/dyOTvMjZZcvSz2Xngz6UCJq2+ehuNZM8+BGUC2Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788286316;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Ry2Ca6eVIobbdb3mjvfI+PPMW1jezxUtVw9TJE04NiQ=;
	b=ahK7dsdVrtHFa9kH3uJp9ZDbRz7XbKUi9HxWL43F8vnel5iEy4FFzWt1rIrc8FmX
	Xsbs4mAWHx/OEbNCvNuoTWWjVuJ30eKuv6/n4W7Dkz1v+4bcla7zqZ32W62MHccXRJn
	VfgwBXevRlrdVDIpfd0yYHlhLh51HLSni06sCP49oibDZMTvf1FxaxmkGyNF9K0KiwG
	W9qlDF5kvnvjprhsu0iCsyw2sgco/FWJtt+fdB5DYW2H8YsoY98ryPtr0t02+/mkuHN
	aRRV1gJ7B31CfHvzwcGGh4uwNzHjHbPwRydZdUtWA4twTA1u0Pyed+lsXcn5F3H+jc3
	0fHGP6mA9g==
Received: by mx.zohomail.com with SMTPS id 1788286314577497.2575333775951;
	Tue, 1 Sep 2026 11:11:54 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Wed, 02 Sep 2026 02:09:31 +0800
Subject: [PATCH v6 12/12] platform/x86: ideapad-laptop: Fully support auto
 keyboard backlight
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260902-leds-trigger-hw-changed-v6-12-55693cd78877@rong.moe>
References: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
In-Reply-To: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
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
resetting the brightness to zero, so that the state of auto mode can
retain among boots.

Acked-by: Ike Panhc <ikepanhc@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v6:
- Simplify the auto mode state preservation logic by converting
  `priv->kbd_bl.initialized' into a tristate integer

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
 drivers/platform/x86/lenovo/ideapad-laptop.c | 119 ++++++++++++++++++++++++---
 2 files changed, 109 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index 516594993073..a97852b0b228 100644
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
index 712999b6900d..f86c11f51d0b 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -15,6 +15,7 @@
 #include <linux/bug.h>
 #include <linux/cleanup.h>
 #include <linux/compiler.h>
+#include <linux/container_of.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -32,6 +33,7 @@
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
 #include <linux/power_supply.h>
+#include <linux/printk.h>
 #include <linux/rfkill.h>
 #include <linux/seq_file.h>
 #include <linux/string_choices.h>
@@ -226,7 +228,10 @@ struct ideapad_private {
 		bool ymc_ec_trigger       : 1;
 	} features;
 	struct {
-		bool initialized;
+		int initialized; /*  0: initializion pending/ongoing/failed
+				  * >0: initializion finished
+				  * <0: unregisteration ongoing/finished
+				  */
 		int type;
 		struct led_classdev led;
 		unsigned int last_hw_brightness;
@@ -1716,14 +1721,68 @@ static int ideapad_kbd_bl_led_cdev_brightness_set(struct led_classdev *led_cdev,
 {
 	struct ideapad_private *priv = container_of(led_cdev, struct ideapad_private, kbd_bl.led);
 
+	/*
+	 * When unregistering: It must be the side effect of LED unregistration
+	 * when our private trigger is active. We've set LED_RETAIN_AT_SHUTDOWN
+	 * to retain led_cdev brightness level. To do the same for auto mode,
+	 * gate changes and return early.
+	 *
+	 * It's needless to gate changes when initializing, as there may be a
+	 * time margin between sysfs attribute creation and state change.
+	 */
+	if (unlikely(priv->kbd_bl.initialized < 0))
+		return 0;
+
 	return ideapad_kbd_bl_brightness_set(priv, brightness);
 }
 
+static bool ideapad_kbd_bl_auto_trigger_offloaded(struct led_classdev *led_cdev)
+{
+	struct ideapad_private *priv = container_of(led_cdev, struct ideapad_private, kbd_bl.led);
+
+	guard(mutex)(&priv->kbd_bl.mutex);
+
+	return priv->kbd_bl.last_hw_brightness == KBD_BL_AUTO_MODE_HW_BRIGHTNESS;
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
+					     unsigned int hw_brightness)
+{
+	bool hw_control, last_hw_control;
+
+	if (!ideapad_kbd_bl_auto_trigger_registered || priv->kbd_bl.type != KBD_BL_TRISTATE_AUTO)
+		return;
+
+	hw_control = hw_brightness == KBD_BL_AUTO_MODE_HW_BRIGHTNESS;
+	last_hw_control = priv->kbd_bl.last_hw_brightness == KBD_BL_AUTO_MODE_HW_BRIGHTNESS;
+
+	if (hw_control != last_hw_control)
+		led_trigger_notify_hw_control_changed(&priv->kbd_bl.led, hw_control);
+}
+
 static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
 {
 	int hw_brightness, brightness;
 
-	if (!priv->kbd_bl.initialized)
+	if (unlikely(priv->kbd_bl.initialized <= 0))
 		return;
 
 	guard(mutex)(&priv->kbd_bl.mutex);
@@ -1739,6 +1798,8 @@ static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
 	if (priv->kbd_bl.last_hw_brightness == hw_brightness)
 		return;
 
+	ideapad_kbd_bl_notify_hw_control(priv, hw_brightness);
+
 	priv->kbd_bl.last_hw_brightness = hw_brightness;
 
 	led_classdev_notify_brightness_hw_changed(&priv->kbd_bl.led, brightness);
@@ -1751,9 +1812,11 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 	if (!priv->features.kbd_bl)
 		return -ENODEV;
 
-	if (WARN_ON(priv->kbd_bl.initialized))
+	if (WARN_ON(priv->kbd_bl.initialized > 0))
 		return -EEXIST;
 
+	priv->kbd_bl.initialized = 0;
+
 	err = devm_mutex_init(&priv->platform_device->dev, &priv->kbd_bl.mutex);
 	if (err)
 		return err;
@@ -1771,6 +1834,24 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 
 	switch (priv->kbd_bl.type) {
 	case KBD_BL_TRISTATE_AUTO:
+		priv->kbd_bl.led.max_brightness = 2;
+
+		if (!ideapad_kbd_bl_auto_trigger_registered) {
+			dev_warn(&priv->platform_device->dev,
+				 "Cannot provide LED trigger %s for keyboard backlight\n",
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
@@ -1791,17 +1872,17 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 	if (err)
 		return err;
 
-	priv->kbd_bl.initialized = true;
+	priv->kbd_bl.initialized = 1;
 
 	return 0;
 }
 
 static void ideapad_kbd_bl_exit(struct ideapad_private *priv)
 {
-	if (!priv->kbd_bl.initialized)
+	if (priv->kbd_bl.initialized <= 0)
 		return;
 
-	priv->kbd_bl.initialized = false;
+	priv->kbd_bl.initialized = -1;
 
 	led_classdev_unregister(&priv->kbd_bl.led);
 }
@@ -2620,17 +2701,30 @@ static int __init ideapad_laptop_init(void)
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
 
@@ -2638,6 +2732,9 @@ static void __exit ideapad_laptop_exit(void)
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


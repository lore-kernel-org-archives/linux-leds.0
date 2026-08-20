Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06EB47B420;
	Thu, 20 Aug 2026 17:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246803; cv=pass; b=suzZGkAYpLbVyow4ZTa8mNipB27UgsXYag9P3sBBYksL7kmLuwHpjkwlyB/pwL9rXx6TVfu0z+Bpu6oX+txRl/9UQ09fGoRmJ4kKiql5qPTdY6aX9WeRK4pAYADWk2eoJYszjg9eCylgFs8WNLY8VLTtarR5GL/y3KgKe/sQGLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246803; c=relaxed/simple;
	bh=ktzf2ZH3k1wxARkKhoxyN/99UgGamJEZKjsSqbGw0AM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ljcfVTj15PDlKUNHJ2jM7Kc4zl1raVprDUnXloXWcQjXIYkI3QkNDDtAwPfJUvb4KmgU4UsMGXH9RjJFvbsiVddn8qh8mVbvwAN2rJJF3N3HjHF4NWbpZVKXeDeRmRQoZs/jsyXMGL0jIczupN0M+nmgONTbh+Ueec2pEtXVJLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=kc/tyzQw; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="kc/tyzQw"
ARC-Seal: i=1; a=rsa-sha256; t=1787246671; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eS4hh1eei9fwQN8sqDrOCB/tw/z9uOXIRluz2czmaPjgkjWpMLtVnhM+Oqj3MIdM+urZFqVcUljL+rsyj5/wFJ9iCWD5f6VPDAPfjxiuqtpPg0xCLxIe8aNaiR/YRoTkG7K7Nle1dRFG9zchgv6UnYXMwFFrKFADN7F009vSLW0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787246671; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=McKAgm5xQbW/yqY9fYzZE4mK9mmotvG2ZfMMzTpOWaY=; 
	b=iLeq47MQiWEh8TRC06EnxDIFImDJh6zPxv0qgwoTTKHapLkTa/p6RHP3FczwTTSLuTbTsiq8YTcYKlkeA4kQkojYRAsihlQPQjOg+Eow3ljYC4DaU+W62f95RGk1GLBBE3JddWsN74ApxZYEHaq94tXMNOgu1fxsqgE5uMhC0MM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787246671;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=McKAgm5xQbW/yqY9fYzZE4mK9mmotvG2ZfMMzTpOWaY=;
	b=kc/tyzQwwEtW7xzmIGDbyIey65u3rcCFmk3ADQJ+B3JKrqGCoGG8Js7eHnatJKNU
	VXPm+o/mVkl3iqWaJvRvtPtCblmh+/XdPgQhREE62oF2gP5XPrL2Pohpzcw1MZZr4zY
	RUnGPUeiwmww76eNdoIE8DUMLx25Ooggk7JAjsPRYNBTSMFHeZsLAwD0BJWk+YkGhdU
	gRvrVU1OepRVbu2lWzZ8X69+IvuMibM5e4aXeuNWwakiZATr0KmsJD+kN3n6GChBQmK
	6bG2GYgIJkncXNJuYnGNR30K5wBD0cIuTZA70w/YHFUMaF7dWWtwGIh4W0aH2zree36
	XtDgZqRq0Q==
Received: by mx.zohomail.com with SMTPS id 1787246669127589.4961319337049;
	Thu, 20 Aug 2026 10:24:29 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Fri, 21 Aug 2026 01:22:05 +0800
Subject: [PATCH v5 10/12] platform/x86: ideapad-laptop: Decouple hardware &
 classdev brightness for keyboard backlight
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260821-leds-trigger-hw-changed-v5-10-3e00d6c4a936@rong.moe>
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

Some recent models come with an ambient light sensor (ALS). On these
models, their EC will automatically set the keyboard backlight to an
appropriate brightness when the effective "hardware brightness" is 3.
"Hardware brightness" can't be perfectly mapped to an LED classdev
brightness, but the EC does use this predefined brightness value to
represent auto mode.

Currently, the code processing keyboard backlight is coupled with LED
classdev, making it hard to expose the auto brightness (ALS) mode to the
userspace.

As the first step toward the goal, decouple hardware brightness from LED
classdev brightness, and update comments about corresponding backlight
modes.

Since upcoming changes will heavily rely on kbd_bl.last_hw_brightness,
also convert it into an atomic_t to prevent potential race conditions.

To minimalize the diff set in upcoming changes, a trivial refactor
also converts the initialization path into another equivalent form.

Acked-by: Ike Panhc <ikepanhc@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v4:
- Add missing #include (Thanks Ilpo Järvinen)
- Address concerns from Sashiko
  - Reject insane hardware brightness
  - https://sashiko.dev/#/patchset/20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe?part=9
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 151 +++++++++++++++++++--------
 1 file changed, 106 insertions(+), 45 deletions(-)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 8213524504ee..2fa2665f35d6 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -9,14 +9,17 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
+#include <linux/atomic.h>
 #include <linux/backlight.h>
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/bug.h>
 #include <linux/cleanup.h>
+#include <linux/compiler.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/dev_printk.h>
 #include <linux/dmi.h>
 #include <linux/i8042.h>
 #include <linux/init.h>
@@ -134,10 +137,31 @@ enum {
 };
 
 /*
- * These correspond to the number of supported states - 1
- * Future keyboard types may need a new system, if there's a collision
- * KBD_BL_TRISTATE_AUTO has no way to report or set the auto state
- * so it effectively has 3 states, but needs to handle 4
+ * The enumeration has two purposes:
+ *   - as an internal identifier for all known types of keyboard backlight
+ *   - as a mandatory parameter of the KBLC command
+ *
+ * For each type, the hardware brightness values are defined as follows:
+ * +--------------------------+----------+-----+------+------+
+ * |      Hardware brightness |        0 |   1 |    2 |    3 |
+ * | Type                     |          |     |      |      |
+ * +--------------------------+----------+-----+------+------+
+ * | KBD_BL_STANDARD          |      off |  on |  N/A |  N/A |
+ * +--------------------------+----------+-----+------+------+
+ * | KBD_BL_TRISTATE          |      off | low | high |  N/A |
+ * +--------------------------+----------+-----+------+------+
+ * | KBD_BL_TRISTATE_AUTO     |      off | low | high | auto |
+ * +--------------------------+----------+-----+------+------+
+ *
+ * We map LED classdev brightness for KBD_BL_TRISTATE_AUTO as follows:
+ * +--------------------------+----------+-----+------+
+ * |  LED classdev brightness |        0 |   1 |    2 |
+ * | Operation                |          |     |      |
+ * +--------------------------+----------+-----+------+
+ * | Read                     | off/auto | low | high |
+ * +--------------------------+----------+-----+------+
+ * | Write                    |      off | low | high |
+ * +--------------------------+----------+-----+------+
  */
 enum {
 	KBD_BL_STANDARD      = 1,
@@ -145,6 +169,8 @@ enum {
 	KBD_BL_TRISTATE_AUTO = 3,
 };
 
+#define KBD_BL_AUTO_MODE_HW_BRIGHTNESS	3
+
 #define KBD_BL_QUERY_TYPE		0x1
 #define KBD_BL_TRISTATE_TYPE		0x5
 #define KBD_BL_TRISTATE_AUTO_TYPE	0x7
@@ -203,7 +229,7 @@ struct ideapad_private {
 		bool initialized;
 		int type;
 		struct led_classdev led;
-		unsigned int last_brightness;
+		atomic_t last_hw_brightness;
 	} kbd_bl;
 	struct {
 		bool initialized;
@@ -1592,7 +1618,24 @@ static int ideapad_kbd_bl_check_tristate(int type)
 	return (type == KBD_BL_TRISTATE) || (type == KBD_BL_TRISTATE_AUTO);
 }
 
-static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
+static int ideapad_kbd_bl_brightness_parse(struct ideapad_private *priv, int hw_brightness)
+{
+	/* Off, low or high */
+	if (hw_brightness <= priv->kbd_bl.led.max_brightness)
+		return hw_brightness;
+
+	/* Auto (controlled by EC according to ALS), report as off */
+	if (priv->kbd_bl.type == KBD_BL_TRISTATE_AUTO &&
+	    hw_brightness == KBD_BL_AUTO_MODE_HW_BRIGHTNESS)
+		return 0;
+
+	/* Unknown value */
+	dev_warn(&priv->platform_device->dev,
+		 "Unknown keyboard backlight value: %d", hw_brightness);
+	return -EINVAL;
+}
+
+static int ideapad_kbd_bl_hw_brightness_get(struct ideapad_private *priv)
 {
 	unsigned long value;
 	int err;
@@ -1606,21 +1649,7 @@ static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
 		if (err)
 			return err;
 
-		/* Convert returned value to brightness level */
-		value = FIELD_GET(KBD_BL_GET_BRIGHTNESS, value);
-
-		/* Off, low or high */
-		if (value <= priv->kbd_bl.led.max_brightness)
-			return value;
-
-		/* Auto, report as off */
-		if (value == priv->kbd_bl.led.max_brightness + 1)
-			return 0;
-
-		/* Unknown value */
-		dev_warn(&priv->platform_device->dev,
-			 "Unknown keyboard backlight value: %lu", value);
-		return -EINVAL;
+		return FIELD_GET(KBD_BL_GET_BRIGHTNESS, value);
 	}
 
 	err = eval_hals(priv->adev->handle, &value);
@@ -1630,6 +1659,16 @@ static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
 	return !!test_bit(HALS_KBD_BL_STATE_BIT, &value);
 }
 
+static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
+{
+	int hw_brightness = ideapad_kbd_bl_hw_brightness_get(priv);
+
+	if (hw_brightness < 0)
+		return hw_brightness;
+
+	return ideapad_kbd_bl_brightness_parse(priv, hw_brightness);
+}
+
 static enum led_brightness ideapad_kbd_bl_led_cdev_brightness_get(struct led_classdev *led_cdev)
 {
 	struct ideapad_private *priv = container_of(led_cdev, struct ideapad_private, kbd_bl.led);
@@ -1637,32 +1676,37 @@ static enum led_brightness ideapad_kbd_bl_led_cdev_brightness_get(struct led_cla
 	return ideapad_kbd_bl_brightness_get(priv);
 }
 
-static int ideapad_kbd_bl_brightness_set(struct ideapad_private *priv, unsigned int brightness)
+static int ideapad_kbd_bl_hw_brightness_set(struct ideapad_private *priv, int hw_brightness)
 {
-	int err;
 	unsigned long value;
 	int type = priv->kbd_bl.type;
+	int err;
 
 	if (ideapad_kbd_bl_check_tristate(type)) {
-		if (brightness > priv->kbd_bl.led.max_brightness)
-			return -EINVAL;
-
-		value = FIELD_PREP(KBD_BL_SET_BRIGHTNESS, brightness) |
+		value = FIELD_PREP(KBD_BL_SET_BRIGHTNESS, hw_brightness) |
 			FIELD_PREP(KBD_BL_COMMAND_TYPE, type) |
 			KBD_BL_COMMAND_SET;
 		err = exec_kblc(priv->adev->handle, value);
 	} else {
-		err = exec_sals(priv->adev->handle, brightness ? SALS_KBD_BL_ON : SALS_KBD_BL_OFF);
+		value = hw_brightness ? SALS_KBD_BL_ON : SALS_KBD_BL_OFF;
+		err = exec_sals(priv->adev->handle, value);
 	}
-
 	if (err)
 		return err;
 
-	priv->kbd_bl.last_brightness = brightness;
+	atomic_set(&priv->kbd_bl.last_hw_brightness, hw_brightness);
 
 	return 0;
 }
 
+static int ideapad_kbd_bl_brightness_set(struct ideapad_private *priv, int brightness)
+{
+	if (brightness > priv->kbd_bl.led.max_brightness)
+		return -EINVAL;
+
+	return ideapad_kbd_bl_hw_brightness_set(priv, brightness);
+}
+
 static int ideapad_kbd_bl_led_cdev_brightness_set(struct led_classdev *led_cdev,
 						  enum led_brightness brightness)
 {
@@ -1673,26 +1717,29 @@ static int ideapad_kbd_bl_led_cdev_brightness_set(struct led_classdev *led_cdev,
 
 static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
 {
-	int brightness;
+	int hw_brightness, brightness, last_hw_brightness;
 
 	if (!priv->kbd_bl.initialized)
 		return;
 
-	brightness = ideapad_kbd_bl_brightness_get(priv);
-	if (brightness < 0)
+	hw_brightness = ideapad_kbd_bl_hw_brightness_get(priv);
+	if (hw_brightness < 0)
 		return;
 
-	if (brightness == priv->kbd_bl.last_brightness)
-		return;
+	brightness = ideapad_kbd_bl_brightness_parse(priv, hw_brightness);
+	if (brightness < 0)
+		return; /* Reject insane values early. */
 
-	priv->kbd_bl.last_brightness = brightness;
+	last_hw_brightness = atomic_xchg(&priv->kbd_bl.last_hw_brightness, hw_brightness);
+	if (hw_brightness == last_hw_brightness)
+		return;
 
 	led_classdev_notify_brightness_hw_changed(&priv->kbd_bl.led, brightness);
 }
 
 static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 {
-	int brightness, err;
+	int hw_brightness, err;
 
 	if (!priv->features.kbd_bl)
 		return -ENODEV;
@@ -1700,21 +1747,35 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 	if (WARN_ON(priv->kbd_bl.initialized))
 		return -EEXIST;
 
-	if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type))
-		priv->kbd_bl.led.max_brightness = 2;
-	else
-		priv->kbd_bl.led.max_brightness = 1;
+	hw_brightness = ideapad_kbd_bl_hw_brightness_get(priv);
+	if (hw_brightness < 0)
+		return hw_brightness;
 
-	brightness = ideapad_kbd_bl_brightness_get(priv);
-	if (brightness < 0)
-		return brightness;
+	atomic_set(&priv->kbd_bl.last_hw_brightness, hw_brightness);
 
-	priv->kbd_bl.last_brightness = brightness;
 	priv->kbd_bl.led.name                    = "platform::" LED_FUNCTION_KBD_BACKLIGHT;
 	priv->kbd_bl.led.brightness_get          = ideapad_kbd_bl_led_cdev_brightness_get;
 	priv->kbd_bl.led.brightness_set_blocking = ideapad_kbd_bl_led_cdev_brightness_set;
 	priv->kbd_bl.led.flags                   = LED_BRIGHT_HW_CHANGED | LED_RETAIN_AT_SHUTDOWN;
 
+	switch (priv->kbd_bl.type) {
+	case KBD_BL_TRISTATE_AUTO:
+	case KBD_BL_TRISTATE:
+		priv->kbd_bl.led.max_brightness = 2;
+		break;
+	case KBD_BL_STANDARD:
+		priv->kbd_bl.led.max_brightness = 1;
+		break;
+	default:
+		/* This has already been validated by ideapad_check_features(). */
+		unreachable();
+	}
+
+	/* Reject insane values. */
+	err = ideapad_kbd_bl_brightness_parse(priv, hw_brightness);
+	if (err < 0)
+		return err;
+
 	err = led_classdev_register(&priv->platform_device->dev, &priv->kbd_bl.led);
 	if (err)
 		return err;

-- 
2.55.0


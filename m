Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2249538E8A7;
	Sat, 18 Jul 2026 17:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784394783; cv=pass; b=cSQFDxLJ5j0bCrc0sqITk30P+zkuqqHNCtCoXirCULL/pWr37FWyR7q+KIdwULtnwm667/1nRaoGuniaOc4x51GYsaPiENBn+oLK8L/cTRlvcdHldWZjLWQzjA7izfBUAr21coOdwngd1Y1yJzhx+S9/mSuIaQ3JIOWMpBAfeoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784394783; c=relaxed/simple;
	bh=L3ZscbR5KQ2zc/YbN6Z4Hul70ZBtDLupdSivXD/i8f8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N50oLwNAZjPELDVForTFNfmhMbhEnCT5Xj5N9TYLzDekEr5h8WLyjFsM4+5x1vkV5UCXXsT37hsHmBEL3zMubYFAgc4rJtXnFMS4wfXXG/GLMu5yZGpRYd/LuW9zZV3tuI/gDgHPETnV7gNKHgJyZUfFl4K197dhSMYtLp6pBKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=F6xdsodw; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="F6xdsodw"
ARC-Seal: i=1; a=rsa-sha256; t=1784394593; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fzdw87NncWfZ08DXwAGgS7RV+Obw+jWzOeMqcl6TZzUq8wq5Uc10QLAAAWNkf7hh6yop2l4hXgc/7HWoBH2VG2BbF8OnwAd5YFskJG83g0O86zCtFsVYpKEdZYHr5NPyLLvJyFfYG19xq2pEduTU0/8q9FnTXADA18Hyhizrp+8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784394593; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=b/M8GgLwAWPI3fUkEx8GGDQY1JOCadsXweVj1W2J9IA=; 
	b=IO9SMHhLrmQ9N6dquP5eyxpuSL+SBEbHwYGQh2uJ/SR/6mFYQPiOpbTDKs+Lwgg0IDMl04IYL1Bj+wH2y2B5NyteugmAvKEerx32r42AY2kuyf62TgqzRj1jivqg4JVuMxFR1ti/eY/mgQHFoPZksJgQ8oDuXY29rMRgVVeMYTk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784394593;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=b/M8GgLwAWPI3fUkEx8GGDQY1JOCadsXweVj1W2J9IA=;
	b=F6xdsodwqTWdnrHcYMtwuAFaTfOjaPBgmFHwN2RQzyP0uN3oNFGRLjiQN9YQY70d
	/0i8zGh9qYQNHH1sJA6gIg17622APpA+gYuQ627dZ11eQ35lHjjwpuoUG/YCv03R6Ju
	WxALa/4qYbE8ku3P73My98lQYgFT1ZiyT88RTP3XkiW77pjutkkg+nE8OE8MDuR+G3Q
	jBTC1jnWpaTKnwuFPu1b9tEq47/7CAYNvwdU5iaAh3CsATqJ6mQb82ssXyfDa1BeJsP
	2UMQzuk/pyHv7n2pYQY9jOEqMbvHiZ9561zT4LYxNqIDDAOX8gDl+yo3tBCau2tNeeS
	kJ9/23LFGA==
Received: by mx.zohomail.com with SMTPS id 1784394589750195.17178609482085;
	Sat, 18 Jul 2026 10:09:49 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 19 Jul 2026 01:05:28 +0800
Subject: [PATCH RFC v3 11/11] platform/x86: ideapad-laptop: Fully support
 auto keyboard backlight
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-leds-trigger-hw-changed-v3-11-5fb55722e36e@rong.moe>
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
the private trigger according to the current LED trigger state.

Meanwhile, block brightness changes on exit to prevent the side effect
of LED device unregistration when the private trigger is active from
resetting the brightness to zero, so that we can retain the state of
auto mode among boots.

Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v3:
- Address concerns from Sashiko
  - Fix a race condition in ideapad_kbd_bl_led_cdev_brightness_set()
  - Fix trigger re-registration of ideapad_kbd_bl_auto_trigger
  - https://sashiko.dev/#/patchset/20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3%40rong.moe
- Make registration failures of ideapad_kbd_bl_auto_trigger non-fatal
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 112 ++++++++++++++++++++++++---
 1 file changed, 103 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 66e16abda5e3..253d2962b927 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -1714,9 +1714,58 @@ static int ideapad_kbd_bl_led_cdev_brightness_set(struct led_classdev *led_cdev,
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
+	if (priv->kbd_bl.type != KBD_BL_TRISTATE_AUTO)
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
@@ -1738,6 +1787,8 @@ static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
 	if (hw_brightness == last_hw_brightness)
 		return;
 
+	ideapad_kbd_bl_notify_hw_control(priv, hw_brightness, last_hw_brightness);
+
 	led_classdev_notify_brightness_hw_changed(&priv->kbd_bl.led, brightness);
 }
 
@@ -1768,6 +1819,24 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 
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
+		priv->kbd_bl.led.flags             |= LED_TRIG_HW_CHANGED;
+		priv->kbd_bl.led.hw_control_trigger = ideapad_kbd_bl_auto_trigger.name;
+		priv->kbd_bl.led.trigger_type       = &ideapad_kbd_bl_auto_trigger_type;
+
+		/* Hardware remembers the last brightness level, including auto mode. */
+		if (hw_brightness == KBD_BL_AUTO_MODE_HW_BRIGHTNESS)
+			priv->kbd_bl.led.default_trigger = ideapad_kbd_bl_auto_trigger.name;
+
+		break;
 	case KBD_BL_TRISTATE:
 		priv->kbd_bl.led.max_brightness = 2;
 		break;
@@ -1779,13 +1848,22 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 		unreachable();
 	}
 
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
@@ -2612,17 +2690,30 @@ static int __init ideapad_laptop_init(void)
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
 
@@ -2630,6 +2721,9 @@ static void __exit ideapad_laptop_exit(void)
 {
 	ideapad_wmi_driver_unregister();
 	platform_driver_unregister(&ideapad_acpi_driver);
+
+	if (ideapad_kbd_bl_auto_trigger_registered)
+		led_trigger_unregister(&ideapad_kbd_bl_auto_trigger);
 }
 module_exit(ideapad_laptop_exit)
 

-- 
2.53.0


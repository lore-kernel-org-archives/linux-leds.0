Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632437;
	b=YQxui9BwKiDMarcFr+HGfdMDav+nXrdZoh3gIWwlUsPvJAfpl43c+UALZzl4FnAtfcPl
	 fyoNnYipqbLXjiJHKWluY6lzQAxLctBCoOlAed8zl1zla8kwN1fpbbPZyWtYQ66+YHl+E
	 1/v79mgrKMOpSqoeJAAdfqGS/eZSxSE/2sK+fWcjLDeZx54esj5RfqhRNiOWV+J2/XZVm
	 FmpyO5yRmUOfpckJD+Ib9dAYaiZNGX9mph7yN4xZ7ZuX26AZyVfda10cypKSQQsssvAEi
	 uLJKhWEl7xwx5IKr340W1dZan8eDg66T0W/tRf74nGuP12N0tWBZ3GpqSZkytcL2WUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y7feNmDjfQ2jApjQuy0VL1P8l3TJBR1k6HT7MTIkCw0=;
	b=hkwNny9s++kXojUHNNYyJuwmZtbTk4wwKq+77U56A7IL6AZE5eLPGaygDwnNIjopfyj5
	 YBBLRfqvo+N+QxVVzBh2Acl0ksnPUehFswVlaH/YhaXi5P8OPs44UzClfbmZrDTk08Kqp
	 i2Yc9yAJqQ2I7sNbnC12F//4NT1v+MzQOh5JdTdUXd9mhe25GDJ0wWVnzAEKHg1fO7lkt
	 jQfkgtrn8mT7q6zV73cc5gI1KOo79EkrsIQgTYJ58AxLgf49oBpyve3tvZbfYSozUoHHW
	 DVHk3NBoa7zLuwB5z8CsZeSFRFsaby4FVm4/snsNGLxLaovIF5Dvj6fK5GXXzLQji7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PB/TvD+P";
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF63B6079A8E
	for <linux-leds@vger.kernel.org>; Mon,  2 Nov 2026 15:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF63B6079A8E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PB/TvD+P
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2eb0c699769so10624875ad.1
        for <linux-leds@vger.kernel.org>; Mon, 02 Nov 2026 07:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793632436; x=1794237236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y7feNmDjfQ2jApjQuy0VL1P8l3TJBR1k6HT7MTIkCw0=;
        b=PB/TvD+Pr5FOPwke/1A60fksDFE4wenK56qArv4fl8Amx48YKVpxbXzQJwVNuBTpf0
         V/umv1ym5X8lfM8u1/S5doAkz+M9ZGeUX9NevjOrrvTYOp9wif6jR7G4cC3RRukKMExJ
         QyrSg9feCkGK9TcszdK4WdqmA4l+i0A/fu0tikhC4WJFwgZYiU54odYM9u+f6B9XtEsm
         bVHwTfN31ZgUcrGOS4eweIeRwa52Q8Wsz6nFjeuoD7hTJQKMfe3rGi4Uk9MwHswZHYaU
         Qm6ag64U0pPOMA9CcVel1bSqvfVQFN5brgehiNILxUb8arsOFiymrjzR+tfnzt+VQAYJ
         C2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632436; x=1794237236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y7feNmDjfQ2jApjQuy0VL1P8l3TJBR1k6HT7MTIkCw0=;
        b=qIQ4FAgWy4FLfVKitjAthiEJSx+iFJfBMeZgXbwsGbw5LUugDefli8kv/Hf+mKms9c
         LSS14okTa8zVXgqIyZQd19dnc/s99UNMN3/48wVcnaCmGflyjBJVvc4CIYPTZcqyeu4g
         yeJNqGI2xNuXks+MvFb+FdmW2HvzzUsM4Z2gHEdVFd+yozeTjQELNFuoEyYc++FFMsYa
         ZwtPmLMJepT6Th79+4mcheZ7m/VMQ+2k0fKJY9j554zbT/zdIHgp8yT2m2Pe8A2QvmQE
         uAb3UW/bS7t/4egkDADUEVpWWD1yjlsauVshEK33ZSJo9aEaqXPkdHF2fnY8ElR/i0+d
         jQeQ==
X-Forwarded-Encrypted: i=1; AKwUvBzj2uqewZUjT1XvPbXa1JQqUKhm7bICRh/4qpSf1MdPYOYnlkvoaQZQvU873v85tuELOYlzNWIaJ3oF@vger.kernel.org
X-Gm-Message-State: APuU4Z9OYcoV2Px9FwiVqUL0xcHOFH4ptREd5ztPeb0o25bBZrsDj9GK
	hPHXoDs7OLqNSMIT4VieyAkuTH0A2yZpZD1BkMKihltUiXMGsaFQ8GSh
X-Gm-Gg: AYBFou0wLX22gFpOSHEN1Ex8oMtsleeafYXGn1NQNhfHBwrroYhdr6hLm12xe4UDScH
	r9odMXtQlhZzH5JD9oPpTzOqKUjF2u2WTJQ8OLN0fyLk2YAr0R+ckebiYGlG9QWoOfOXa0joKD5
	gvIqVhy5IsCGE6DPc3yk6DM33emmU6MDPT/uW+lnZJgi48ck0Gh6tONbyuoSzTsOkXQYzmPSuVU
	BqJZGyvNBC5lmKC9fgRCTZ8VM9ZGw2usBgiIx8nc5HCsMifL7y9H9lnuIAK9jIH55MHiaSlIilr
	LL9mfM+ZndVxDu6l8Ysp8uq+bR48ILKqfVbaHfIrnJ3/Hg6MpxRHmXu1LGP+v5bh/W5aCAgSvuY
	Rj5gBSY/d7IczeDn+GkRa+XQQSq4kW9SvPJ3l6NN2rHcWDvvU9VVC9DPdVAqPWMIxJmE65ZNtWz
	MGKct/G40WKVReGYizExnm4mqssuhSa6iKJRfiQqoLCdbBSCd5iv6UbLE83MreeaSVLB5HndFlZ
	lYW6N3bcDzlSw6+IYWoUsQY8BO1SHRpmlsyjaRM3+1Lj7ZiPbyxEUjS3q0j/pgZgiiXC06BwTGE
	IvnXkKTdrfFDD+ZRSe/0IzCW9YglP6DJvNV0Ah9nKnTNJdZRNyxBPSQ=
X-Received: by 2002:a17:903:4690:b0:2dd:c100:4b87 with SMTP id d9443c01a7336-2eb36533c4cmr100182345ad.62.1793632435888;
        Mon, 02 Nov 2026 07:13:55 -0800 (PST)
Received: from ThinkPad ([240e:46e:8710:e4e:e10f:cd51:e533:58a5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3924c93fsm30567675ad.34.2026.11.02.07.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:13:55 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>,
	ibm-acpi-devel@lists.sourceforge.net,
	Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	Qiling Zhu <kmatzkaczor244@gmail.com>
Subject: [RFC PATCH v2 2/2] platform/x86: thinkpad_acpi: Add support for auto keyboard backlight
Date: Mon,  2 Nov 2026 23:10:19 +0800
Message-ID: <20261102151211.40701-3-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
References: <20261101100123.28749-1-kmatzkaczor244@gmail.com>
 <20261102151211.40701-1-kmatzkaczor244@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recent ThinkPads with an ambient light sensor (ALS) support an auto mode
for the keyboard backlight: the EC controls the backlight according to
ambient light. The mode is EC keyboard backlight level 3, above the two
fixed levels exposed so far, and is currently reachable only through the
Fn+Space shortcut, which is handled directly by the firmware.

Wire the auto mode up as a private hardware control trigger, named
"tpacpi-kbd-auto", on top of the LED hw control trigger framework:

  - selecting the trigger writes level 3 (activate); the offloaded state
    is derived from the current EC level
  - when Fn+Space cycles into or out of auto mode, the driver notifies
    the LED core about the hardware-initiated hardware control
    transition, so the trigger state (shown bracketed in the trigger
    sysfs attribute) follows along
  - if the EC is already in auto mode at driver initialization, the
    trigger is set as the default one

The auto mode is not a brightness level: max_brightness stays 2 and the
LED core is always told a brightness of 0 while in auto mode. The proc
interface keeps reporting the raw EC level, including 3, and keeps
rejecting writes of 3 with -EINVAL; writing a regular level through it
while in auto mode drops the trigger, like writing a brightness through
sysfs does. In auto mode suspend and resume are left to the EC and the
firmware; on resume the restored EC level is observed and reconciled.

LEDS_TRIGGERS is selected to keep the trigger functional in
stripped-down configurations.

Deliberately unchanged: module unload still resets the backlight to off;
retaining auto mode across unload is left for future work.

Note that Documentation/admin-guide/laptops/thinkpad-acpi.rst has no
kbdlight section at all, so there is no in-tree documentation to update;
userspace-facing semantics of hardware control triggers are documented
in Documentation/leds/leds-class.rst.

Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---
 drivers/platform/x86/lenovo/Kconfig         |   1 +
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 152 ++++++++++++++++++--
 2 files changed, 141 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index 516594993..77d159a3a 100644
--- a/drivers/platform/x86/lenovo/Kconfig
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -83,6 +83,7 @@ config THINKPAD_ACPI
 	select NVRAM
 	select NEW_LEDS
 	select LEDS_CLASS
+	select LEDS_TRIGGERS
 	select INPUT_SPARSEKMAP
 	help
 	  This is a driver for the IBM and Lenovo ThinkPad laptops. It adds
diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 3260eaa62..7b46ad6f9 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5102,6 +5102,14 @@ static struct ibm_struct video_driver_data = {
  * Keyboard backlight subdriver
  */
 
+/* EC level that selects ALS-controlled auto mode for the keyboard backlight */
+#define TPACPI_KBD_LIGHT_AUTO_LEVEL	3
+
+/*
+ * Cached EC level, including TPACPI_KBD_LIGHT_AUTO_LEVEL. All state
+ * tracking compares EC levels; the auto mode is translated to a
+ * brightness value only when reporting to the LED core.
+ */
 static enum led_brightness kbdlight_brightness;
 static DEFINE_MUTEX(kbdlight_mutex);
 
@@ -5180,6 +5188,15 @@ static bool kbdlight_is_supported(void)
 	return status & BIT(9);
 }
 
+/* The auto mode is not a brightness level; report it as off to the LED core. */
+static enum led_brightness kbdlight_level_to_brightness(int level)
+{
+	if (level == TPACPI_KBD_LIGHT_AUTO_LEVEL)
+		return 0;
+
+	return level;
+}
+
 static int kbdlight_sysfs_set(struct led_classdev *led_cdev,
 			enum led_brightness brightness)
 {
@@ -5194,16 +5211,54 @@ static enum led_brightness kbdlight_sysfs_get(struct led_classdev *led_cdev)
 	if (level < 0)
 		return 0;
 
-	return level;
+	return kbdlight_level_to_brightness(level);
+}
+
+static struct led_hw_trigger_type kbdlight_auto_trigger_type;
+
+static int kbdlight_auto_trigger_activate(struct led_classdev *led_cdev)
+{
+	/*
+	 * The EC may already be in auto mode (cycled there on Fn+Space, or
+	 * active since before the driver loaded), in which case there is
+	 * nothing to program.
+	 */
+	if (kbdlight_get_level() == TPACPI_KBD_LIGHT_AUTO_LEVEL)
+		return 0;
+
+	if (kbdlight_set_level(TPACPI_KBD_LIGHT_AUTO_LEVEL))
+		return -EIO;
+
+	/*
+	 * Check that the EC actually accepted the auto mode; on error the
+	 * trigger core reverts the LED to the "none" trigger.
+	 */
+	if (kbdlight_get_level() != TPACPI_KBD_LIGHT_AUTO_LEVEL)
+		return -EIO;
+
+	return 0;
 }
 
+static bool kbdlight_auto_trigger_hw_offloaded(struct led_classdev *led_cdev)
+{
+	return kbdlight_get_level() == TPACPI_KBD_LIGHT_AUTO_LEVEL;
+}
+
+static struct led_trigger kbdlight_auto_trigger = {
+	.name		= "tpacpi-kbd-auto",
+	.trigger_type	= &kbdlight_auto_trigger_type,
+	.activate	= kbdlight_auto_trigger_activate,
+	.hw_offloaded	= kbdlight_auto_trigger_hw_offloaded,
+};
+
 static struct tpacpi_led_classdev tpacpi_led_kbdlight = {
 	.led_classdev = {
 		.name		= "tpacpi::kbd_backlight",
 		.max_brightness	= 2,
-		.flags		= LED_BRIGHT_HW_CHANGED,
+		.flags		= LED_BRIGHT_HW_CHANGED | LED_TRIG_HW_CHANGED,
 		.brightness_set_blocking = &kbdlight_sysfs_set,
 		.brightness_get	= &kbdlight_sysfs_get,
+		.trigger_type	= &kbdlight_auto_trigger_type,
 	}
 };
 
@@ -5221,9 +5276,30 @@ static int __init kbdlight_init(struct ibm_init_struct *iibm)
 		return -ENODEV;
 	}
 
-	kbdlight_brightness = kbdlight_sysfs_get(NULL);
+	kbdlight_brightness = kbdlight_get_level();
+	if (kbdlight_brightness < 0)
+		kbdlight_brightness = 0;
 	tp_features.kbdlight = 1;
 
+	/*
+	 * Register the auto-mode trigger before the LED classdev: if the
+	 * EC is already in auto mode, the trigger can then be set as the
+	 * default one and gets activated during LED classdev registration.
+	 */
+	rc = devm_led_trigger_register(&tpacpi_pdev->dev,
+				       &kbdlight_auto_trigger);
+	if (rc) {
+		tp_features.kbdlight = 0;
+		return rc;
+	}
+
+	tpacpi_led_kbdlight.led_classdev.hw_control_trigger =
+		kbdlight_auto_trigger.name;
+
+	if (kbdlight_brightness == TPACPI_KBD_LIGHT_AUTO_LEVEL)
+		tpacpi_led_kbdlight.led_classdev.default_trigger =
+			kbdlight_auto_trigger.name;
+
 	rc = led_classdev_register(&tpacpi_pdev->dev,
 				   &tpacpi_led_kbdlight.led_classdev);
 	if (rc < 0) {
@@ -5246,9 +5322,22 @@ static int kbdlight_set_level_and_update(int level)
 	int ret;
 	struct led_classdev *led_cdev;
 
-	ret = kbdlight_set_level(level);
 	led_cdev = &tpacpi_led_kbdlight.led_classdev;
 
+	/*
+	 * Leaving auto mode through the proc interface has to drop the
+	 * trigger, like writing a brightness through sysfs does. Route the
+	 * new level through the LED core as well, so that it is applied
+	 * after the LED_OFF queued by dropping the trigger.
+	 */
+	if (led_trigger_is_hw_controlled(led_cdev)) {
+		led_trigger_remove_hw_control(led_cdev);
+		led_set_brightness(led_cdev, level);
+		return 0;
+	}
+
+	ret = kbdlight_set_level(level);
+
 	if (ret == 0 && !(led_cdev->flags & LED_SUSPENDED))
 		led_cdev->brightness = level;
 
@@ -5293,6 +5382,8 @@ static int kbdlight_write(char *buf)
 	return kbdlight_set_level_and_update(level);
 }
 
+static void kbdlight_notify_change(void);
+
 static void kbdlight_suspend(void)
 {
 	struct led_classdev *led_cdev;
@@ -5301,38 +5392,75 @@ static void kbdlight_suspend(void)
 		return;
 
 	led_cdev = &tpacpi_led_kbdlight.led_classdev;
+
+	/*
+	 * In auto mode the EC drives the backlight and the firmware turns
+	 * it off for suspend and restores it on resume by itself; keep the
+	 * LED core out of it entirely.
+	 */
+	if (kbdlight_get_level() == TPACPI_KBD_LIGHT_AUTO_LEVEL)
+		return;
+
 	led_update_brightness(led_cdev);
 	led_classdev_suspend(led_cdev);
 }
 
 static void kbdlight_resume(void)
 {
+	struct led_classdev *led_cdev;
+
 	if (!tp_features.kbdlight)
 		return;
 
-	led_classdev_resume(&tpacpi_led_kbdlight.led_classdev);
+	led_cdev = &tpacpi_led_kbdlight.led_classdev;
+
+	/* Only balance a suspend that actually suspended the LED. */
+	if (led_cdev->flags & LED_SUSPENDED) {
+		led_classdev_resume(led_cdev);
+		return;
+	}
+
+	/*
+	 * Auto mode was left running over suspend; observe what the
+	 * firmware actually restored.
+	 */
+	kbdlight_notify_change();
 }
 
 /*
- * The EC cycles the keyboard backlight level itself on Fn+Space; check
- * the current level and update the LED core state.
+ * The EC cycles the keyboard backlight level (and auto mode) itself on
+ * Fn+Space; check the current level and update the LED core state.
  */
 static void kbdlight_notify_change(void)
 {
 	struct led_classdev *led_cdev = &tpacpi_led_kbdlight.led_classdev;
 	enum led_brightness brightness;
+	bool was_auto, is_auto;
+	int level;
 
 	guard(mutex)(&kbdlight_mutex);
 
 	/*
-	 * Check the brightness actually changed, setting the brightness
-	 * through kbdlight_set_level() also triggers this event.
+	 * Check the level actually changed, setting the brightness through
+	 * kbdlight_set_level() also triggers this event.
 	 */
-	brightness = kbdlight_sysfs_get(NULL);
-	if (kbdlight_brightness == brightness)
+	level = kbdlight_get_level();
+	if (kbdlight_brightness == level)
 		return;
 
-	kbdlight_brightness = brightness;
+	/*
+	 * Notifying the trigger core is safe while holding
+	 * kbdlight_mutex: the transition is only queued, and the worker
+	 * re-reads the EC level (via hw_offloaded) after this critical
+	 * section has been left.
+	 */
+	is_auto = level == TPACPI_KBD_LIGHT_AUTO_LEVEL;
+	was_auto = kbdlight_brightness == TPACPI_KBD_LIGHT_AUTO_LEVEL;
+	if (is_auto != was_auto)
+		led_trigger_notify_hw_control_changed(led_cdev, is_auto);
+
+	brightness = kbdlight_level_to_brightness(level);
+	kbdlight_brightness = level;
 	led_classdev_notify_brightness_hw_changed(led_cdev, brightness);
 }
 
-- 
2.56.0


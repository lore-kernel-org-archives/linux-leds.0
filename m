Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596558;
	b=LzaLyEc84AE8pnsSqx2tqAZna8mUQ10MdIrjin2oDEcn6GNoT86razbsUBwUtbfbRJAE
	 X05mKqyodHlwaF3jn879aho3Ut54sTe32bcdss5iY5cijqJ5LOAhB1fKFcTm0JS9lNC9E
	 Z/g4qXgKuicEafvjC2cWox432YNcNcF72g3l4KqCj8fmTUZR8LFwdi8Q7dhDEcQ3TWG8/
	 bW7q7isso7rnQgZIhpCalexqP9/xelalTW11D/Srs2/lDnytOhbf3aVvOFfvdy9AoLkWS
	 Vm617Lzr/JAMINlDS7O+ijdGgJzZ+pWS9iHPlrLWI8RaaRtgfYh4YXLfMI538dhIafw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/styZDo3HIOWYzqCGtu0zg7wLv8vADgHpzW2PCNwSlE=;
	b=UDGR9tWdaRvWZJPxqZCvFpOOjXC5kVYCeHa/y0kNXBUlUfXp2vSpWR5bGlULFI1WXutq
	 Yunlj8isMZKqlXGharCQJcp98up2lvfY8jRpeaJLbDEOcs3FhGcDofkA9WwGr9K0y0oC6
	 aaIHiIho6kF197H1u6Z3hVXmNDWOtW7DpkQJs/kkI/sXJw9l2E3vYGTkglc2MisaTssA/
	 91x2W/GtidIQvQ2dxZqVRmTnE9/lNdfb9/TFth9gmdQt+2lJtQCWeUzrz/uPOTpW7M3rv
	 Jg9BiRefIqYZbvTf6i6HoP+XfSF/1h3ubHRmxFYgpN8o5zjH0eX7tbvM19GYM3ZGCqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ad6RNdKv;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52059606A330
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 08:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52059606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ad6RNdKv
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso3068677eec.0
        for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 00:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596556; x=1796201356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/styZDo3HIOWYzqCGtu0zg7wLv8vADgHpzW2PCNwSlE=;
        b=Ad6RNdKv/U2VbR9/IrvjerS0c0dP/hE1gokKFykqf46KtGuaxBtytB9+Obi8CPN1f9
         n9kCi2iKHQupuYa2EslELbR6WrQwtpi0ctOeqhmqRYxwlHA+ag2sxIzgnLW2dnAa13/M
         +vyGW/LJ/KnNi9kYOSiEGuR61IuBZMHahQRnKDJMO5ia6OS8NkNB/SWrgdgIsuU8q5RE
         /zBW90VgdcIsUgZcsKuyflloAH6klWqXcInafsb465xiLHWB33czfsN8um0H5kqCIeZt
         ZUS9keDgJ72xFn9BEDUaukNqkUxSXglaL9Rbb44SQQ8m1ZkvD8bo3sbOQnhE3w9XWfwq
         FeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596556; x=1796201356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/styZDo3HIOWYzqCGtu0zg7wLv8vADgHpzW2PCNwSlE=;
        b=jQqhMk6GAqtI5/gzQqpfmx7ne902Ryr6ULgM5UALcGfvBQTN8c1tWry+Z7HjyhpH/+
         FO0q4YEryuYe685iRLAju/xQE2gq1j+zntai1cw09YPinAky7oAMpH8pCbPhyfVdMdoD
         Ke1aYCYPVXeKNmsoVNzZ4t44WfFv4MWCSRbMUoybNwCXAnYuIRYWJ+mCt+3Lf7FnvvqU
         Ps1BXw5zBgapKM7hu1R0VRxAlu++tDpV3w/JKzhUKETyWJr1hABq3cwikG/We/mMCdYC
         Yuc12q8LPDmpjYb2I1PjTntaorfLyzGVeMzQnD2DIptGzzzHj99xv/SIH+VeehnvvF1b
         9qBQ==
X-Forwarded-Encrypted: i=1; AL+hErGr+5GSfy+vCsUdvNo69J2+EzivWVVhacvDg9akylUPZG5yd4ckiLMxb7vn9RmZUJOwFBq5rBnUk6fl@vger.kernel.org
X-Gm-Message-State: APuU4Z+Jpc8Os65PJ78bJssRbO+hpI6ulKQxK9PrPN+Ogw07vSCBQHla
	NHxANXG6KHyFs+y0vImfENiDJ0gkEaRUsRgWFpTbJAXvOHeoMcWzeXNH
X-Gm-Gg: AZFdTZcjlUav9jwZu043+jP2rKNeUWE53ewUx6O4IQHjPUltRViqcS2onS37bEAQD8d
	6ZdFDqtUgsuub8ponX8eIzHZYPCPOs+sqKlhjeJB1oSli5gPoF9clyh2PUM0d0epl5mtDQpxRFo
	50E31V6OG+OAUBamJ3B0KmnnFzIiG2lb1C33ZwgoBxWr/MG7kWn+etQzgdyTv4T+Z59YmhxjIqo
	/veNRzkeuTb1DcVfQSzUNv78c2aKQq/B0iZENpYvet28Rs7YITalvjzwGIUBeeh52uI3WdrxMwp
	LemTL7Pa8HUSDdFXHqT1hTzRh8WTf/xNJeaz4nyW94RXUoD4ZacOZGFOTkDNxgSDKshNX8wQgQ3
	BXzzJ4xw6vpYm4z+obBMj0tL83o3PJmTfJzKgc/swD4OEesvTXNAoc08CQkCc9TUNEWI5qTGquZ
	p+2lGXrzbfhWhW95zQMkA8I4W3HJxId29WecpsDRW06u6bhwj9tD7Kc3VyMnUmUWIa5eAL4EYXP
	X4LKWPsVVwKaMQzz+RUVk96+6lRvJtsxp3hDW1X0QDClqQxtUZAKNaTAXQBESd6PoJnOaz78dLu
	AnaZm6EHdLoDa3Gz8n6pB1/TptAU
X-Received: by 2002:a05:7301:923:b0:36a:1709:458 with SMTP id 5a478bee46e88-3856f859121mr19687590eec.27.1795596556422;
        Wed, 25 Nov 2026 00:49:16 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm18879252eec.9.2026.11.25.00.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:49:16 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-leds@vger.kernel.org,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>
Subject: [PATCH v4 6/6] platform/x86: thinkpad_acpi: Add a keyboard backlight auto-mode trigger
Date: Wed, 25 Nov 2026 16:46:43 +0800
Message-ID: <20261125084644.137506-7-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125084644.137506-1-kmatzkaczor244@gmail.com>
References: <20261125084644.137506-1-kmatzkaczor244@gmail.com>
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

On ThinkPads that advertise the auto mode in MLCG bit 20, expose EC
level 3 as a private LED trigger named "tpacpi-kbd-auto".  Select
LEDS_TRIGGERS so that the trigger is available in stripped-down
configurations.  If registering the trigger fails, register the
keyboard backlight LED as before.

Activating the trigger writes EC level 3 and records it in the cached
level; whether the LED is hardware-controlled is derived from that
cached level, so reading brightness returns -ENODATA while the trigger
is active and the EC is in auto mode.  If the EC is already in auto
mode when the driver loads, make the trigger the default one, to
reflect a selection made before the driver was loaded.

A sysfs brightness write leaves auto mode through the LED core's own
trigger removal.  With CONFIG_LEDS_TRIGGERS_HW_CHANGED enabled, the LED
core also switches between "none" and the trigger in response to
Fn+Space, or to a procfs write that leaves auto mode.

Deliberately unchanged: max_brightness stays 2.

Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---
 drivers/platform/x86/lenovo/Kconfig         |  1 +
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 60 +++++++++++++++++++++
 2 files changed, 61 insertions(+)

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
index ee8f7429d..f9a835fe2 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5222,6 +5222,27 @@ static bool kbdlight_is_supported(void)
 	return status & BIT(9);
 }
 
+static struct led_hw_trigger_type kbdlight_auto_trigger_type;
+
+static int kbdlight_auto_trigger_activate(struct led_classdev *led_cdev)
+{
+	return kbdlight_set_level_and_update(TPACPI_KBD_LIGHT_AUTO_LEVEL);
+}
+
+static bool kbdlight_auto_trigger_hw_offloaded(struct led_classdev *led_cdev)
+{
+	guard(mutex)(&kbdlight_mutex);
+
+	return kbdlight_brightness == TPACPI_KBD_LIGHT_AUTO_LEVEL;
+}
+
+static struct led_trigger kbdlight_auto_trigger = {
+	.name		= "tpacpi-kbd-auto",
+	.trigger_type	= &kbdlight_auto_trigger_type,
+	.activate	= kbdlight_auto_trigger_activate,
+	.hw_offloaded	= kbdlight_auto_trigger_hw_offloaded,
+};
+
 static int kbdlight_sysfs_set(struct led_classdev *led_cdev,
 			enum led_brightness brightness)
 {
@@ -5249,6 +5270,35 @@ static struct tpacpi_led_classdev tpacpi_led_kbdlight = {
 	}
 };
 
+static void __init kbdlight_init_auto_trigger(void)
+{
+	struct led_classdev *led_cdev = &tpacpi_led_kbdlight.led_classdev;
+	int rc;
+
+	rc = devm_led_trigger_register(&tpacpi_pdev->dev, &kbdlight_auto_trigger);
+	if (rc) {
+		/*
+		 * Auto-mode trigger unavailable; basic backlight
+		 * control keeps working.
+		 */
+		dev_warn(&tpacpi_pdev->dev, "auto-mode trigger unavailable\n");
+		return;
+	}
+
+	led_cdev->flags |= LED_TRIG_HW_CHANGED;
+	led_cdev->trigger_type = &kbdlight_auto_trigger_type;
+	led_cdev->hw_control_trigger = kbdlight_auto_trigger.name;
+
+	/*
+	 * The EC does not keep the level across boots, but it may already
+	 * be in auto mode when the driver loads: Fn+Space works at the
+	 * BIOS or disk-encryption prompt, and while the module is
+	 * unloaded.  Sync the initial trigger state with the EC then.
+	 */
+	if (kbdlight_brightness == TPACPI_KBD_LIGHT_AUTO_LEVEL)
+		led_cdev->default_trigger = kbdlight_auto_trigger.name;
+}
+
 static int __init kbdlight_init(struct ibm_init_struct *iibm)
 {
 	int rc;
@@ -5269,6 +5319,9 @@ static int __init kbdlight_init(struct ibm_init_struct *iibm)
 
 	tp_features.kbdlight = 1;
 
+	if (tp_features.kbdlight_auto)
+		kbdlight_init_auto_trigger();
+
 	rc = led_classdev_register(&tpacpi_pdev->dev,
 				   &tpacpi_led_kbdlight.led_classdev);
 	if (rc < 0) {
@@ -5289,6 +5342,7 @@ static void kbdlight_exit(void)
 static void kbdlight_notify_level(int level)
 {
 	struct led_classdev *led_cdev = &tpacpi_led_kbdlight.led_classdev;
+	bool was_auto, is_auto;
 
 	lockdep_assert_held(&kbdlight_mutex);
 
@@ -5299,6 +5353,12 @@ static void kbdlight_notify_level(int level)
 	if (level == kbdlight_brightness)
 		return;
 
+	was_auto = kbdlight_brightness == TPACPI_KBD_LIGHT_AUTO_LEVEL;
+	is_auto = level == TPACPI_KBD_LIGHT_AUTO_LEVEL;
+
+	if (is_auto != was_auto && led_cdev->hw_control_trigger)
+		led_trigger_notify_hw_control_changed(led_cdev, is_auto);
+
 	kbdlight_brightness = level;
 	led_classdev_notify_brightness_hw_changed(led_cdev, kbdlight_level_to_brightness(level));
 }
-- 
2.56.1


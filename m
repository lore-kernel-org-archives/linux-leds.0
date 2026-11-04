Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795195;
	b=u6JPcz4mNS04XfNCke6szxwJQdevKY0Y8gAGn++1IrM8YkxoantzjjHJgDNHmm8C9Ua8
	 a2v6UtjJq4C5TTqfFirU7Mwk6LcGrhqncGoG77/PtTgGtcHMgSU5NDB/cX2P0k7F+eCDT
	 iUzvynky/b9ZNPFs5Z8zrWcaMvrZxbRPU64BZkyGX6+RAA8Q58HckH9WByaljZdEiQ3q4
	 6txwSWClymFRk8FYm5fGZ/SwzmxBQ0ASS85O825VHqCCa8TgchvforEpqNTVT4HaLAzx+
	 OE7D96FnyVD1UOL4/5BR11SfrjdjYWdlUjrJ0JuxSRBOinA5wUySv8G2sY/4a/o+yTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ZrqYmFboseaWvyfG7gkwsiYJ19YZHfBqxK9w3RRraM0=;
	b=X/BE3PGtd1MubqcDkeX+wLcEusQ+tb+jdIk99JqEb0jWI2k+BhbbxprghQgUyfOlCuQZ
	 1/xru+MDv3OdP9Rf35GoOH8x5k+z5+uh27JQN+YdBGZ/DfWbutGGwfzNdYGw56o7ThPlV
	 rqeEVvYtTLKDoBhIys9UTpClupchs+3NzsCGvZy1xhkXNnpk5XrsrOpwEGdh3d9xLms8R
	 p2xsSc4uh6Zp9+00nRylD4UjwjkqbtZqFQPZH7+7vjQR0CLDZrl0ErdEfuNY3jp4/BS6X
	 lpfB8X4Z86eOPLaBZw4maZ5Qy6kU9ayJRiIX4alb7gplsbnUOcEB28woYVoxUOItNlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0fsrhQFl;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0118606EE8D
	for <linux-leds@vger.kernel.org>; Wed,  4 Nov 2026 12:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0118606EE8D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0fsrhQFl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so5775025e9.0
        for <linux-leds@vger.kernel.org>; Wed, 04 Nov 2026 04:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795193; x=1794399993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZrqYmFboseaWvyfG7gkwsiYJ19YZHfBqxK9w3RRraM0=;
        b=0fsrhQFlHNe2dyMAfTb9BQT9b3x/mmwIHn3FdwVoZmg7CJ9hFyIvSgdTCpZNoRzx/D
         BhhLO50OeSr0Q5h5QB2VItHYe3vzmkg/REA4sfo9sdvhcoAaEs0xZSjG+1r0+V2OvZVj
         kZ+Ul0eJ4D4C0Z9njF1Ho5HUM3CFWNZQZviF9P4FcQSDxaoeNrZTrF5/dfG8AMPbpAcP
         EK06LJ/70AONmf5TDaY2A/74yFnUydVOHm3iqVS5y8HUXKEQ97cVGlQ6hMtvz4RmtvPt
         H1wqrk6bMZYAi4/WXMQYyWMzWLGQbe3f6v6WJ+Vlz9t6Lh1UgtWA/r7VN0QIFpKGqYtj
         jtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795193; x=1794399993;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZrqYmFboseaWvyfG7gkwsiYJ19YZHfBqxK9w3RRraM0=;
        b=A6ILWMlxyrQnmSsZpLmAN9+FYq/h4+ueTXFWGVQCRDW9I1frVQwgEPH0AvFc966GA7
         NLi3aF5gP/f1Pm+2Ryy0jdO6ZAe/tZC34Evr8c8duWhnwLoLjHYwfsXTLIeTpzpDLXaY
         xgfr/KQG5HYJ0QvTdh0mqZQ4KaGMyG9VAZiRnHrGiSHUwbAU3Eo19SK+aCoHZufKEngg
         iNMGqsP0bvxzRoSnv0ZI7FTYQBzHqbzdb1nVrJ4UQVB3jRTwn0HNFRYYa7NMQFRAI3Yi
         0b2fqbhkaJXLUukg+IG0lC1RZLS3Z8vNFqhtSZygtluZgZ1fmm6dWPNn1+EqwqT9LQeN
         3rpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkn1jQ/QknqvFMKl8FnTS95kYX9EZ4kX6L5z1FEfWzvNLC1rHP2TjumHKHeRD35To3TqCcD4qiMLJd@vger.kernel.org
X-Gm-Message-State: APuU4Z/ACpVa8HJnxtqYR879+EcUn5ZEahH9KC+VL/t4w5pNt5qZyF/X
	yjlaCa4aVDPfpvo+oZPzPnEPPnpel/iRZjU/wWYvw2vvtOJNX17AfXkg
X-Gm-Gg: AYBFou1+bx3EaUjhsoY5Zw0dLCQLziWQf2sFBay5yAvzT0f3fuGI2AbhpZOZ5HAK/rg
	NsQxtD3SeJyXz8Zutd+vLF5FcjLNW/1hUKl1qcpX9pKCsH0GxO0PpPRZZ5n78WK2vLGx9q/os7k
	3OuBijN0Lxzl050iXy1DrbG4pS3Pis/4AFNsVIM9XlDIm2gGKT5jMpN5f7cMxoP4V2v9n9sr9zq
	ikvqbfoa/9Vhtb15Ecxfz+t5XApKr9ogOAeeY8FTmgOzRxCL0v5psuRvK7Rt98x8hrtPfZ7pl5w
	cUgdoUmpy0kDEuql7rGwfDATJUTxJmDlLEpYoaALxr45jEl/u6PDCO6oYmQcm27mlOuLxLrGuwH
	yGa5pbXrZtvgCpGDNSHwQoIrIKQR2+3Dz0ZxdH8+imDjHce4ljBr0fsNQiq5zRHYueFN79tEhLo
	nPWt0DnalsAPSrnaAJm+l0RBRMbJwTY1SSvxEwG4svJsbuNX+8jX/SlU1IrCiJUDFWuJwcE6FJP
	R4Bg5Q6deASACM1vOqHnVkCJs1Nay6GeTvTUer3tSU/9GVIG7lupJOhq3GO93gCWmkoEWNwfU09
	kZQkj/kCih4ibJLM3mD/xHdCmZDce6s48fGGmZttjq3Rrv2Jfg==
X-Received: by 2002:a05:600c:a012:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4ac17b2ce18mr354317305e9.27.1793795193089;
        Wed, 04 Nov 2026 04:26:33 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43da9825bsm50492415e9.15.2026.11.04.04.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:26:31 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
	Florian Krischer <florian.krischer@fkr.dev>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v13 4/7] input: keyboard: Add driver for ASUS Transformer dock multimedia keys
Date: Wed,  4 Nov 2026 14:26:03 +0200
Message-ID: <20261104122606.215629-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104122606.215629-1-clamor95@gmail.com>
References: <20261104122606.215629-1-clamor95@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Michał Mirosław <mirq-linux@rere.qmqm.pl>

Add support for multimedia top button row of ASUS Transformer's Mobile
Dock keyboard. Driver is made that function keys (F1-F12) are used by
default which suits average Linux use better and with pressing
ScreenLock + AltGr function keys layout is switched to multimedia keys.
Only Dock keyboard input events are tracked for AltGr pressing.

Co-developed-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/input/keyboard/Kconfig                |  10 +
 drivers/input/keyboard/Makefile               |   1 +
 .../input/keyboard/asus-transformer-ec-keys.c | 216 ++++++++++++++++++
 3 files changed, 227 insertions(+)
 create mode 100644 drivers/input/keyboard/asus-transformer-ec-keys.c

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index d8c64f333462c..728bc068667e7 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -89,6 +89,16 @@ config KEYBOARD_APPLESPI
 	  To compile this driver as a module, choose M here: the
 	  module will be called applespi.
 
+config KEYBOARD_ASUS_TRANSFORMER_EC
+	tristate "Asus Transformer's Mobile Dock multimedia keys"
+	depends on MFD_ASUS_TRANSFORMER_EC
+	help
+	  Say Y here if you want to use multimedia keys present on Asus
+	  Transformer's Mobile Dock.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called asus-transformer-ec-keys.
+
 config KEYBOARD_ATARI
 	tristate "Atari keyboard"
 	depends on ATARI
diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
index 60bb7baf802f7..0d81096887ada 100644
--- a/drivers/input/keyboard/Makefile
+++ b/drivers/input/keyboard/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_KEYBOARD_ADP5585)		+= adp5585-keys.o
 obj-$(CONFIG_KEYBOARD_ADP5588)		+= adp5588-keys.o
 obj-$(CONFIG_KEYBOARD_AMIGA)		+= amikbd.o
 obj-$(CONFIG_KEYBOARD_APPLESPI)		+= applespi.o
+obj-$(CONFIG_KEYBOARD_ASUS_TRANSFORMER_EC)	+= asus-transformer-ec-keys.o
 obj-$(CONFIG_KEYBOARD_ATARI)		+= atakbd.o
 obj-$(CONFIG_KEYBOARD_ATKBD)		+= atkbd.o
 obj-$(CONFIG_KEYBOARD_BCM)		+= bcm-keypad.o
diff --git a/drivers/input/keyboard/asus-transformer-ec-keys.c b/drivers/input/keyboard/asus-transformer-ec-keys.c
new file mode 100644
index 0000000000000..5a8fb86a97555
--- /dev/null
+++ b/drivers/input/keyboard/asus-transformer-ec-keys.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/array_size.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/mfd/asus-transformer-ec.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define ASUSEC_EXT_KEY_CODES		0x20
+
+struct asus_ec_keys_data {
+	struct notifier_block nb;
+	struct asusec_core *ec;
+	struct input_dev *xidev;
+	unsigned short keymap[ASUSEC_EXT_KEY_CODES * 2];
+	bool special_key_mode;
+};
+
+static const unsigned short asus_ec_dock_ext_keys[] = {
+	/* Function keys [0x00 - 0x19] */
+	[0x01] = KEY_DELETE,
+	[0x02] = KEY_F1,
+	[0x03] = KEY_F2,
+	[0x04] = KEY_F3,
+	[0x05] = KEY_F4,
+	[0x06] = KEY_F5,
+	[0x07] = KEY_F6,
+	[0x08] = KEY_F7,
+	[0x10] = KEY_F8,
+	[0x11] = KEY_F9,
+	[0x12] = KEY_F10,
+	[0x13] = KEY_F11,
+	[0x14] = KEY_F12,
+	[0x15] = KEY_MUTE,
+	[0x16] = KEY_VOLUMEDOWN,
+	[0x17] = KEY_VOLUMEUP,
+	/* Multimedia keys [0x20 - 0x39] */
+	[0x21] = KEY_SCREENLOCK,
+	[0x22] = KEY_WLAN,
+	[0x23] = KEY_BLUETOOTH,
+	[0x24] = KEY_TOUCHPAD_TOGGLE,
+	[0x25] = KEY_BRIGHTNESSDOWN,
+	[0x26] = KEY_BRIGHTNESSUP,
+	[0x27] = KEY_BRIGHTNESS_AUTO,
+	[0x28] = KEY_PRINT,
+	[0x30] = KEY_WWW,
+	[0x31] = KEY_CONFIG,
+	[0x32] = KEY_PREVIOUSSONG,
+	[0x33] = KEY_PLAYPAUSE,
+	[0x34] = KEY_NEXTSONG,
+	[0x35] = KEY_MUTE,
+	[0x36] = KEY_VOLUMEDOWN,
+	[0x37] = KEY_VOLUMEUP,
+};
+
+static void asus_ec_keys_report_key(struct input_dev *dev, unsigned int code,
+				    unsigned int key, bool value)
+{
+	input_event(dev, EV_MSC, MSC_SCAN, code);
+	input_report_key(dev, key, value);
+	input_sync(dev);
+}
+
+static int asus_ec_keys_process_key(struct input_dev *dev, u8 code)
+{
+	struct asus_ec_keys_data *priv = dev_get_drvdata(dev->dev.parent);
+	unsigned int key = 0;
+
+	if (code == 0)
+		return NOTIFY_DONE;
+
+	if (priv->ec->right_alt_pressed) {
+		priv->ec->special_combo_triggered = true;
+
+		/* Flip special key mode state when pressing SCREEN LOCK + R ALT */
+		if (code == 1) {
+			priv->special_key_mode = !priv->special_key_mode;
+			return NOTIFY_OK;
+		}
+	}
+
+	/*
+	 * Relocate code to second "page" if pressed state XOR's mode state
+	 * This way special key will invert the current mode
+	 */
+	if (priv->special_key_mode ^ priv->ec->right_alt_pressed)
+		code += ASUSEC_EXT_KEY_CODES;
+
+	if (code < dev->keycodemax) {
+		unsigned short *map = dev->keycode;
+
+		key = map[code];
+	}
+
+	if (!key)
+		key = KEY_UNKNOWN;
+
+	asus_ec_keys_report_key(dev, code, key, 1);
+	asus_ec_keys_report_key(dev, code, key, 0);
+
+	return NOTIFY_OK;
+}
+
+static int asus_ec_keys_notify(struct notifier_block *nb, unsigned long action, void *data_)
+{
+	struct asus_ec_keys_data *priv =
+		container_of(nb, struct asus_ec_keys_data, nb);
+	u8 *data = data_;
+
+	if (action & ASUSEC_SMI_MASK)
+		return NOTIFY_DONE;
+
+	if (action & ASUSEC_SCI_MASK)
+		return asus_ec_keys_process_key(priv->xidev, data[2]);
+
+	return NOTIFY_DONE;
+}
+
+static void asus_ec_keys_setup_keymap(struct asus_ec_keys_data *priv)
+{
+	struct input_dev *dev = priv->xidev;
+	unsigned int i;
+
+	BUILD_BUG_ON(ARRAY_SIZE(priv->keymap) < ARRAY_SIZE(asus_ec_dock_ext_keys));
+
+	dev->keycode = priv->keymap;
+	dev->keycodesize = sizeof(*priv->keymap);
+	dev->keycodemax = ARRAY_SIZE(priv->keymap);
+
+	input_set_capability(dev, EV_MSC, MSC_SCAN);
+	input_set_capability(dev, EV_KEY, KEY_UNKNOWN);
+
+	for (i = 0; i < ARRAY_SIZE(asus_ec_dock_ext_keys); i++) {
+		unsigned int code = asus_ec_dock_ext_keys[i];
+
+		__set_bit(code, dev->keybit);
+		priv->keymap[i] = code;
+	}
+}
+
+static int asus_ec_keys_open(struct input_dev *input)
+{
+	struct asus_ec_keys_data *priv = input_get_drvdata(input);
+	struct asusec_core *ec = priv->ec;
+	int error;
+
+	priv->nb.notifier_call = asus_ec_keys_notify;
+	error = blocking_notifier_chain_register(&ec->notify_list, &priv->nb);
+	if (error)
+		return error;
+
+	ec->ext_keys_enabled = true;
+
+	return 0;
+}
+
+static void asus_ec_keys_close(struct input_dev *input)
+{
+	struct asus_ec_keys_data *priv = input_get_drvdata(input);
+	struct asusec_core *ec = priv->ec;
+
+	ec->ext_keys_enabled = false;
+	blocking_notifier_chain_unregister(&ec->notify_list, &priv->nb);
+}
+
+static int asus_ec_keys_probe(struct platform_device *pdev)
+{
+	struct i2c_client *parent = to_i2c_client(pdev->dev.parent);
+	struct asusec_core *ec = dev_get_drvdata(pdev->dev.parent);
+	struct device *dev = &pdev->dev;
+	struct asus_ec_keys_data *priv;
+	int error;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+	priv->ec = ec;
+
+	priv->xidev = devm_input_allocate_device(dev);
+	if (!priv->xidev)
+		return -ENOMEM;
+
+	priv->xidev->name = devm_kasprintf(dev, GFP_KERNEL, "%s Keyboard Ext", ec->model);
+	priv->xidev->phys = devm_kasprintf(dev, GFP_KERNEL, "i2c-%u-%04x",
+					   i2c_adapter_id(parent->adapter), parent->addr);
+
+	if (!priv->xidev->name || !priv->xidev->phys)
+		return -ENOMEM;
+
+	priv->xidev->open = asus_ec_keys_open;
+	priv->xidev->close = asus_ec_keys_close;
+	input_set_drvdata(priv->xidev, priv);
+
+	asus_ec_keys_setup_keymap(priv);
+
+	error = input_register_device(priv->xidev);
+	if (error)
+		return dev_err_probe(dev, error, "Failed to register extension keys\n");
+
+	return 0;
+}
+
+static struct platform_driver asus_ec_keys_driver = {
+	.driver.name = "asus-transformer-ec-keys",
+	.probe = asus_ec_keys_probe,
+};
+module_platform_driver(asus_ec_keys_driver);
+
+MODULE_ALIAS("platform:asus-transformer-ec-keys");
+MODULE_AUTHOR("Michał Mirosław <mirq-linux@rere.qmqm.pl>");
+MODULE_DESCRIPTION("ASUS Transformer's multimedia keys driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0


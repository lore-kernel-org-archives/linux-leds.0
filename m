Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DCB44D021
	for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2026 09:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627601; cv=none; b=ZWWvfin3lMMF86CLWWvmMS+4Dk7mozWKu0P5uWXaR4pZbVmLQejy4r2zRY6/QD82Ocm8qmVRqFZsKAkjNMmAL73eQ1hk/x+0Au+EHV90g8OXzCzMfv0gJtfTqrus1j40ydiIYiOR2R/On4H2NVjH1PAHtYpu8E+PKGvyInk4Fvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627601; c=relaxed/simple;
	bh=36Fm0XKKpglJqJTQXDjBBwGW+jY6X8re7o5+BQh56H8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ofx1txGZvehmFU8qTjghKDdj61nrzOrH8eDiXfkJgAQ8k4HWn5V4E5UMoHE1jG3rYgWHhNvQv1v0oB5iO1Bwkyy6BV6bSim+VMH6AYbragk+V+1deYUtmJMMjK7rnG2d3qawxyGsQ/5JOorqeGaKasXhFdtV0Hg/RDsm8j1mcsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCb7jdFu; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCb7jdFu"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-495635a85d2so12353635e9.0
        for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2026 02:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784627595; x=1785232395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2YqtUSJZQXU32v22oGNWv7m7+Rsi7u5BUjEL4bNYMHE=;
        b=YCb7jdFuNDOVUtPQRTsRsUs9xx4PhwXgmg/oVorOt43VStdNb48t6hm+7f4yqUGox2
         gfj5kI1JxlbK/8UUz5CbK/PrvUHbtb3iczt/MX04emoxsvmeY8EKUzkVus7WSMgsl+qL
         t5zOQ4ex+uiJ4/ZgoHQ+cB0NU2IJvar8AbB0IrVuEe2UYztUKF/aDk/ldph4K1nPfIp6
         VbHyr8v3O3iUk2hpaqL/mreEq78EaMP/hyaLkE7njvJQIfTSLkVzB6KSISXuW3hluv9p
         rNE2bhmib/Ejg1j+UOHSOsPjnzuWNlAXMsmbyAo6oodrrZPrqL4++u/Dxjutw7pNehuC
         +pAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627595; x=1785232395;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2YqtUSJZQXU32v22oGNWv7m7+Rsi7u5BUjEL4bNYMHE=;
        b=JHWFTRukKDJp50j6FS0YyDeIclckeDrfaSWTFljkT7amfF9rbPuaUgcvqiHDmGoxx6
         hJ2Ylj9AUGXzwLIAwKZHMrGfyV4eGVC60fA4Pxq/gCi6DUFZPt+SIFbML+4U7JK/hRAm
         RBM4NUnQYjHZiUiu3uXyATzzgP/TWQLu84JsmMKaR02UsO30Ix3lFus0asIIOwCmdZd/
         EW+r+aUK1itG3PsdfInsnSJxt4ZBczfZkhAZrPZq1wFY9AlRRde8NzvSMFExsHcOyA8B
         7vsZ4ijIIWbHA8Rdtf60pQtecntSFPBaCXK1w6pwT1wk6o9ld8MABvF1f/K9qhdozNhn
         b0/w==
X-Forwarded-Encrypted: i=1; AHgh+RrfUuzCwT+pP4or19FvHHVtEDeA7E2y0B9OTgOpeknIwKFphKxiWxEypRUU0dB9acQb4YSX/S9ANJxs@vger.kernel.org
X-Gm-Message-State: AOJu0YySuvDxzx6uhYGqianag453XUZsWCbC8a6PJS6GuF7APUckVhW9
	Za+RvkQeRfw0pFiVPZGLZ60gXtU8FwFb80/o6UZzm6LabYejPf3j0jkm
X-Gm-Gg: AfdE7cnm2iKkh1N4vVIk0W2H+2/Du9lrprBNFJ7qwFvNEKp1oShJNhLKQQYvVtgEEoZ
	hiET5Y1bKi+8LJyFJ3E3iHVFJBRXFyagjafL2ml9IzofdDjoLrlQhozsmsse/u6NZD1I0Nq3IyB
	BxAM264cWToGtbL0ZO4dXLDKD2sHIvi71c/mTFIKG08Yc2m+Q/cgG6NsdM9eUN930Zpt0ah5MPH
	By0+IQvfP3gP1WQbDSZyBvMT6zHI3srwtWFm1ZM+1xoOcvU0Leam3+gUxGbU8h9Cj3miyksDjRq
	fD7eytZTRFgOoSCCPcuG1qn8ym0weZC2zt83moomdrkl45q5C1RToC9eXzhzwEdB2zb6usoI3Ml
	/FT2anHKfX3ffhuMY0aNyL9reO0sB24Z61xB/HpdUlrW5KbeSHzZfJ1nvc2CeI6FMmMzHUCvPE2
	868SYUHbbTcg/A1F4ZrneWk14=
X-Received: by 2002:a05:600c:b85:b0:495:5365:c0d1 with SMTP id 5b1f17b1804b1-49553d85ea0mr149031905e9.14.1784627594424;
        Tue, 21 Jul 2026 02:53:14 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49565482c5asm82834285e9.10.2026.07.21.02.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:53:13 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v10 4/7] input: keyboard: Add driver for ASUS Transformer dock multimedia keys
Date: Tue, 21 Jul 2026 12:52:30 +0300
Message-ID: <20260721095233.420823-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721095233.420823-1-clamor95@gmail.com>
References: <20260721095233.420823-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
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
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/input/keyboard/Kconfig                |  10 +
 drivers/input/keyboard/Makefile               |   1 +
 .../input/keyboard/asus-transformer-ec-keys.c | 310 ++++++++++++++++++
 3 files changed, 321 insertions(+)
 create mode 100644 drivers/input/keyboard/asus-transformer-ec-keys.c

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 9d1019ba0245b..913cb4900565c 100644
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
index 0000000000000..44235e4a7f548
--- /dev/null
+++ b/drivers/input/keyboard/asus-transformer-ec-keys.c
@@ -0,0 +1,310 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/array_size.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/mfd/asus-transformer-ec.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#define ASUSEC_EXT_KEY_CODES		0x20
+
+struct asus_ec_keys_data {
+	struct notifier_block nb;
+	struct asusec_core *ec;
+	struct input_dev *xidev;
+	struct input_handler input_handler;
+	unsigned short keymap[ASUSEC_EXT_KEY_CODES * 2];
+	const char *kbc_phys;
+	bool special_key_pressed;
+	bool special_key_mode;
+};
+
+static void asus_ec_input_event(struct input_handle *handle,
+				unsigned int event_type,
+				unsigned int event_code, int value)
+{
+	struct asus_ec_keys_data *priv = handle->handler->private;
+
+	/* Store special key state */
+	if (event_type == EV_KEY && event_code == KEY_RIGHTALT)
+		priv->special_key_pressed = !!value;
+}
+
+static int asus_ec_input_connect(struct input_handler *handler,
+				 struct input_dev *dev,
+				 const struct input_device_id *id)
+{
+	struct asus_ec_keys_data *priv = handler->private;
+	struct input_handle *handle;
+	int error;
+
+	if (!dev->phys || !strstr(dev->phys, priv->kbc_phys))
+		return -ENODEV;
+
+	handle = kzalloc_obj(*handle);
+	if (!handle)
+		return -ENOMEM;
+
+	handle->dev = dev;
+	handle->handler = handler;
+	handle->name = handler->name;
+
+	error = input_register_handle(handle);
+	if (error)
+		goto err_free_handle;
+
+	error = input_open_device(handle);
+	if (error)
+		goto err_unregister_handle;
+
+	return 0;
+
+ err_unregister_handle:
+	input_unregister_handle(handle);
+ err_free_handle:
+	kfree(handle);
+
+	return error;
+}
+
+static void asus_ec_input_disconnect(struct input_handle *handle)
+{
+	input_close_device(handle);
+	input_unregister_handle(handle);
+	kfree(handle);
+}
+
+static const struct input_device_id asus_ec_input_ids[] = {
+	{
+		.flags = INPUT_DEVICE_ID_MATCH_EVBIT,
+		.evbit = { BIT_MASK(EV_KEY) },
+	},
+	{ }
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
+	/* Flip special key mode state when pressing SCREEN LOCK + R ALT */
+	if (priv->special_key_pressed && code == 1) {
+		priv->special_key_mode = !priv->special_key_mode;
+		return NOTIFY_DONE;
+	}
+
+	/*
+	 * Relocate code to second "page" if pressed state XOR's mode state
+	 * This way special key will invert the current mode
+	 */
+	if (priv->special_key_mode ^ priv->special_key_pressed)
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
+static int asus_ec_keys_notify(struct notifier_block *nb,
+			       unsigned long action, void *data_)
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
+		if (!code)
+			continue;
+
+		__set_bit(code, dev->keybit);
+		priv->keymap[i] = code;
+	}
+}
+
+static int asus_ec_keys_register_handler(struct device *dev,
+					 struct asus_ec_keys_data *priv)
+{
+	struct i2c_client *parent = to_i2c_client(dev->parent);
+	int error;
+
+	priv->input_handler.event = asus_ec_input_event;
+	priv->input_handler.connect = asus_ec_input_connect;
+	priv->input_handler.disconnect = asus_ec_input_disconnect;
+	priv->input_handler.id_table = asus_ec_input_ids;
+	priv->input_handler.passive_observer = true;
+	priv->input_handler.private = priv;
+	priv->input_handler.name = devm_kasprintf(dev, GFP_KERNEL,
+						  "%s-media-handler",
+						  priv->ec->name);
+	if (!priv->input_handler.name)
+		return -ENOMEM;
+
+	priv->kbc_phys = devm_kasprintf(dev, GFP_KERNEL, "i2c-%u-%04x/serio0",
+					i2c_adapter_id(parent->adapter),
+					parent->addr);
+	if (!priv->kbc_phys)
+		return -ENOMEM;
+
+	error = input_register_handler(&priv->input_handler);
+	if (error)
+		return error;
+
+	return 0;
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
+	priv->xidev->name = devm_kasprintf(dev, GFP_KERNEL, "%s Keyboard Ext",
+					   ec->model);
+	priv->xidev->phys = devm_kasprintf(dev, GFP_KERNEL, "i2c-%u-%04x",
+					   i2c_adapter_id(parent->adapter),
+					   parent->addr);
+
+	if (!priv->xidev->name || !priv->xidev->phys)
+		return -ENOMEM;
+
+	asus_ec_keys_setup_keymap(priv);
+
+	error = input_register_device(priv->xidev);
+	if (error)
+		return dev_err_probe(dev, error,
+				     "failed to register extension keys\n");
+
+	error = asus_ec_keys_register_handler(dev, priv);
+	if (error)
+		return error;
+
+	priv->nb.notifier_call = asus_ec_keys_notify;
+
+	error = blocking_notifier_chain_register(&ec->notify_list, &priv->nb);
+	if (error) {
+		input_unregister_handler(&priv->input_handler);
+		return error;
+	}
+
+	return 0;
+}
+
+static void asus_ec_keys_remove(struct platform_device *pdev)
+{
+	struct asus_ec_keys_data *priv = platform_get_drvdata(pdev);
+	struct asusec_core *ec = priv->ec;
+
+	blocking_notifier_chain_unregister(&ec->notify_list, &priv->nb);
+	input_unregister_handler(&priv->input_handler);
+}
+
+static struct platform_driver asus_ec_keys_driver = {
+	.driver.name = "asus-transformer-ec-keys",
+	.probe = asus_ec_keys_probe,
+	.remove = asus_ec_keys_remove,
+};
+module_platform_driver(asus_ec_keys_driver);
+
+MODULE_ALIAS("platform:asus-transformer-ec-keys");
+MODULE_AUTHOR("Michał Mirosław <mirq-linux@rere.qmqm.pl>");
+MODULE_DESCRIPTION("ASUS Transformer's multimedia keys driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0


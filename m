From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 4/4] platform: x86: dell-*: Simplify dell-rbtn integration with dell-laptop [untested]
Date: Sun, 23 Oct 2016 21:46:52 +0200
Message-ID: <20161023194652.24335-4-hdegoede@redhat.com>
References: <20161023194652.24335-1-hdegoede@redhat.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:56266 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753493AbcJWTrH (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 23 Oct 2016 15:47:07 -0400
In-Reply-To: <20161023194652.24335-1-hdegoede@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

Use dell_smbios*notifier for dell-laptop to listen to dell-rbtn slider
events, replace dell_rbtn_notifier_register() /
dell_rbtn_notifier_unregister() with a single dell_rbtn_has_rfkill() used
by dell-laptop to decide whether or not to use the i8042 filter and used
by dell-rbtn to auto-remove its rfkill interface when called.

This results in a nice cleanup, downside is that the rfkill interface
of dell-rbtn is not automatically re-enabled on rmmod dell-laptop, this
now requires rmmod + insmod of dell-rbtn. But people who do not want
dell-laptop for some reason will have it blacklisted anyways, so this
is not an issue and there is a work-around.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
-This is a new patch in v2 of my platform/x86/dell-* notifier set intended
 to show how dell_smbios*notifier can be used to improve the dell-rbtn
 integration too
---
 drivers/platform/x86/Kconfig       |  1 +
 drivers/platform/x86/dell-laptop.c | 53 +++++++-------------------------
 drivers/platform/x86/dell-rbtn.c   | 63 +++++++++-----------------------------
 drivers/platform/x86/dell-rbtn.h   |  5 +--
 drivers/platform/x86/dell-smbios.h |  1 +
 5 files changed, 29 insertions(+), 94 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 81b8dcc..30291e1 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -158,6 +158,7 @@ config DELL_RBTN
 	depends on ACPI
 	depends on INPUT
 	depends on RFKILL
+	depends on DELL_SMBIOS
 	---help---
 	  Say Y here if you want to support Dell Airplane Mode Switch ACPI
 	  device on Dell laptops. Sometimes it has names: DELLABCE or DELRBTN.
diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 5a96c25..3803da1 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -670,25 +670,12 @@ static bool dell_laptop_i8042_filter(unsigned char data, unsigned char str,
 	return false;
 }
 
-static int (*dell_rbtn_notifier_register_func)(struct notifier_block *);
-static int (*dell_rbtn_notifier_unregister_func)(struct notifier_block *);
-
-static int dell_laptop_rbtn_notifier_call(struct notifier_block *nb,
-					  unsigned long action, void *data)
-{
-	schedule_delayed_work(&dell_rfkill_work, 0);
-	return NOTIFY_OK;
-}
-
-static struct notifier_block dell_laptop_rbtn_notifier = {
-	.notifier_call = dell_laptop_rbtn_notifier_call,
-};
-
 static int __init dell_setup_rfkill(void)
 {
 	struct calling_interface_buffer *buffer;
 	int status, ret, whitelisted;
 	const char *product;
+	int (*dell_rbtn_has_rfkill_func)(void);
 
 	/*
 	 * rfkill support causes trouble on various models, mostly Inspirons.
@@ -773,29 +760,13 @@ static int __init dell_setup_rfkill(void)
 	 *
 	 * To prevent duplicate rfkill devices which control and do same thing,
 	 * dell-rbtn driver will automatically remove its own rfkill devices
-	 * once function dell_rbtn_notifier_register() is called.
+	 * once function dell_rbtn_has_rfkill() is called.
 	 */
 
-	dell_rbtn_notifier_register_func =
-		symbol_request(dell_rbtn_notifier_register);
-	if (dell_rbtn_notifier_register_func) {
-		dell_rbtn_notifier_unregister_func =
-			symbol_request(dell_rbtn_notifier_unregister);
-		if (!dell_rbtn_notifier_unregister_func) {
-			symbol_put(dell_rbtn_notifier_register);
-			dell_rbtn_notifier_register_func = NULL;
-		}
-	}
-
-	if (dell_rbtn_notifier_register_func) {
-		ret = dell_rbtn_notifier_register_func(
-			&dell_laptop_rbtn_notifier);
-		symbol_put(dell_rbtn_notifier_register);
-		dell_rbtn_notifier_register_func = NULL;
-		if (ret != 0) {
-			symbol_put(dell_rbtn_notifier_unregister);
-			dell_rbtn_notifier_unregister_func = NULL;
-		}
+	dell_rbtn_has_rfkill_func = symbol_request(dell_rbtn_has_rfkill);
+	if (dell_rbtn_has_rfkill_func) {
+		ret = dell_rbtn_has_rfkill();
+		symbol_put(dell_rbtn_has_rfkill);
 	} else {
 		pr_info("Symbols from dell-rbtn acpi driver are not available\n");
 		ret = -ENODEV;
@@ -835,13 +806,7 @@ static int __init dell_setup_rfkill(void)
 
 static void dell_cleanup_rfkill(void)
 {
-	if (dell_rbtn_notifier_unregister_func) {
-		dell_rbtn_notifier_unregister_func(&dell_laptop_rbtn_notifier);
-		symbol_put(dell_rbtn_notifier_unregister);
-		dell_rbtn_notifier_unregister_func = NULL;
-	} else {
-		i8042_remove_filter(dell_laptop_i8042_filter);
-	}
+	i8042_remove_filter(dell_laptop_i8042_filter);
 	cancel_delayed_work_sync(&dell_rfkill_work);
 	if (wifi_rfkill) {
 		rfkill_unregister(wifi_rfkill);
@@ -1984,6 +1949,10 @@ static int dell_laptop_notifier_call(struct notifier_block *nb,
 		if (kbd_led_present)
 			led_notify_brightness_change(&kbd_led);
 		break;
+	case dell_smbios_rbtn_slider:
+		if (wifi_rfkill || bluetooth_rfkill || wwan_rfkill)
+			schedule_delayed_work(&dell_rfkill_work, 0);
+		break;
 	}
 
 	return NOTIFY_OK;
diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x86/dell-rbtn.c
index dcd9f40..b6c03d4 100644
--- a/drivers/platform/x86/dell-rbtn.c
+++ b/drivers/platform/x86/dell-rbtn.c
@@ -17,6 +17,8 @@
 #include <linux/acpi.h>
 #include <linux/rfkill.h>
 #include <linux/input.h>
+#include "dell-smbios.h"
+#include "dell-rbtn.h"
 
 enum rbtn_type {
 	RBTN_UNKNOWN,
@@ -295,12 +297,11 @@ static struct acpi_driver rbtn_driver = {
 
 
 /*
- * notifier export functions
+ * Functions to coordinate registering only 1 rfkill with dell-laptop
  */
 
 static bool auto_remove_rfkill = true;
-
-static ATOMIC_NOTIFIER_HEAD(rbtn_chain_head);
+static bool init_rfkill = true;
 
 static int rbtn_inc_count(struct device *dev, void *data)
 {
@@ -314,26 +315,14 @@ static int rbtn_inc_count(struct device *dev, void *data)
 	return 0;
 }
 
-static int rbtn_switch_dev(struct device *dev, void *data)
+static int rbtn_disable_rfkill(struct device *dev, void *data)
 {
-	struct acpi_device *device = to_acpi_device(dev);
-	struct rbtn_data *rbtn_data = device->driver_data;
-	bool enable = data;
-
-	if (rbtn_data->type != RBTN_SLIDER)
-		return 0;
-
-	if (enable)
-		rbtn_rfkill_init(device);
-	else
-		rbtn_rfkill_exit(device);
-
+	rbtn_rfkill_exit(to_acpi_device(dev));
 	return 0;
 }
 
-int dell_rbtn_notifier_register(struct notifier_block *nb)
+int dell_rbtn_has_rfkill(void)
 {
-	bool first;
 	int count;
 	int ret;
 
@@ -343,35 +332,15 @@ int dell_rbtn_notifier_register(struct notifier_block *nb)
 	if (ret || count == 0)
 		return -ENODEV;
 
-	first = !rbtn_chain_head.head;
-
-	ret = atomic_notifier_chain_register(&rbtn_chain_head, nb);
-	if (ret != 0)
-		return ret;
-
-	if (auto_remove_rfkill && first)
-		ret = driver_for_each_device(&rbtn_driver.drv, NULL,
-					     (void *)false, rbtn_switch_dev);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(dell_rbtn_notifier_register);
-
-int dell_rbtn_notifier_unregister(struct notifier_block *nb)
-{
-	int ret;
-
-	ret = atomic_notifier_chain_unregister(&rbtn_chain_head, nb);
-	if (ret != 0)
-		return ret;
-
-	if (auto_remove_rfkill && !rbtn_chain_head.head)
-		ret = driver_for_each_device(&rbtn_driver.drv, NULL,
-					     (void *)true, rbtn_switch_dev);
+	if (auto_remove_rfkill) {
+		init_rfkill = false;
+		ret = driver_for_each_device(&rbtn_driver.drv, NULL, NULL,
+					     rbtn_disable_rfkill);
+	}
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(dell_rbtn_notifier_unregister);
+EXPORT_SYMBOL_GPL(dell_rbtn_has_rfkill);
 
 
 /*
@@ -408,9 +377,7 @@ static int rbtn_add(struct acpi_device *device)
 		ret = rbtn_input_init(rbtn_data);
 		break;
 	case RBTN_SLIDER:
-		if (auto_remove_rfkill && rbtn_chain_head.head)
-			ret = 0;
-		else
+		if (init_rfkill)
 			ret = rbtn_rfkill_init(device);
 		break;
 	default:
@@ -467,7 +434,7 @@ static void rbtn_notify(struct acpi_device *device, u32 event)
 		break;
 	case RBTN_SLIDER:
 		rbtn_rfkill_event(device);
-		atomic_notifier_call_chain(&rbtn_chain_head, event, device);
+		dell_smbios_call_notifier(dell_smbios_rbtn_slider, NULL);
 		break;
 	default:
 		break;
diff --git a/drivers/platform/x86/dell-rbtn.h b/drivers/platform/x86/dell-rbtn.h
index c59cc6b..97578e8 100644
--- a/drivers/platform/x86/dell-rbtn.h
+++ b/drivers/platform/x86/dell-rbtn.h
@@ -16,9 +16,6 @@
 #ifndef _DELL_RBTN_H_
 #define _DELL_RBTN_H_
 
-struct notifier_block;
-
-int dell_rbtn_notifier_register(struct notifier_block *nb);
-int dell_rbtn_notifier_unregister(struct notifier_block *nb);
+int dell_rbtn_has_rfkill(void);
 
 #endif
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell-smbios.h
index e91f13f..92817a1 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -48,6 +48,7 @@ struct calling_interface_token *dell_smbios_find_token(int tokenid);
 
 enum dell_smbios_notifier_actions {
 	dell_smbios_kbd_backlight_brightness_changed,
+	dell_smbios_rbtn_slider,
 };
 
 int dell_smbios_register_notifier(struct notifier_block *nb);
-- 
2.9.3

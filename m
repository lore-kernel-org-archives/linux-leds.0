From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v8 4/7] platform/x86/dell-*: Add a generic dell-laptop notifier chain
Date: Thu,  9 Feb 2017 16:44:14 +0100
Message-ID: <20170209154417.19040-5-hdegoede@redhat.com>
References: <20170209154417.19040-1-hdegoede@redhat.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:44960 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752597AbdBIQkO (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 9 Feb 2017 11:40:14 -0500
In-Reply-To: <20170209154417.19040-1-hdegoede@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

There are several cases where events handled in one of the dell-* drivers
need to be propagated to another dell-* driver.

This commits add 3 generic functions:
dell_laptop_register_notifier()
dell_laptop_unregister_notifier()
dell_laptop_call_notifier()

It currently only defines 1 action:
DELL_LAPTOP_KBD_BACKLIGHT_BRIGHTNESS_CHANGED

Which is intended to propagate kbd_backlight_brightness_changed wmi
events from dell-wmi to dell-laptop (which contains the actual kbd
backlight driver).

These functions are put in dell-smbios as both dell-wmi and dell-laptop
use smbios functions and I do not want to put the notifier head in
either driver, as that will make the 2 drivers depend on each other.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
-This is a new patch in v2 of this patch-set
Changes in v3:
-No changes
Changes in v4:
-Rename functions from dell_smbios_*_notifier to dell_laptop_*_notifier
Changes in v5:
-Dropped due to new led-trigger based approach making this unnecessary
Changes in v6:
-Re-introduced as led-trigger based approach got nacked
Changes in v8:
-Change from atomic to blocking notifier as some of the called notifier
 callbacks may take a mutex
---
 drivers/platform/x86/dell-smbios.c | 20 ++++++++++++++++++++
 drivers/platform/x86/dell-smbios.h | 11 +++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
index d2412ab..0a57234 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -105,6 +105,26 @@ struct calling_interface_token *dell_smbios_find_token(int tokenid)
 }
 EXPORT_SYMBOL_GPL(dell_smbios_find_token);
 
+static BLOCKING_NOTIFIER_HEAD(dell_laptop_chain_head);
+
+int dell_laptop_register_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&dell_laptop_chain_head, nb);
+}
+EXPORT_SYMBOL_GPL(dell_laptop_register_notifier);
+
+int dell_laptop_unregister_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&dell_laptop_chain_head, nb);
+}
+EXPORT_SYMBOL_GPL(dell_laptop_unregister_notifier);
+
+void dell_laptop_call_notifier(unsigned long action, void *data)
+{
+	blocking_notifier_call_chain(&dell_laptop_chain_head, action, data);
+}
+EXPORT_SYMBOL_GPL(dell_laptop_call_notifier);
+
 static void __init parse_da_table(const struct dmi_header *dm)
 {
 	/* Final token is a terminator, so we don't want to copy it */
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell-smbios.h
index ec7d40a..45cbc22 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -16,6 +16,8 @@
 #ifndef _DELL_SMBIOS_H_
 #define _DELL_SMBIOS_H_
 
+struct notifier_block;
+
 /* This structure will be modified by the firmware when we enter
  * system management mode, hence the volatiles */
 
@@ -43,4 +45,13 @@ void dell_smbios_release_buffer(void);
 void dell_smbios_send_request(int class, int select);
 
 struct calling_interface_token *dell_smbios_find_token(int tokenid);
+
+enum dell_laptop_notifier_actions {
+	DELL_LAPTOP_KBD_BACKLIGHT_BRIGHTNESS_CHANGED,
+};
+
+int dell_laptop_register_notifier(struct notifier_block *nb);
+int dell_laptop_unregister_notifier(struct notifier_block *nb);
+void dell_laptop_call_notifier(unsigned long action, void *data);
+
 #endif
-- 
2.9.3

From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4 3/4] platform: x86: dell-*: Add a generic dell-laptop notifier chain
Date: Tue,  1 Nov 2016 14:37:47 +0100
Message-ID: <20161101133748.7168-3-hdegoede@redhat.com>
References: <20161101133748.7168-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20161101133748.7168-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-leds@vger.kernel.org

There are several cases where events handled in one of the dell-* drivers
need to be propagated to another dell-* driver.

This commits add 3 generic functions:
dell_laptop_register_notifier()
dell_laptop_unregister_notifier()
dell_laptop_call_notifier()

It currently only defines 1 action:
dell_laptop_kbd_backlight_brightness_changed

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
---
 drivers/platform/x86/dell-smbios.c | 20 ++++++++++++++++++++
 drivers/platform/x86/dell-smbios.h | 11 +++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
index d2412ab..bceb382 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -105,6 +105,26 @@ struct calling_interface_token *dell_smbios_find_token(int tokenid)
 }
 EXPORT_SYMBOL_GPL(dell_smbios_find_token);
 
+static ATOMIC_NOTIFIER_HEAD(dell_laptop_chain_head);
+
+int dell_laptop_register_notifier(struct notifier_block *nb)
+{
+	return atomic_notifier_chain_register(&dell_laptop_chain_head, nb);
+}
+EXPORT_SYMBOL_GPL(dell_laptop_register_notifier);
+
+int dell_laptop_unregister_notifier(struct notifier_block *nb)
+{
+	return atomic_notifier_chain_unregister(&dell_laptop_chain_head, nb);
+}
+EXPORT_SYMBOL_GPL(dell_laptop_unregister_notifier);
+
+void dell_laptop_call_notifier(unsigned long action, void *data)
+{
+	atomic_notifier_call_chain(&dell_laptop_chain_head, action, data);
+}
+EXPORT_SYMBOL_GPL(dell_laptop_call_notifier);
+
 static void __init parse_da_table(const struct dmi_header *dm)
 {
 	/* Final token is a terminator, so we don't want to copy it */
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell-smbios.h
index ec7d40a..b8e01cc 100644
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
+	dell_laptop_kbd_backlight_brightness_changed,
+};
+
+int dell_laptop_register_notifier(struct notifier_block *nb);
+int dell_laptop_unregister_notifier(struct notifier_block *nb);
+void dell_laptop_call_notifier(unsigned long action, void *data);
+
 #endif
-- 
2.9.3

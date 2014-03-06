From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH] dell-led: add mic mute led interface
Date: Thu,  6 Mar 2014 17:21:25 +0800
Message-ID: <1394097685-24815-1-git-send-email-alex.hung@canonical.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:46739 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751647AbaCFJUs (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 6 Mar 2014 04:20:48 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, alex.hung@canonical.com

This patch provides similar led functional of

  420f973 thinkpad-acpi: Add mute and mic-mute LED functionality

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/leds/dell-led.c  | 180 +++++++++++++++++++++++++++++++++++++++++++++--
 include/linux/dell-led.h |  10 +++
 2 files changed, 183 insertions(+), 7 deletions(-)
 create mode 100644 include/linux/dell-led.h

diff --git a/drivers/leds/dell-led.c b/drivers/leds/dell-led.c
index e5c5738..cbbd8e0 100644
--- a/drivers/leds/dell-led.c
+++ b/drivers/leds/dell-led.c
@@ -15,12 +15,15 @@
 #include <linux/leds.h>
 #include <linux/slab.h>
 #include <linux/module.h>
+#include <linux/dmi.h>
+#include <linux/dell-led.h>
 
 MODULE_AUTHOR("Louis Davis/Jim Dailey");
 MODULE_DESCRIPTION("Dell LED Control Driver");
 MODULE_LICENSE("GPL");
 
 #define DELL_LED_BIOS_GUID "F6E4FE6E-909D-47cb-8BAB-C9F6F2F8D396"
+#define DELL_APP_GUID "A80593CE-A997-11DA-B012-B622A1EF5492"
 MODULE_ALIAS("wmi:" DELL_LED_BIOS_GUID);
 
 /* Error Result Codes: */
@@ -39,6 +42,155 @@ MODULE_ALIAS("wmi:" DELL_LED_BIOS_GUID);
 #define CMD_LED_OFF	17
 #define CMD_LED_BLINK	18
 
+struct app_wmi_args {
+	u16 class;
+	u16 selector;
+	u32 arg1;
+	u32 arg2;
+	u32 arg3;
+	u32 arg4;
+	u32 res1;
+	u32 res2;
+	u32 res3;
+	u32 res4;
+	char dummy[92];
+};
+
+#define GLOBAL_MIC_MUTE_ENABLE	0x364
+#define GLOBAL_MIC_MUTE_DISABLE	0x365
+
+struct dell_bios_data_token {
+	u16 tokenid;
+	u16 location;
+	u16 value;
+};
+
+struct __attribute__ ((__packed__)) dell_bios_calling_interface {
+	struct	dmi_header header;
+	u16	cmd_io_addr;
+	u8	cmd_io_code;
+	u32	supported_cmds;
+	struct	dell_bios_data_token damap[];
+};
+
+static struct dell_bios_data_token dell_mic_tokens[2];
+
+static int dell_wmi_perform_query(struct app_wmi_args *args)
+{
+	struct app_wmi_args *bios_return;
+	union acpi_object *obj;
+	struct acpi_buffer input;
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	u32 rc;
+	acpi_status status;
+
+	input.length = 128;
+	input.pointer = args;
+
+	status = wmi_evaluate_method(DELL_APP_GUID, 0, 1, &input, &output);
+	if (!ACPI_SUCCESS(status))
+		return -EINVAL;
+
+	obj = output.pointer;
+
+	if (!obj) {
+		return -EINVAL;
+	} else if (obj->type != ACPI_TYPE_BUFFER) {
+		kfree(obj);
+		return -EINVAL;
+	}
+
+	bios_return = (struct app_wmi_args *)obj->buffer.pointer;
+	rc = bios_return->res1;
+
+	if (rc) {
+		kfree(obj);
+		return rc;
+	}
+
+	memcpy(args, bios_return, sizeof(struct app_wmi_args));
+	kfree(obj);
+
+	return 0;
+}
+
+static void __init find_micmute_tokens(const struct dmi_header *dm, void *dummy)
+{
+	struct dell_bios_calling_interface *calling_interface;
+	struct dell_bios_data_token *token;
+	int token_size = sizeof(struct dell_bios_data_token);
+	int i = 0;
+
+	if (dm->type == 0xda && dm->length > 17) {
+		calling_interface = container_of(dm,
+				struct dell_bios_calling_interface, header);
+
+		token = &calling_interface->damap[i];
+		while (token->tokenid != 0xffff) {
+			if (token->tokenid == GLOBAL_MIC_MUTE_DISABLE)
+				memcpy(&dell_mic_tokens[0], token, token_size);
+			else if (token->tokenid == GLOBAL_MIC_MUTE_ENABLE)
+				memcpy(&dell_mic_tokens[1], token, token_size);
+
+			i++;
+			token = &calling_interface->damap[i];
+		}
+	}
+}
+
+static int dell_micmute_led_set(int state)
+{
+	struct app_wmi_args args;
+	struct dell_bios_data_token *token;
+
+	if (!wmi_has_guid(DELL_APP_GUID))
+		return -ENODEV;
+
+	if (state == 0 || state == 1)
+		token = &dell_mic_tokens[state];
+	else
+		return -EINVAL;
+
+	memset(&args, 0, sizeof(struct app_wmi_args));
+
+	args.class = 1;
+	args.arg1 = token->location;
+	args.arg2 = token->value;
+
+	dell_wmi_perform_query(&args);
+
+	return state;
+}
+
+int dell_app_wmi_led_set(int whichled, int on)
+{
+	int state = 0;
+
+	switch (whichled) {
+	case DELL_LED_MICMUTE:
+		state = dell_micmute_led_set(on);
+		break;
+	default:
+		pr_warn("led type %x is not supported\n", whichled);
+		break;
+	}
+
+	return state;
+}
+EXPORT_SYMBOL_GPL(dell_app_wmi_led_set);
+
+static int __init dell_micmute_led_init(void)
+{
+	memset(dell_mic_tokens, 0, sizeof(struct dell_bios_data_token) * 2);
+	dmi_walk(find_micmute_tokens, NULL);
+
+	return 0;
+}
+
+static void __exit dell_micmute_led_exit(void)
+{
+}
+
 struct bios_args {
 	unsigned char length;
 	unsigned char result_code;
@@ -181,21 +333,35 @@ static int __init dell_led_init(void)
 {
 	int error = 0;
 
-	if (!wmi_has_guid(DELL_LED_BIOS_GUID))
+	if (!wmi_has_guid(DELL_LED_BIOS_GUID) && !wmi_has_guid(DELL_APP_GUID))
 		return -ENODEV;
 
-	error = led_off();
-	if (error != 0)
-		return -ENODEV;
+	if (wmi_has_guid(DELL_APP_GUID))
+		error = dell_micmute_led_init();
+
+	if (wmi_has_guid(DELL_LED_BIOS_GUID)) {
+		error = led_off();
+		if (error != 0)
+			return -ENODEV;
+
+		error = led_classdev_register(NULL, &dell_led);
+	}
 
-	return led_classdev_register(NULL, &dell_led);
+	return error;
 }
 
 static void __exit dell_led_exit(void)
 {
-	led_classdev_unregister(&dell_led);
+	int error = 0;
 
-	led_off();
+	if (wmi_has_guid(DELL_APP_GUID))
+		dell_micmute_led_exit();
+
+	if (wmi_has_guid(DELL_LED_BIOS_GUID)) {
+		error = led_off();
+		if (error == 0)
+			led_classdev_unregister(&dell_led);
+	}
 }
 
 module_init(dell_led_init);
diff --git a/include/linux/dell-led.h b/include/linux/dell-led.h
new file mode 100644
index 0000000..7009b8b
--- /dev/null
+++ b/include/linux/dell-led.h
@@ -0,0 +1,10 @@
+#ifndef __DELL_LED_H__
+#define __DELL_LED_H__
+
+enum {
+	DELL_LED_MICMUTE,
+};
+
+int dell_app_wmi_led_set(int whichled, int on);
+
+#endif
-- 
1.8.1.2

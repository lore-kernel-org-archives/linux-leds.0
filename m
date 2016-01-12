From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 01/14] dell-laptop: extract SMBIOS-related code to a separate module
Date: Tue, 12 Jan 2016 15:02:47 +0100
Message-ID: <1452607380-20861-2-git-send-email-kernel@kempniu.pl>
References: <1452607380-20861-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452607380-20861-1-git-send-email-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Extract SMBIOS-related code from dell-laptop to a new kernel module,
dell-smbios.  The static specifier was removed from exported symbols,
otherwise code is just moved around.

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
 drivers/platform/x86/Kconfig       |   12 ++-
 drivers/platform/x86/Makefile      |    1 +
 drivers/platform/x86/dell-laptop.c |  163 +---------------------------=
--
 drivers/platform/x86/dell-smbios.c |  193 ++++++++++++++++++++++++++++=
++++++++
 drivers/platform/x86/dell-smbios.h |   51 ++++++++++
 5 files changed, 257 insertions(+), 163 deletions(-)
 create mode 100644 drivers/platform/x86/dell-smbios.c
 create mode 100644 drivers/platform/x86/dell-smbios.h

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
index f37821f..177a794 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -91,10 +91,20 @@ config ASUS_LAPTOP
=20
 	  If you have an ACPI-compatible ASUS laptop, say Y or M here.
=20
+config DELL_SMBIOS
+	tristate "Dell SMBIOS Support"
+	depends on DCDBAS
+	default n
+	---help---
+	This module provides common functions for kernel modules using
+	Dell SMBIOS.
+
+	If you have a Dell laptop, say Y or M here.
+
 config DELL_LAPTOP
 	tristate "Dell Laptop Extras"
 	depends on X86
-	depends on DCDBAS
+	depends on DELL_SMBIOS
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on ACPI_VIDEO || ACPI_VIDEO =3D n
 	depends on RFKILL || RFKILL =3D n
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makef=
ile
index 8b8df29..1128595 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_EEEPC_WMI)		+=3D eeepc-wmi.o
 obj-$(CONFIG_MSI_LAPTOP)	+=3D msi-laptop.o
 obj-$(CONFIG_ACPI_CMPC)		+=3D classmate-laptop.o
 obj-$(CONFIG_COMPAL_LAPTOP)	+=3D compal-laptop.o
+obj-$(CONFIG_DELL_SMBIOS)	+=3D dell-smbios.o
 obj-$(CONFIG_DELL_LAPTOP)	+=3D dell-laptop.o
 obj-$(CONFIG_DELL_WMI)		+=3D dell-wmi.o
 obj-$(CONFIG_DELL_WMI_AIO)	+=3D dell-wmi-aio.o
diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-laptop.c
index aaeeae8..d45d356 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -28,12 +28,11 @@
 #include <linux/acpi.h>
 #include <linux/mm.h>
 #include <linux/i8042.h>
-#include <linux/slab.h>
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
 #include <acpi/video.h>
-#include "../../firmware/dcdbas.h"
 #include "dell-rbtn.h"
+#include "dell-smbios.h"
=20
 #define BRIGHTNESS_TOKEN 0x7d
 #define KBD_LED_OFF_TOKEN 0x01E1
@@ -44,33 +43,6 @@
 #define KBD_LED_AUTO_75_TOKEN 0x02EC
 #define KBD_LED_AUTO_100_TOKEN 0x02F6
=20
-/* This structure will be modified by the firmware when we enter
- * system management mode, hence the volatiles */
-
-struct calling_interface_buffer {
-	u16 class;
-	u16 select;
-	volatile u32 input[4];
-	volatile u32 output[4];
-} __packed;
-
-struct calling_interface_token {
-	u16 tokenID;
-	u16 location;
-	union {
-		u16 value;
-		u16 stringlength;
-	};
-};
-
-struct calling_interface_structure {
-	struct dmi_header header;
-	u16 cmdIOAddress;
-	u8 cmdIOCode;
-	u32 supportedCmds;
-	struct calling_interface_token tokens[];
-} __packed;
-
 struct quirk_entry {
 	u8 touchpad_led;
=20
@@ -103,11 +75,6 @@ static struct quirk_entry quirk_dell_xps13_9333 =3D=
 {
 	.kbd_timeouts =3D { 0, 5, 15, 60, 5 * 60, 15 * 60, -1 },
 };
=20
-static int da_command_address;
-static int da_command_code;
-static int da_num_tokens;
-static struct calling_interface_token *da_tokens;
-
 static struct platform_driver platform_driver =3D {
 	.driver =3D {
 		.name =3D "dell-laptop",
@@ -306,112 +273,6 @@ static const struct dmi_system_id dell_quirks[] _=
_initconst =3D {
 	{ }
 };
=20
-static struct calling_interface_buffer *buffer;
-static DEFINE_MUTEX(buffer_mutex);
-
-static void clear_buffer(void)
-{
-	memset(buffer, 0, sizeof(struct calling_interface_buffer));
-}
-
-static void get_buffer(void)
-{
-	mutex_lock(&buffer_mutex);
-	clear_buffer();
-}
-
-static void release_buffer(void)
-{
-	mutex_unlock(&buffer_mutex);
-}
-
-static void __init parse_da_table(const struct dmi_header *dm)
-{
-	/* Final token is a terminator, so we don't want to copy it */
-	int tokens =3D (dm->length-11)/sizeof(struct calling_interface_token)=
-1;
-	struct calling_interface_token *new_da_tokens;
-	struct calling_interface_structure *table =3D
-		container_of(dm, struct calling_interface_structure, header);
-
-	/* 4 bytes of table header, plus 7 bytes of Dell header, plus at leas=
t
-	   6 bytes of entry */
-
-	if (dm->length < 17)
-		return;
-
-	da_command_address =3D table->cmdIOAddress;
-	da_command_code =3D table->cmdIOCode;
-
-	new_da_tokens =3D krealloc(da_tokens, (da_num_tokens + tokens) *
-				 sizeof(struct calling_interface_token),
-				 GFP_KERNEL);
-
-	if (!new_da_tokens)
-		return;
-	da_tokens =3D new_da_tokens;
-
-	memcpy(da_tokens+da_num_tokens, table->tokens,
-	       sizeof(struct calling_interface_token) * tokens);
-
-	da_num_tokens +=3D tokens;
-}
-
-static void __init find_tokens(const struct dmi_header *dm, void *dumm=
y)
-{
-	switch (dm->type) {
-	case 0xd4: /* Indexed IO */
-	case 0xd5: /* Protected Area Type 1 */
-	case 0xd6: /* Protected Area Type 2 */
-		break;
-	case 0xda: /* Calling interface */
-		parse_da_table(dm);
-		break;
-	}
-}
-
-static int find_token_id(int tokenid)
-{
-	int i;
-
-	for (i =3D 0; i < da_num_tokens; i++) {
-		if (da_tokens[i].tokenID =3D=3D tokenid)
-			return i;
-	}
-
-	return -1;
-}
-
-static int find_token_location(int tokenid)
-{
-	int id;
-
-	id =3D find_token_id(tokenid);
-	if (id =3D=3D -1)
-		return -1;
-
-	return da_tokens[id].location;
-}
-
-static struct calling_interface_buffer *
-dell_send_request(struct calling_interface_buffer *buffer, int class,
-		  int select)
-{
-	struct smi_cmd command;
-
-	command.magic =3D SMI_CMD_MAGIC;
-	command.command_address =3D da_command_address;
-	command.command_code =3D da_command_code;
-	command.ebx =3D virt_to_phys(buffer);
-	command.ecx =3D 0x42534931;
-
-	buffer->class =3D class;
-	buffer->select =3D select;
-
-	dcdbas_smi_request(&command);
-
-	return buffer;
-}
-
 static inline int dell_smi_error(int value)
 {
 	switch (value) {
@@ -2122,13 +1983,6 @@ static int __init dell_init(void)
 	/* find if this machine support other functions */
 	dmi_check_system(dell_quirks);
=20
-	dmi_walk(find_tokens, NULL);
-
-	if (!da_tokens)  {
-		pr_info("Unable to find dmi tokens\n");
-		return -ENODEV;
-	}
-
 	ret =3D platform_driver_register(&platform_driver);
 	if (ret)
 		goto fail_platform_driver;
@@ -2141,16 +1995,6 @@ static int __init dell_init(void)
 	if (ret)
 		goto fail_platform_device2;
=20
-	/*
-	 * Allocate buffer below 4GB for SMI data--only 32-bit physical addr
-	 * is passed to SMI handler.
-	 */
-	buffer =3D (void *)__get_free_page(GFP_KERNEL | GFP_DMA32);
-	if (!buffer) {
-		ret =3D -ENOMEM;
-		goto fail_buffer;
-	}
-
 	ret =3D dell_setup_rfkill();
=20
 	if (ret) {
@@ -2208,15 +2052,12 @@ static int __init dell_init(void)
 fail_backlight:
 	dell_cleanup_rfkill();
 fail_rfkill:
-	free_page((unsigned long)buffer);
-fail_buffer:
 	platform_device_del(platform_device);
 fail_platform_device2:
 	platform_device_put(platform_device);
 fail_platform_device1:
 	platform_driver_unregister(&platform_driver);
 fail_platform_driver:
-	kfree(da_tokens);
 	return ret;
 }
=20
@@ -2232,8 +2073,6 @@ static void __exit dell_exit(void)
 		platform_device_unregister(platform_device);
 		platform_driver_unregister(&platform_driver);
 	}
-	kfree(da_tokens);
-	free_page((unsigned long)buffer);
 }
=20
 /* dell-rbtn.c driver export functions which will not work correctly (=
and could
diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/=
dell-smbios.c
new file mode 100644
index 0000000..260a32a
--- /dev/null
+++ b/drivers/platform/x86/dell-smbios.c
@@ -0,0 +1,193 @@
+/*
+ *  Common functions for kernel modules using Dell SMBIOS
+ *
+ *  Copyright (c) Red Hat <mjg@redhat.com>
+ *  Copyright (c) 2014 Gabriele Mazzotta <gabriele.mzt@gmail.com>
+ *  Copyright (c) 2014 Pali Roh=C3=A1r <pali.rohar@gmail.com>
+ *
+ *  Based on documentation in the libsmbios package:
+ *  Copyright (C) 2005-2014 Dell Inc.
+ *
+ *  This program is free software; you can redistribute it and/or modi=
fy
+ *  it under the terms of the GNU General Public License version 2 as
+ *  published by the Free Software Foundation.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/dmi.h>
+#include <linux/gfp.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include "../../firmware/dcdbas.h"
+#include "dell-smbios.h"
+
+struct calling_interface_structure {
+	struct dmi_header header;
+	u16 cmdIOAddress;
+	u8 cmdIOCode;
+	u32 supportedCmds;
+	struct calling_interface_token tokens[];
+} __packed;
+
+static DEFINE_MUTEX(buffer_mutex);
+struct calling_interface_buffer *buffer;
+EXPORT_SYMBOL_GPL(buffer);
+
+static int da_command_address;
+static int da_command_code;
+static int da_num_tokens;
+struct calling_interface_token *da_tokens;
+EXPORT_SYMBOL_GPL(da_tokens);
+
+void clear_buffer(void)
+{
+	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+}
+EXPORT_SYMBOL_GPL(clear_buffer);
+
+void get_buffer(void)
+{
+	mutex_lock(&buffer_mutex);
+	clear_buffer();
+}
+EXPORT_SYMBOL_GPL(get_buffer);
+
+void release_buffer(void)
+{
+	mutex_unlock(&buffer_mutex);
+}
+EXPORT_SYMBOL_GPL(release_buffer);
+
+int find_token_id(int tokenid)
+{
+	int i;
+
+	for (i =3D 0; i < da_num_tokens; i++) {
+		if (da_tokens[i].tokenID =3D=3D tokenid)
+			return i;
+	}
+
+	return -1;
+}
+EXPORT_SYMBOL_GPL(find_token_id);
+
+int find_token_location(int tokenid)
+{
+	int id;
+
+	id =3D find_token_id(tokenid);
+	if (id =3D=3D -1)
+		return -1;
+
+	return da_tokens[id].location;
+}
+EXPORT_SYMBOL_GPL(find_token_location);
+
+struct calling_interface_buffer *
+dell_send_request(struct calling_interface_buffer *buffer, int class,
+		  int select)
+{
+	struct smi_cmd command;
+
+	command.magic =3D SMI_CMD_MAGIC;
+	command.command_address =3D da_command_address;
+	command.command_code =3D da_command_code;
+	command.ebx =3D virt_to_phys(buffer);
+	command.ecx =3D 0x42534931;
+
+	buffer->class =3D class;
+	buffer->select =3D select;
+
+	dcdbas_smi_request(&command);
+
+	return buffer;
+}
+EXPORT_SYMBOL_GPL(dell_send_request);
+
+static void __init parse_da_table(const struct dmi_header *dm)
+{
+	/* Final token is a terminator, so we don't want to copy it */
+	int tokens =3D (dm->length-11)/sizeof(struct calling_interface_token)=
-1;
+	struct calling_interface_token *new_da_tokens;
+	struct calling_interface_structure *table =3D
+		container_of(dm, struct calling_interface_structure, header);
+
+	/* 4 bytes of table header, plus 7 bytes of Dell header, plus at leas=
t
+	   6 bytes of entry */
+
+	if (dm->length < 17)
+		return;
+
+	da_command_address =3D table->cmdIOAddress;
+	da_command_code =3D table->cmdIOCode;
+
+	new_da_tokens =3D krealloc(da_tokens, (da_num_tokens + tokens) *
+				 sizeof(struct calling_interface_token),
+				 GFP_KERNEL);
+
+	if (!new_da_tokens)
+		return;
+	da_tokens =3D new_da_tokens;
+
+	memcpy(da_tokens+da_num_tokens, table->tokens,
+	       sizeof(struct calling_interface_token) * tokens);
+
+	da_num_tokens +=3D tokens;
+}
+
+static void __init find_tokens(const struct dmi_header *dm, void *dumm=
y)
+{
+	switch (dm->type) {
+	case 0xd4: /* Indexed IO */
+	case 0xd5: /* Protected Area Type 1 */
+	case 0xd6: /* Protected Area Type 2 */
+		break;
+	case 0xda: /* Calling interface */
+		parse_da_table(dm);
+		break;
+	}
+}
+
+static int __init dell_smbios_init(void)
+{
+	int ret;
+
+	dmi_walk(find_tokens, NULL);
+
+	if (!da_tokens)  {
+		pr_info("Unable to find dmi tokens\n");
+		return -ENODEV;
+	}
+
+	/*
+	 * Allocate buffer below 4GB for SMI data--only 32-bit physical addr
+	 * is passed to SMI handler.
+	 */
+	buffer =3D (void *)__get_free_page(GFP_KERNEL | GFP_DMA32);
+	if (!buffer) {
+		ret =3D -ENOMEM;
+		goto fail_buffer;
+	}
+
+	return 0;
+
+fail_buffer:
+	kfree(da_tokens);
+	return ret;
+}
+
+static void __exit dell_smbios_exit(void)
+{
+	kfree(da_tokens);
+	free_page((unsigned long)buffer);
+}
+
+subsys_initcall(dell_smbios_init);
+module_exit(dell_smbios_exit);
+
+MODULE_AUTHOR("Matthew Garrett <mjg@redhat.com>");
+MODULE_AUTHOR("Gabriele Mazzotta <gabriele.mzt@gmail.com>");
+MODULE_AUTHOR("Pali Roh=C3=A1r <pali.rohar@gmail.com>");
+MODULE_DESCRIPTION("Common functions for kernel modules using Dell SMB=
IOS");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/=
dell-smbios.h
new file mode 100644
index 0000000..00e03b2
--- /dev/null
+++ b/drivers/platform/x86/dell-smbios.h
@@ -0,0 +1,51 @@
+/*
+ *  Common functions for kernel modules using Dell SMBIOS
+ *
+ *  Copyright (c) Red Hat <mjg@redhat.com>
+ *  Copyright (c) 2014 Gabriele Mazzotta <gabriele.mzt@gmail.com>
+ *  Copyright (c) 2014 Pali Roh=C3=A1r <pali.rohar@gmail.com>
+ *
+ *  Based on documentation in the libsmbios package:
+ *  Copyright (C) 2005-2014 Dell Inc.
+ *
+ *  This program is free software; you can redistribute it and/or modi=
fy
+ *  it under the terms of the GNU General Public License version 2 as
+ *  published by the Free Software Foundation.
+ */
+
+#ifndef _DELL_SMBIOS_H_
+#define _DELL_SMBIOS_H_
+
+/* This structure will be modified by the firmware when we enter
+ * system management mode, hence the volatiles */
+
+struct calling_interface_buffer {
+	u16 class;
+	u16 select;
+	volatile u32 input[4];
+	volatile u32 output[4];
+} __packed;
+
+struct calling_interface_token {
+	u16 tokenID;
+	u16 location;
+	union {
+		u16 value;
+		u16 stringlength;
+	};
+};
+
+extern struct calling_interface_buffer *buffer;
+extern struct calling_interface_token *da_tokens;
+
+void clear_buffer(void);
+void get_buffer(void);
+void release_buffer(void);
+
+int find_token_id(int tokenid);
+int find_token_location(int tokenid);
+
+struct calling_interface_buffer *
+dell_send_request(struct calling_interface_buffer *buffer, int class,
+		  int select);
+#endif
--=20
1.7.10.4

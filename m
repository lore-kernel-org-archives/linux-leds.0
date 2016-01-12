From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 13/14] dell-led: use dell_smbios_find_token() for finding mic DMI tokens
Date: Tue, 12 Jan 2016 15:02:59 +0100
Message-ID: <1452607380-20861-14-git-send-email-kernel@kempniu.pl>
References: <1452607380-20861-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <1452607380-20861-1-git-send-email-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

With the advent of dell_smbios_find_token(), dell-led does not need to
perform any DMI walking on its own, but it can rather ask dell-smbios t=
o
look up the DMI tokens it needs for changing the state of the microphon=
e
LED.

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
 drivers/leds/Kconfig    |    1 +
 drivers/leds/dell-led.c |   63 +++++++--------------------------------=
--------
 2 files changed, 10 insertions(+), 54 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index b1ab8bd..171810c 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -441,6 +441,7 @@ config LEDS_DELL_NETBOOKS
 	tristate "External LED on Dell Business Netbooks"
 	depends on LEDS_CLASS
 	depends on X86 && ACPI_WMI
+	depends on DELL_SMBIOS
 	help
 	  This adds support for the Latitude 2100 and similar
 	  notebooks that have an external LED.
diff --git a/drivers/leds/dell-led.c b/drivers/leds/dell-led.c
index c36acaf..bfa7511 100644
--- a/drivers/leds/dell-led.c
+++ b/drivers/leds/dell-led.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/dmi.h>
 #include <linux/dell-led.h>
+#include "../platform/x86/dell-smbios.h"
=20
 MODULE_AUTHOR("Louis Davis/Jim Dailey");
 MODULE_DESCRIPTION("Dell LED Control Driver");
@@ -59,22 +60,6 @@ struct app_wmi_args {
 #define GLOBAL_MIC_MUTE_ENABLE	0x364
 #define GLOBAL_MIC_MUTE_DISABLE	0x365
=20
-struct dell_bios_data_token {
-	u16 tokenid;
-	u16 location;
-	u16 value;
-};
-
-struct __attribute__ ((__packed__)) dell_bios_calling_interface {
-	struct	dmi_header header;
-	u16	cmd_io_addr;
-	u8	cmd_io_code;
-	u32	supported_cmds;
-	struct	dell_bios_data_token damap[];
-};
-
-static struct dell_bios_data_token dell_mic_tokens[2];
-
 static int dell_wmi_perform_query(struct app_wmi_args *args)
 {
 	struct app_wmi_args *bios_return;
@@ -112,43 +97,24 @@ static int dell_wmi_perform_query(struct app_wmi_a=
rgs *args)
 	return rc;
 }
=20
-static void __init find_micmute_tokens(const struct dmi_header *dm, vo=
id *dummy)
-{
-	struct dell_bios_calling_interface *calling_interface;
-	struct dell_bios_data_token *token;
-	int token_size =3D sizeof(struct dell_bios_data_token);
-	int i =3D 0;
-
-	if (dm->type =3D=3D 0xda && dm->length > 17) {
-		calling_interface =3D container_of(dm,
-				struct dell_bios_calling_interface, header);
-
-		token =3D &calling_interface->damap[i];
-		while (token->tokenid !=3D 0xffff) {
-			if (token->tokenid =3D=3D GLOBAL_MIC_MUTE_DISABLE)
-				memcpy(&dell_mic_tokens[0], token, token_size);
-			else if (token->tokenid =3D=3D GLOBAL_MIC_MUTE_ENABLE)
-				memcpy(&dell_mic_tokens[1], token, token_size);
-
-			i++;
-			token =3D &calling_interface->damap[i];
-		}
-	}
-}
-
 static int dell_micmute_led_set(int state)
 {
+	struct calling_interface_token *token;
 	struct app_wmi_args args;
-	struct dell_bios_data_token *token;
=20
 	if (!wmi_has_guid(DELL_APP_GUID))
 		return -ENODEV;
=20
-	if (state =3D=3D 0 || state =3D=3D 1)
-		token =3D &dell_mic_tokens[state];
+	if (state =3D=3D 0)
+		token =3D dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE);
+	else if (state =3D=3D 1)
+		token =3D dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE);
 	else
 		return -EINVAL;
=20
+	if (!token)
+		return -ENODEV;
+
 	memset(&args, 0, sizeof(struct app_wmi_args));
=20
 	args.class =3D 1;
@@ -177,14 +143,6 @@ int dell_app_wmi_led_set(int whichled, int on)
 }
 EXPORT_SYMBOL_GPL(dell_app_wmi_led_set);
=20
-static int __init dell_micmute_led_init(void)
-{
-	memset(dell_mic_tokens, 0, sizeof(struct dell_bios_data_token) * 2);
-	dmi_walk(find_micmute_tokens, NULL);
-
-	return 0;
-}
-
 struct bios_args {
 	unsigned char length;
 	unsigned char result_code;
@@ -330,9 +288,6 @@ static int __init dell_led_init(void)
 	if (!wmi_has_guid(DELL_LED_BIOS_GUID) && !wmi_has_guid(DELL_APP_GUID)=
)
 		return -ENODEV;
=20
-	if (wmi_has_guid(DELL_APP_GUID))
-		error =3D dell_micmute_led_init();
-
 	if (wmi_has_guid(DELL_LED_BIOS_GUID)) {
 		error =3D led_off();
 		if (error !=3D 0)
--=20
1.7.10.4

From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 16/16] dell-led: use dell_smbios_send_request() for performing SMBIOS calls
Date: Fri, 22 Jan 2016 15:27:28 +0100
Message-ID: <1453472848-3118-17-git-send-email-kernel@kempniu.pl>
References: <1453472848-3118-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <1453472848-3118-1-git-send-email-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Instead of using the WMI wrapper, dell-led can take advantage of
dell_smbios_send_request() for performing the SMBIOS calls required to
change the state of the microphone LED.

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/dell-led.c |   65 +++++----------------------------------=
--------
 1 file changed, 6 insertions(+), 59 deletions(-)

diff --git a/drivers/leds/dell-led.c b/drivers/leds/dell-led.c
index bfa7511..b3d6e9c 100644
--- a/drivers/leds/dell-led.c
+++ b/drivers/leds/dell-led.c
@@ -43,64 +43,13 @@ MODULE_ALIAS("wmi:" DELL_LED_BIOS_GUID);
 #define CMD_LED_OFF	17
 #define CMD_LED_BLINK	18
=20
-struct app_wmi_args {
-	u16 class;
-	u16 selector;
-	u32 arg1;
-	u32 arg2;
-	u32 arg3;
-	u32 arg4;
-	u32 res1;
-	u32 res2;
-	u32 res3;
-	u32 res4;
-	char dummy[92];
-};
-
 #define GLOBAL_MIC_MUTE_ENABLE	0x364
 #define GLOBAL_MIC_MUTE_DISABLE	0x365
=20
-static int dell_wmi_perform_query(struct app_wmi_args *args)
-{
-	struct app_wmi_args *bios_return;
-	union acpi_object *obj;
-	struct acpi_buffer input;
-	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
-	acpi_status status;
-	u32 rc =3D -EINVAL;
-
-	input.length =3D 128;
-	input.pointer =3D args;
-
-	status =3D wmi_evaluate_method(DELL_APP_GUID, 0, 1, &input, &output);
-	if (!ACPI_SUCCESS(status))
-		goto err_out0;
-
-	obj =3D output.pointer;
-	if (!obj)
-		goto err_out0;
-
-	if (obj->type !=3D ACPI_TYPE_BUFFER)
-		goto err_out1;
-
-	bios_return =3D (struct app_wmi_args *)obj->buffer.pointer;
-	rc =3D bios_return->res1;
-	if (rc)
-		goto err_out1;
-
-	memcpy(args, bios_return, sizeof(struct app_wmi_args));
-	rc =3D 0;
-
- err_out1:
-	kfree(obj);
- err_out0:
-	return rc;
-}
-
 static int dell_micmute_led_set(int state)
 {
+	struct calling_interface_buffer *buffer;
 	struct calling_interface_token *token;
-	struct app_wmi_args args;
=20
 	if (!wmi_has_guid(DELL_APP_GUID))
 		return -ENODEV;
@@ -115,13 +64,11 @@ static int dell_micmute_led_set(int state)
 	if (!token)
 		return -ENODEV;
=20
-	memset(&args, 0, sizeof(struct app_wmi_args));
-
-	args.class =3D 1;
-	args.arg1 =3D token->location;
-	args.arg2 =3D token->value;
-
-	dell_wmi_perform_query(&args);
+	buffer =3D dell_smbios_get_buffer();
+	buffer->input[0] =3D token->location;
+	buffer->input[1] =3D token->value;
+	dell_smbios_send_request(1, 0);
+	dell_smbios_release_buffer();
=20
 	return state;
 }
--=20
1.7.10.4

From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 12/16] dell-laptop: use dell_smbios_find_token() instead of find_token_location()
Date: Fri, 22 Jan 2016 15:27:24 +0100
Message-ID: <1453472848-3118-13-git-send-email-kernel@kempniu.pl>
References: <1453472848-3118-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33257 "EHLO
	mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754110AbcAVO15 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 22 Jan 2016 09:27:57 -0500
Received: by mail-lf0-f68.google.com with SMTP id z62so4198651lfd.0
        for <linux-leds@vger.kernel.org>; Fri, 22 Jan 2016 06:27:56 -0800 (PST)
In-Reply-To: <1453472848-3118-1-git-send-email-kernel@kempniu.pl>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Replace all uses of find_token_location() with dell_smbios_find_token()
to avoid directly accessing the da_tokens table.

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
 drivers/platform/x86/dell-laptop.c |   24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-laptop.c
index 4d1694d..76064c8 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -874,15 +874,15 @@ static void dell_cleanup_rfkill(void)
 static int dell_send_intensity(struct backlight_device *bd)
 {
 	struct calling_interface_buffer *buffer;
-	int token;
+	struct calling_interface_token *token;
 	int ret;
=20
-	token =3D find_token_location(BRIGHTNESS_TOKEN);
-	if (token =3D=3D -1)
+	token =3D dell_smbios_find_token(BRIGHTNESS_TOKEN);
+	if (!token)
 		return -ENODEV;
=20
 	buffer =3D dell_smbios_get_buffer();
-	buffer->input[0] =3D token;
+	buffer->input[0] =3D token->location;
 	buffer->input[1] =3D bd->props.brightness;
=20
 	if (power_supply_is_system_supplied() > 0)
@@ -899,15 +899,15 @@ static int dell_send_intensity(struct backlight_d=
evice *bd)
 static int dell_get_intensity(struct backlight_device *bd)
 {
 	struct calling_interface_buffer *buffer;
-	int token;
+	struct calling_interface_token *token;
 	int ret;
=20
-	token =3D find_token_location(BRIGHTNESS_TOKEN);
-	if (token =3D=3D -1)
+	token =3D dell_smbios_find_token(BRIGHTNESS_TOKEN);
+	if (!token)
 		return -ENODEV;
=20
 	buffer =3D dell_smbios_get_buffer();
-	buffer->input[0] =3D token;
+	buffer->input[0] =3D token->location;
=20
 	if (power_supply_is_system_supplied() > 0)
 		dell_smbios_send_request(0, 2);
@@ -1987,8 +1987,8 @@ static void kbd_led_exit(void)
 static int __init dell_init(void)
 {
 	struct calling_interface_buffer *buffer;
+	struct calling_interface_token *token;
 	int max_intensity =3D 0;
-	int token;
 	int ret;
=20
 	if (!dmi_check_system(dell_device_table))
@@ -2030,10 +2030,10 @@ static int __init dell_init(void)
 	if (acpi_video_get_backlight_type() !=3D acpi_backlight_vendor)
 		return 0;
=20
-	token =3D find_token_location(BRIGHTNESS_TOKEN);
-	if (token !=3D -1) {
+	token =3D dell_smbios_find_token(BRIGHTNESS_TOKEN);
+	if (token) {
 		buffer =3D dell_smbios_get_buffer();
-		buffer->input[0] =3D token;
+		buffer->input[0] =3D token->location;
 		dell_smbios_send_request(0, 2);
 		if (buffer->output[0] =3D=3D 0)
 			max_intensity =3D buffer->output[3];
--=20
1.7.10.4

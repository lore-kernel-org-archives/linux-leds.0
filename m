From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 10/14] dell-laptop: use dell_smbios_find_token() instead of find_token_location()
Date: Tue, 12 Jan 2016 15:02:56 +0100
Message-ID: <1452607380-20861-11-git-send-email-kernel@kempniu.pl>
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

Replace all uses of find_token_location() with dell_smbios_find_token()
to avoid directly accessing the da_tokens table.

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
 drivers/platform/x86/dell-laptop.c |   24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-laptop.c
index dfe2afd..4de61b7 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -867,15 +867,15 @@ static void dell_cleanup_rfkill(void)
=20
 static int dell_send_intensity(struct backlight_device *bd)
 {
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
 	dell_smbios_get_buffer();
-	dell_smbios_buffer->input[0] =3D token;
+	dell_smbios_buffer->input[0] =3D token->location;
 	dell_smbios_buffer->input[1] =3D bd->props.brightness;
=20
 	if (power_supply_is_system_supplied() > 0)
@@ -891,15 +891,15 @@ static int dell_send_intensity(struct backlight_d=
evice *bd)
=20
 static int dell_get_intensity(struct backlight_device *bd)
 {
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
 	dell_smbios_get_buffer();
-	dell_smbios_buffer->input[0] =3D token;
+	dell_smbios_buffer->input[0] =3D token->location;
=20
 	if (power_supply_is_system_supplied() > 0)
 		dell_smbios_send_request(0, 2);
@@ -1973,8 +1973,8 @@ static void kbd_led_exit(void)
=20
 static int __init dell_init(void)
 {
+	struct calling_interface_token *token;
 	int max_intensity =3D 0;
-	int token;
 	int ret;
=20
 	if (!dmi_check_system(dell_device_table))
@@ -2016,10 +2016,10 @@ static int __init dell_init(void)
 	if (acpi_video_get_backlight_type() !=3D acpi_backlight_vendor)
 		return 0;
=20
-	token =3D find_token_location(BRIGHTNESS_TOKEN);
-	if (token !=3D -1) {
+	token =3D dell_smbios_find_token(BRIGHTNESS_TOKEN);
+	if (token) {
 		dell_smbios_get_buffer();
-		dell_smbios_buffer->input[0] =3D token;
+		dell_smbios_buffer->input[0] =3D token->location;
 		dell_smbios_send_request(0, 2);
 		if (dell_smbios_buffer->output[0] =3D=3D 0)
 			max_intensity =3D dell_smbios_buffer->output[3];
--=20
1.7.10.4

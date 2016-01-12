From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 05/14] dell-smbios: rename get_buffer() to dell_smbios_get_buffer()
Date: Tue, 12 Jan 2016 15:02:51 +0100
Message-ID: <1452607380-20861-6-git-send-email-kernel@kempniu.pl>
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

As get_buffer() is exported from the module, it has to be renamed to
something less generic, so add a "dell_smbios_" prefix to the function
name.

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
 drivers/platform/x86/dell-laptop.c |   26 +++++++++++++-------------
 drivers/platform/x86/dell-smbios.c |    4 ++--
 drivers/platform/x86/dell-smbios.h |    2 +-
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-laptop.c
index 1bfc95e..5df30a9 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -416,7 +416,7 @@ static int dell_rfkill_set(void *data, bool blocked=
)
 	int status;
 	int ret;
=20
-	get_buffer();
+	dell_smbios_get_buffer();
=20
 	dell_send_request(17, 11);
 	ret =3D dell_smbios_buffer->output[0];
@@ -480,7 +480,7 @@ static void dell_rfkill_query(struct rfkill *rfkill=
, void *data)
 	int status;
 	int ret;
=20
-	get_buffer();
+	dell_smbios_get_buffer();
=20
 	dell_send_request(17, 11);
 	ret =3D dell_smbios_buffer->output[0];
@@ -520,7 +520,7 @@ static int dell_debugfs_show(struct seq_file *s, vo=
id *data)
 	int status;
 	int ret;
=20
-	get_buffer();
+	dell_smbios_get_buffer();
=20
 	dell_send_request(17, 11);
 	ret =3D dell_smbios_buffer->output[0];
@@ -618,7 +618,7 @@ static void dell_update_rfkill(struct work_struct *=
ignored)
 	int status;
 	int ret;
=20
-	get_buffer();
+	dell_smbios_get_buffer();
=20
 	dell_send_request(17, 11);
 	ret =3D dell_smbios_buffer->output[0];
@@ -710,7 +710,7 @@ static int __init dell_setup_rfkill(void)
 	if (!force_rfkill && !whitelisted)
 		return 0;
=20
-	get_buffer();
+	dell_smbios_get_buffer();
 	dell_send_request(17, 11);
 	ret =3D dell_smbios_buffer->output[0];
 	status =3D dell_smbios_buffer->output[1];
@@ -874,7 +874,7 @@ static int dell_send_intensity(struct backlight_dev=
ice *bd)
 	if (token =3D=3D -1)
 		return -ENODEV;
=20
-	get_buffer();
+	dell_smbios_get_buffer();
 	dell_smbios_buffer->input[0] =3D token;
 	dell_smbios_buffer->input[1] =3D bd->props.brightness;
=20
@@ -898,7 +898,7 @@ static int dell_get_intensity(struct backlight_devi=
ce *bd)
 	if (token =3D=3D -1)
 		return -ENODEV;
=20
-	get_buffer();
+	dell_smbios_get_buffer();
 	dell_smbios_buffer->input[0] =3D token;
=20
 	if (power_supply_is_system_supplied() > 0)
@@ -1158,7 +1158,7 @@ static int kbd_get_info(struct kbd_info *info)
 	u8 units;
 	int ret;
=20
-	get_buffer();
+	dell_smbios_get_buffer();
=20
 	dell_smbios_buffer->input[0] =3D 0x0;
 	dell_send_request(4, 11);
@@ -1246,7 +1246,7 @@ static int kbd_get_state(struct kbd_state *state)
 {
 	int ret;
=20
-	get_buffer();
+	dell_smbios_get_buffer();
=20
 	dell_smbios_buffer->input[0] =3D 0x1;
 	dell_send_request(4, 11);
@@ -1277,7 +1277,7 @@ static int kbd_set_state(struct kbd_state *state)
 {
 	int ret;
=20
-	get_buffer();
+	dell_smbios_get_buffer();
 	dell_smbios_buffer->input[0] =3D 0x2;
 	dell_smbios_buffer->input[1] =3D BIT(state->mode_bit) & 0xFFFF;
 	dell_smbios_buffer->input[1] |=3D (state->triggers & 0xFF) << 16;
@@ -1324,7 +1324,7 @@ static int kbd_set_token_bit(u8 bit)
 	if (id =3D=3D -1)
 		return -EINVAL;
=20
-	get_buffer();
+	dell_smbios_get_buffer();
 	dell_smbios_buffer->input[0] =3D da_tokens[id].location;
 	dell_smbios_buffer->input[1] =3D da_tokens[id].value;
 	dell_send_request(1, 0);
@@ -1347,7 +1347,7 @@ static int kbd_get_token_bit(u8 bit)
 	if (id =3D=3D -1)
 		return -EINVAL;
=20
-	get_buffer();
+	dell_smbios_get_buffer();
 	dell_smbios_buffer->input[0] =3D da_tokens[id].location;
 	dell_send_request(0, 0);
 	ret =3D dell_smbios_buffer->output[0];
@@ -2018,7 +2018,7 @@ static int __init dell_init(void)
=20
 	token =3D find_token_location(BRIGHTNESS_TOKEN);
 	if (token !=3D -1) {
-		get_buffer();
+		dell_smbios_get_buffer();
 		dell_smbios_buffer->input[0] =3D token;
 		dell_send_request(0, 2);
 		if (dell_smbios_buffer->output[0] =3D=3D 0)
diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/=
dell-smbios.c
index 8fa740c..27dbfb9 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -46,12 +46,12 @@ void dell_smbios_clear_buffer(void)
 }
 EXPORT_SYMBOL_GPL(dell_smbios_clear_buffer);
=20
-void get_buffer(void)
+void dell_smbios_get_buffer(void)
 {
 	mutex_lock(&buffer_mutex);
 	dell_smbios_clear_buffer();
 }
-EXPORT_SYMBOL_GPL(get_buffer);
+EXPORT_SYMBOL_GPL(dell_smbios_get_buffer);
=20
 void release_buffer(void)
 {
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/=
dell-smbios.h
index ba0bc22..e3c2014 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -39,7 +39,7 @@ extern struct calling_interface_buffer *dell_smbios_b=
uffer;
 extern struct calling_interface_token *da_tokens;
=20
 void dell_smbios_clear_buffer(void);
-void get_buffer(void);
+void dell_smbios_get_buffer(void);
 void release_buffer(void);
=20
 int find_token_id(int tokenid);
--=20
1.7.10.4

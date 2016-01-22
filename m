From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 02/16] dell-smbios: rename get_buffer() to dell_smbios_get_buffer()
Date: Fri, 22 Jan 2016 15:27:14 +0100
Message-ID: <1453472848-3118-3-git-send-email-kernel@kempniu.pl>
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
index d45d356..575b0df 100644
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
 	dell_send_request(buffer, 17, 11);
 	ret =3D buffer->output[0];
@@ -479,7 +479,7 @@ static void dell_rfkill_query(struct rfkill *rfkill=
, void *data)
 	int status;
 	int ret;
=20
-	get_buffer();
+	dell_smbios_get_buffer();
=20
 	dell_send_request(buffer, 17, 11);
 	ret =3D buffer->output[0];
@@ -519,7 +519,7 @@ static int dell_debugfs_show(struct seq_file *s, vo=
id *data)
 	int status;
 	int ret;
=20
-	get_buffer();
+	dell_smbios_get_buffer();
=20
 	dell_send_request(buffer, 17, 11);
 	ret =3D buffer->output[0];
@@ -617,7 +617,7 @@ static void dell_update_rfkill(struct work_struct *=
ignored)
 	int status;
 	int ret;
=20
-	get_buffer();
+	dell_smbios_get_buffer();
=20
 	dell_send_request(buffer, 17, 11);
 	ret =3D buffer->output[0];
@@ -709,7 +709,7 @@ static int __init dell_setup_rfkill(void)
 	if (!force_rfkill && !whitelisted)
 		return 0;
=20
-	get_buffer();
+	dell_smbios_get_buffer();
 	dell_send_request(buffer, 17, 11);
 	ret =3D buffer->output[0];
 	status =3D buffer->output[1];
@@ -873,7 +873,7 @@ static int dell_send_intensity(struct backlight_dev=
ice *bd)
 	if (token =3D=3D -1)
 		return -ENODEV;
=20
-	get_buffer();
+	dell_smbios_get_buffer();
 	buffer->input[0] =3D token;
 	buffer->input[1] =3D bd->props.brightness;
=20
@@ -897,7 +897,7 @@ static int dell_get_intensity(struct backlight_devi=
ce *bd)
 	if (token =3D=3D -1)
 		return -ENODEV;
=20
-	get_buffer();
+	dell_smbios_get_buffer();
 	buffer->input[0] =3D token;
=20
 	if (power_supply_is_system_supplied() > 0)
@@ -1157,7 +1157,7 @@ static int kbd_get_info(struct kbd_info *info)
 	u8 units;
 	int ret;
=20
-	get_buffer();
+	dell_smbios_get_buffer();
=20
 	buffer->input[0] =3D 0x0;
 	dell_send_request(buffer, 4, 11);
@@ -1245,7 +1245,7 @@ static int kbd_get_state(struct kbd_state *state)
 {
 	int ret;
=20
-	get_buffer();
+	dell_smbios_get_buffer();
=20
 	buffer->input[0] =3D 0x1;
 	dell_send_request(buffer, 4, 11);
@@ -1276,7 +1276,7 @@ static int kbd_set_state(struct kbd_state *state)
 {
 	int ret;
=20
-	get_buffer();
+	dell_smbios_get_buffer();
 	buffer->input[0] =3D 0x2;
 	buffer->input[1] =3D BIT(state->mode_bit) & 0xFFFF;
 	buffer->input[1] |=3D (state->triggers & 0xFF) << 16;
@@ -1323,7 +1323,7 @@ static int kbd_set_token_bit(u8 bit)
 	if (id =3D=3D -1)
 		return -EINVAL;
=20
-	get_buffer();
+	dell_smbios_get_buffer();
 	buffer->input[0] =3D da_tokens[id].location;
 	buffer->input[1] =3D da_tokens[id].value;
 	dell_send_request(buffer, 1, 0);
@@ -1346,7 +1346,7 @@ static int kbd_get_token_bit(u8 bit)
 	if (id =3D=3D -1)
 		return -EINVAL;
=20
-	get_buffer();
+	dell_smbios_get_buffer();
 	buffer->input[0] =3D da_tokens[id].location;
 	dell_send_request(buffer, 0, 0);
 	ret =3D buffer->output[0];
@@ -2017,7 +2017,7 @@ static int __init dell_init(void)
=20
 	token =3D find_token_location(BRIGHTNESS_TOKEN);
 	if (token !=3D -1) {
-		get_buffer();
+		dell_smbios_get_buffer();
 		buffer->input[0] =3D token;
 		dell_send_request(buffer, 0, 2);
 		if (buffer->output[0] =3D=3D 0)
diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/=
dell-smbios.c
index e08cf78..f28778b 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -40,12 +40,12 @@ static int da_num_tokens;
 struct calling_interface_token *da_tokens;
 EXPORT_SYMBOL_GPL(da_tokens);
=20
-void get_buffer(void)
+void dell_smbios_get_buffer(void)
 {
 	mutex_lock(&buffer_mutex);
 	clear_buffer();
 }
-EXPORT_SYMBOL_GPL(get_buffer);
+EXPORT_SYMBOL_GPL(dell_smbios_get_buffer);
=20
 void clear_buffer(void)
 {
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/=
dell-smbios.h
index 3bc9080..ace16c1 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -38,7 +38,7 @@ struct calling_interface_token {
 extern struct calling_interface_buffer *buffer;
 extern struct calling_interface_token *da_tokens;
=20
-void get_buffer(void);
+void dell_smbios_get_buffer(void);
 void clear_buffer(void);
 void release_buffer(void);
 struct calling_interface_buffer *
--=20
1.7.10.4

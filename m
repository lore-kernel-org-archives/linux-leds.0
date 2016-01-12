From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 02/14] dell-smbios: don't pass a buffer to dell_send_request()
Date: Tue, 12 Jan 2016 15:02:48 +0100
Message-ID: <1452607380-20861-3-git-send-email-kernel@kempniu.pl>
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

Passing a struct calling_interface_buffer pointer to dell_send_request(=
)
is redundant as it should always operate on the buffer exported from th=
e
module.

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
 drivers/platform/x86/dell-laptop.c |   42 ++++++++++++++++++----------=
--------
 drivers/platform/x86/dell-smbios.c |    4 +---
 drivers/platform/x86/dell-smbios.h |    4 +---
 3 files changed, 23 insertions(+), 27 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-laptop.c
index d45d356..572bdca 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -418,7 +418,7 @@ static int dell_rfkill_set(void *data, bool blocked=
)
=20
 	get_buffer();
=20
-	dell_send_request(buffer, 17, 11);
+	dell_send_request(17, 11);
 	ret =3D buffer->output[0];
 	status =3D buffer->output[1];
=20
@@ -428,7 +428,7 @@ static int dell_rfkill_set(void *data, bool blocked=
)
 	clear_buffer();
=20
 	buffer->input[0] =3D 0x2;
-	dell_send_request(buffer, 17, 11);
+	dell_send_request(17, 11);
 	ret =3D buffer->output[0];
 	hwswitch =3D buffer->output[1];
=20
@@ -441,7 +441,7 @@ static int dell_rfkill_set(void *data, bool blocked=
)
 	clear_buffer();
=20
 	buffer->input[0] =3D (1 | (radio<<8) | (disable << 16));
-	dell_send_request(buffer, 17, 11);
+	dell_send_request(17, 11);
 	ret =3D buffer->output[0];
=20
  out:
@@ -458,7 +458,7 @@ static void dell_rfkill_update_sw_state(struct rfki=
ll *rfkill, int radio,
 		int block =3D rfkill_blocked(rfkill);
 		clear_buffer();
 		buffer->input[0] =3D (1 | (radio << 8) | (block << 16));
-		dell_send_request(buffer, 17, 11);
+		dell_send_request(17, 11);
 	} else {
 		/* No hw-switch, sync BIOS state to sw_state */
 		rfkill_set_sw_state(rfkill, !!(status & BIT(radio + 16)));
@@ -481,7 +481,7 @@ static void dell_rfkill_query(struct rfkill *rfkill=
, void *data)
=20
 	get_buffer();
=20
-	dell_send_request(buffer, 17, 11);
+	dell_send_request(17, 11);
 	ret =3D buffer->output[0];
 	status =3D buffer->output[1];
=20
@@ -493,7 +493,7 @@ static void dell_rfkill_query(struct rfkill *rfkill=
, void *data)
 	clear_buffer();
=20
 	buffer->input[0] =3D 0x2;
-	dell_send_request(buffer, 17, 11);
+	dell_send_request(17, 11);
 	ret =3D buffer->output[0];
 	hwswitch =3D buffer->output[1];
=20
@@ -521,14 +521,14 @@ static int dell_debugfs_show(struct seq_file *s, =
void *data)
=20
 	get_buffer();
=20
-	dell_send_request(buffer, 17, 11);
+	dell_send_request(17, 11);
 	ret =3D buffer->output[0];
 	status =3D buffer->output[1];
=20
 	clear_buffer();
=20
 	buffer->input[0] =3D 0x2;
-	dell_send_request(buffer, 17, 11);
+	dell_send_request(17, 11);
 	hwswitch_ret =3D buffer->output[0];
 	hwswitch_state =3D buffer->output[1];
=20
@@ -619,7 +619,7 @@ static void dell_update_rfkill(struct work_struct *=
ignored)
=20
 	get_buffer();
=20
-	dell_send_request(buffer, 17, 11);
+	dell_send_request(17, 11);
 	ret =3D buffer->output[0];
 	status =3D buffer->output[1];
=20
@@ -629,7 +629,7 @@ static void dell_update_rfkill(struct work_struct *=
ignored)
 	clear_buffer();
=20
 	buffer->input[0] =3D 0x2;
-	dell_send_request(buffer, 17, 11);
+	dell_send_request(17, 11);
 	ret =3D buffer->output[0];
=20
 	if (ret =3D=3D 0 && (status & BIT(0)))
@@ -710,7 +710,7 @@ static int __init dell_setup_rfkill(void)
 		return 0;
=20
 	get_buffer();
-	dell_send_request(buffer, 17, 11);
+	dell_send_request(17, 11);
 	ret =3D buffer->output[0];
 	status =3D buffer->output[1];
 	release_buffer();
@@ -878,9 +878,9 @@ static int dell_send_intensity(struct backlight_dev=
ice *bd)
 	buffer->input[1] =3D bd->props.brightness;
=20
 	if (power_supply_is_system_supplied() > 0)
-		dell_send_request(buffer, 1, 2);
+		dell_send_request(1, 2);
 	else
-		dell_send_request(buffer, 1, 1);
+		dell_send_request(1, 1);
=20
 	ret =3D dell_smi_error(buffer->output[0]);
=20
@@ -901,9 +901,9 @@ static int dell_get_intensity(struct backlight_devi=
ce *bd)
 	buffer->input[0] =3D token;
=20
 	if (power_supply_is_system_supplied() > 0)
-		dell_send_request(buffer, 0, 2);
+		dell_send_request(0, 2);
 	else
-		dell_send_request(buffer, 0, 1);
+		dell_send_request(0, 1);
=20
 	if (buffer->output[0])
 		ret =3D dell_smi_error(buffer->output[0]);
@@ -1160,7 +1160,7 @@ static int kbd_get_info(struct kbd_info *info)
 	get_buffer();
=20
 	buffer->input[0] =3D 0x0;
-	dell_send_request(buffer, 4, 11);
+	dell_send_request(4, 11);
 	ret =3D buffer->output[0];
=20
 	if (ret) {
@@ -1248,7 +1248,7 @@ static int kbd_get_state(struct kbd_state *state)
 	get_buffer();
=20
 	buffer->input[0] =3D 0x1;
-	dell_send_request(buffer, 4, 11);
+	dell_send_request(4, 11);
 	ret =3D buffer->output[0];
=20
 	if (ret) {
@@ -1284,7 +1284,7 @@ static int kbd_set_state(struct kbd_state *state)
 	buffer->input[1] |=3D (state->timeout_unit & 0x3) << 30;
 	buffer->input[2] =3D state->als_setting & 0xFF;
 	buffer->input[2] |=3D (state->level & 0xFF) << 16;
-	dell_send_request(buffer, 4, 11);
+	dell_send_request(4, 11);
 	ret =3D buffer->output[0];
 	release_buffer();
=20
@@ -1326,7 +1326,7 @@ static int kbd_set_token_bit(u8 bit)
 	get_buffer();
 	buffer->input[0] =3D da_tokens[id].location;
 	buffer->input[1] =3D da_tokens[id].value;
-	dell_send_request(buffer, 1, 0);
+	dell_send_request(1, 0);
 	ret =3D buffer->output[0];
 	release_buffer();
=20
@@ -1348,7 +1348,7 @@ static int kbd_get_token_bit(u8 bit)
=20
 	get_buffer();
 	buffer->input[0] =3D da_tokens[id].location;
-	dell_send_request(buffer, 0, 0);
+	dell_send_request(0, 0);
 	ret =3D buffer->output[0];
 	val =3D buffer->output[1];
 	release_buffer();
@@ -2019,7 +2019,7 @@ static int __init dell_init(void)
 	if (token !=3D -1) {
 		get_buffer();
 		buffer->input[0] =3D token;
-		dell_send_request(buffer, 0, 2);
+		dell_send_request(0, 2);
 		if (buffer->output[0] =3D=3D 0)
 			max_intensity =3D buffer->output[3];
 		release_buffer();
diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/=
dell-smbios.c
index 260a32a..758680f 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -84,9 +84,7 @@ int find_token_location(int tokenid)
 }
 EXPORT_SYMBOL_GPL(find_token_location);
=20
-struct calling_interface_buffer *
-dell_send_request(struct calling_interface_buffer *buffer, int class,
-		  int select)
+struct calling_interface_buffer *dell_send_request(int class, int sele=
ct)
 {
 	struct smi_cmd command;
=20
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/=
dell-smbios.h
index 00e03b2..0f58ce8 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -45,7 +45,5 @@ void release_buffer(void);
 int find_token_id(int tokenid);
 int find_token_location(int tokenid);
=20
-struct calling_interface_buffer *
-dell_send_request(struct calling_interface_buffer *buffer, int class,
-		  int select);
+struct calling_interface_buffer *dell_send_request(int class, int sele=
ct);
 #endif
--=20
1.7.10.4

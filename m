From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 07/14] dell-smbios: rename dell_send_request() to dell_smbios_send_request()
Date: Tue, 12 Jan 2016 15:02:53 +0100
Message-ID: <1452607380-20861-8-git-send-email-kernel@kempniu.pl>
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

As dell_send_request() is exported from the module, its prefix should b=
e
consistent with other exported symbols, so change function name to
dell_smbios_send_request().

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
 drivers/platform/x86/dell-laptop.c |   42 ++++++++++++++++++----------=
--------
 drivers/platform/x86/dell-smbios.c |    5 +++--
 drivers/platform/x86/dell-smbios.h |    3 ++-
 3 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-laptop.c
index ab256ae..65aa1ff 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -418,7 +418,7 @@ static int dell_rfkill_set(void *data, bool blocked=
)
=20
 	dell_smbios_get_buffer();
=20
-	dell_send_request(17, 11);
+	dell_smbios_send_request(17, 11);
 	ret =3D dell_smbios_buffer->output[0];
 	status =3D dell_smbios_buffer->output[1];
=20
@@ -428,7 +428,7 @@ static int dell_rfkill_set(void *data, bool blocked=
)
 	dell_smbios_clear_buffer();
=20
 	dell_smbios_buffer->input[0] =3D 0x2;
-	dell_send_request(17, 11);
+	dell_smbios_send_request(17, 11);
 	ret =3D dell_smbios_buffer->output[0];
 	hwswitch =3D dell_smbios_buffer->output[1];
=20
@@ -441,7 +441,7 @@ static int dell_rfkill_set(void *data, bool blocked=
)
 	dell_smbios_clear_buffer();
=20
 	dell_smbios_buffer->input[0] =3D (1 | (radio << 8) | (disable << 16))=
;
-	dell_send_request(17, 11);
+	dell_smbios_send_request(17, 11);
 	ret =3D dell_smbios_buffer->output[0];
=20
  out:
@@ -459,7 +459,7 @@ static void dell_rfkill_update_sw_state(struct rfki=
ll *rfkill, int radio,
 		dell_smbios_clear_buffer();
 		dell_smbios_buffer->input[0] =3D (1 | (radio << 8)
 						  | (block << 16));
-		dell_send_request(17, 11);
+		dell_smbios_send_request(17, 11);
 	} else {
 		/* No hw-switch, sync BIOS state to sw_state */
 		rfkill_set_sw_state(rfkill, !!(status & BIT(radio + 16)));
@@ -482,7 +482,7 @@ static void dell_rfkill_query(struct rfkill *rfkill=
, void *data)
=20
 	dell_smbios_get_buffer();
=20
-	dell_send_request(17, 11);
+	dell_smbios_send_request(17, 11);
 	ret =3D dell_smbios_buffer->output[0];
 	status =3D dell_smbios_buffer->output[1];
=20
@@ -494,7 +494,7 @@ static void dell_rfkill_query(struct rfkill *rfkill=
, void *data)
 	dell_smbios_clear_buffer();
=20
 	dell_smbios_buffer->input[0] =3D 0x2;
-	dell_send_request(17, 11);
+	dell_smbios_send_request(17, 11);
 	ret =3D dell_smbios_buffer->output[0];
 	hwswitch =3D dell_smbios_buffer->output[1];
=20
@@ -522,14 +522,14 @@ static int dell_debugfs_show(struct seq_file *s, =
void *data)
=20
 	dell_smbios_get_buffer();
=20
-	dell_send_request(17, 11);
+	dell_smbios_send_request(17, 11);
 	ret =3D dell_smbios_buffer->output[0];
 	status =3D dell_smbios_buffer->output[1];
=20
 	dell_smbios_clear_buffer();
=20
 	dell_smbios_buffer->input[0] =3D 0x2;
-	dell_send_request(17, 11);
+	dell_smbios_send_request(17, 11);
 	hwswitch_ret =3D dell_smbios_buffer->output[0];
 	hwswitch_state =3D dell_smbios_buffer->output[1];
=20
@@ -620,7 +620,7 @@ static void dell_update_rfkill(struct work_struct *=
ignored)
=20
 	dell_smbios_get_buffer();
=20
-	dell_send_request(17, 11);
+	dell_smbios_send_request(17, 11);
 	ret =3D dell_smbios_buffer->output[0];
 	status =3D dell_smbios_buffer->output[1];
=20
@@ -630,7 +630,7 @@ static void dell_update_rfkill(struct work_struct *=
ignored)
 	dell_smbios_clear_buffer();
=20
 	dell_smbios_buffer->input[0] =3D 0x2;
-	dell_send_request(17, 11);
+	dell_smbios_send_request(17, 11);
 	ret =3D dell_smbios_buffer->output[0];
=20
 	if (ret =3D=3D 0 && (status & BIT(0)))
@@ -711,7 +711,7 @@ static int __init dell_setup_rfkill(void)
 		return 0;
=20
 	dell_smbios_get_buffer();
-	dell_send_request(17, 11);
+	dell_smbios_send_request(17, 11);
 	ret =3D dell_smbios_buffer->output[0];
 	status =3D dell_smbios_buffer->output[1];
 	dell_smbios_release_buffer();
@@ -879,9 +879,9 @@ static int dell_send_intensity(struct backlight_dev=
ice *bd)
 	dell_smbios_buffer->input[1] =3D bd->props.brightness;
=20
 	if (power_supply_is_system_supplied() > 0)
-		dell_send_request(1, 2);
+		dell_smbios_send_request(1, 2);
 	else
-		dell_send_request(1, 1);
+		dell_smbios_send_request(1, 1);
=20
 	ret =3D dell_smi_error(dell_smbios_buffer->output[0]);
=20
@@ -902,9 +902,9 @@ static int dell_get_intensity(struct backlight_devi=
ce *bd)
 	dell_smbios_buffer->input[0] =3D token;
=20
 	if (power_supply_is_system_supplied() > 0)
-		dell_send_request(0, 2);
+		dell_smbios_send_request(0, 2);
 	else
-		dell_send_request(0, 1);
+		dell_smbios_send_request(0, 1);
=20
 	if (dell_smbios_buffer->output[0])
 		ret =3D dell_smi_error(dell_smbios_buffer->output[0]);
@@ -1161,7 +1161,7 @@ static int kbd_get_info(struct kbd_info *info)
 	dell_smbios_get_buffer();
=20
 	dell_smbios_buffer->input[0] =3D 0x0;
-	dell_send_request(4, 11);
+	dell_smbios_send_request(4, 11);
 	ret =3D dell_smbios_buffer->output[0];
=20
 	if (ret) {
@@ -1249,7 +1249,7 @@ static int kbd_get_state(struct kbd_state *state)
 	dell_smbios_get_buffer();
=20
 	dell_smbios_buffer->input[0] =3D 0x1;
-	dell_send_request(4, 11);
+	dell_smbios_send_request(4, 11);
 	ret =3D dell_smbios_buffer->output[0];
=20
 	if (ret) {
@@ -1285,7 +1285,7 @@ static int kbd_set_state(struct kbd_state *state)
 	dell_smbios_buffer->input[1] |=3D (state->timeout_unit & 0x3) << 30;
 	dell_smbios_buffer->input[2] =3D state->als_setting & 0xFF;
 	dell_smbios_buffer->input[2] |=3D (state->level & 0xFF) << 16;
-	dell_send_request(4, 11);
+	dell_smbios_send_request(4, 11);
 	ret =3D dell_smbios_buffer->output[0];
 	dell_smbios_release_buffer();
=20
@@ -1327,7 +1327,7 @@ static int kbd_set_token_bit(u8 bit)
 	dell_smbios_get_buffer();
 	dell_smbios_buffer->input[0] =3D da_tokens[id].location;
 	dell_smbios_buffer->input[1] =3D da_tokens[id].value;
-	dell_send_request(1, 0);
+	dell_smbios_send_request(1, 0);
 	ret =3D dell_smbios_buffer->output[0];
 	dell_smbios_release_buffer();
=20
@@ -1349,7 +1349,7 @@ static int kbd_get_token_bit(u8 bit)
=20
 	dell_smbios_get_buffer();
 	dell_smbios_buffer->input[0] =3D da_tokens[id].location;
-	dell_send_request(0, 0);
+	dell_smbios_send_request(0, 0);
 	ret =3D dell_smbios_buffer->output[0];
 	val =3D dell_smbios_buffer->output[1];
 	dell_smbios_release_buffer();
@@ -2020,7 +2020,7 @@ static int __init dell_init(void)
 	if (token !=3D -1) {
 		dell_smbios_get_buffer();
 		dell_smbios_buffer->input[0] =3D token;
-		dell_send_request(0, 2);
+		dell_smbios_send_request(0, 2);
 		if (dell_smbios_buffer->output[0] =3D=3D 0)
 			max_intensity =3D dell_smbios_buffer->output[3];
 		dell_smbios_release_buffer();
diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/=
dell-smbios.c
index 20d7f21..597a29f 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -84,7 +84,8 @@ int find_token_location(int tokenid)
 }
 EXPORT_SYMBOL_GPL(find_token_location);
=20
-struct calling_interface_buffer *dell_send_request(int class, int sele=
ct)
+struct calling_interface_buffer *dell_smbios_send_request(int class,
+							  int select)
 {
 	struct smi_cmd command;
=20
@@ -101,7 +102,7 @@ struct calling_interface_buffer *dell_send_request(=
int class, int select)
=20
 	return dell_smbios_buffer;
 }
-EXPORT_SYMBOL_GPL(dell_send_request);
+EXPORT_SYMBOL_GPL(dell_smbios_send_request);
=20
 static void __init parse_da_table(const struct dmi_header *dm)
 {
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/=
dell-smbios.h
index 1ffd680..5ccc0ea 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -45,5 +45,6 @@ void dell_smbios_release_buffer(void);
 int find_token_id(int tokenid);
 int find_token_location(int tokenid);
=20
-struct calling_interface_buffer *dell_send_request(int class, int sele=
ct);
+struct calling_interface_buffer *dell_smbios_send_request(int class,
+							  int select);
 #endif
--=20
1.7.10.4

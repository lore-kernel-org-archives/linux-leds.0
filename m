From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 08/16] dell-smbios: return the SMBIOS buffer from dell_smbios_get_buffer()
Date: Fri, 22 Jan 2016 15:27:20 +0100
Message-ID: <1453472848-3118-9-git-send-email-kernel@kempniu.pl>
References: <1453472848-3118-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:35823 "EHLO
	mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753620AbcAVO1w (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 22 Jan 2016 09:27:52 -0500
Received: by mail-lf0-f67.google.com with SMTP id c134so4290807lfb.2
        for <linux-leds@vger.kernel.org>; Fri, 22 Jan 2016 06:27:51 -0800 (PST)
In-Reply-To: <1453472848-3118-1-git-send-email-kernel@kempniu.pl>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Ultimately, the SMBIOS buffer should not be exported from dell-smbios.
Currently, dell-laptop accesses it directly using a global variable, so
make dell_smbios_get_buffer() return a pointer to the SMBIOS buffer and
replace all uses of the global variable with local variables.

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
 drivers/platform/x86/dell-laptop.c |   49 +++++++++++++++++++++++-----=
--------
 drivers/platform/x86/dell-smbios.c |    3 ++-
 drivers/platform/x86/dell-smbios.h |    2 +-
 3 files changed, 35 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-laptop.c
index 0bb2211..5b200f2 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -409,6 +409,7 @@ static inline int dell_smi_error(int value)
=20
 static int dell_rfkill_set(void *data, bool blocked)
 {
+	struct calling_interface_buffer *buffer;
 	int disable =3D blocked ? 1 : 0;
 	unsigned long radio =3D (unsigned long)data;
 	int hwswitch_bit =3D (unsigned long)data - 1;
@@ -416,7 +417,7 @@ static int dell_rfkill_set(void *data, bool blocked=
)
 	int status;
 	int ret;
=20
-	dell_smbios_get_buffer();
+	buffer =3D dell_smbios_get_buffer();
=20
 	dell_smbios_send_request(17, 11);
 	ret =3D buffer->output[0];
@@ -451,7 +452,8 @@ static int dell_rfkill_set(void *data, bool blocked=
)
=20
 /* Must be called with the buffer held */
 static void dell_rfkill_update_sw_state(struct rfkill *rfkill, int rad=
io,
-					int status)
+					int status,
+					struct calling_interface_buffer *buffer)
 {
 	if (status & BIT(0)) {
 		/* Has hw-switch, sync sw_state to BIOS */
@@ -474,12 +476,13 @@ static void dell_rfkill_update_hw_state(struct rf=
kill *rfkill, int radio,
=20
 static void dell_rfkill_query(struct rfkill *rfkill, void *data)
 {
+	struct calling_interface_buffer *buffer;
 	int radio =3D ((unsigned long)data & 0xF);
 	int hwswitch;
 	int status;
 	int ret;
=20
-	dell_smbios_get_buffer();
+	buffer =3D dell_smbios_get_buffer();
=20
 	dell_smbios_send_request(17, 11);
 	ret =3D buffer->output[0];
@@ -514,12 +517,13 @@ static struct dentry *dell_laptop_dir;
=20
 static int dell_debugfs_show(struct seq_file *s, void *data)
 {
+	struct calling_interface_buffer *buffer;
 	int hwswitch_state;
 	int hwswitch_ret;
 	int status;
 	int ret;
=20
-	dell_smbios_get_buffer();
+	buffer =3D dell_smbios_get_buffer();
=20
 	dell_smbios_send_request(17, 11);
 	ret =3D buffer->output[0];
@@ -613,11 +617,12 @@ static const struct file_operations dell_debugfs_=
fops =3D {
=20
 static void dell_update_rfkill(struct work_struct *ignored)
 {
+	struct calling_interface_buffer *buffer;
 	int hwswitch =3D 0;
 	int status;
 	int ret;
=20
-	dell_smbios_get_buffer();
+	buffer =3D dell_smbios_get_buffer();
=20
 	dell_smbios_send_request(17, 11);
 	ret =3D buffer->output[0];
@@ -637,16 +642,17 @@ static void dell_update_rfkill(struct work_struct=
 *ignored)
=20
 	if (wifi_rfkill) {
 		dell_rfkill_update_hw_state(wifi_rfkill, 1, status, hwswitch);
-		dell_rfkill_update_sw_state(wifi_rfkill, 1, status);
+		dell_rfkill_update_sw_state(wifi_rfkill, 1, status, buffer);
 	}
 	if (bluetooth_rfkill) {
 		dell_rfkill_update_hw_state(bluetooth_rfkill, 2, status,
 					    hwswitch);
-		dell_rfkill_update_sw_state(bluetooth_rfkill, 2, status);
+		dell_rfkill_update_sw_state(bluetooth_rfkill, 2, status,
+					    buffer);
 	}
 	if (wwan_rfkill) {
 		dell_rfkill_update_hw_state(wwan_rfkill, 3, status, hwswitch);
-		dell_rfkill_update_sw_state(wwan_rfkill, 3, status);
+		dell_rfkill_update_sw_state(wwan_rfkill, 3, status, buffer);
 	}
=20
  out:
@@ -694,6 +700,7 @@ static struct notifier_block dell_laptop_rbtn_notif=
ier =3D {
=20
 static int __init dell_setup_rfkill(void)
 {
+	struct calling_interface_buffer *buffer;
 	int status, ret, whitelisted;
 	const char *product;
=20
@@ -709,7 +716,7 @@ static int __init dell_setup_rfkill(void)
 	if (!force_rfkill && !whitelisted)
 		return 0;
=20
-	dell_smbios_get_buffer();
+	buffer =3D dell_smbios_get_buffer();
 	dell_smbios_send_request(17, 11);
 	ret =3D buffer->output[0];
 	status =3D buffer->output[1];
@@ -866,6 +873,7 @@ static void dell_cleanup_rfkill(void)
=20
 static int dell_send_intensity(struct backlight_device *bd)
 {
+	struct calling_interface_buffer *buffer;
 	int token;
 	int ret;
=20
@@ -873,7 +881,7 @@ static int dell_send_intensity(struct backlight_dev=
ice *bd)
 	if (token =3D=3D -1)
 		return -ENODEV;
=20
-	dell_smbios_get_buffer();
+	buffer =3D dell_smbios_get_buffer();
 	buffer->input[0] =3D token;
 	buffer->input[1] =3D bd->props.brightness;
=20
@@ -890,6 +898,7 @@ static int dell_send_intensity(struct backlight_dev=
ice *bd)
=20
 static int dell_get_intensity(struct backlight_device *bd)
 {
+	struct calling_interface_buffer *buffer;
 	int token;
 	int ret;
=20
@@ -897,7 +906,7 @@ static int dell_get_intensity(struct backlight_devi=
ce *bd)
 	if (token =3D=3D -1)
 		return -ENODEV;
=20
-	dell_smbios_get_buffer();
+	buffer =3D dell_smbios_get_buffer();
 	buffer->input[0] =3D token;
=20
 	if (power_supply_is_system_supplied() > 0)
@@ -1154,10 +1163,11 @@ static bool kbd_led_present;
=20
 static int kbd_get_info(struct kbd_info *info)
 {
+	struct calling_interface_buffer *buffer;
 	u8 units;
 	int ret;
=20
-	dell_smbios_get_buffer();
+	buffer =3D dell_smbios_get_buffer();
=20
 	buffer->input[0] =3D 0x0;
 	dell_smbios_send_request(4, 11);
@@ -1243,9 +1253,10 @@ static int kbd_set_level(struct kbd_state *state=
, u8 level)
=20
 static int kbd_get_state(struct kbd_state *state)
 {
+	struct calling_interface_buffer *buffer;
 	int ret;
=20
-	dell_smbios_get_buffer();
+	buffer =3D dell_smbios_get_buffer();
=20
 	buffer->input[0] =3D 0x1;
 	dell_smbios_send_request(4, 11);
@@ -1274,9 +1285,10 @@ static int kbd_get_state(struct kbd_state *state=
)
=20
 static int kbd_set_state(struct kbd_state *state)
 {
+	struct calling_interface_buffer *buffer;
 	int ret;
=20
-	dell_smbios_get_buffer();
+	buffer =3D dell_smbios_get_buffer();
 	buffer->input[0] =3D 0x2;
 	buffer->input[1] =3D BIT(state->mode_bit) & 0xFFFF;
 	buffer->input[1] |=3D (state->triggers & 0xFF) << 16;
@@ -1313,6 +1325,7 @@ static int kbd_set_state_safe(struct kbd_state *s=
tate, struct kbd_state *old)
=20
 static int kbd_set_token_bit(u8 bit)
 {
+	struct calling_interface_buffer *buffer;
 	int id;
 	int ret;
=20
@@ -1323,7 +1336,7 @@ static int kbd_set_token_bit(u8 bit)
 	if (id =3D=3D -1)
 		return -EINVAL;
=20
-	dell_smbios_get_buffer();
+	buffer =3D dell_smbios_get_buffer();
 	buffer->input[0] =3D da_tokens[id].location;
 	buffer->input[1] =3D da_tokens[id].value;
 	dell_smbios_send_request(1, 0);
@@ -1335,6 +1348,7 @@ static int kbd_set_token_bit(u8 bit)
=20
 static int kbd_get_token_bit(u8 bit)
 {
+	struct calling_interface_buffer *buffer;
 	int id;
 	int ret;
 	int val;
@@ -1346,7 +1360,7 @@ static int kbd_get_token_bit(u8 bit)
 	if (id =3D=3D -1)
 		return -EINVAL;
=20
-	dell_smbios_get_buffer();
+	buffer =3D dell_smbios_get_buffer();
 	buffer->input[0] =3D da_tokens[id].location;
 	dell_smbios_send_request(0, 0);
 	ret =3D buffer->output[0];
@@ -1972,6 +1986,7 @@ static void kbd_led_exit(void)
=20
 static int __init dell_init(void)
 {
+	struct calling_interface_buffer *buffer;
 	int max_intensity =3D 0;
 	int token;
 	int ret;
@@ -2017,7 +2032,7 @@ static int __init dell_init(void)
=20
 	token =3D find_token_location(BRIGHTNESS_TOKEN);
 	if (token !=3D -1) {
-		dell_smbios_get_buffer();
+		buffer =3D dell_smbios_get_buffer();
 		buffer->input[0] =3D token;
 		dell_smbios_send_request(0, 2);
 		if (buffer->output[0] =3D=3D 0)
diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/=
dell-smbios.c
index b10c613..535d382 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -40,10 +40,11 @@ static int da_num_tokens;
 struct calling_interface_token *da_tokens;
 EXPORT_SYMBOL_GPL(da_tokens);
=20
-void dell_smbios_get_buffer(void)
+struct calling_interface_buffer *dell_smbios_get_buffer(void)
 {
 	mutex_lock(&buffer_mutex);
 	dell_smbios_clear_buffer();
+	return buffer;
 }
 EXPORT_SYMBOL_GPL(dell_smbios_get_buffer);
=20
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/=
dell-smbios.h
index 80b5048..f7a51f5 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -38,7 +38,7 @@ struct calling_interface_token {
 extern struct calling_interface_buffer *buffer;
 extern struct calling_interface_token *da_tokens;
=20
-void dell_smbios_get_buffer(void);
+struct calling_interface_buffer *dell_smbios_get_buffer(void);
 void dell_smbios_clear_buffer(void);
 void dell_smbios_release_buffer(void);
 void dell_smbios_send_request(int class, int select);
--=20
1.7.10.4

From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 03/14] dell-smbios: rename buffer to dell_smbios_buffer
Date: Tue, 12 Jan 2016 15:02:49 +0100
Message-ID: <1452607380-20861-4-git-send-email-kernel@kempniu.pl>
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

As the SMBIOS buffer is exported from the module, it has to be renamed
to something less generic, so add a "dell_smbios_" prefix to the
variable name.

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
 drivers/platform/x86/dell-laptop.c |  139 ++++++++++++++++++----------=
--------
 drivers/platform/x86/dell-smbios.c |   20 +++---
 drivers/platform/x86/dell-smbios.h |    2 +-
 3 files changed, 81 insertions(+), 80 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-laptop.c
index 572bdca..aaef181 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -419,18 +419,18 @@ static int dell_rfkill_set(void *data, bool block=
ed)
 	get_buffer();
=20
 	dell_send_request(17, 11);
-	ret =3D buffer->output[0];
-	status =3D buffer->output[1];
+	ret =3D dell_smbios_buffer->output[0];
+	status =3D dell_smbios_buffer->output[1];
=20
 	if (ret !=3D 0)
 		goto out;
=20
 	clear_buffer();
=20
-	buffer->input[0] =3D 0x2;
+	dell_smbios_buffer->input[0] =3D 0x2;
 	dell_send_request(17, 11);
-	ret =3D buffer->output[0];
-	hwswitch =3D buffer->output[1];
+	ret =3D dell_smbios_buffer->output[0];
+	hwswitch =3D dell_smbios_buffer->output[1];
=20
 	/* If the hardware switch controls this radio, and the hardware
 	   switch is disabled, always disable the radio */
@@ -440,9 +440,9 @@ static int dell_rfkill_set(void *data, bool blocked=
)
=20
 	clear_buffer();
=20
-	buffer->input[0] =3D (1 | (radio<<8) | (disable << 16));
+	dell_smbios_buffer->input[0] =3D (1 | (radio << 8) | (disable << 16))=
;
 	dell_send_request(17, 11);
-	ret =3D buffer->output[0];
+	ret =3D dell_smbios_buffer->output[0];
=20
  out:
 	release_buffer();
@@ -457,7 +457,8 @@ static void dell_rfkill_update_sw_state(struct rfki=
ll *rfkill, int radio,
 		/* Has hw-switch, sync sw_state to BIOS */
 		int block =3D rfkill_blocked(rfkill);
 		clear_buffer();
-		buffer->input[0] =3D (1 | (radio << 8) | (block << 16));
+		dell_smbios_buffer->input[0] =3D (1 | (radio << 8)
+						  | (block << 16));
 		dell_send_request(17, 11);
 	} else {
 		/* No hw-switch, sync BIOS state to sw_state */
@@ -482,8 +483,8 @@ static void dell_rfkill_query(struct rfkill *rfkill=
, void *data)
 	get_buffer();
=20
 	dell_send_request(17, 11);
-	ret =3D buffer->output[0];
-	status =3D buffer->output[1];
+	ret =3D dell_smbios_buffer->output[0];
+	status =3D dell_smbios_buffer->output[1];
=20
 	if (ret !=3D 0 || !(status & BIT(0))) {
 		release_buffer();
@@ -492,10 +493,10 @@ static void dell_rfkill_query(struct rfkill *rfki=
ll, void *data)
=20
 	clear_buffer();
=20
-	buffer->input[0] =3D 0x2;
+	dell_smbios_buffer->input[0] =3D 0x2;
 	dell_send_request(17, 11);
-	ret =3D buffer->output[0];
-	hwswitch =3D buffer->output[1];
+	ret =3D dell_smbios_buffer->output[0];
+	hwswitch =3D dell_smbios_buffer->output[1];
=20
 	release_buffer();
=20
@@ -522,15 +523,15 @@ static int dell_debugfs_show(struct seq_file *s, =
void *data)
 	get_buffer();
=20
 	dell_send_request(17, 11);
-	ret =3D buffer->output[0];
-	status =3D buffer->output[1];
+	ret =3D dell_smbios_buffer->output[0];
+	status =3D dell_smbios_buffer->output[1];
=20
 	clear_buffer();
=20
-	buffer->input[0] =3D 0x2;
+	dell_smbios_buffer->input[0] =3D 0x2;
 	dell_send_request(17, 11);
-	hwswitch_ret =3D buffer->output[0];
-	hwswitch_state =3D buffer->output[1];
+	hwswitch_ret =3D dell_smbios_buffer->output[0];
+	hwswitch_state =3D dell_smbios_buffer->output[1];
=20
 	release_buffer();
=20
@@ -620,20 +621,20 @@ static void dell_update_rfkill(struct work_struct=
 *ignored)
 	get_buffer();
=20
 	dell_send_request(17, 11);
-	ret =3D buffer->output[0];
-	status =3D buffer->output[1];
+	ret =3D dell_smbios_buffer->output[0];
+	status =3D dell_smbios_buffer->output[1];
=20
 	if (ret !=3D 0)
 		goto out;
=20
 	clear_buffer();
=20
-	buffer->input[0] =3D 0x2;
+	dell_smbios_buffer->input[0] =3D 0x2;
 	dell_send_request(17, 11);
-	ret =3D buffer->output[0];
+	ret =3D dell_smbios_buffer->output[0];
=20
 	if (ret =3D=3D 0 && (status & BIT(0)))
-		hwswitch =3D buffer->output[1];
+		hwswitch =3D dell_smbios_buffer->output[1];
=20
 	if (wifi_rfkill) {
 		dell_rfkill_update_hw_state(wifi_rfkill, 1, status, hwswitch);
@@ -711,8 +712,8 @@ static int __init dell_setup_rfkill(void)
=20
 	get_buffer();
 	dell_send_request(17, 11);
-	ret =3D buffer->output[0];
-	status =3D buffer->output[1];
+	ret =3D dell_smbios_buffer->output[0];
+	status =3D dell_smbios_buffer->output[1];
 	release_buffer();
=20
 	/* dell wireless info smbios call is not supported */
@@ -874,15 +875,15 @@ static int dell_send_intensity(struct backlight_d=
evice *bd)
 		return -ENODEV;
=20
 	get_buffer();
-	buffer->input[0] =3D token;
-	buffer->input[1] =3D bd->props.brightness;
+	dell_smbios_buffer->input[0] =3D token;
+	dell_smbios_buffer->input[1] =3D bd->props.brightness;
=20
 	if (power_supply_is_system_supplied() > 0)
 		dell_send_request(1, 2);
 	else
 		dell_send_request(1, 1);
=20
-	ret =3D dell_smi_error(buffer->output[0]);
+	ret =3D dell_smi_error(dell_smbios_buffer->output[0]);
=20
 	release_buffer();
 	return ret;
@@ -898,17 +899,17 @@ static int dell_get_intensity(struct backlight_de=
vice *bd)
 		return -ENODEV;
=20
 	get_buffer();
-	buffer->input[0] =3D token;
+	dell_smbios_buffer->input[0] =3D token;
=20
 	if (power_supply_is_system_supplied() > 0)
 		dell_send_request(0, 2);
 	else
 		dell_send_request(0, 1);
=20
-	if (buffer->output[0])
-		ret =3D dell_smi_error(buffer->output[0]);
+	if (dell_smbios_buffer->output[0])
+		ret =3D dell_smi_error(dell_smbios_buffer->output[0]);
 	else
-		ret =3D buffer->output[1];
+		ret =3D dell_smbios_buffer->output[1];
=20
 	release_buffer();
 	return ret;
@@ -1159,29 +1160,29 @@ static int kbd_get_info(struct kbd_info *info)
=20
 	get_buffer();
=20
-	buffer->input[0] =3D 0x0;
+	dell_smbios_buffer->input[0] =3D 0x0;
 	dell_send_request(4, 11);
-	ret =3D buffer->output[0];
+	ret =3D dell_smbios_buffer->output[0];
=20
 	if (ret) {
 		ret =3D dell_smi_error(ret);
 		goto out;
 	}
=20
-	info->modes =3D buffer->output[1] & 0xFFFF;
-	info->type =3D (buffer->output[1] >> 24) & 0xFF;
-	info->triggers =3D buffer->output[2] & 0xFF;
-	units =3D (buffer->output[2] >> 8) & 0xFF;
-	info->levels =3D (buffer->output[2] >> 16) & 0xFF;
+	info->modes =3D dell_smbios_buffer->output[1] & 0xFFFF;
+	info->type =3D (dell_smbios_buffer->output[1] >> 24) & 0xFF;
+	info->triggers =3D dell_smbios_buffer->output[2] & 0xFF;
+	units =3D (dell_smbios_buffer->output[2] >> 8) & 0xFF;
+	info->levels =3D (dell_smbios_buffer->output[2] >> 16) & 0xFF;
=20
 	if (units & BIT(0))
-		info->seconds =3D (buffer->output[3] >> 0) & 0xFF;
+		info->seconds =3D (dell_smbios_buffer->output[3] >> 0) & 0xFF;
 	if (units & BIT(1))
-		info->minutes =3D (buffer->output[3] >> 8) & 0xFF;
+		info->minutes =3D (dell_smbios_buffer->output[3] >> 8) & 0xFF;
 	if (units & BIT(2))
-		info->hours =3D (buffer->output[3] >> 16) & 0xFF;
+		info->hours =3D (dell_smbios_buffer->output[3] >> 16) & 0xFF;
 	if (units & BIT(3))
-		info->days =3D (buffer->output[3] >> 24) & 0xFF;
+		info->days =3D (dell_smbios_buffer->output[3] >> 24) & 0xFF;
=20
  out:
 	release_buffer();
@@ -1247,25 +1248,25 @@ static int kbd_get_state(struct kbd_state *stat=
e)
=20
 	get_buffer();
=20
-	buffer->input[0] =3D 0x1;
+	dell_smbios_buffer->input[0] =3D 0x1;
 	dell_send_request(4, 11);
-	ret =3D buffer->output[0];
+	ret =3D dell_smbios_buffer->output[0];
=20
 	if (ret) {
 		ret =3D dell_smi_error(ret);
 		goto out;
 	}
=20
-	state->mode_bit =3D ffs(buffer->output[1] & 0xFFFF);
+	state->mode_bit =3D ffs(dell_smbios_buffer->output[1] & 0xFFFF);
 	if (state->mode_bit !=3D 0)
 		state->mode_bit--;
=20
-	state->triggers =3D (buffer->output[1] >> 16) & 0xFF;
-	state->timeout_value =3D (buffer->output[1] >> 24) & 0x3F;
-	state->timeout_unit =3D (buffer->output[1] >> 30) & 0x3;
-	state->als_setting =3D buffer->output[2] & 0xFF;
-	state->als_value =3D (buffer->output[2] >> 8) & 0xFF;
-	state->level =3D (buffer->output[2] >> 16) & 0xFF;
+	state->triggers =3D (dell_smbios_buffer->output[1] >> 16) & 0xFF;
+	state->timeout_value =3D (dell_smbios_buffer->output[1] >> 24) & 0x3F=
;
+	state->timeout_unit =3D (dell_smbios_buffer->output[1] >> 30) & 0x3;
+	state->als_setting =3D dell_smbios_buffer->output[2] & 0xFF;
+	state->als_value =3D (dell_smbios_buffer->output[2] >> 8) & 0xFF;
+	state->level =3D (dell_smbios_buffer->output[2] >> 16) & 0xFF;
=20
  out:
 	release_buffer();
@@ -1277,15 +1278,15 @@ static int kbd_set_state(struct kbd_state *stat=
e)
 	int ret;
=20
 	get_buffer();
-	buffer->input[0] =3D 0x2;
-	buffer->input[1] =3D BIT(state->mode_bit) & 0xFFFF;
-	buffer->input[1] |=3D (state->triggers & 0xFF) << 16;
-	buffer->input[1] |=3D (state->timeout_value & 0x3F) << 24;
-	buffer->input[1] |=3D (state->timeout_unit & 0x3) << 30;
-	buffer->input[2] =3D state->als_setting & 0xFF;
-	buffer->input[2] |=3D (state->level & 0xFF) << 16;
+	dell_smbios_buffer->input[0] =3D 0x2;
+	dell_smbios_buffer->input[1] =3D BIT(state->mode_bit) & 0xFFFF;
+	dell_smbios_buffer->input[1] |=3D (state->triggers & 0xFF) << 16;
+	dell_smbios_buffer->input[1] |=3D (state->timeout_value & 0x3F) << 24=
;
+	dell_smbios_buffer->input[1] |=3D (state->timeout_unit & 0x3) << 30;
+	dell_smbios_buffer->input[2] =3D state->als_setting & 0xFF;
+	dell_smbios_buffer->input[2] |=3D (state->level & 0xFF) << 16;
 	dell_send_request(4, 11);
-	ret =3D buffer->output[0];
+	ret =3D dell_smbios_buffer->output[0];
 	release_buffer();
=20
 	return dell_smi_error(ret);
@@ -1324,10 +1325,10 @@ static int kbd_set_token_bit(u8 bit)
 		return -EINVAL;
=20
 	get_buffer();
-	buffer->input[0] =3D da_tokens[id].location;
-	buffer->input[1] =3D da_tokens[id].value;
+	dell_smbios_buffer->input[0] =3D da_tokens[id].location;
+	dell_smbios_buffer->input[1] =3D da_tokens[id].value;
 	dell_send_request(1, 0);
-	ret =3D buffer->output[0];
+	ret =3D dell_smbios_buffer->output[0];
 	release_buffer();
=20
 	return dell_smi_error(ret);
@@ -1347,10 +1348,10 @@ static int kbd_get_token_bit(u8 bit)
 		return -EINVAL;
=20
 	get_buffer();
-	buffer->input[0] =3D da_tokens[id].location;
+	dell_smbios_buffer->input[0] =3D da_tokens[id].location;
 	dell_send_request(0, 0);
-	ret =3D buffer->output[0];
-	val =3D buffer->output[1];
+	ret =3D dell_smbios_buffer->output[0];
+	val =3D dell_smbios_buffer->output[1];
 	release_buffer();
=20
 	if (ret)
@@ -2018,10 +2019,10 @@ static int __init dell_init(void)
 	token =3D find_token_location(BRIGHTNESS_TOKEN);
 	if (token !=3D -1) {
 		get_buffer();
-		buffer->input[0] =3D token;
+		dell_smbios_buffer->input[0] =3D token;
 		dell_send_request(0, 2);
-		if (buffer->output[0] =3D=3D 0)
-			max_intensity =3D buffer->output[3];
+		if (dell_smbios_buffer->output[0] =3D=3D 0)
+			max_intensity =3D dell_smbios_buffer->output[3];
 		release_buffer();
 	}
=20
diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/=
dell-smbios.c
index 758680f..a3898f9 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -31,8 +31,8 @@ struct calling_interface_structure {
 } __packed;
=20
 static DEFINE_MUTEX(buffer_mutex);
-struct calling_interface_buffer *buffer;
-EXPORT_SYMBOL_GPL(buffer);
+struct calling_interface_buffer *dell_smbios_buffer;
+EXPORT_SYMBOL_GPL(dell_smbios_buffer);
=20
 static int da_command_address;
 static int da_command_code;
@@ -42,7 +42,7 @@ EXPORT_SYMBOL_GPL(da_tokens);
=20
 void clear_buffer(void)
 {
-	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+	memset(dell_smbios_buffer, 0, sizeof(struct calling_interface_buffer)=
);
 }
 EXPORT_SYMBOL_GPL(clear_buffer);
=20
@@ -91,15 +91,15 @@ struct calling_interface_buffer *dell_send_request(=
int class, int select)
 	command.magic =3D SMI_CMD_MAGIC;
 	command.command_address =3D da_command_address;
 	command.command_code =3D da_command_code;
-	command.ebx =3D virt_to_phys(buffer);
+	command.ebx =3D virt_to_phys(dell_smbios_buffer);
 	command.ecx =3D 0x42534931;
=20
-	buffer->class =3D class;
-	buffer->select =3D select;
+	dell_smbios_buffer->class =3D class;
+	dell_smbios_buffer->select =3D select;
=20
 	dcdbas_smi_request(&command);
=20
-	return buffer;
+	return dell_smbios_buffer;
 }
 EXPORT_SYMBOL_GPL(dell_send_request);
=20
@@ -162,8 +162,8 @@ static int __init dell_smbios_init(void)
 	 * Allocate buffer below 4GB for SMI data--only 32-bit physical addr
 	 * is passed to SMI handler.
 	 */
-	buffer =3D (void *)__get_free_page(GFP_KERNEL | GFP_DMA32);
-	if (!buffer) {
+	dell_smbios_buffer =3D (void *)__get_free_page(GFP_KERNEL | GFP_DMA32=
);
+	if (!dell_smbios_buffer) {
 		ret =3D -ENOMEM;
 		goto fail_buffer;
 	}
@@ -178,7 +178,7 @@ fail_buffer:
 static void __exit dell_smbios_exit(void)
 {
 	kfree(da_tokens);
-	free_page((unsigned long)buffer);
+	free_page((unsigned long)dell_smbios_buffer);
 }
=20
 subsys_initcall(dell_smbios_init);
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/=
dell-smbios.h
index 0f58ce8..89c787c 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -35,7 +35,7 @@ struct calling_interface_token {
 	};
 };
=20
-extern struct calling_interface_buffer *buffer;
+extern struct calling_interface_buffer *dell_smbios_buffer;
 extern struct calling_interface_token *da_tokens;
=20
 void clear_buffer(void);
--=20
1.7.10.4

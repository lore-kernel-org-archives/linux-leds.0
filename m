From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 04/16] dell-smbios: rename release_buffer() to dell_smbios_release_buffer()
Date: Fri, 22 Jan 2016 15:27:16 +0100
Message-ID: <1453472848-3118-5-git-send-email-kernel@kempniu.pl>
References: <1453472848-3118-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453472848-3118-1-git-send-email-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

As release_buffer() is exported from the module, it has to be renamed t=
o
something less generic, so add a "dell_smbios_" prefix to the function
name.

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
 drivers/platform/x86/dell-laptop.c |   28 ++++++++++++++--------------
 drivers/platform/x86/dell-smbios.c |    4 ++--
 drivers/platform/x86/dell-smbios.h |    2 +-
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-laptop.c
index 90d75ce..b47dc5a 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -445,7 +445,7 @@ static int dell_rfkill_set(void *data, bool blocked=
)
 	ret =3D buffer->output[0];
=20
  out:
-	release_buffer();
+	dell_smbios_release_buffer();
 	return dell_smi_error(ret);
 }
=20
@@ -486,7 +486,7 @@ static void dell_rfkill_query(struct rfkill *rfkill=
, void *data)
 	status =3D buffer->output[1];
=20
 	if (ret !=3D 0 || !(status & BIT(0))) {
-		release_buffer();
+		dell_smbios_release_buffer();
 		return;
 	}
=20
@@ -497,7 +497,7 @@ static void dell_rfkill_query(struct rfkill *rfkill=
, void *data)
 	ret =3D buffer->output[0];
 	hwswitch =3D buffer->output[1];
=20
-	release_buffer();
+	dell_smbios_release_buffer();
=20
 	if (ret !=3D 0)
 		return;
@@ -532,7 +532,7 @@ static int dell_debugfs_show(struct seq_file *s, vo=
id *data)
 	hwswitch_ret =3D buffer->output[0];
 	hwswitch_state =3D buffer->output[1];
=20
-	release_buffer();
+	dell_smbios_release_buffer();
=20
 	seq_printf(s, "return:\t%d\n", ret);
 	seq_printf(s, "status:\t0x%X\n", status);
@@ -650,7 +650,7 @@ static void dell_update_rfkill(struct work_struct *=
ignored)
 	}
=20
  out:
-	release_buffer();
+	dell_smbios_release_buffer();
 }
 static DECLARE_DELAYED_WORK(dell_rfkill_work, dell_update_rfkill);
=20
@@ -713,7 +713,7 @@ static int __init dell_setup_rfkill(void)
 	dell_send_request(buffer, 17, 11);
 	ret =3D buffer->output[0];
 	status =3D buffer->output[1];
-	release_buffer();
+	dell_smbios_release_buffer();
=20
 	/* dell wireless info smbios call is not supported */
 	if (ret !=3D 0)
@@ -884,7 +884,7 @@ static int dell_send_intensity(struct backlight_dev=
ice *bd)
=20
 	ret =3D dell_smi_error(buffer->output[0]);
=20
-	release_buffer();
+	dell_smbios_release_buffer();
 	return ret;
 }
=20
@@ -910,7 +910,7 @@ static int dell_get_intensity(struct backlight_devi=
ce *bd)
 	else
 		ret =3D buffer->output[1];
=20
-	release_buffer();
+	dell_smbios_release_buffer();
 	return ret;
 }
=20
@@ -1184,7 +1184,7 @@ static int kbd_get_info(struct kbd_info *info)
 		info->days =3D (buffer->output[3] >> 24) & 0xFF;
=20
  out:
-	release_buffer();
+	dell_smbios_release_buffer();
 	return ret;
 }
=20
@@ -1268,7 +1268,7 @@ static int kbd_get_state(struct kbd_state *state)
 	state->level =3D (buffer->output[2] >> 16) & 0xFF;
=20
  out:
-	release_buffer();
+	dell_smbios_release_buffer();
 	return ret;
 }
=20
@@ -1286,7 +1286,7 @@ static int kbd_set_state(struct kbd_state *state)
 	buffer->input[2] |=3D (state->level & 0xFF) << 16;
 	dell_send_request(buffer, 4, 11);
 	ret =3D buffer->output[0];
-	release_buffer();
+	dell_smbios_release_buffer();
=20
 	return dell_smi_error(ret);
 }
@@ -1328,7 +1328,7 @@ static int kbd_set_token_bit(u8 bit)
 	buffer->input[1] =3D da_tokens[id].value;
 	dell_send_request(buffer, 1, 0);
 	ret =3D buffer->output[0];
-	release_buffer();
+	dell_smbios_release_buffer();
=20
 	return dell_smi_error(ret);
 }
@@ -1351,7 +1351,7 @@ static int kbd_get_token_bit(u8 bit)
 	dell_send_request(buffer, 0, 0);
 	ret =3D buffer->output[0];
 	val =3D buffer->output[1];
-	release_buffer();
+	dell_smbios_release_buffer();
=20
 	if (ret)
 		return dell_smi_error(ret);
@@ -2022,7 +2022,7 @@ static int __init dell_init(void)
 		dell_send_request(buffer, 0, 2);
 		if (buffer->output[0] =3D=3D 0)
 			max_intensity =3D buffer->output[3];
-		release_buffer();
+		dell_smbios_release_buffer();
 	}
=20
 	if (max_intensity) {
diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/=
dell-smbios.c
index 8b1a0dd..2607d1c 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -53,11 +53,11 @@ void dell_smbios_clear_buffer(void)
 }
 EXPORT_SYMBOL_GPL(dell_smbios_clear_buffer);
=20
-void release_buffer(void)
+void dell_smbios_release_buffer(void)
 {
 	mutex_unlock(&buffer_mutex);
 }
-EXPORT_SYMBOL_GPL(release_buffer);
+EXPORT_SYMBOL_GPL(dell_smbios_release_buffer);
=20
 struct calling_interface_buffer *
 dell_send_request(struct calling_interface_buffer *buffer,
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/=
dell-smbios.h
index c5e9474..8558103 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -40,7 +40,7 @@ extern struct calling_interface_token *da_tokens;
=20
 void dell_smbios_get_buffer(void);
 void dell_smbios_clear_buffer(void);
-void release_buffer(void);
+void dell_smbios_release_buffer(void);
 struct calling_interface_buffer *
 dell_send_request(struct calling_interface_buffer *buffer,
 		  int class, int select);
--=20
1.7.10.4

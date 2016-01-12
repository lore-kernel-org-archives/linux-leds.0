From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 06/14] dell-smbios: rename release_buffer() to dell_smbios_release_buffer()
Date: Tue, 12 Jan 2016 15:02:52 +0100
Message-ID: <1452607380-20861-7-git-send-email-kernel@kempniu.pl>
References: <1452607380-20861-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f195.google.com ([209.85.217.195]:33252 "EHLO
	mail-lb0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965453AbcALOD1 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 Jan 2016 09:03:27 -0500
Received: by mail-lb0-f195.google.com with SMTP id bc4so18567744lbc.0
        for <linux-leds@vger.kernel.org>; Tue, 12 Jan 2016 06:03:26 -0800 (PST)
In-Reply-To: <1452607380-20861-1-git-send-email-kernel@kempniu.pl>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

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
index 5df30a9..ab256ae 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -445,7 +445,7 @@ static int dell_rfkill_set(void *data, bool blocked=
)
 	ret =3D dell_smbios_buffer->output[0];
=20
  out:
-	release_buffer();
+	dell_smbios_release_buffer();
 	return dell_smi_error(ret);
 }
=20
@@ -487,7 +487,7 @@ static void dell_rfkill_query(struct rfkill *rfkill=
, void *data)
 	status =3D dell_smbios_buffer->output[1];
=20
 	if (ret !=3D 0 || !(status & BIT(0))) {
-		release_buffer();
+		dell_smbios_release_buffer();
 		return;
 	}
=20
@@ -498,7 +498,7 @@ static void dell_rfkill_query(struct rfkill *rfkill=
, void *data)
 	ret =3D dell_smbios_buffer->output[0];
 	hwswitch =3D dell_smbios_buffer->output[1];
=20
-	release_buffer();
+	dell_smbios_release_buffer();
=20
 	if (ret !=3D 0)
 		return;
@@ -533,7 +533,7 @@ static int dell_debugfs_show(struct seq_file *s, vo=
id *data)
 	hwswitch_ret =3D dell_smbios_buffer->output[0];
 	hwswitch_state =3D dell_smbios_buffer->output[1];
=20
-	release_buffer();
+	dell_smbios_release_buffer();
=20
 	seq_printf(s, "return:\t%d\n", ret);
 	seq_printf(s, "status:\t0x%X\n", status);
@@ -651,7 +651,7 @@ static void dell_update_rfkill(struct work_struct *=
ignored)
 	}
=20
  out:
-	release_buffer();
+	dell_smbios_release_buffer();
 }
 static DECLARE_DELAYED_WORK(dell_rfkill_work, dell_update_rfkill);
=20
@@ -714,7 +714,7 @@ static int __init dell_setup_rfkill(void)
 	dell_send_request(17, 11);
 	ret =3D dell_smbios_buffer->output[0];
 	status =3D dell_smbios_buffer->output[1];
-	release_buffer();
+	dell_smbios_release_buffer();
=20
 	/* dell wireless info smbios call is not supported */
 	if (ret !=3D 0)
@@ -885,7 +885,7 @@ static int dell_send_intensity(struct backlight_dev=
ice *bd)
=20
 	ret =3D dell_smi_error(dell_smbios_buffer->output[0]);
=20
-	release_buffer();
+	dell_smbios_release_buffer();
 	return ret;
 }
=20
@@ -911,7 +911,7 @@ static int dell_get_intensity(struct backlight_devi=
ce *bd)
 	else
 		ret =3D dell_smbios_buffer->output[1];
=20
-	release_buffer();
+	dell_smbios_release_buffer();
 	return ret;
 }
=20
@@ -1185,7 +1185,7 @@ static int kbd_get_info(struct kbd_info *info)
 		info->days =3D (dell_smbios_buffer->output[3] >> 24) & 0xFF;
=20
  out:
-	release_buffer();
+	dell_smbios_release_buffer();
 	return ret;
 }
=20
@@ -1269,7 +1269,7 @@ static int kbd_get_state(struct kbd_state *state)
 	state->level =3D (dell_smbios_buffer->output[2] >> 16) & 0xFF;
=20
  out:
-	release_buffer();
+	dell_smbios_release_buffer();
 	return ret;
 }
=20
@@ -1287,7 +1287,7 @@ static int kbd_set_state(struct kbd_state *state)
 	dell_smbios_buffer->input[2] |=3D (state->level & 0xFF) << 16;
 	dell_send_request(4, 11);
 	ret =3D dell_smbios_buffer->output[0];
-	release_buffer();
+	dell_smbios_release_buffer();
=20
 	return dell_smi_error(ret);
 }
@@ -1329,7 +1329,7 @@ static int kbd_set_token_bit(u8 bit)
 	dell_smbios_buffer->input[1] =3D da_tokens[id].value;
 	dell_send_request(1, 0);
 	ret =3D dell_smbios_buffer->output[0];
-	release_buffer();
+	dell_smbios_release_buffer();
=20
 	return dell_smi_error(ret);
 }
@@ -1352,7 +1352,7 @@ static int kbd_get_token_bit(u8 bit)
 	dell_send_request(0, 0);
 	ret =3D dell_smbios_buffer->output[0];
 	val =3D dell_smbios_buffer->output[1];
-	release_buffer();
+	dell_smbios_release_buffer();
=20
 	if (ret)
 		return dell_smi_error(ret);
@@ -2023,7 +2023,7 @@ static int __init dell_init(void)
 		dell_send_request(0, 2);
 		if (dell_smbios_buffer->output[0] =3D=3D 0)
 			max_intensity =3D dell_smbios_buffer->output[3];
-		release_buffer();
+		dell_smbios_release_buffer();
 	}
=20
 	if (max_intensity) {
diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/=
dell-smbios.c
index 27dbfb9..20d7f21 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -53,11 +53,11 @@ void dell_smbios_get_buffer(void)
 }
 EXPORT_SYMBOL_GPL(dell_smbios_get_buffer);
=20
-void release_buffer(void)
+void dell_smbios_release_buffer(void)
 {
 	mutex_unlock(&buffer_mutex);
 }
-EXPORT_SYMBOL_GPL(release_buffer);
+EXPORT_SYMBOL_GPL(dell_smbios_release_buffer);
=20
 int find_token_id(int tokenid)
 {
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/=
dell-smbios.h
index e3c2014..1ffd680 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -40,7 +40,7 @@ extern struct calling_interface_token *da_tokens;
=20
 void dell_smbios_clear_buffer(void);
 void dell_smbios_get_buffer(void);
-void release_buffer(void);
+void dell_smbios_release_buffer(void);
=20
 int find_token_id(int tokenid);
 int find_token_location(int tokenid);
--=20
1.7.10.4

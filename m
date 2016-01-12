From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 04/14] dell-smbios: rename clear_buffer() to dell_smbios_clear_buffer()
Date: Tue, 12 Jan 2016 15:02:50 +0100
Message-ID: <1452607380-20861-5-git-send-email-kernel@kempniu.pl>
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

As clear_buffer() is exported from the module, it has to be renamed to
something less generic, so add a "dell_smbios_" prefix to the function
name.

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
 drivers/platform/x86/dell-laptop.c |   12 ++++++------
 drivers/platform/x86/dell-smbios.c |    6 +++---
 drivers/platform/x86/dell-smbios.h |    2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-laptop.c
index aaef181..1bfc95e 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -425,7 +425,7 @@ static int dell_rfkill_set(void *data, bool blocked=
)
 	if (ret !=3D 0)
 		goto out;
=20
-	clear_buffer();
+	dell_smbios_clear_buffer();
=20
 	dell_smbios_buffer->input[0] =3D 0x2;
 	dell_send_request(17, 11);
@@ -438,7 +438,7 @@ static int dell_rfkill_set(void *data, bool blocked=
)
 	    (status & BIT(0)) && !(status & BIT(16)))
 		disable =3D 1;
=20
-	clear_buffer();
+	dell_smbios_clear_buffer();
=20
 	dell_smbios_buffer->input[0] =3D (1 | (radio << 8) | (disable << 16))=
;
 	dell_send_request(17, 11);
@@ -456,7 +456,7 @@ static void dell_rfkill_update_sw_state(struct rfki=
ll *rfkill, int radio,
 	if (status & BIT(0)) {
 		/* Has hw-switch, sync sw_state to BIOS */
 		int block =3D rfkill_blocked(rfkill);
-		clear_buffer();
+		dell_smbios_clear_buffer();
 		dell_smbios_buffer->input[0] =3D (1 | (radio << 8)
 						  | (block << 16));
 		dell_send_request(17, 11);
@@ -491,7 +491,7 @@ static void dell_rfkill_query(struct rfkill *rfkill=
, void *data)
 		return;
 	}
=20
-	clear_buffer();
+	dell_smbios_clear_buffer();
=20
 	dell_smbios_buffer->input[0] =3D 0x2;
 	dell_send_request(17, 11);
@@ -526,7 +526,7 @@ static int dell_debugfs_show(struct seq_file *s, vo=
id *data)
 	ret =3D dell_smbios_buffer->output[0];
 	status =3D dell_smbios_buffer->output[1];
=20
-	clear_buffer();
+	dell_smbios_clear_buffer();
=20
 	dell_smbios_buffer->input[0] =3D 0x2;
 	dell_send_request(17, 11);
@@ -627,7 +627,7 @@ static void dell_update_rfkill(struct work_struct *=
ignored)
 	if (ret !=3D 0)
 		goto out;
=20
-	clear_buffer();
+	dell_smbios_clear_buffer();
=20
 	dell_smbios_buffer->input[0] =3D 0x2;
 	dell_send_request(17, 11);
diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/=
dell-smbios.c
index a3898f9..8fa740c 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -40,16 +40,16 @@ static int da_num_tokens;
 struct calling_interface_token *da_tokens;
 EXPORT_SYMBOL_GPL(da_tokens);
=20
-void clear_buffer(void)
+void dell_smbios_clear_buffer(void)
 {
 	memset(dell_smbios_buffer, 0, sizeof(struct calling_interface_buffer)=
);
 }
-EXPORT_SYMBOL_GPL(clear_buffer);
+EXPORT_SYMBOL_GPL(dell_smbios_clear_buffer);
=20
 void get_buffer(void)
 {
 	mutex_lock(&buffer_mutex);
-	clear_buffer();
+	dell_smbios_clear_buffer();
 }
 EXPORT_SYMBOL_GPL(get_buffer);
=20
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/=
dell-smbios.h
index 89c787c..ba0bc22 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -38,7 +38,7 @@ struct calling_interface_token {
 extern struct calling_interface_buffer *dell_smbios_buffer;
 extern struct calling_interface_token *da_tokens;
=20
-void clear_buffer(void);
+void dell_smbios_clear_buffer(void);
 void get_buffer(void);
 void release_buffer(void);
=20
--=20
1.7.10.4

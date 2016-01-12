From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 09/14] dell-laptop: use dell_smbios_find_token() instead of find_token_id()
Date: Tue, 12 Jan 2016 15:02:55 +0100
Message-ID: <1452607380-20861-10-git-send-email-kernel@kempniu.pl>
References: <1452607380-20861-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <1452607380-20861-1-git-send-email-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Replace all uses of find_token_id() with dell_smbios_find_token() to
avoid directly accessing the da_tokens table.

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
 drivers/platform/x86/dell-laptop.c |   22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-laptop.c
index 65aa1ff..dfe2afd 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -1314,19 +1314,19 @@ static int kbd_set_state_safe(struct kbd_state =
*state, struct kbd_state *old)
=20
 static int kbd_set_token_bit(u8 bit)
 {
-	int id;
+	struct calling_interface_token *token;
 	int ret;
=20
 	if (bit >=3D ARRAY_SIZE(kbd_tokens))
 		return -EINVAL;
=20
-	id =3D find_token_id(kbd_tokens[bit]);
-	if (id =3D=3D -1)
+	token =3D dell_smbios_find_token(kbd_tokens[bit]);
+	if (!token)
 		return -EINVAL;
=20
 	dell_smbios_get_buffer();
-	dell_smbios_buffer->input[0] =3D da_tokens[id].location;
-	dell_smbios_buffer->input[1] =3D da_tokens[id].value;
+	dell_smbios_buffer->input[0] =3D token->location;
+	dell_smbios_buffer->input[1] =3D token->value;
 	dell_smbios_send_request(1, 0);
 	ret =3D dell_smbios_buffer->output[0];
 	dell_smbios_release_buffer();
@@ -1336,19 +1336,19 @@ static int kbd_set_token_bit(u8 bit)
=20
 static int kbd_get_token_bit(u8 bit)
 {
-	int id;
+	struct calling_interface_token *token;
 	int ret;
 	int val;
=20
 	if (bit >=3D ARRAY_SIZE(kbd_tokens))
 		return -EINVAL;
=20
-	id =3D find_token_id(kbd_tokens[bit]);
-	if (id =3D=3D -1)
+	token =3D dell_smbios_find_token(kbd_tokens[bit]);
+	if (!token)
 		return -EINVAL;
=20
 	dell_smbios_get_buffer();
-	dell_smbios_buffer->input[0] =3D da_tokens[id].location;
+	dell_smbios_buffer->input[0] =3D token->location;
 	dell_smbios_send_request(0, 0);
 	ret =3D dell_smbios_buffer->output[0];
 	val =3D dell_smbios_buffer->output[1];
@@ -1357,7 +1357,7 @@ static int kbd_get_token_bit(u8 bit)
 	if (ret)
 		return dell_smi_error(ret);
=20
-	return (val =3D=3D da_tokens[id].value);
+	return (val =3D=3D token->value);
 }
=20
 static int kbd_get_first_active_token_bit(void)
@@ -1459,7 +1459,7 @@ static inline void kbd_init_tokens(void)
 	int i;
=20
 	for (i =3D 0; i < ARRAY_SIZE(kbd_tokens); ++i)
-		if (find_token_id(kbd_tokens[i]) !=3D -1)
+		if (dell_smbios_find_token(kbd_tokens[i]))
 			kbd_token_bits |=3D BIT(i);
 }
=20
--=20
1.7.10.4

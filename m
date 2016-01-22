From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 13/16] dell-smbios: remove find_token_{id,location}()
Date: Fri, 22 Jan 2016 15:27:25 +0100
Message-ID: <1453472848-3118-14-git-send-email-kernel@kempniu.pl>
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

As dell-laptop has been changed to use dell_smbios_find_token() instead
of find_token_id() and find_token_location(), these functions can be
safely removed.

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
 drivers/platform/x86/dell-smbios.c |   25 -------------------------
 drivers/platform/x86/dell-smbios.h |    3 ---
 2 files changed, 28 deletions(-)

diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/=
dell-smbios.c
index 43aafab..e313c16 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -89,31 +89,6 @@ struct calling_interface_token *dell_smbios_find_tok=
en(int tokenid)
 }
 EXPORT_SYMBOL_GPL(dell_smbios_find_token);
=20
-int find_token_id(int tokenid)
-{
-	int i;
-
-	for (i =3D 0; i < da_num_tokens; i++) {
-		if (da_tokens[i].tokenID =3D=3D tokenid)
-			return i;
-	}
-
-	return -1;
-}
-EXPORT_SYMBOL_GPL(find_token_id);
-
-int find_token_location(int tokenid)
-{
-	int id;
-
-	id =3D find_token_id(tokenid);
-	if (id =3D=3D -1)
-		return -1;
-
-	return da_tokens[id].location;
-}
-EXPORT_SYMBOL_GPL(find_token_location);
-
 static void __init parse_da_table(const struct dmi_header *dm)
 {
 	/* Final token is a terminator, so we don't want to copy it */
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/=
dell-smbios.h
index 6f6dbe8..f17cf7b 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -43,7 +43,4 @@ void dell_smbios_release_buffer(void);
 void dell_smbios_send_request(int class, int select);
=20
 struct calling_interface_token *dell_smbios_find_token(int tokenid);
-
-int find_token_id(int tokenid);
-int find_token_location(int tokenid);
 #endif
--=20
1.7.10.4

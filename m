From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 11/14] dell-smbios: remove find_token_{id,location}()
Date: Tue, 12 Jan 2016 15:02:57 +0100
Message-ID: <1452607380-20861-12-git-send-email-kernel@kempniu.pl>
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

As find_token_id() and find_token_location() were only used in
dell-laptop, which has been changed to use dell_smbios_find_token()
instead, the old functions can be safely removed.

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
 drivers/platform/x86/dell-smbios.c |   25 -------------------------
 drivers/platform/x86/dell-smbios.h |    3 ---
 2 files changed, 28 deletions(-)

diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/=
dell-smbios.c
index 83e35ed..f506a20 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -72,31 +72,6 @@ struct calling_interface_token *dell_smbios_find_tok=
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
 struct calling_interface_buffer *dell_smbios_send_request(int class,
 							  int select)
 {
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/=
dell-smbios.h
index 23f6e95..3e39e13 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -44,9 +44,6 @@ void dell_smbios_release_buffer(void);
=20
 struct calling_interface_token *dell_smbios_find_token(int tokenid);
=20
-int find_token_id(int tokenid);
-int find_token_location(int tokenid);
-
 struct calling_interface_buffer *dell_smbios_send_request(int class,
 							  int select);
 #endif
--=20
1.7.10.4

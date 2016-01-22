From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 10/16] dell-smbios: implement new function for finding DMI table 0xDA tokens
Date: Fri, 22 Jan 2016 15:27:22 +0100
Message-ID: <1453472848-3118-11-git-send-email-kernel@kempniu.pl>
References: <1453472848-3118-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33242 "EHLO
	mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754071AbcAVO1y (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 22 Jan 2016 09:27:54 -0500
Received: by mail-lf0-f68.google.com with SMTP id z62so4198478lfd.0
        for <linux-leds@vger.kernel.org>; Fri, 22 Jan 2016 06:27:53 -0800 (PST)
In-Reply-To: <1453472848-3118-1-git-send-email-kernel@kempniu.pl>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Ultimately, the da_tokens table should not be exported from dell-smbios=
=2E
Currently, in some cases, dell-laptop accesses that table's members
directly, so implement a new function, dell_smbios_find_token(), which
returns a pointer to an entry inside the da_tokens table with the given
token ID (or NULL if it is not found).

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
 drivers/platform/x86/dell-smbios.c |   13 +++++++++++++
 drivers/platform/x86/dell-smbios.h |    2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/=
dell-smbios.c
index b383d0d..43aafab 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -76,6 +76,19 @@ void dell_smbios_send_request(int class, int select)
 }
 EXPORT_SYMBOL_GPL(dell_smbios_send_request);
=20
+struct calling_interface_token *dell_smbios_find_token(int tokenid)
+{
+	int i;
+
+	for (i =3D 0; i < da_num_tokens; i++) {
+		if (da_tokens[i].tokenID =3D=3D tokenid)
+			return &da_tokens[i];
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(dell_smbios_find_token);
+
 int find_token_id(int tokenid)
 {
 	int i;
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/=
dell-smbios.h
index af653ff..6f6dbe8 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -42,6 +42,8 @@ void dell_smbios_clear_buffer(void);
 void dell_smbios_release_buffer(void);
 void dell_smbios_send_request(int class, int select);
=20
+struct calling_interface_token *dell_smbios_find_token(int tokenid);
+
 int find_token_id(int tokenid);
 int find_token_location(int tokenid);
 #endif
--=20
1.7.10.4

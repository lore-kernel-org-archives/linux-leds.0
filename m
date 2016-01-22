From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 07/16] dell-smbios: don't return an SMBIOS buffer from dell_smbios_send_request()
Date: Fri, 22 Jan 2016 15:27:19 +0100
Message-ID: <1453472848-3118-8-git-send-email-kernel@kempniu.pl>
References: <1453472848-3118-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33232 "EHLO
	mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754050AbcAVO1u (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 22 Jan 2016 09:27:50 -0500
Received: by mail-lf0-f68.google.com with SMTP id z62so4198424lfd.0
        for <linux-leds@vger.kernel.org>; Fri, 22 Jan 2016 06:27:49 -0800 (PST)
In-Reply-To: <1453472848-3118-1-git-send-email-kernel@kempniu.pl>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

An SMBIOS buffer pointer does not need to be returned by
dell_smbios_send_request(), because SMBIOS call results are stored in
the buffer passed as input.

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
 drivers/platform/x86/dell-smbios.c |    5 +----
 drivers/platform/x86/dell-smbios.h |    3 +--
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/=
dell-smbios.c
index d573765..b10c613 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -59,8 +59,7 @@ void dell_smbios_release_buffer(void)
 }
 EXPORT_SYMBOL_GPL(dell_smbios_release_buffer);
=20
-struct calling_interface_buffer *
-dell_smbios_send_request(int class, int select)
+void dell_smbios_send_request(int class, int select)
 {
 	struct smi_cmd command;
=20
@@ -74,8 +73,6 @@ dell_smbios_send_request(int class, int select)
 	buffer->select =3D select;
=20
 	dcdbas_smi_request(&command);
-
-	return buffer;
 }
 EXPORT_SYMBOL_GPL(dell_smbios_send_request);
=20
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/=
dell-smbios.h
index 4220ac1..80b5048 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -41,8 +41,7 @@ extern struct calling_interface_token *da_tokens;
 void dell_smbios_get_buffer(void);
 void dell_smbios_clear_buffer(void);
 void dell_smbios_release_buffer(void);
-struct calling_interface_buffer *
-dell_smbios_send_request(int class, int select);
+void dell_smbios_send_request(int class, int select);
=20
 int find_token_id(int tokenid);
 int find_token_location(int tokenid);
--=20
1.7.10.4

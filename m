From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 14/16] dell-smbios: make da_tokens static
Date: Fri, 22 Jan 2016 15:27:26 +0100
Message-ID: <1453472848-3118-15-git-send-email-kernel@kempniu.pl>
References: <1453472848-3118-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:36071 "EHLO
	mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754130AbcAVO17 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 22 Jan 2016 09:27:59 -0500
Received: by mail-lf0-f65.google.com with SMTP id t141so4144389lfd.3
        for <linux-leds@vger.kernel.org>; Fri, 22 Jan 2016 06:27:59 -0800 (PST)
In-Reply-To: <1453472848-3118-1-git-send-email-kernel@kempniu.pl>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

As dell-laptop has been changed to use dell_smbios_find_token() instead
of directly accessing members of the da_tokens table, the latter can be
marked static.

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
 drivers/platform/x86/dell-smbios.c |    3 +--
 drivers/platform/x86/dell-smbios.h |    2 --
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/=
dell-smbios.c
index e313c16..f68c434 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -36,8 +36,7 @@ static DEFINE_MUTEX(buffer_mutex);
 static int da_command_address;
 static int da_command_code;
 static int da_num_tokens;
-struct calling_interface_token *da_tokens;
-EXPORT_SYMBOL_GPL(da_tokens);
+static struct calling_interface_token *da_tokens;
=20
 struct calling_interface_buffer *dell_smbios_get_buffer(void)
 {
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/=
dell-smbios.h
index f17cf7b..4f69b16 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -35,8 +35,6 @@ struct calling_interface_token {
 	};
 };
=20
-extern struct calling_interface_token *da_tokens;
-
 struct calling_interface_buffer *dell_smbios_get_buffer(void);
 void dell_smbios_clear_buffer(void);
 void dell_smbios_release_buffer(void);
--=20
1.7.10.4

From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 09/16] dell-smbios: make the SMBIOS buffer static
Date: Fri, 22 Jan 2016 15:27:21 +0100
Message-ID: <1453472848-3118-10-git-send-email-kernel@kempniu.pl>
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

As dell-laptop has been changed to always retrieve a pointer to the
SMBIOS buffer using dell_smbios_get_buffer(), the SMBIOS buffer can be
marked static.

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
 drivers/platform/x86/dell-smbios.c |    3 +--
 drivers/platform/x86/dell-smbios.h |    1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/=
dell-smbios.c
index 535d382..b383d0d 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -30,8 +30,7 @@ struct calling_interface_structure {
 	struct calling_interface_token tokens[];
 } __packed;
=20
-struct calling_interface_buffer *buffer;
-EXPORT_SYMBOL_GPL(buffer);
+static struct calling_interface_buffer *buffer;
 static DEFINE_MUTEX(buffer_mutex);
=20
 static int da_command_address;
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/=
dell-smbios.h
index f7a51f5..af653ff 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -35,7 +35,6 @@ struct calling_interface_token {
 	};
 };
=20
-extern struct calling_interface_buffer *buffer;
 extern struct calling_interface_token *da_tokens;
=20
 struct calling_interface_buffer *dell_smbios_get_buffer(void);
--=20
1.7.10.4

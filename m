From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 1/6] dell-led: remove GUID check from dell_micmute_led_set()
Date: Mon, 16 Jan 2017 14:21:59 +0100
Message-ID: <20170116132204.6421-2-kernel@kempniu.pl>
References: <20170116132204.6421-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170116132204.6421-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Anthony Wong <anthony.wong@canonical.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

As dell_micmute_led_set() no longer uses the dell_wmi_perform_query()
method, which was removed in commit 0c41a08e131d ("dell-led: use
dell_smbios_send_request() for performing SMBIOS calls"), the
DELL_APP_GUID check is redundant and thus can be safely removed.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
Reviewed-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/leds/dell-led.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/leds/dell-led.c b/drivers/leds/dell-led.c
index b3d6e9c15cf9..e8e8f67224c1 100644
--- a/drivers/leds/dell-led.c
+++ b/drivers/leds/dell-led.c
@@ -51,9 +51,6 @@ static int dell_micmute_led_set(int state)
 	struct calling_interface_buffer *buffer;
 	struct calling_interface_token *token;
 
-	if (!wmi_has_guid(DELL_APP_GUID))
-		return -ENODEV;
-
 	if (state == 0)
 		token = dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE);
 	else if (state == 1)
-- 
2.11.0

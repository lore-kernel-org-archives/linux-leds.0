From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH 20/20] leds: mark wrap driver with LED_BRIGHTNESS_FAST flag
Date: Thu, 21 May 2015 18:24:17 +0300
Message-ID: <555DF8A1.9060308@list.ru>
References: <555CA58A.10700@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp46.i.mail.ru ([94.100.177.106]:45521 "EHLO smtp46.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755474AbbEUPYV (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 21 May 2015 11:24:21 -0400
In-Reply-To: <555CA58A.10700@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Kristian Kielhofner <kris@krisk.org>


This driver doesn't use sleeping operations in .brightness_set
method, and can be marked with LED_BRIGHTNESS_FAST flag.
That flag allows changing brightness at high rates (over 100Hz).

CC: Bryan Wu <cooloney@gmail.com>
CC: Richard Purdie <rpurdie@rpsys.net>
CC: Jacek Anaszewski <j.anaszewski@samsung.com>
CC: linux-leds@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Kristian Kielhofner <kris@krisk.org>

Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/leds-wrap.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-wrap.c b/drivers/leds/leds-wrap.c
index 1ba3def..dfc9e73 100644
--- a/drivers/leds/leds-wrap.c
+++ b/drivers/leds/leds-wrap.c
@@ -57,19 +57,19 @@ static struct led_classdev wrap_power_led = {
 	.name			= "wrap::power",
 	.brightness_set		= wrap_power_led_set,
 	.default_trigger	= "default-on",
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.flags			= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_FAST,
 };

 static struct led_classdev wrap_error_led = {
 	.name		= "wrap::error",
 	.brightness_set	= wrap_error_led_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.flags			= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_FAST,
 };

 static struct led_classdev wrap_extra_led = {
 	.name           = "wrap::extra",
 	.brightness_set = wrap_extra_led_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.flags			= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_FAST,
 };

 static int wrap_led_probe(struct platform_device *pdev)
-- 
1.7.9.5

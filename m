From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH 13/20] leds: mark netxbig driver with LED_BRIGHTNESS_FAST
 flag
Date: Thu, 21 May 2015 18:19:25 +0300
Message-ID: <555DF77D.6040807@list.ru>
References: <555CA58A.10700@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp40.i.mail.ru ([94.100.177.100]:39814 "EHLO smtp40.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751569AbbEUPTb (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 21 May 2015 11:19:31 -0400
In-Reply-To: <555CA58A.10700@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Simon Guinot <sguinot@lacie.com>


This driver doesn't use sleeping operations in .brightness_set
method, and can be marked with LED_BRIGHTNESS_FAST flag.
That flag allows changing brightness at high rates (over 100Hz).

CC: Bryan Wu <cooloney@gmail.com>
CC: Richard Purdie <rpurdie@rpsys.net>
CC: Jacek Anaszewski <j.anaszewski@samsung.com>
CC: linux-leds@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Simon Guinot <sguinot@lacie.com>

Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/leds-netxbig.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
index 25e4197..e99b233 100644
--- a/drivers/leds/leds-netxbig.c
+++ b/drivers/leds/leds-netxbig.c
@@ -329,7 +329,7 @@ create_netxbig_led(struct platform_device *pdev,
 	 */
 	led_dat->sata = 0;
 	led_dat->cdev.brightness = LED_OFF;
-	led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME;
+	led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_FAST;
 	led_dat->mode_addr = template->mode_addr;
 	led_dat->mode_val = template->mode_val;
 	led_dat->bright_addr = template->bright_addr;
-- 
1.7.9.5

From: Antonio Ospite <ao2@ao2.it>
Subject: [PATCH] leds: lp3944: improve wording and formatting in a comment
Date: Wed, 27 Jan 2016 15:31:38 +0100
Message-ID: <1453905098-7020-1-git-send-email-ao2@ao2.it>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp206.alice.it ([82.57.200.102]:3069 "EHLO smtp206.alice.it"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932494AbcA0OiF (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 27 Jan 2016 09:38:05 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Antonio Ospite <ao2@ao2.it>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>

Improve the wording for the comment about the led status, and while at
it also use the standard formatting for multi-line comments.

Signed-off-by: Antonio Ospite <ao2@ao2.it>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/leds-lp3944.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-lp3944.c b/drivers/leds/leds-lp3944.c
index 6c758ae..793838e 100644
--- a/drivers/leds/leds-lp3944.c
+++ b/drivers/leds/leds-lp3944.c
@@ -199,8 +199,10 @@ static int lp3944_led_set(struct lp3944_led_data *led, u8 status)
 	if (status > LP3944_LED_STATUS_DIM1)
 		return -EINVAL;
 
-	/* invert only 0 and 1, leave unchanged the other values,
-	 * remember we are abusing status to set blink patterns
+	/*
+	 * Invert status only if it is < 2 (i.e. 0 or 1), leave it unchanged
+	 * otherwise because we are abusing the status to set blink patterns
+	 * too.
 	 */
 	if (led->type == LP3944_LED_TYPE_LED_INVERTED && status < 2)
 		status = 1 - status;
-- 
2.7.0

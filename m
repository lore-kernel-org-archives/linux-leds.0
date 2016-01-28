From: Antonio Ospite <ao2@ao2.it>
Subject: [PATCHv2] leds: lp3944: improve wording and formatting in a comment
Date: Thu, 28 Jan 2016 16:49:29 +0100
Message-ID: <1453996169-18124-1-git-send-email-ao2@ao2.it>
References: <56A9C4D6.5000505@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp205.alice.it ([82.57.200.101]:46621 "EHLO smtp205.alice.it"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S935239AbcA1Ptg (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 28 Jan 2016 10:49:36 -0500
In-Reply-To: <56A9C4D6.5000505@samsung.com>
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

Changes since v1:
  - make the comment more explicit as suggested by Jacek

 drivers/leds/leds-lp3944.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-lp3944.c b/drivers/leds/leds-lp3944.c
index 6c758ae..be60c18 100644
--- a/drivers/leds/leds-lp3944.c
+++ b/drivers/leds/leds-lp3944.c
@@ -199,8 +199,11 @@ static int lp3944_led_set(struct lp3944_led_data *led, u8 status)
 	if (status > LP3944_LED_STATUS_DIM1)
 		return -EINVAL;
 
-	/* invert only 0 and 1, leave unchanged the other values,
-	 * remember we are abusing status to set blink patterns
+	/*
+	 * Invert status only when it's < 2 (i.e. 0 or 1) which means it's
+	 * controlling the on/off state directly.
+	 * When, instead, status is >= 2 don't invert it because it would mean
+	 * to mess with the hardware blinking mode.
 	 */
 	if (led->type == LP3944_LED_TYPE_LED_INVERTED && status < 2)
 		status = 1 - status;
-- 
2.7.0

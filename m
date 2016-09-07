From: vadimp@mellanox.com
Subject: [patch 2/2] leds: add driver for Mellanox systems leds
Date: Wed,  7 Sep 2016 14:53:15 +0000
Message-ID: <1473259995-196607-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:46933 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S933658AbcIGMy3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 7 Sep 2016 08:54:29 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, j.anaszewski@samsung.com
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, jiri@resnulli.us, michaelsh@mellanox.com, Vadim Pasternak <vadimp@mellanox.com>

From: Vadim Pasternak <vadimp@mellanox.com>

Fix in comments 3KHz and 6KHz to 3Hz and 6Hz respectively.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/leds/leds-mlxcpld.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-mlxcpld.c b/drivers/leds/leds-mlxcpld.c
index 0ec2375..eeed35c 100644
--- a/drivers/leds/leds-mlxcpld.c
+++ b/drivers/leds/leds-mlxcpld.c
@@ -47,8 +47,8 @@
 #define MLXPLAT_CPLD_LPC_REG_BASE_ADRR     0x2500 /* LPC bus access */
 
 /* Color codes for leds */
-#define LED_OFFSET_HALF		0x01 /* Offset from solid for 3KHz blink */
-#define LED_OFFSET_FULL		0x02 /* Offset from solid for 6KHz blink */
+#define LED_OFFSET_HALF		0x01 /* Offset from solid for 3Hz blink */
+#define LED_OFFSET_FULL		0x02 /* Offset from solid for 6Hz blink */
 #define LED_IS_OFF		0x00 /* Off */
 #define LED_RED_STATIC_ON	0x05 /* Solid red */
 #define LED_RED_BLINK_HALF	(LED_RED_STATIC_ON + LED_OFFSET_HALF)
@@ -237,7 +237,7 @@ static void mlxcpld_led_store_hw(u8 mask, u8 off, u8 vset)
 	/* Each led is controlled through low or high nibble of the relevant
 	 * CPLD register. Register offset is specified by off parameter.
 	 * Parameter vset provides color code: 0x0 for off, 0x5 for solid red,
-	 * 0x6 for 3KHz blink red, 0xd for solid green, 0xe for 3KHz blink
+	 * 0x6 for 3Hz blink red, 0xd for solid green, 0xe for 3Hz blink
 	 * green.
 	 * Parameter mask specifies which nibble is used for specific led: mask
 	 * 0xf0 - lower nibble is to be used (bits from 0 to 3), mask 0x0f -
@@ -274,8 +274,8 @@ static int mlxcpld_led_blink(struct led_classdev *led,
 {
 	struct mlxcpld_led_priv *pled = cdev_to_priv(led);
 
-	/* HW supports two types of blinking: full (6KHz) and half (3KHz).
-	 * For delay on/off zero default setting 3KHz is used.
+	/* HW supports two types of blinking: full (6Hz) and half (3Hz).
+	 * For delay on/off zero default setting 3Hz is used.
 	 */
 	if (!(*delay_on == 0 && *delay_off == 0) &&
 	    !(*delay_on == LED_BLINK_3HZ && *delay_off == LED_BLINK_3HZ) &&
-- 
2.1.4

From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH 1/3] leds: leds-mc13783: Remove duplicate field in platform data
Date: Sat,  7 Dec 2013 10:22:18 +0400
Message-ID: <1386397339-30972-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from fallback6.mail.ru ([94.100.176.134]:38343 "EHLO
	fallback6.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750833Ab3LGGah (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 7 Dec 2013 01:30:37 -0500
Received: from smtp38.i.mail.ru (smtp38.i.mail.ru [94.100.177.98])
	by fallback6.mail.ru (mPOP.Fallback_MX) with ESMTP id 710DF27DD797
	for <linux-leds@vger.kernel.org>; Sat,  7 Dec 2013 10:22:53 +0400 (MSK)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, =?UTF-8?q?Philippe=20R=C3=A9tornaz?= <philippe.retornaz@epfl.ch>, Sascha Hauer <kernel@pengutronix.de>, Alexander Shiyan <shc_work@mail.ru>

LED platform data are overwhelmed by excessive field "max_cur"
which just replicates few bits of "led_control" field.
This patch removes this field and adds a definition for the
current settings in the header.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 arch/arm/mach-imx/mach-mx31moboard.c | 16 ++++----
 drivers/leds/leds-mc13783.c          | 76 ------------------------------------
 include/linux/mfd/mc13xxx.h          | 37 +++++++++++++-----
 3 files changed, 36 insertions(+), 93 deletions(-)

diff --git a/arch/arm/mach-imx/mach-mx31moboard.c b/arch/arm/mach-imx/mach-mx31moboard.c
index 6f424ec..b3738e6 100644
--- a/arch/arm/mach-imx/mach-mx31moboard.c
+++ b/arch/arm/mach-imx/mach-mx31moboard.c
@@ -236,32 +236,26 @@ static struct mc13xxx_led_platform_data moboard_led[] = {
 	{
 		.id = MC13783_LED_R1,
 		.name = "coreboard-led-4:red",
-		.max_current = 2,
 	},
 	{
 		.id = MC13783_LED_G1,
 		.name = "coreboard-led-4:green",
-		.max_current = 2,
 	},
 	{
 		.id = MC13783_LED_B1,
 		.name = "coreboard-led-4:blue",
-		.max_current = 2,
 	},
 	{
 		.id = MC13783_LED_R2,
 		.name = "coreboard-led-5:red",
-		.max_current = 3,
 	},
 	{
 		.id = MC13783_LED_G2,
 		.name = "coreboard-led-5:green",
-		.max_current = 3,
 	},
 	{
 		.id = MC13783_LED_B2,
 		.name = "coreboard-led-5:blue",
-		.max_current = 3,
 	},
 };
 
@@ -271,8 +265,14 @@ static struct mc13xxx_leds_platform_data moboard_leds = {
 	.led_control[0]	= MC13783_LED_C0_ENABLE | MC13783_LED_C0_ABMODE(0),
 	.led_control[1]	= MC13783_LED_C1_SLEWLIM,
 	.led_control[2]	= MC13783_LED_C2_SLEWLIM,
-	.led_control[3]	= MC13783_LED_C3_PERIOD(0),
-	.led_control[4]	= MC13783_LED_C3_PERIOD(0),
+	.led_control[3]	= MC13783_LED_C3_PERIOD(0) |
+			  MC13783_LED_C3_CURRENT_R1(2) |
+			  MC13783_LED_C3_CURRENT_G1(2) |
+			  MC13783_LED_C3_CURRENT_B1(2),
+	.led_control[4]	= MC13783_LED_C4_PERIOD(0) |
+			  MC13783_LED_C4_CURRENT_R2(3) |
+			  MC13783_LED_C4_CURRENT_G2(3) |
+			  MC13783_LED_C4_CURRENT_B2(3),
 };
 
 static struct mc13xxx_buttons_platform_data moboard_buttons = {
diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
index fa9b439..ec704f2 100644
--- a/drivers/leds/leds-mc13783.c
+++ b/drivers/leds/leds-mc13783.c
@@ -132,75 +132,6 @@ static void mc13xxx_led_set(struct led_classdev *led_cdev,
 	schedule_work(&led->work);
 }
 
-static int __init mc13xxx_led_setup(struct mc13xxx_led *led, int max_current)
-{
-	int shift, mask, reg, ret, bank;
-
-	switch (led->id) {
-	case MC13783_LED_MD:
-		reg = MC13XXX_REG_LED_CONTROL(2);
-		shift = 0;
-		mask = 0x07;
-		break;
-	case MC13783_LED_AD:
-		reg = MC13XXX_REG_LED_CONTROL(2);
-		shift = 3;
-		mask = 0x07;
-		break;
-	case MC13783_LED_KP:
-		reg = MC13XXX_REG_LED_CONTROL(2);
-		shift = 6;
-		mask = 0x07;
-		break;
-	case MC13783_LED_R1:
-	case MC13783_LED_G1:
-	case MC13783_LED_B1:
-	case MC13783_LED_R2:
-	case MC13783_LED_G2:
-	case MC13783_LED_B2:
-	case MC13783_LED_R3:
-	case MC13783_LED_G3:
-	case MC13783_LED_B3:
-		bank = (led->id - MC13783_LED_R1) / 3;
-		reg = MC13XXX_REG_LED_CONTROL(3) + bank;
-		shift = ((led->id - MC13783_LED_R1) - bank * 3) * 2;
-		mask = 0x03;
-		break;
-	case MC13892_LED_MD:
-		reg = MC13XXX_REG_LED_CONTROL(0);
-		shift = 9;
-		mask = 0x07;
-		break;
-	case MC13892_LED_AD:
-		reg = MC13XXX_REG_LED_CONTROL(0);
-		shift = 21;
-		mask = 0x07;
-		break;
-	case MC13892_LED_KP:
-		reg = MC13XXX_REG_LED_CONTROL(1);
-		shift = 9;
-		mask = 0x07;
-		break;
-	case MC13892_LED_R:
-	case MC13892_LED_G:
-	case MC13892_LED_B:
-		bank = (led->id - MC13892_LED_R) / 2;
-		reg = MC13XXX_REG_LED_CONTROL(2) + bank;
-		shift = ((led->id - MC13892_LED_R) - bank * 2) * 12 + 9;
-		mask = 0x07;
-		break;
-	default:
-		BUG();
-	}
-
-	mc13xxx_lock(led->master);
-	ret = mc13xxx_reg_rmw(led->master, reg, mask << shift,
-			      max_current << shift);
-	mc13xxx_unlock(led->master);
-
-	return ret;
-}
-
 static int __init mc13xxx_led_probe(struct platform_device *pdev)
 {
 	struct mc13xxx_leds_platform_data *pdata = dev_get_platdata(&pdev->dev);
@@ -250,14 +181,12 @@ static int __init mc13xxx_led_probe(struct platform_device *pdev)
 
 	for (i = 0; i < num_leds; i++) {
 		const char *name, *trig;
-		char max_current;
 
 		ret = -EINVAL;
 
 		id = pdata->led[i].id;
 		name = pdata->led[i].name;
 		trig = pdata->led[i].default_trigger;
-		max_current = pdata->led[i].max_current;
 
 		if ((id > devtype->led_max) || (id < devtype->led_min)) {
 			dev_err(&pdev->dev, "Invalid ID %i\n", id);
@@ -280,11 +209,6 @@ static int __init mc13xxx_led_probe(struct platform_device *pdev)
 
 		INIT_WORK(&leds->led[i].work, mc13xxx_led_work);
 
-		ret = mc13xxx_led_setup(&leds->led[i], max_current);
-		if (ret) {
-			dev_err(&pdev->dev, "Unable to setup LED %i\n", id);
-			break;
-		}
 		ret = led_classdev_register(pdev->dev.parent,
 					    &leds->led[i].cdev);
 		if (ret) {
diff --git a/include/linux/mfd/mc13xxx.h b/include/linux/mfd/mc13xxx.h
index 67c17b5..ac22305 100644
--- a/include/linux/mfd/mc13xxx.h
+++ b/include/linux/mfd/mc13xxx.h
@@ -112,9 +112,6 @@ struct mc13xxx_led_platform_data {
 	int id;
 	const char *name;
 	const char *default_trigger;
-
-/* Three or two bits current selection depending on the led */
-	char max_current;
 };
 
 #define MAX_LED_CONTROL_REGS	6
@@ -123,7 +120,7 @@ struct mc13xxx_leds_platform_data {
 	struct mc13xxx_led_platform_data *led;
 	int num_leds;
 
-/* LED Control 0 */
+/* MC13783 LED Control 0 */
 #define MC13783_LED_C0_ENABLE		(1 << 0)
 #define MC13783_LED_C0_TRIODE_MD	(1 << 7)
 #define MC13783_LED_C0_TRIODE_AD	(1 << 8)
@@ -131,21 +128,43 @@ struct mc13xxx_leds_platform_data {
 #define MC13783_LED_C0_BOOST		(1 << 10)
 #define MC13783_LED_C0_ABMODE(x)	(((x) & 0x7) << 11)
 #define MC13783_LED_C0_ABREF(x)		(((x) & 0x3) << 14)
-/* LED Control 1 */
+/* MC13783 LED Control 1 */
 #define MC13783_LED_C1_TC1HALF		(1 << 18)
 #define MC13783_LED_C1_SLEWLIM		(1 << 23)
-/* LED Control 2 */
+/* MC13783 LED Control 2 */
+#define MC13783_LED_C2_CURRENT_MD(x)	(((x) & 0x7) << 0)
+#define MC13783_LED_C2_CURRENT_AD(x)	(((x) & 0x7) << 3)
+#define MC13783_LED_C2_CURRENT_KP(x)	(((x) & 0x7) << 6)
 #define MC13783_LED_C2_PERIOD(x)	(((x) & 0x3) << 21)
 #define MC13783_LED_C2_SLEWLIM		(1 << 23)
-/* LED Control 3 */
+/* MC13783 LED Control 3 */
+#define MC13783_LED_C3_CURRENT_R1(x)	(((x) & 0x3) << 0)
+#define MC13783_LED_C3_CURRENT_G1(x)	(((x) & 0x3) << 2)
+#define MC13783_LED_C3_CURRENT_B1(x)	(((x) & 0x3) << 4)
 #define MC13783_LED_C3_PERIOD(x)	(((x) & 0x3) << 21)
 #define MC13783_LED_C3_TRIODE_TC1	(1 << 23)
-/* LED Control 4 */
+/* MC13783 LED Control 4 */
+#define MC13783_LED_C4_CURRENT_R2(x)	(((x) & 0x3) << 0)
+#define MC13783_LED_C4_CURRENT_G2(x)	(((x) & 0x3) << 2)
+#define MC13783_LED_C4_CURRENT_B2(x)	(((x) & 0x3) << 4)
 #define MC13783_LED_C4_PERIOD(x)	(((x) & 0x3) << 21)
 #define MC13783_LED_C4_TRIODE_TC2	(1 << 23)
-/* LED Control 5 */
+/* MC13783 LED Control 5 */
+#define MC13783_LED_C5_CURRENT_R3(x)	(((x) & 0x3) << 0)
+#define MC13783_LED_C5_CURRENT_G3(x)	(((x) & 0x3) << 2)
+#define MC13783_LED_C5_CURRENT_B3(x)	(((x) & 0x3) << 4)
 #define MC13783_LED_C5_PERIOD(x)	(((x) & 0x3) << 21)
 #define MC13783_LED_C5_TRIODE_TC3	(1 << 23)
+/* MC13892 LED Control 0 */
+#define MC13892_LED_C0_CURRENT_MD(x)	(((x) & 0x7) << 9)
+#define MC13892_LED_C0_CURRENT_AD(x)	(((x) & 0x7) << 21)
+/* MC13892 LED Control 1 */
+#define MC13892_LED_C1_CURRENT_KP(x)	(((x) & 0x7) << 9)
+/* MC13892 LED Control 2 */
+#define MC13892_LED_C2_CURRENT_R(x)	(((x) & 0x7) << 9)
+#define MC13892_LED_C2_CURRENT_G(x)	(((x) & 0x7) << 21)
+/* MC13892 LED Control 3 */
+#define MC13892_LED_C3_CURRENT_B(x)	(((x) & 0x7) << 9)
 	u32 led_control[MAX_LED_CONTROL_REGS];
 };
 
-- 
1.8.3.2

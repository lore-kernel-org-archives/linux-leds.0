From: Colin King <colin.king@canonical.com>
Subject: [PATCH 3/4] leds: lp5562: make several arrays static const
Date: Thu, 24 Aug 2017 14:00:54 +0100
Message-ID: <20170824130055.23642-3-colin.king@canonical.com>
References: <20170824130055.23642-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170824130055.23642-1-colin.king@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the arrays on the stack, instead make them static const.
Makes the object code smaller by over 150 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
   7725	   2448	     64	  10237	   27fd	drivers/leds/leds-lp5562.o

After:
   text	   data	    bss	    dec	    hex	filename
   7184	   2832	     64	  10080	   2760	drivers/leds/leds-lp5562.o

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/leds/leds-lp5562.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
index 90892585bcb5..05ffa34fb6ad 100644
--- a/drivers/leds/leds-lp5562.c
+++ b/drivers/leds/leds-lp5562.c
@@ -116,7 +116,7 @@ static inline void lp5562_wait_enable_done(void)
 
 static void lp5562_set_led_current(struct lp55xx_led *led, u8 led_current)
 {
-	u8 addr[] = {
+	static const u8 addr[] = {
 		LP5562_REG_R_CURRENT,
 		LP5562_REG_G_CURRENT,
 		LP5562_REG_B_CURRENT,
@@ -130,13 +130,13 @@ static void lp5562_set_led_current(struct lp55xx_led *led, u8 led_current)
 static void lp5562_load_engine(struct lp55xx_chip *chip)
 {
 	enum lp55xx_engine_index idx = chip->engine_idx;
-	u8 mask[] = {
+	static const u8 mask[] = {
 		[LP55XX_ENGINE_1] = LP5562_MODE_ENG1_M,
 		[LP55XX_ENGINE_2] = LP5562_MODE_ENG2_M,
 		[LP55XX_ENGINE_3] = LP5562_MODE_ENG3_M,
 	};
 
-	u8 val[] = {
+	static const u8 val[] = {
 		[LP55XX_ENGINE_1] = LP5562_LOAD_ENG1,
 		[LP55XX_ENGINE_2] = LP5562_LOAD_ENG2,
 		[LP55XX_ENGINE_3] = LP5562_LOAD_ENG3,
@@ -211,7 +211,7 @@ static int lp5562_update_firmware(struct lp55xx_chip *chip,
 {
 	enum lp55xx_engine_index idx = chip->engine_idx;
 	u8 pattern[LP5562_PROGRAM_LENGTH] = {0};
-	u8 addr[] = {
+	static const u8 addr[] = {
 		[LP55XX_ENGINE_1] = LP5562_REG_PROG_MEM_ENG1,
 		[LP55XX_ENGINE_2] = LP5562_REG_PROG_MEM_ENG2,
 		[LP55XX_ENGINE_3] = LP5562_REG_PROG_MEM_ENG3,
@@ -314,7 +314,7 @@ static int lp5562_post_init_device(struct lp55xx_chip *chip)
 static int lp5562_led_brightness(struct lp55xx_led *led)
 {
 	struct lp55xx_chip *chip = led->chip;
-	u8 addr[] = {
+	static const u8 addr[] = {
 		LP5562_REG_R_PWM,
 		LP5562_REG_G_PWM,
 		LP5562_REG_B_PWM,
-- 
2.14.1

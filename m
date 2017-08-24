From: Colin King <colin.king@canonical.com>
Subject: [PATCH 2/4] leds: lp5521: make several arrays static const
Date: Thu, 24 Aug 2017 14:00:53 +0100
Message-ID: <20170824130055.23642-2-colin.king@canonical.com>
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
Makes the object code smaller by over 120 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
   8999	   4176	     64	  13239	   33b7	drivers/leds/leds-lp5521.o

After:
   text	   data	    bss	    dec	    hex	filename
   8554	   4496	     64	  13114	   333a	drivers/leds/leds-lp5521.o

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/leds/leds-lp5521.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index f53c8cda1bde..55c0517fbe03 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -134,13 +134,13 @@ static void lp5521_set_led_current(struct lp55xx_led *led, u8 led_current)
 static void lp5521_load_engine(struct lp55xx_chip *chip)
 {
 	enum lp55xx_engine_index idx = chip->engine_idx;
-	u8 mask[] = {
+	static const u8 mask[] = {
 		[LP55XX_ENGINE_1] = LP5521_MODE_R_M,
 		[LP55XX_ENGINE_2] = LP5521_MODE_G_M,
 		[LP55XX_ENGINE_3] = LP5521_MODE_B_M,
 	};
 
-	u8 val[] = {
+	static const u8 val[] = {
 		[LP55XX_ENGINE_1] = LP5521_LOAD_R,
 		[LP55XX_ENGINE_2] = LP5521_LOAD_G,
 		[LP55XX_ENGINE_3] = LP5521_LOAD_B,
@@ -160,7 +160,7 @@ static void lp5521_stop_all_engines(struct lp55xx_chip *chip)
 static void lp5521_stop_engine(struct lp55xx_chip *chip)
 {
 	enum lp55xx_engine_index idx = chip->engine_idx;
-	u8 mask[] = {
+	static const u8 mask[] = {
 		[LP55XX_ENGINE_1] = LP5521_MODE_R_M,
 		[LP55XX_ENGINE_2] = LP5521_MODE_G_M,
 		[LP55XX_ENGINE_3] = LP5521_MODE_B_M,
@@ -226,7 +226,7 @@ static int lp5521_update_program_memory(struct lp55xx_chip *chip,
 {
 	enum lp55xx_engine_index idx = chip->engine_idx;
 	u8 pattern[LP5521_PROGRAM_LENGTH] = {0};
-	u8 addr[] = {
+	static const u8 addr[] = {
 		[LP55XX_ENGINE_1] = LP5521_REG_R_PROG_MEM,
 		[LP55XX_ENGINE_2] = LP5521_REG_G_PROG_MEM,
 		[LP55XX_ENGINE_3] = LP5521_REG_B_PROG_MEM,
-- 
2.14.1

From: Colin King <colin.king@canonical.com>
Subject: [PATCH 4/4] leds: lp8501: make several arrays static const
Date: Thu, 24 Aug 2017 14:00:55 +0100
Message-ID: <20170824130055.23642-4-colin.king@canonical.com>
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
Makes the object code smaller by 50 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
   5058	   1552	     64	   6674	   1a12	drivers/leds/leds-lp8501.o

After:
   text	   data	    bss	    dec	    hex	filename
   4788	   1776	     64	   6628	   19e4	drivers/leds/leds-lp8501.o

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/leds/leds-lp8501.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index 3f9675bd214a..3adb113cf02e 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -118,19 +118,19 @@ static int lp8501_post_init_device(struct lp55xx_chip *chip)
 static void lp8501_load_engine(struct lp55xx_chip *chip)
 {
 	enum lp55xx_engine_index idx = chip->engine_idx;
-	u8 mask[] = {
+	static const u8 mask[] = {
 		[LP55XX_ENGINE_1] = LP8501_MODE_ENG1_M,
 		[LP55XX_ENGINE_2] = LP8501_MODE_ENG2_M,
 		[LP55XX_ENGINE_3] = LP8501_MODE_ENG3_M,
 	};
 
-	u8 val[] = {
+	static const u8 val[] = {
 		[LP55XX_ENGINE_1] = LP8501_LOAD_ENG1,
 		[LP55XX_ENGINE_2] = LP8501_LOAD_ENG2,
 		[LP55XX_ENGINE_3] = LP8501_LOAD_ENG3,
 	};
 
-	u8 page_sel[] = {
+	static const u8 page_sel[] = {
 		[LP55XX_ENGINE_1] = LP8501_PAGE_ENG1,
 		[LP55XX_ENGINE_2] = LP8501_PAGE_ENG2,
 		[LP55XX_ENGINE_3] = LP8501_PAGE_ENG3,
-- 
2.14.1

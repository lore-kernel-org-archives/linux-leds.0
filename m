From: Colin King <colin.king@canonical.com>
Subject: [PATCH][leds-next] leds: pca955x: remove redundant null check on array name
Date: Wed, 16 Aug 2017 13:01:05 +0100
Message-ID: <20170816120105.1963-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check to see if pdata-leds[i].name is redundant as name is
a 32 byte char array and hence can never be null.  Remove the
redundant check.

Detected by CoverityScan, CID#1454218 ("Array compared against 0")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/leds/leds-pca955x.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index f062d1e7640f..b12b7ea51867 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -473,10 +473,9 @@ static int pca955x_probe(struct i2c_client *client,
 			 * Platform data can specify LED names and
 			 * default triggers
 			 */
-			if (pdata->leds[i].name)
-				snprintf(pca955x_led->name,
-					sizeof(pca955x_led->name), "pca955x:%s",
-					pdata->leds[i].name);
+			snprintf(pca955x_led->name,
+				sizeof(pca955x_led->name), "pca955x:%s",
+				pdata->leds[i].name);
 			if (pdata->leds[i].default_trigger)
 				pca955x_led->led_cdev.default_trigger =
 					pdata->leds[i].default_trigger;
-- 
2.11.0

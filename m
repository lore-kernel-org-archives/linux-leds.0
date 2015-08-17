From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH] leds: syscon: Correct check for syscon_node_to_regmap() errors
Date: Mon, 17 Aug 2015 09:18:54 -0700
Message-ID: <1439828334-6619-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

syscon_node_to_regmap() returns a regmap or an ERR_PTR().

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---
 drivers/leds/leds-syscon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-syscon.c b/drivers/leds/leds-syscon.c
index d1660b039812..39fca4c9f1ee 100644
--- a/drivers/leds/leds-syscon.c
+++ b/drivers/leds/leds-syscon.c
@@ -83,7 +83,7 @@ static int syscon_led_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 	map = syscon_node_to_regmap(parent->of_node);
-	if (!map) {
+	if (IS_ERR(map)) {
 		dev_err(dev, "no regmap for syscon LED parent\n");
 		return -ENODEV;
 	}
-- 
1.8.2.2

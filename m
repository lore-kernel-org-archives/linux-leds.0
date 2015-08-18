From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH v2] leds: syscon: Correct check for syscon_node_to_regmap() errors
Date: Tue, 18 Aug 2015 12:25:26 -0700
Message-ID: <1439925926-3174-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from seldrel01.sonyericsson.com ([37.139.156.2]:9579 "EHLO
	seldrel01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751616AbbHRTZl (ORCPT
	<rfc822;linux-leds@vger.kernel.org>);
	Tue, 18 Aug 2015 15:25:41 -0400
In-Reply-To: 55D30A6B.5060304@samsung.com
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

syscon_node_to_regmap() returns a regmap or an ERR_PTR().

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---

Changes since v1:
- Propagate the error

 drivers/leds/leds-syscon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-syscon.c b/drivers/leds/leds-syscon.c
index d1660b039812..b88900d721e4 100644
--- a/drivers/leds/leds-syscon.c
+++ b/drivers/leds/leds-syscon.c
@@ -83,9 +83,9 @@ static int syscon_led_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 	map = syscon_node_to_regmap(parent->of_node);
-	if (!map) {
+	if (IS_ERR(map)) {
 		dev_err(dev, "no regmap for syscon LED parent\n");
-		return -ENODEV;
+		return PTR_ERR(map);
 	}
 
 	sled = devm_kzalloc(dev, sizeof(*sled), GFP_KERNEL);
-- 
1.8.2.2

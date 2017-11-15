From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 2/2] leds: lp8860: Add regulator enable during init
Date: Wed, 15 Nov 2017 13:52:13 -0600
Message-ID: <20171115195213.8404-2-dmurphy@ti.com>
References: <20171115195213.8404-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from fllnx210.ext.ti.com ([198.47.19.17]:58574 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755666AbdKOTwq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Nov 2017 14:52:46 -0500
In-Reply-To: <20171115195213.8404-1-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>

Add the regulator enable call during initialization.
If init fails then disable the regulator.

Also during init the gpio gets set low even
on a passing case so add if everything passes
then return.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lp8860.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 91b6c5fbd361..f91a4fe25168 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -247,6 +247,15 @@ static int lp8860_init(struct lp8860_led *led)
 	unsigned int read_buf;
 	int ret, i, reg_count;
 
+	if (led->regulator) {
+		ret = regulator_enable(led->regulator);
+		if (ret) {
+			dev_err(&led->client->dev,
+				"Failed to enable regulator\n");
+			return ret;
+		}
+	}
+
 	if (led->enable_gpio)
 		gpiod_direction_output(led->enable_gpio, 1);
 
@@ -282,12 +291,25 @@ static int lp8860_init(struct lp8860_led *led)
 	ret = regmap_write(led->regmap,
 			LP8860_EEPROM_CNTRL,
 			LP8860_PROGRAM_EEPROM);
-	if (ret)
+	if (ret) {
 		dev_err(&led->client->dev, "Failed programming EEPROM\n");
+		goto out;
+	}
+
+	return ret;
+
 out:
 	if (ret)
 		if (led->enable_gpio)
 			gpiod_direction_output(led->enable_gpio, 0);
+
+	if (led->regulator) {
+		ret = regulator_disable(led->regulator);
+		if (ret)
+			dev_err(&led->client->dev,
+				"Failed to disable regulator\n");
+	}
+
 	return ret;
 }
 
-- 
2.15.0.124.g7668cbc60

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/2] leds: lp3952: Use 'if (ret)' pattern
Date: Wed, 22 Mar 2017 17:00:21 +0200
Message-ID: <20170322150021.62311-2-andriy.shevchenko@linux.intel.com>
References: <20170322150021.62311-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:29875 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1759416AbdCVPA0 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 22 Mar 2017 11:00:26 -0400
In-Reply-To: <20170322150021.62311-1-andriy.shevchenko@linux.intel.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Instead of unusual "if (!ret)" use "if (ret)" in lp3952_get_label().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-lp3952.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-lp3952.c b/drivers/leds/leds-lp3952.c
index 5184436b8905..847f7f282126 100644
--- a/drivers/leds/leds-lp3952.c
+++ b/drivers/leds/leds-lp3952.c
@@ -102,10 +102,11 @@ static int lp3952_get_label(struct device *dev, const char *label, char *dest)
 	const char *str;
 
 	ret = device_property_read_string(dev, label, &str);
-	if (!ret)
-		strncpy(dest, str, LP3952_LABEL_MAX_LEN);
+	if (ret)
+		return ret;
 
-	return ret;
+	strncpy(dest, str, LP3952_LABEL_MAX_LEN);
+	return 0;
 }
 
 static int lp3952_register_led_classdev(struct lp3952_led_array *priv)
-- 
2.11.0

From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] leds: max77650: Remove set but not used variable 'parent'
Date: Sat, 25 May 2019 22:19:41 +0800
Message-ID: <20190525141941.16088-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bgolaszewski@baylibre.com, jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-leds@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/leds/leds-max77650.c: In function max77650_led_probe:
drivers/leds/leds-max77650.c:67:17: warning: variable parent set but not used [-Wunused-but-set-variable]

It is never used and can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/leds/leds-max77650.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/leds/leds-max77650.c b/drivers/leds/leds-max77650.c
index 6b74ce9cac12..8a8e5c65b157 100644
--- a/drivers/leds/leds-max77650.c
+++ b/drivers/leds/leds-max77650.c
@@ -64,7 +64,6 @@ static int max77650_led_probe(struct platform_device *pdev)
 {
 	struct device_node *of_node, *child;
 	struct max77650_led *leds, *led;
-	struct device *parent;
 	struct device *dev;
 	struct regmap *map;
 	const char *label;
@@ -72,7 +71,6 @@ static int max77650_led_probe(struct platform_device *pdev)
 	u32 reg;
 
 	dev = &pdev->dev;
-	parent = dev->parent;
 	of_node = dev->of_node;
 
 	if (!of_node)
-- 
2.17.1

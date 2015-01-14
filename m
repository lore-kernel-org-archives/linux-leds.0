From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] leds: leds-mc13783: Use of_get_child_by_name() instead of refcount hack
Date: Wed, 14 Jan 2015 14:51:58 +0100
Message-ID: <1421243519-6257-3-git-send-email-geert+renesas@glider.be>
References: <1421243519-6257-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421243519-6257-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jingoo Han <jg1.han@samsung.com>, Lee Jones <lee.jones@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

of_find_node_by_name() calls of_node_put() on its "from" parameter.
To counter this, mc13xxx_led_probe_dt() calls of_node_get() first.

Use of_get_child_by_name() instead to get rid of the refcount hack.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-leds@vger.kernel.org
---
Compile-tested only
---
 drivers/leds/leds-mc13783.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
index 85c3714e1b5aabba..e2b847fe22a1c934 100644
--- a/drivers/leds/leds-mc13783.c
+++ b/drivers/leds/leds-mc13783.c
@@ -134,9 +134,7 @@ static struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
 
-	of_node_get(dev->parent->of_node);
-
-	parent = of_find_node_by_name(dev->parent->of_node, "leds");
+	parent = of_get_child_by_name(dev->parent->of_node, "leds");
 	if (!parent)
 		goto out_node_put;
 
-- 
1.9.1

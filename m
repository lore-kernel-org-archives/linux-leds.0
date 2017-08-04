From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH] leds: blinkm: constify attribute_group structures.
Date: Fri,  4 Aug 2017 11:55:52 +0530
Message-ID: <7f7a15506ee3ccb8d2d54e3f3209f5cd1105f031.1501827866.git.arvind.yadav.cs@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jansimon.moeller@gmx.de, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

attribute_group are not supposed to change at runtime. All functions
working with attribute_group provided by <linux/sysfs.h> work with
const attribute_group. So mark the non-const structs as const.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/leds/leds-blinkm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
index 617fe97..d03ed6b 100644
--- a/drivers/leds/leds-blinkm.c
+++ b/drivers/leds/leds-blinkm.c
@@ -298,7 +298,7 @@ static ssize_t store_test(struct device *dev, struct device_attribute *attr,
 	NULL,
 };
 
-static struct attribute_group blinkm_group = {
+static const struct attribute_group blinkm_group = {
 	.name = "blinkm",
 	.attrs = blinkm_attrs,
 };
-- 
1.9.1

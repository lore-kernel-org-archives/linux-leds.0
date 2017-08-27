From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] leds-PowerNV: Delete an error message for a failed memory
 allocation in powernv_led_create()
Date: Sun, 27 Aug 2017 22:10:08 +0200
Message-ID: <019499e0-68d8-b89d-f5d6-6aefd9cbaf04@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>, Richard Purdie <rpurdie@rpsys.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 27 Aug 2017 22:00:22 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/leds/leds-powernv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
index b2a98c7b521b..b1adbd70ce2e 100644
--- a/drivers/leds/leds-powernv.c
+++ b/drivers/leds/leds-powernv.c
@@ -224,12 +224,8 @@ static int powernv_led_create(struct device *dev,
 	powernv_led->cdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s:%s",
 						powernv_led->loc_code,
 						led_type_desc);
-	if (!powernv_led->cdev.name) {
-		dev_err(dev,
-			"%s: Memory allocation failed for classdev name\n",
-			__func__);
+	if (!powernv_led->cdev.name)
 		return -ENOMEM;
-	}
 
 	powernv_led->cdev.brightness_set_blocking = powernv_brightness_set;
 	powernv_led->cdev.brightness_get = powernv_brightness_get;
-- 
2.14.1

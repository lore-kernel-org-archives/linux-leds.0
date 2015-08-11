From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 31/57] leds: max8997: Remove unneeded workqueue include
Date: Tue, 11 Aug 2015 11:37:44 +0200
Message-ID: <1439285890-27329-32-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Work queues are not used in this driver, so remove the include.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/leds/leds-max8997.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/leds-max8997.c b/drivers/leds/leds-max8997.c
index c592aa5..01b45906 100644
--- a/drivers/leds/leds-max8997.c
+++ b/drivers/leds/leds-max8997.c
@@ -13,7 +13,6 @@
 #include <linux/module.h>
 #include <linux/err.h>
 #include <linux/slab.h>
-#include <linux/workqueue.h>
 #include <linux/leds.h>
 #include <linux/mfd/max8997.h>
 #include <linux/mfd/max8997-private.h>
-- 
1.7.9.5

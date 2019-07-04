From: Joe Perches <joe@perches.com>
Subject: [PATCH 2/8] leds: as3645a: Fix misuse of strlcpy
Date: Thu,  4 Jul 2019 16:57:42 -0700
Message-ID: <79fe35321ff794dccf1d08b415cee40636fa5fce.1562283944.git.joe@perches.com>
References: <cover.1562283944.git.joe@perches.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1562283944.git.joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Probable cut&paste typo - use the correct field size.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/leds/leds-as3645a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
index 14ab6b0e4de9..050088dff8dd 100644
--- a/drivers/leds/leds-as3645a.c
+++ b/drivers/leds/leds-as3645a.c
@@ -668,7 +668,7 @@ static int as3645a_v4l2_setup(struct as3645a *flash)
 	};
 
 	strlcpy(cfg.dev_name, led->name, sizeof(cfg.dev_name));
-	strlcpy(cfgind.dev_name, flash->iled_cdev.name, sizeof(cfg.dev_name));
+	strlcpy(cfgind.dev_name, flash->iled_cdev.name, sizeof(cfgind.dev_name));
 
 	flash->vf = v4l2_flash_init(
 		&flash->client->dev, flash->flash_node, &flash->fled, NULL,
-- 
2.15.0

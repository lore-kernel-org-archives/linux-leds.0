From: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Subject: [PATCH 2/2] leds: lm3533: constify attribute_group structure
Date: Thu, 10 Aug 2017 12:28:09 -0400
Message-ID: <20170810162809.GA6903@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Functions working with attribute_groups provided by <linux/device.h>
work with const attribute_group. These attribute_group structures do not
change at runtime so mark them as const.

File size before:
 text      data     bss     dec     hex filename
 8272      4608      64   12944    3290 drivers/leds/leds-lm3533.o

File size after:
 text      data     bss     dec     hex filename
 8368      4512      64   12944    3290 drivers/leds/leds-lm3533.o

This change was made with the help of Coccinelle.

Signed-off-by: Amitoj Kaur Chawla <amitoj1606@gmail.com>
---
 drivers/leds/leds-lm3533.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
index 5b529dc..72224b5 100644
--- a/drivers/leds/leds-lm3533.c
+++ b/drivers/leds/leds-lm3533.c
@@ -626,7 +626,7 @@ static umode_t lm3533_led_attr_is_visible(struct kobject *kobj,
 	return mode;
 };
 
-static struct attribute_group lm3533_led_attribute_group = {
+static const struct attribute_group lm3533_led_attribute_group = {
 	.is_visible	= lm3533_led_attr_is_visible,
 	.attrs		= lm3533_led_attributes
 };
-- 
2.7.4

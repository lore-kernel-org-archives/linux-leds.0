From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch 2/2] leds: netxbig: clean up a data type issue
Date: Thu, 9 Apr 2015 12:07:12 +0300
Message-ID: <20150409090712.GF17605@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Simon Guinot <simon.guinot@sequanux.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

This driver is pretty hardware specific so it's unlikely that we're
going to be using it on 64 big endian systems.  Still, the current code
causes a static checker warning so we may as well change the type from
"unsigned long" to "u32" and remove the casting.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/include/linux/platform_data/leds-kirkwood-netxbig.h b/include/linux/platform_data/leds-kirkwood-netxbig.h
index d2be19a..bbd1d99 100644
--- a/include/linux/platform_data/leds-kirkwood-netxbig.h
+++ b/include/linux/platform_data/leds-kirkwood-netxbig.h
@@ -29,9 +29,9 @@ enum netxbig_led_mode {
 #define NETXBIG_LED_INVALID_MODE NETXBIG_LED_MODE_NUM
 
 struct netxbig_led_timer {
-	unsigned long		delay_on;
-	unsigned long		delay_off;
-	enum netxbig_led_mode	mode;
+	u32 delay_on;
+	u32 delay_off;
+	enum netxbig_led_mode mode;
 };
 
 struct netxbig_led {
diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
index d0b743c..3da87be 100644
--- a/drivers/leds/leds-netxbig.c
+++ b/drivers/leds/leds-netxbig.c
@@ -447,9 +447,9 @@ static int netxbig_leds_get_of_pdata(struct device *dev,
 			of_property_read_u32_index(np, "timers", 3 * i,
 						&timers[i].mode);
 			of_property_read_u32_index(np, "timers", 3 * i + 1,
-						(u32 *) &timers[i].delay_on);
+						   &timers[i].delay_on);
 			of_property_read_u32_index(np, "timers", 3 * i + 2,
-						(u32 *) &timers[i].delay_off);
+						   &timers[i].delay_off);
 		}
 		pdata->timer = timers;
 		pdata->num_timer = num_timers;

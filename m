From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0306/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:58:36 +0800
Message-ID: <20160802105836.1867-1-baolex.ni@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rpurdie@rpsys.net, j.anaszewski@samsung.com, hal.rosenstock@gmail.com, dledford@redhat.com, sean.hefty@intel.com, bp@alien8.de
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, fabio.baltieri@gmail.com, u.kleine-koenig@pengutronix.de, chuansheng.liu@intel.com, baolex.ni@intel.com
List-Id: linux-leds@vger.kernel.org

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/leds/trigger/ledtrig-oneshot.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-oneshot.c b/drivers/leds/trigger/ledtrig-oneshot.c
index b8ea9f0..052c805 100644
--- a/drivers/leds/trigger/ledtrig-oneshot.c
+++ b/drivers/leds/trigger/ledtrig-oneshot.c
@@ -117,10 +117,10 @@ static ssize_t led_delay_off_store(struct device *dev,
 	return size;
 }
 
-static DEVICE_ATTR(delay_on, 0644, led_delay_on_show, led_delay_on_store);
-static DEVICE_ATTR(delay_off, 0644, led_delay_off_show, led_delay_off_store);
-static DEVICE_ATTR(invert, 0644, led_invert_show, led_invert_store);
-static DEVICE_ATTR(shot, 0200, NULL, led_shot);
+static DEVICE_ATTR(delay_on, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, led_delay_on_show, led_delay_on_store);
+static DEVICE_ATTR(delay_off, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, led_delay_off_show, led_delay_off_store);
+static DEVICE_ATTR(invert, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, led_invert_show, led_invert_store);
+static DEVICE_ATTR(shot, S_IWUSR, NULL, led_shot);
 
 static void oneshot_trig_activate(struct led_classdev *led_cdev)
 {
-- 
2.9.2

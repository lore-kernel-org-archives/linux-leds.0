From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 021/244] leds: avoid races with workqueue
Date: Wed, 22 May 2019 15:22:47 -0400
Message-ID: <20190522192630.24917-21-sashal@kernel.org>
References: <20190522192630.24917-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190522192630.24917-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Sasha Levin <sashal@kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

From: Pavel Machek <pavel@ucw.cz>

[ Upstream commit 0db37915d912e8dc6588f25da76d3ed36718d92f ]

There are races between "main" thread and workqueue. They manifest
themselves on Thinkpad X60:

This should result in LED blinking, but it turns it off instead:

    root@amd:/data/pavel# cd /sys/class/leds/tpacpi\:\:power
    root@amd:/sys/class/leds/tpacpi::power# echo timer > trigger
    root@amd:/sys/class/leds/tpacpi::power# echo timer > trigger

It should be possible to transition from blinking to solid on by echo
0 > brightness; echo 1 > brightness... but that does not work, either,
if done too quickly.

Synchronization of the workqueue fixes both.

Fixes: 1afcadfcd184 ("leds: core: Use set_brightness_work for the blocking op")
Signed-off-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/leds/led-class.c | 1 +
 drivers/leds/led-core.c  | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 3c7e3487b373b..85848c5da705f 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -57,6 +57,7 @@ static ssize_t brightness_store(struct device *dev,
 	if (state == LED_OFF)
 		led_trigger_remove(led_cdev);
 	led_set_brightness(led_cdev, state);
+	flush_work(&led_cdev->set_brightness_work);
 
 	ret = size;
 unlock:
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index ede4fa0ac2cce..55dec67023599 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -162,6 +162,11 @@ static void led_blink_setup(struct led_classdev *led_cdev,
 		     unsigned long *delay_on,
 		     unsigned long *delay_off)
 {
+	/*
+	 * If "set brightness to 0" is pending in workqueue, we don't
+	 * want that to be reordered after blink_set()
+	 */
+	flush_work(&led_cdev->set_brightness_work);
 	if (!test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
 	    led_cdev->blink_set &&
 	    !led_cdev->blink_set(led_cdev, delay_on, delay_off))
-- 
2.20.1

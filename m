From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH stable v4.4+ 2/3] leds: turn off the LED and wait for completion on unregistering LED class device
Date: Thu,  6 Dec 2018 10:47:01 +0100
Message-ID: <1544089622-23982-2-git-send-email-krzk@kernel.org>
References: <1544089622-23982-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544089622-23982-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stable@vger.kernel.org
Cc: Milo Kim <milo.kim@ti.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Jacek Anaszewski <j.anaszewski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-leds@vger.kernel.org

From: Milo Kim <milo.kim@ti.com>

commit d1aa577f5e191d77d3ad62da93729b5af9532bb4 upstream.

Workqueue, 'set_brightness_work' is used for scheduling brightness control.
This workqueue is canceled when the LED class device is unregistered.
Currently, LED subsystem handles like below.

  cancel_work_sync(&led_cdev->set_brightness_work)
  led_set_brightness(led_cdev, LED_OFF)

However, this could be a problem.
Workqueue is going to be canceled but LED device needs to be off.
The worst case is null pointer access due to scheduling a workqueue.

LED module is loaded.
  LED driver private data is allocated by using devm_zalloc().

LED module is unloaded.
  led_classdev_unregister() is called.
    cancel_work_sync()
      led_set_brightness(led_cdev, LED_OFF)
        schedule_work() if LED driver uses brightness_set_blocking()
        In the meantime, driver private data will be freed.

        ..scheduling..

        brightness_set_blocking() callback is invoked.
          For the brightness control, LED driver tries to access private
          data but resource is removed!

To avoid this problem, LED subsystem should turn off the brightness first
and wait for completion.

  led_set_brightness(led_cdev, LED_OFF)
  flush_work(&led_cdev->set_brightness_work)

It guarantees that LED driver turns off the brightness prior to
resource management.

Cc: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Milo Kim <milo.kim@ti.com>
Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/leds/led-class.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 7385f98dd54b..51a5b51ec467 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -247,12 +247,13 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
 	up_write(&led_cdev->trigger_lock);
 #endif
 
-	cancel_work_sync(&led_cdev->set_brightness_work);
-
 	/* Stop blinking */
 	led_stop_software_blink(led_cdev);
+
 	led_set_brightness(led_cdev, LED_OFF);
 
+	flush_work(&led_cdev->set_brightness_work);
+
 	device_unregister(led_cdev->dev);
 
 	down_write(&leds_list_lock);
-- 
2.7.4

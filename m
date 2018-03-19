From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH 4.9 v2 1/2] Revert "led: core: Fix brightness setting when setting delay_off=0"
Date: Mon, 19 Mar 2018 20:23:18 +0100
Message-ID: <1521487399-10447-2-git-send-email-jacek.anaszewski@gmail.com>
References: <1521487399-10447-1-git-send-email-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521487399-10447-1-git-send-email-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: stable@vger.kernel.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, pavel@ucw.cz, jacek.anaszewski@gmail.com
List-Id: linux-leds@vger.kernel.org

This reverts commit 86b9fa2190907f4f550d9d6bf490c5f89ca33836.

The commit being reverted has two flaws:
 - it introduces a regression, fixed in the upstream
   commit 7b6af2c53192f1766892ef40c8f48a413509ed72.
 - it has truncated commit message

Reported-by: Sasha Levin <Alexander.Levin@microsoft.com>
Reported-by: Matthias Schiffer <mschiffer@universe-factory.net>
Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---
 drivers/leds/led-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index d70d4a5..3bce448 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -186,7 +186,7 @@ void led_blink_set(struct led_classdev *led_cdev,
 		   unsigned long *delay_on,
 		   unsigned long *delay_off)
 {
-	led_stop_software_blink(led_cdev);
+	del_timer_sync(&led_cdev->blink_timer);
 
 	led_cdev->flags &= ~LED_BLINK_ONESHOT;
 	led_cdev->flags &= ~LED_BLINK_ONESHOT_STOP;
-- 
2.1.4

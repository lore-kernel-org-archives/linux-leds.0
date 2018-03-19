From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH 4.9 v2 0/2] Clear LED_BLINK_SW flag in led_blink_set()
Date: Mon, 19 Mar 2018 20:23:17 +0100
Message-ID: <1521487399-10447-1-git-send-email-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stable@vger.kernel.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, pavel@ucw.cz, jacek.anaszewski@gmail.com
List-Id: linux-leds@vger.kernel.org

The fix for brightness setting when setting delay_off=0 introduces
a regression and has truncated commit message. Revert that patch
and apply the one-line change required to fix the original issue
in the way appropriate for the 4.9 code base.

Changes from v1:
 - added Reported-by and Signed-off-by tags

Thanks,
Jacek Anaszewski

Jacek Anaszewski (2):
  Revert "led: core: Fix brightness setting when setting delay_off=0"
  led: core: Clear LED_BLINK_SW flag in led_blink_set()

 drivers/leds/led-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.1.4

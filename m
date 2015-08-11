From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 47/57] leds: net48xx: Use brightness_set_nonblocking op
Date: Tue, 11 Aug 2015 11:38:00 +0200
Message-ID: <1439285890-27329-48-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Chris Boot <bootc@bootc.net>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set op.
Use a new brightness_set_nonblocking op instead of brightness_set for
setting brightness then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Chris Boot <bootc@bootc.net>
---
 drivers/leds/leds-net48xx.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-net48xx.c b/drivers/leds/leds-net48xx.c
index ec3a2e8..b48fdeb 100644
--- a/drivers/leds/leds-net48xx.c
+++ b/drivers/leds/leds-net48xx.c
@@ -32,9 +32,9 @@ static void net48xx_error_led_set(struct led_classdev *led_cdev,
 }
 
 static struct led_classdev net48xx_error_led = {
-	.name		= "net48xx::error",
-	.brightness_set	= net48xx_error_led_set,
-	.flags		= LED_CORE_SUSPENDRESUME,
+	.name				= "net48xx::error",
+	.brightness_set_nonblocking	= net48xx_error_led_set,
+	.flags				= LED_CORE_SUSPENDRESUME,
 };
 
 static int net48xx_led_probe(struct platform_device *pdev)
-- 
1.7.9.5

From: Amitesh Singh <singh.amitesh@gmail.com>
Subject: [PATCH] leds: oneshot - Allow default delay to be passed as an
 argument
Date: Sat, 3 Sep 2016 14:33:35 +0530
Message-ID: <20160903090331.GA15375@ami-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33649 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751360AbcICJDp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 3 Sep 2016 05:03:45 -0400
Received: by mail-pf0-f195.google.com with SMTP id i6so6829209pfe.0
        for <linux-leds@vger.kernel.org>; Sat, 03 Sep 2016 02:03:45 -0700 (PDT)
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org

This patch facilates the blink delay to be passed as
an argument at the time of module loading.
e.g.
insmod ledtrigg-oneshot.ko default_delay=100
---
 drivers/leds/trigger/ledtrig-oneshot.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-oneshot.c b/drivers/leds/trigger/ledtrig-oneshot.c
index b8ea9f0..95933a1 100644
--- a/drivers/leds/trigger/ledtrig-oneshot.c
+++ b/drivers/leds/trigger/ledtrig-oneshot.c
@@ -22,6 +22,9 @@
 
 #define DEFAULT_DELAY 100
 
+static unsigned long default_delay = DEFAULT_DELAY;
+module_param(default_delay, ulong, S_IRUGO|S_IWUSR);
+
 struct oneshot_trig_data {
 	unsigned int invert;
 };
@@ -146,8 +149,8 @@ static void oneshot_trig_activate(struct led_classdev *led_cdev)
 	if (rc)
 		goto err_out_invert;
 
-	led_cdev->blink_delay_on = DEFAULT_DELAY;
-	led_cdev->blink_delay_off = DEFAULT_DELAY;
+	led_cdev->blink_delay_on = default_delay;
+	led_cdev->blink_delay_off = default_delay;
 
 	led_cdev->activated = true;
 
-- 
2.7.4

This patch facilates the blink delay to be passed as
an argument at the time of module loading.
e.g.
insmod ledtrigg-oneshot.ko default_delay=100

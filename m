Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D3FC0015E
	for <linux-leds@archiver.kernel.org>; Fri, 28 Jul 2023 12:31:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbjG1Mb3 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 28 Jul 2023 08:31:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235314AbjG1Mb2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 Jul 2023 08:31:28 -0400
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4FBB10FC;
        Fri, 28 Jul 2023 05:31:27 -0700 (PDT)
Received: from local
        by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
         (Exim 4.96)
        (envelope-from <daniel@makrotopia.org>)
        id 1qPMck-0003Lx-2p;
        Fri, 28 Jul 2023 12:31:14 +0000
Date:   Fri, 28 Jul 2023 13:30:58 +0100
From:   Daniel Golle <daniel@makrotopia.org>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Daniel Golle <daniel@makrotopia.org>,
        Johannes Berg <johannes.berg@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Richard Purdie <rpurdie@linux.intel.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] led: trig: timer: stop offloading on deactivation
Message-ID: <728da6e11d34a39f717be07e246dcc4964b0fd51.1690542871.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Stop hardware blinking when switching from 'timer' to another trigger.

Fixes: 5ada28bf7675 ("led-class: always implement blinking")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/leds/trigger/ledtrig-timer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-timer.c b/drivers/leds/trigger/ledtrig-timer.c
index b4688d1d9d2b2..fb6b207b052b8 100644
--- a/drivers/leds/trigger/ledtrig-timer.c
+++ b/drivers/leds/trigger/ledtrig-timer.c
@@ -125,6 +125,8 @@ static void timer_trig_deactivate(struct led_classdev *led_cdev)
 {
 	/* Stop blinking */
 	led_set_brightness(led_cdev, LED_OFF);
+	if (led_cdev->blink_set)
+		led_cdev->blink_set(led_cdev, 0, 0);
 }
 
 static struct led_trigger timer_led_trigger = {
-- 
2.41.0


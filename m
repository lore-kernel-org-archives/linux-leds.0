From: Rob Herring <robh@kernel.org>
Subject: [PATCH] leds: ledtrig-transient: fix duration to be msec instead of jiffies
Date: Tue, 10 Nov 2015 17:10:17 -0600
Message-ID: <1447197017-4783-1-git-send-email-robh@kernel.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:32967 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752054AbbKJXKa (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 10 Nov 2015 18:10:30 -0500
Received: by obbww6 with SMTP id ww6so9827827obb.0
        for <linux-leds@vger.kernel.org>; Tue, 10 Nov 2015 15:10:29 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
Cc: Shuah Khan <shuahkhan@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org

The transient trigger duration is documented to be in msec units, but is
actually in jiffies units. Other time based triggers are in msec units
as well. Fix the timer setup to convert from msec.

This could break an existing userspace that worked around this problem,
but exposing jiffies to userspace is just wrong and would break anyway
if HZ is changed.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Shuah Khan <shuahkhan@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org
---
 drivers/leds/trigger/ledtrig-transient.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-transient.c b/drivers/leds/trigger/ledtrig-transient.c
index 3c34de4..60034bf 100644
--- a/drivers/leds/trigger/ledtrig-transient.c
+++ b/drivers/leds/trigger/ledtrig-transient.c
@@ -85,7 +85,7 @@ static ssize_t transient_activate_store(struct device *dev,
 		transient_data->restore_state =
 		    (transient_data->state == LED_FULL) ? LED_OFF : LED_FULL;
 		mod_timer(&transient_data->timer,
-			  jiffies + transient_data->duration);
+			  jiffies + msecs_to_jiffies(transient_data->duration));
 	}
 
 	/* state == 0 && transient_data->activate == 0
-- 
2.5.0

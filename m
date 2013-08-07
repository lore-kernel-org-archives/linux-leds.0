From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/2] leds: ss4200: Fix incorrect placement of __initdata
Date: Wed,  7 Aug 2013 15:00:43 +0530
Message-ID: <1375867843-19162-2-git-send-email-sachin.kamat@linaro.org>
References: <1375867843-19162-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:41795 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932360Ab3HGJrc (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 7 Aug 2013 05:47:32 -0400
Received: by mail-pa0-f48.google.com with SMTP id kp13so1956771pab.35
        for <linux-leds@vger.kernel.org>; Wed, 07 Aug 2013 02:47:32 -0700 (PDT)
In-Reply-To: <1375867843-19162-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: cooloney@gmail.com, rpurdie@rpsys.net, sachin.kamat@linaro.org, Dave Hansen <dave@sr71.net>

__initdata should be placed between the variable name and equal
sign for the variable to be placed in the intended section.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Dave Hansen <dave@sr71.net>
---
 drivers/leds/leds-ss4200.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
index 51bb0ee..5b8f938 100644
--- a/drivers/leds/leds-ss4200.c
+++ b/drivers/leds/leds-ss4200.c
@@ -91,7 +91,7 @@ MODULE_PARM_DESC(nodetect, "Skip DMI-based hardware detection");
  * detected as working, but in reality it is not) as low as
  * possible.
  */
-static struct dmi_system_id __initdata nas_led_whitelist[] = {
+static struct dmi_system_id nas_led_whitelist[] __initdata = {
 	{
 		.callback = ss4200_led_dmi_callback,
 		.ident = "Intel SS4200-E",
-- 
1.7.9.5


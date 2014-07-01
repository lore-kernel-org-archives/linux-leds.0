From: Sachin Kamat <sachin.kamat@samsung.com>
Subject: [PATCH 1/1] leds: blinkm: Remove unused variable
Date: Tue,  1 Jul 2014 17:37:23 +0530
Message-ID: <1404216443-21177-1-git-send-email-sachin.kamat@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:44562 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751225AbaGAMKy (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 1 Jul 2014 08:10:54 -0400
Received: by mail-pa0-f49.google.com with SMTP id lj1so10476570pab.22
        for <linux-leds@vger.kernel.org>; Tue, 01 Jul 2014 05:10:53 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: jansimon.moeller@gmx.de, cooloney@gmail.com, spk.linux@gmail.com

'ret' is not used in the function. Remove it.

Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
---
 drivers/leds/leds-blinkm.c |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
index d0452b099aee..f07f920ac0ac 100644
--- a/drivers/leds/leds-blinkm.c
+++ b/drivers/leds/leds-blinkm.c
@@ -441,14 +441,13 @@ static int blinkm_transfer_hw(struct i2c_client *client, int cmd)
 
 static void led_work(struct work_struct *work)
 {
-	int ret;
 	struct blinkm_led *led;
 	struct blinkm_data *data;
 	struct blinkm_work *blm_work = work_to_blmwork(work);
 
 	led = blm_work->blinkm_led;
 	data = i2c_get_clientdata(led->i2c_client);
-	ret = blinkm_transfer_hw(led->i2c_client, BLM_GO_RGB);
+	blinkm_transfer_hw(led->i2c_client, BLM_GO_RGB);
 	atomic_dec(&led->active);
 	dev_dbg(&led->i2c_client->dev,
 			"# DONE # next_red = %d, next_green = %d,"
@@ -546,9 +545,8 @@ static void blinkm_led_blue_set(struct led_classdev *led_cdev,
 
 static void blinkm_init_hw(struct i2c_client *client)
 {
-	int ret;
-	ret = blinkm_transfer_hw(client, BLM_STOP_SCRIPT);
-	ret = blinkm_transfer_hw(client, BLM_GO_RGB);
+	blinkm_transfer_hw(client, BLM_STOP_SCRIPT);
+	blinkm_transfer_hw(client, BLM_GO_RGB);
 }
 
 static int blinkm_test_run(struct i2c_client *client)
-- 
1.7.9.5

From: Tin Huynh <tnhuynh@apm.com>
Subject: [PATCH V1] leds: pca955x: Correct I2C Functionality
Date: Mon, 22 May 2017 16:19:20 +0700
Message-ID: <1495444760-7626-1-git-send-email-tnhuynh@apm.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f174.google.com ([209.85.192.174]:36139 "EHLO
        mail-pf0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757890AbdEVJTe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 22 May 2017 05:19:34 -0400
Received: by mail-pf0-f174.google.com with SMTP id m17so76603054pfg.3
        for <linux-leds@vger.kernel.org>; Mon, 22 May 2017 02:19:34 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Loc Ho <lho@apm.com>, Phong Vo <pvo@apm.com>, Thang Nguyen <tqnguyen@apm.com>, patches@apm.com, Tin Huynh <tnhuynh@apm.com>

The driver checks an incorrect flag of functionality of adapter.
When a driver requires i2c_smbus_read_byte_data and
i2c_smbus_write_byte_data, it should check I2C_FUNC_SMBUS_BYTE_DATA
instead I2C_FUNC_I2C.
This patch fixes the problem.

Signed-off-by: Tin Huynh <tnhuynh@apm.com>
---
 drivers/leds/leds-pca955x.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 78a7ce8..9a87311 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -285,7 +285,7 @@ static int pca955x_probe(struct i2c_client *client,
 			"slave address 0x%02x\n",
 			client->name, chip->bits, client->addr);
 
-	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
+	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
 		return -EIO;
 
 	if (pdata) {
-- 
1.7.1

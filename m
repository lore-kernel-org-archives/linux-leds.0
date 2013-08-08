From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] Documentation: leds: Fix a typo
Date: Thu,  8 Aug 2013 10:37:59 +0530
Message-ID: <1375938479-5021-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:47800 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755948Ab3HHFYq (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 8 Aug 2013 01:24:46 -0400
Received: by mail-pd0-f174.google.com with SMTP id 10so2186674pdc.19
        for <linux-leds@vger.kernel.org>; Wed, 07 Aug 2013 22:24:45 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-doc@vger.kernel.org, linux-leds@vger.kernel.org
Cc: cooloney@gmail.com, rob@landley.net, sachin.kamat@linaro.org

__initdata should be placed between the variable name and equal
sign for the variable to be placed in the intended section.
Fix the example.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 Documentation/leds/leds-lm3556.txt |    2 +-
 Documentation/leds/leds-lp3944.txt |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/leds/leds-lm3556.txt b/Documentation/leds/leds-lm3556.txt
index d9eb91b..62278e8 100644
--- a/Documentation/leds/leds-lm3556.txt
+++ b/Documentation/leds/leds-lm3556.txt
@@ -71,7 +71,7 @@ To register the chip at address 0x63 on specific adapter, set the platform data
 according to include/linux/platform_data/leds-lm3556.h, set the i2c board info
 
 Example:
-	static struct i2c_board_info __initdata board_i2c_ch4[]	= {
+	static struct i2c_board_info board_i2c_ch4[] __initdata = {
 		{
 			 I2C_BOARD_INFO(LM3556_NAME, 0x63),
 			 .platform_data = &lm3556_pdata,
diff --git a/Documentation/leds/leds-lp3944.txt b/Documentation/leds/leds-lp3944.txt
index c6eda18..e88ac3b 100644
--- a/Documentation/leds/leds-lp3944.txt
+++ b/Documentation/leds/leds-lp3944.txt
@@ -37,7 +37,7 @@ registered using the i2c_board_info mechanism.
 To register the chip at address 0x60 on adapter 0, set the platform data
 according to include/linux/leds-lp3944.h, set the i2c board info:
 
-	static struct i2c_board_info __initdata a910_i2c_board_info[] = {
+	static struct i2c_board_info a910_i2c_board_info[] __initdata = {
 		{
 			I2C_BOARD_INFO("lp3944", 0x60),
 			.platform_data = &a910_lp3944_leds,
-- 
1.7.9.5


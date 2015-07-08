From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] leds: lp8860: Constify reg_default tables
Date: Wed, 08 Jul 2015 10:43:26 +0800
Message-ID: <1436323406.25341.0.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:33947 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753624AbbGHCnc (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 7 Jul 2015 22:43:32 -0400
Received: by pabvl15 with SMTP id vl15so123021981pab.1
        for <linux-leds@vger.kernel.org>; Tue, 07 Jul 2015 19:43:31 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org

These reg_default tables are not modified after initialized, so make them
const.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/leds/leds-lp8860.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 8c2b7fb..79f0843 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -302,7 +302,7 @@ out:
 	return ret;
 }
 
-static struct reg_default lp8860_reg_defs[] = {
+static const struct reg_default lp8860_reg_defs[] = {
 	{ LP8860_DISP_CL1_BRT_MSB, 0x00},
 	{ LP8860_DISP_CL1_BRT_LSB, 0x00},
 	{ LP8860_DISP_CL1_CURR_MSB, 0x00},
@@ -332,7 +332,7 @@ static const struct regmap_config lp8860_regmap_config = {
 	.cache_type = REGCACHE_NONE,
 };
 
-static struct reg_default lp8860_eeprom_defs[] = {
+static const struct reg_default lp8860_eeprom_defs[] = {
 	{ LP8860_EEPROM_REG_0, 0x00 },
 	{ LP8860_EEPROM_REG_1, 0x00 },
 	{ LP8860_EEPROM_REG_2, 0x00 },
-- 
2.1.0

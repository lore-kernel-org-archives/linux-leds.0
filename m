From: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Subject: [PATCH 1/2] leds: blinkm: constify attribute_group structure
Date: Thu, 10 Aug 2017 12:28:02 -0400
Message-ID: <20170810162802.GA6881@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:36503 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753029AbdHJQ2D (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Aug 2017 12:28:03 -0400
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Functions working with attribute_groups provided by <linux/sysfs.h>
work with const attribute_group. These attribute_group structures do not
change at runtime so mark them as const.

File size before:
 text      data     bss     dec     hex filename
 8657      3496      64   12217    2fb9 drivers/leds/leds-blinkm.o

File size after:
 text      data     bss     dec     hex filename
 8753      3400      64   12217    2fb9 drivers/leds/leds-blinkm.o

This change was made with the help of Coccinelle.

Signed-off-by: Amitoj Kaur Chawla <amitoj1606@gmail.com>
---
 drivers/leds/leds-blinkm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
index 617fe97..d03ed6b 100644
--- a/drivers/leds/leds-blinkm.c
+++ b/drivers/leds/leds-blinkm.c
@@ -298,7 +298,7 @@ static struct attribute *blinkm_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group blinkm_group = {
+static const struct attribute_group blinkm_group = {
 	.name = "blinkm",
 	.attrs = blinkm_attrs,
 };
-- 
2.7.4

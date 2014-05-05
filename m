From: Daniel Mack <zonque@gmail.com>
Subject: [PATCH] leds: lp55xx: add DT bindings for LP55231
Date: Mon,  5 May 2014 13:46:54 +0200
Message-ID: <1399290414-27983-1-git-send-email-zonque@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ee0-f52.google.com ([74.125.83.52]:62117 "EHLO
	mail-ee0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753432AbaEELrC (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 5 May 2014 07:47:02 -0400
Received: by mail-ee0-f52.google.com with SMTP id e53so5190723eek.25
        for <linux-leds@vger.kernel.org>; Mon, 05 May 2014 04:47:00 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net, samu.p.onkalo@nokia.com, milo.kim@ti.com
Cc: linux-leds@vger.kernel.org, Daniel Mack <zonque@gmail.com>

The TI55231 appears to be fully compatible to the 5523 model from
National Semicondutor. This patch just adds DT bindings for it.

Signed-off-by: Daniel Mack <zonque@gmail.com>
---
 Documentation/devicetree/bindings/leds/leds-lp55xx.txt | 8 +++++++-
 drivers/leds/leds-lp5523.c                             | 3 ++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.txt b/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
index c55b8c0..1b66a41 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
@@ -1,7 +1,13 @@
 Binding for TI/National Semiconductor LP55xx Led Drivers
 
 Required properties:
-- compatible: "national,lp5521" or "national,lp5523" or "ti,lp5562" or "ti,lp8501"
+- compatible: one of
+	national,lp5521
+	national,lp5523
+	ti,lp55231
+	ti,lp5562
+	ti,lp8501
+
 - reg: I2C slave address
 - clock-mode: Input clock mode, (0: automode, 1: internal, 2: external)
 
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 4ade66a..7e46f57 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -1,5 +1,5 @@
 /*
- * lp5523.c - LP5523 LED Driver
+ * lp5523.c - LP5523, LP55231 LED Driver
  *
  * Copyright (C) 2010 Nokia Corporation
  * Copyright (C) 2012 Texas Instruments
@@ -815,6 +815,7 @@ MODULE_DEVICE_TABLE(i2c, lp5523_id);
 #ifdef CONFIG_OF
 static const struct of_device_id of_lp5523_leds_match[] = {
 	{ .compatible = "national,lp5523", },
+	{ .compatible = "ti,lp55231", },
 	{},
 };
 
-- 
1.9.0

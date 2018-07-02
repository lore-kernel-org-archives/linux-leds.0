From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 1/4] leds: lm3692x: Update license header to SPDX
Date: Mon, 2 Jul 2018 13:12:13 -0500
Message-ID: <20180702181216.19660-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, jacek.anaszewski@gmail.com, andy.shevchenko@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Update the license header to the current
SPDX licensing format.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lm3692x.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index 437173d1712c..1a06d8c97789 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -1,17 +1,6 @@
-/*
- * TI lm3692x LED Driver
- *
- * Copyright (C) 2017 Texas Instruments
- *
- * Author: Dan Murphy <dmurphy@ti.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * Data sheet is located
- * http://www.ti.com/lit/ds/snvsa29/snvsa29.pdf
- */
+// SPDX-License-Identifier: GPL-2.0
+// TI LM3692x LED chip family driver 
+// Copyright (C) 2017-18 Texas Instruments Incorporated - http://www.ti.com/
 
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
-- 
2.17.0.582.gccdcbd54c

From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v8 13/14] of: Add Skyworks Solutions, Inc. vendor prefix
Date: Fri, 28 Nov 2014 10:18:05 +0100
Message-ID: <1417166286-27685-14-git-send-email-j.anaszewski@samsung.com>
References: <1417166286-27685-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1417166286-27685-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kyungmin.park@samsung.com, b.zolnierkie@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com, Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Use "skyworks" as the vendor prefix for the
Skyworks Solutions, Inc.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: <devicetree@vger.kernel.org>
---
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index c177cd7..3006825 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -137,6 +137,7 @@ ricoh	Ricoh Co. Ltd.
 rockchip	Fuzhou Rockchip Electronics Co., Ltd
 samsung	Samsung Semiconductor
 sandisk	Sandisk Corporation
+skyworks	Skyworks Solutions, Inc.
 sbs	Smart Battery System
 schindler	Schindler
 seagate	Seagate Technology PLC
-- 
1.7.9.5

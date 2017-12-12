From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v3 4/6] dt: bindings: lp8860: Add trigger binding to the lp8860
Date: Tue, 12 Dec 2017 12:58:07 -0600
Message-ID: <20171212185809.23880-6-dmurphy@ti.com>
References: <20171212185809.23880-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:59512 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752408AbdLLS6c (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 12 Dec 2017 13:58:32 -0500
In-Reply-To: <20171212185809.23880-1-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>

Add a default trigger optional node to the child node.
This will allow the driver to set the trigger for a backlight.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v3 - Removed optional and rebased - https://patchwork.kernel.org/patch/10093755/

v2 - Moved binding changes to first patch in the series.

 Documentation/devicetree/bindings/leds/leds-lp8860.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
index c3d64ade1e26..cdb9e12bd0aa 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
@@ -21,6 +21,8 @@ Required child properties:
 
 Optional child properties:
 	- label : see Documentation/devicetree/bindings/leds/common.txt
+	- linux,default-trigger :
+	   see Documentation/devicetree/bindings/leds/common.txt
 
 Example:
 
@@ -35,6 +37,7 @@ led-controller@2d {
 	led@0 {
 		reg = <0>;
 		label = "white:display_cluster";
+		linux,default-trigger = "backlight";
 	};
 }
 
-- 
2.15.0.124.g7668cbc60

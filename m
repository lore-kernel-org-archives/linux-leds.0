From: Dan Murphy <dmurphy@ti.com>
Subject: [RESEND PATCH v2] dt: bindings: as3645a: Fix the example node
Date: Fri, 8 Dec 2017 09:55:14 -0600
Message-ID: <20171208155514.7696-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from lelnx194.ext.ti.com ([198.47.27.80]:28624 "EHLO
        lelnx194.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753675AbdLHPzn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 8 Dec 2017 10:55:43 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>

Fix the address-cells and size-cells example node
to reflect to the correct representation.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
---

v2 - Moved compatible to be first in the node - https://patchwork.kernel.org/patch/10092937/

 Documentation/devicetree/bindings/leds/ams,as3645a.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/ams,as3645a.txt b/Documentation/devicetree/bindings/leds/ams,as3645a.txt
index fdc40e354a64..fc7f5f9f234c 100644
--- a/Documentation/devicetree/bindings/leds/ams,as3645a.txt
+++ b/Documentation/devicetree/bindings/leds/ams,as3645a.txt
@@ -59,10 +59,10 @@ Example
 =======
 
 	as3645a@30 {
-		#address-cells: 1
-		#size-cells: 0
-		reg = <0x30>;
 		compatible = "ams,as3645a";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x30>;
 		flash@0 {
 			reg = <0x0>;
 			flash-timeout-us = <150000>;
-- 
2.15.0.124.g7668cbc60

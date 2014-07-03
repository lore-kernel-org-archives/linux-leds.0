From: Peter Meerwald <pmeerw@pmeerw.net>
Subject: [PATCH v2 3/3] leds:pca963x: Update for PCA9635 and correct statement about MODE2 OUTDRV default
Date: Thu,  3 Jul 2014 07:50:36 +0200
Message-ID: <1404366636-25469-3-git-send-email-pmeerw@pmeerw.net>
References: <1404366636-25469-1-git-send-email-pmeerw@pmeerw.net>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from ns.pmeerw.net ([87.118.82.44]:38743 "EHLO pmeerw.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750937AbaGCFv2 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 3 Jul 2014 01:51:28 -0400
In-Reply-To: <1404366636-25469-1-git-send-email-pmeerw@pmeerw.net>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: cooloney@gmail.com, rpurdie@rpsys.net, Peter Meerwald <pmeerw@pmeerw.net>

mention support for 16 LED PCA9635 chip

the default of MODE2's OUTDRV was incorrectly stated

Signed-off-by: Peter Meerwald <pmeerw@pmeerw.net>
---
 Documentation/devicetree/bindings/leds/pca963x.txt |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/pca963x.txt b/Documentation/devicetree/bindings/leds/pca963x.txt
index aece3ea..dafbe99 100644
--- a/Documentation/devicetree/bindings/leds/pca963x.txt
+++ b/Documentation/devicetree/bindings/leds/pca963x.txt
@@ -1,18 +1,19 @@
 LEDs connected to pca9632, pca9633 or pca9634
 
 Required properties:
-- compatible : should be : "nxp,pca9632", "nxp,pca9633" or "nxp,pca9634"
+- compatible : should be : "nxp,pca9632", "nxp,pca9633", "nxp,pca9634" or "nxp,pca9635"
 
 Optional properties:
-- nxp,totem-pole : use totem pole (push-pull) instead of default open-drain
+- nxp,totem-pole : use totem pole (push-pull) instead of open-drain (pca9632 defaults
+  to open-drain, newer chips to totem pole)
 - nxp,hw-blink : use hardware blinking instead of software blinking
 
 Each led is represented as a sub-node of the nxp,pca963x device.
 
 LED sub-node properties:
 - label : (optional) see Documentation/devicetree/bindings/leds/common.txt
-- reg : number of LED line (could be from 0 to 3  in pca9632 or pca9633
-		or 0 to 7 in pca9634)
+- reg : number of LED line (could be from 0 to 3 in pca9632 or pca9633,
+		0 to 7 in pca9634, or 0 to 15 in pca9635)
 - linux,default-trigger : (optional)
    see Documentation/devicetree/bindings/leds/common.txt
 
-- 
1.7.9.5

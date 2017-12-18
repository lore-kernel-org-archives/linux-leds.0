From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v5 4/6] dt: bindings: lp8860: Add trigger binding to the lp8860
Date: Mon, 18 Dec 2017 14:23:05 -0600
Message-ID: <20171218202307.4913-4-dmurphy@ti.com>
References: <20171218202307.4913-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171218202307.4913-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Add a default trigger optional node to the child node.
This will allow the driver to set the trigger for a backlight.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v5 - No changes

v4 - No changes
v3 - Removed optional and rebased - https://patchwork.kernel.org/patch/10093755/
v2 - Moved binding changes to first patch in the series.

 Documentation/devicetree/bindings/leds/leds-lp8860.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
index 77ddd22c20dc..5f0e892ad759 100644
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
 		label = "white:backlight";
+		linux,default-trigger = "backlight";
 	};
 }
 
-- 
2.15.0.124.g7668cbc60

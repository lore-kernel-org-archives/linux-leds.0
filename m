From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v9 17/19] DT: Add documentation for exynos4-is 'flashes'
 property
Date: Wed, 03 Dec 2014 17:06:52 +0100
Message-ID: <1417622814-10845-18-git-send-email-j.anaszewski@samsung.com>
References: <1417622814-10845-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1417622814-10845-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kyungmin.park@samsung.com, b.zolnierkie@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, Jacek Anaszewski <j.anaszewski@samsung.com>, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

This patch adds a description of 'flashes' property
to the samsung-fimc.txt.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: <devicetree@vger.kernel.org>
---
 .../devicetree/bindings/media/samsung-fimc.txt     |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/samsung-fimc.txt b/Documentation/devicetree/bindings/media/samsung-fimc.txt
index 922d6f8..22a6b2f 100644
--- a/Documentation/devicetree/bindings/media/samsung-fimc.txt
+++ b/Documentation/devicetree/bindings/media/samsung-fimc.txt
@@ -40,6 +40,12 @@ should be inactive. For the "active-a" state the camera port A must be activated
 and the port B deactivated and for the state "active-b" it should be the other
 way around.
 
+Optional properties:
+
+- flashes - Array of phandles to flash LED devices, or their sub-nodes
+	    representing sub-leds.
+	    (see Documentation/devicetree/bindings/leds/common.txt)
+
 The 'camera' node must include at least one 'fimc' child node.
 
 
@@ -166,6 +172,7 @@ Example:
 		clock-output-names = "cam_a_clkout", "cam_b_clkout";
 		pinctrl-names = "default";
 		pinctrl-0 = <&cam_port_a_clk_active>;
+		flashes = <&camera_flash>, <&system_torch>;
 		status = "okay";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
1.7.9.5

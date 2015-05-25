From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH v9 7/8] DT: Add documentation for exynos4-is 'flashes' property
Date: Mon, 25 May 2015 17:14:02 +0200
Message-ID: <1432566843-6391-8-git-send-email-j.anaszewski@samsung.com>
References: <1432566843-6391-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1432566843-6391-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org, kyungmin.park@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org

This patch adds a description of 'samsung,camera-flashes'
property to the samsung-fimc.txt.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 .../devicetree/bindings/media/samsung-fimc.txt     |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/samsung-fimc.txt b/Documentation/devicetree/bindings/media/samsung-fimc.txt
index 922d6f8..0554cad 100644
--- a/Documentation/devicetree/bindings/media/samsung-fimc.txt
+++ b/Documentation/devicetree/bindings/media/samsung-fimc.txt
@@ -40,6 +40,14 @@ should be inactive. For the "active-a" state the camera port A must be activated
 and the port B deactivated and for the state "active-b" it should be the other
 way around.
 
+Optional properties:
+
+- samsung,camera-flashes - Array of pairs of phandles to the camera sensor
+	devices and flash LEDs respectively. The pairs must reflect the board
+	configuration, i.e. a sensor has to be able to strobe a flash LED by
+	hardware. Flash LED is represented by a child node of a flash LED
+	device (see Documentation/devicetree/bindings/leds/common.txt).
+
 The 'camera' node must include at least one 'fimc' child node.
 
 
@@ -166,6 +174,8 @@ Example:
 		clock-output-names = "cam_a_clkout", "cam_b_clkout";
 		pinctrl-names = "default";
 		pinctrl-0 = <&cam_port_a_clk_active>;
+		samsung,camera-flashes = <&rear_camera &rear_flash>,
+					 <&front_camera &front_flash>;
 		status = "okay";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
1.7.9.5

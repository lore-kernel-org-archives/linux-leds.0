From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v6 2/2] Bindings documentation for ISSI is31fl319x driver
Date: Tue, 19 Jul 2016 13:47:31 +0200
Message-ID: <403335d22f6a8e131bc44077f97e499970e61245.1468928850.git.hns@goldelico.com>
References: <cover.1468928850.git.hns@goldelico.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.220]:22720 "EHLO
	mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753124AbcGSLrr (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 19 Jul 2016 07:47:47 -0400
In-Reply-To: <cover.1468928850.git.hns@goldelico.com>
In-Reply-To: <cover.1468928850.git.hns@goldelico.com>
References: <cover.1468928850.git.hns@goldelico.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, "H. Nikolaus Schaller" <hns@goldelico.com>, drivshin.allworx@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, kernel@pyra-handheld.com, marek@goldelico.com, letux-kernel@openphoenux.org, Andrey Utkin <andrey_utkin@fastmail.com>

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 .../devicetree/bindings/leds/is31fl319x.txt        | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/is31fl319x.txt

diff --git a/Documentation/devicetree/bindings/leds/is31fl319x.txt b/Documentation/devicetree/bindings/leds/is31fl319x.txt
new file mode 100644
index 0000000..03287c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/is31fl319x.txt
@@ -0,0 +1,59 @@
+LEDs connected to is31fl319x LED controller chip
+
+Required properties:
+- compatible : Should be any of
+	"issi,is31fl3190"
+	"issi,is31fl3191"
+	"issi,is31fl3193"
+	"issi,is31fl3196"
+	"issi,is31fl3199"
+	"si-en,sn3199".
+- #address-cells: Must be 1.
+- #size-cells: Must be 0.
+- reg: 0x64, 0x65, 0x66, 0x67.
+
+Optional properties:
+- audio-gain-db : audio gain selection for external analog modulation input.
+	Valid values: 0 - 21, step by 3 (rounded down)
+	Default: 0
+
+Each led is represented as a sub-node of the issi,is31fl319x device.
+There can be less leds subnodes than the chip can support but not more.
+
+Required led sub-node properties:
+- reg : number of LED line
+	Valid values: 1 - number of leds supported by the chip variant.
+
+Optional led sub-node properties:
+- label : see Documentation/devicetree/bindings/leds/common.txt.
+- linux,default-trigger :
+	see Documentation/devicetree/bindings/leds/common.txt.
+- led-max-microamp : (optional)
+	Valid values: 5000 - 40000, step by 5000 (rounded down)
+	Default: 20000 (20 mA)
+	Note: a driver will take the lowest of all led limits since the
+	chip has a single global setting. The lowest value will be chosen
+	due to the PWM specificity, where lower brightness is achieved
+	by reducing the dury-cycle of pulses and not the current, which
+	will always have its peak value equal to led-max-microamp.
+
+Examples:
+
+fancy_leds: leds@65 {
+	compatible = "issi,is31fl3196";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	reg = <0x65>;
+
+	red_aux: led@1 {
+		label = "red:aux";
+		reg = <1>;
+		led-max-microamp = <10000>;
+	};
+
+	green_power: led@5 {
+		label = "green:power";
+		reg = <5>;
+		linux,default-trigger = "default-on";
+	};
+};
-- 
2.7.3

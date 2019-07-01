From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH 2/4] devicetree: Update led binding
Date: Mon, 1 Jul 2019 17:14:21 +0200
Message-ID: <20190701151423.30768-3-jjhiblot@ti.com>
References: <20190701151423.30768-1-jjhiblot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190701151423.30768-1-jjhiblot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: dmurphy@ti.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com, Jean-Jacques Hiblot <jjhiblot@ti.com>, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Update the led binding to describe the possibility to add a "compatible"
option to create a child-device, user of the LED.

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/leds/common.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
index 70876ac11367..2f7882528d97 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -11,6 +11,9 @@ have to be tightly coupled with the LED device binding. They are represented
 by child nodes of the parent LED device binding.
 
 Optional properties for child nodes:
+- compatible : driver name for a child-device. This child-device is the user
+               of the LED. It is created when the LED is registered and
+	       destroyed when the LED is unregistered.
 - led-sources : List of device current outputs the LED is connected to. The
 		outputs are identified by the numbers that must be defined
 		in the LED device binding documentation.
-- 
2.17.1

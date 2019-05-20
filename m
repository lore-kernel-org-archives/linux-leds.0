From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: [PATCH 08/10] dt: fix refs that were renamed to json with the same file name
Date: Mon, 20 May 2019 11:47:37 -0300
Message-ID: <66231286de0f11b45075292216a939858de8c3e5.1558362030.git.mchehab+samsung@kernel.org>
References: <cover.1558362030.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1558362030.git.mchehab+samsung@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>, devicetree
List-Id: linux-leds@vger.kernel.org

This file was converted to json, but the references weren't
renamed.

Fixes: 66ed144f147a ("dt-bindings: interrupt-controller: Convert ARM GIC to json-schema")
(and other similar commits)

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/devicetree/bindings/arm/omap/crossbar.txt       | 2 +-
 .../devicetree/bindings/clock/samsung,s5pv210-clock.txt       | 2 +-
 .../bindings/interrupt-controller/marvell,odmi-controller.txt | 2 +-
 Documentation/devicetree/bindings/leds/irled/spi-ir-led.txt   | 2 +-
 MAINTAINERS                                                   | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/omap/crossbar.txt b/Documentation/devicetree/bindings/arm/omap/crossbar.txt
index 4cd5d873fc3a..a43e4c7aba3d 100644
--- a/Documentation/devicetree/bindings/arm/omap/crossbar.txt
+++ b/Documentation/devicetree/bindings/arm/omap/crossbar.txt
@@ -41,7 +41,7 @@ Examples:
 Consumer:
 ========
 See Documentation/devicetree/bindings/interrupt-controller/interrupts.txt and
-Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt for
+Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml for
 further details.
 
 An interrupt consumer on an SoC using crossbar will use:
diff --git a/Documentation/devicetree/bindings/clock/samsung,s5pv210-clock.txt b/Documentation/devicetree/bindings/clock/samsung,s5pv210-clock.txt
index 15b48e20a061..a86c83bf9d4e 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s5pv210-clock.txt
+++ b/Documentation/devicetree/bindings/clock/samsung,s5pv210-clock.txt
@@ -35,7 +35,7 @@ board device tree, including the system base clock, as selected by XOM[0]
 pin of the SoC. Refer to generic fixed rate clock bindings
 documentation[1] for more information how to specify these clocks.
 
-[1] Documentation/devicetree/bindings/clock/fixed-clock.txt
+[1] Documentation/devicetree/bindings/clock/fixed-clock.yaml
 
 Example: Clock controller node:
 
diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,odmi-controller.txt b/Documentation/devicetree/bindings/interrupt-controller/marvell,odmi-controller.txt
index 930fb462fd9f..0ebfc952cb34 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/marvell,odmi-controller.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/marvell,odmi-controller.txt
@@ -23,7 +23,7 @@ Required properties:
 - marvell,spi-base     : List of GIC base SPI interrupts, one for each
                          ODMI frame. Those SPI interrupts are 0-based,
                          i.e marvell,spi-base = <128> will use SPI #96.
-                         See Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt
+                         See Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
                          for details about the GIC Device Tree binding.
 
 Example:
diff --git a/Documentation/devicetree/bindings/leds/irled/spi-ir-led.txt b/Documentation/devicetree/bindings/leds/irled/spi-ir-led.txt
index 896b6997cf30..21882c8d4b0c 100644
--- a/Documentation/devicetree/bindings/leds/irled/spi-ir-led.txt
+++ b/Documentation/devicetree/bindings/leds/irled/spi-ir-led.txt
@@ -15,7 +15,7 @@ Optional properties:
 	- power-supply: specifies the power source. It can either be a regulator
 	  or a gpio which enables a regulator, i.e. a regulator-fixed as
 	  described in
-	  Documentation/devicetree/bindings/regulator/fixed-regulator.txt
+	  Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
 
 Example:
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 5cfbea4ce575..0c84bf76d165 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2768,7 +2768,7 @@ AVIA HX711 ANALOG DIGITAL CONVERTER IIO DRIVER
 M:	Andreas Klinger <ak@it-klinger.de>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/iio/adc/avia-hx711.txt
+F:	Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
 F:	drivers/iio/adc/hx711.c
 
 AX.25 NETWORK LAYER
@@ -14353,7 +14353,7 @@ SIMPLEFB FB DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	linux-fbdev@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/display/simple-framebuffer.txt
+F:	Documentation/devicetree/bindings/display/simple-framebuffer.yaml
 F:	drivers/video/fbdev/simplefb.c
 F:	include/linux/platform_data/simplefb.h
 
-- 
2.21.0

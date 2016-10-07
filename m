From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 06/10] gpio: gpio-i2cs: Document bindings of I2CS FPGA GPIO block
Date: Fri,  7 Oct 2016 18:21:05 +0300
Message-ID: <1475853669-22480-7-git-send-email-pantelis.antoniou@konsulko.com>
References: <1475853669-22480-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1475853669-22480-1-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Jean Delvare <jdelvare@suse.com>, Peter Rosin <peda@axentia.se>, Avirup Banerjee <abanerjee@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>, Guenter Roeck <linux@roeck-us.net>, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org, linux-hwmon@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

From: Georgi Vlaev <gvlaev@juniper.net>

Add device tree bindings document for the GPIO driver of
Juniper's I2CS FPGA.

Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
[Ported from Juniper kernel]
Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 .../devicetree/bindings/gpio/jnx,gpio-i2cs.txt     | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/jnx,gpio-i2cs.txt

diff --git a/Documentation/devicetree/bindings/gpio/jnx,gpio-i2cs.txt b/Documentation/devicetree/bindings/gpio/jnx,gpio-i2cs.txt
new file mode 100644
index 0000000..835b7fb4
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/jnx,gpio-i2cs.txt
@@ -0,0 +1,43 @@
+Juniper I2CS FPGA GPIO presence block
+
+This is virtual gpio driver, that maps each bit of the I2CS FPGA to
+a gpio. It's used as a compatibility replacement for FRUs that use
+I2CS FPGA to report presence, control and report power status in
+the Juniper's driver infra that uses gpios. Compatible with any I2CS.
+
+Required properties:
+
+Required properties:
+- compatible: "jnx,gpio-i2cs"
+
+- reg:
+    Address on the I2C bus of the I2CS FPGA
+
+- gpio-controller: Marks the device node as a gpio controller.
+
+- interrupt-controller: Marks the device node as an interrupt
+			controller.
+
+- i2c-gpio-map: Map of "I2CS register" and "direction". The registers
+	are 8 bit wide, each bit of the register is mapped to either
+	input or output depending on the bits of the "direction". If
+	the bit in the direction is 1, then that bit from the I2CS
+	register is mapped to gpio input, otherwise to gpio output.
+
+- #gpio-cells : Should be two.  The first cell is the pin number and
+	the second cell is used to specify the gpio polarity:
+	0 = active high
+	1 = active low
+
+Optional properties:
+
+Example:
+
+cb0_slave: i2c-slave@54 {
+	compatible = "jnx,gpio-i2cs";
+	reg = <0x54>;
+	#gpio-cells = <2>;
+	gpio-controller;
+	interrupt-controller;
+	i2c-gpio-map = <0x21 0xff>;	/* power status (bit 6) */
+};
-- 
1.9.1

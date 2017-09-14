From: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: [patch v5 2/2] dt-bindings: mfd: Add Device Tree bindings for Mellanox programmable devices
Date: Thu, 14 Sep 2017 06:48:58 +0000
Message-ID: <1505371738-128683-3-git-send-email-vadimp@mellanox.com>
References: <1505371738-128683-1-git-send-email-vadimp@mellanox.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1505371738-128683-1-git-send-email-vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jiri-rHqAuBHg3fBzbRFIqnYvSA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

The mlxreg a multifunction device driver handling LEDs, events, exposing
through sysfs reset signal, and reset causes info. These components share
a common register space.

Signed-off-by: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
---
v4->v5:
 Comments pointed out by Rob:
 - Avoid duplications in reg;
 - Remove unnecessary details in description;
 - Do not use names like phandels;
 Changes added by Vadim:
 - Combine hotplug nodes interrupt aggregation, register offset and mask
   properties into hotplug-spec properties;
 - Combine reset, cause, etc subnodes register offset, mask and effective
   bit properties into attr-spec properties;
v3->v4:
 Comments pointed out by Rob:
 - Make a separate patch /devicetree/bindings/vendor-prefixes.txt;
 - Add .txt to Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core
   and send it within this series;
 - Modify "compatible" property;
 - Modify explanation for "deferred" property;
 - Describe each subnode by its own section;
 - Don't use underscore in attribute names;
---
 .../bindings/mfd/mellanox,mlxreg-core.txt          | 165 +++++++++++++++++++++
 1 file changed, 165 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core.txt

diff --git a/Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core.txt b/Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core.txt
new file mode 100644
index 0000000..1e3cce5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core.txt
@@ -0,0 +1,165 @@
+Mellanox programmable device control.
+-------------------------------------
+This binding defines the device control interface over for Mellanox BMC based
+switches.
+
+Required properties:
+- compatible =  "mellanox,mlxreg-i2c" or
+		"mellanox,mlxreg-i2c-16"
+
+- #address-cells : must be 1;
+- #size-cells : must be 0;
+- reg : I2C address;
+
+Optional properties:
+- interrupt-parent : phandle of parent interrupt controller;
+- interrupts : interrupt line;
+- deferred : I2C deferred bus phandle;
+	     I2C bus activation order enforce for the cases when hot-plug
+	     devices are attached to I2C bus, which is initialized after the
+	     I2C bus, where programmable device is attached;
+- hotplug-spec <aggr mask>:
+	- aggr : interrupt top aggregation register offset;
+	- mask : interrupt top aggregation register mask;
+
+Optional nodes and their properties:
+ - psu : power supply unit nodes:
+	Required properties:
+	- hotplug-spec <aggr reg mask>:
+		- aggr : effective bit in aggregation interrupt mask;
+		- reg : interrupt status register offset for all group members;
+		- mask : interrupt register mask;
+	- hotplugs - list of relevant dynamic device nodes;
+ - fan : fan unit nodes:
+	Required properties:
+	- hotplug-spec <aggr reg mask>:
+		- aggr : effective bit in aggregation interrupt mask;
+		- reg : interrupt status register offset for all group members;
+		- mask : interrupt register mask;
+	- hotplugs - list of relevant dynamic device nodes;
+ - pwr : power cable nodes:
+	Required properties:
+	- hotplug-spec <aggr reg mask>:
+		- aggr : effective bit in aggregation interrupt mask;
+		- reg : interrupt status register offset for all group members;
+		- mask : interrupt register mask;
+	- hotplugs : list of relevant dynamic device nodes;
+ - host : host side nodes (CPU host side for BMC):
+	Required properties:
+	- hotplug-spec <aggr reg mask>:
+		- aggr : effective bit in aggregation interrupt mask;
+		- reg : interrupt status register offset for all group members;
+		- mask : interrupt register mask;
+	- hotplugs : list of relevant dynamic device nodes;
+ - asic : asic nodes:
+	Required properties:
+	- hotplug-spec <aggr reg mask>:
+		- aggr : effective bit in aggregation interrupt mask;
+		- reg : interrupt status register offsets array per group member;
+		- mask : interrupt register mask;
+	- hotplugs : list of relevant device nodes;
+ - reset : reset nodes for system reset operations:
+	Required properties:
+	- reset control subnodes:
+		Required properties:
+		- attr-spec <reg mask>:
+			- reg : register offset;
+			- mask : attribute mask;
+ - cause - reset cause nodes for reading system reset cause:
+	Required properties:
+	- cause info subnodes:
+		Required properties:
+		- attr-spec <reg mask>:
+			- reg : register offset;
+			- mask : attribute mask;
+ - mux - mux nodes:
+	Required properties:
+	- mux control subnodes for hardware select operations:
+		Required properties:
+		- attr-spec <reg mask bit>:
+			- reg : register offset;
+			- mask : attribute mask;
+			- bit : effective bit;
+		Optional property:
+		- hotplugs : dynamic device node selected by mux;
+ - gprw - general purpose read-write register nodes:
+	Required properties:
+	- general purpose read-write register subnodes:
+		Required properties:
+		- attr-spec <reg mask>:
+			- reg : register offset;
+			- mask : attribute mask;
+ - gpro - general purpose read only register nodes:
+	Required properties:
+	- general purpose read only register subnodes:
+		Required properties:
+		- attr-spec <reg mask>:
+			- reg : register offset.
+			- mask : attribute mask.
+ - led - led nodes for led operations control:
+	Required properties:
+	- led control nodes:
+		Required properties:
+		- attr-spec <reg mask>:
+			- reg : register offset;
+			- mask : attribute mask;
+
+Example:
+	mlxcpld-mng-ctrl@71 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupt-parent = <&gpio>;
+		interrupts = <ASPEED_GPIO(S, 1) 2>;
+		compatible = "mellanox,mlxcpld-ctrl-i2c";
+		reg = <0x71>;
+		deferred = <&i2c6>;
+		hotplug-spec = <0x3a 0x4c>;
+
+		pwr: {
+			hotplug-spec = <0x08 0x64 0x03>;
+			hotplugs = <&psu1_ctrl &psu2_ctrl>;
+		};
+
+		mux {
+			spi_burn_bios_ci {
+				attr-spec = <0x32 0xfe 0x00>;
+				hotplugs = <&spi2>;
+			};
+		};
+
+		led {
+			status-green {
+				attr-spec = <0x20 0xf0>;
+			};
+			status-red {
+				attr-spec = <0x20 0xf0>;
+			};
+		};
+
+		reset {
+			sys_power_cycle {
+				attr-spec = <0x30 0xfb>;
+			};
+		};
+
+		cause {
+			ac_power_cycle {
+				attr-spec = <0x1d 0xfe>;
+			};
+			sys_pwr_cycle: {
+				attr-spec = <0x1e 0xfb>;
+			};
+		};
+
+		gpro {
+			cpld_mng_version {
+				attr-spec <0x00 0xff 0xff>;
+			};
+		};
+
+		gprw {
+			sw_reset_cause {
+				attr-spec = <0x37 0x0f 0x0f>;
+			};
+		};
+	};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

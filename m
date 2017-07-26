From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v2 1/1] Documentation: dt-bindings: Add Device Tree bindings for Mellanox programming devices
Date: Wed, 26 Jul 2017 22:29:44 +0000
Message-ID: <1501108184-17088-2-git-send-email-vadimp@mellanox.com>
References: <1501108184-17088-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:41934 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750982AbdGZUc6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Jul 2017 16:32:58 -0400
In-Reply-To: <1501108184-17088-1-git-send-email-vadimp@mellanox.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, lee.jones@linaro.org, pavel@ucw.cz, j.anaszewski@samsung.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, jiri@resnulli.us, jacek.anaszewski@gmail.com, Vadim Pasternak <vadimp@mellanox.com>

The mlxreg a multifunction device driver handling LEDs, events, exposing
through sysfs reset signal, and reset causes info. These components share
a common register space.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 .../devicetree/bindings/mfd/mellanox,mlxreg-core   | 346 +++++++++++++++++++++
 1 file changed, 346 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core

diff --git a/Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core b/Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core
new file mode 100644
index 0000000..a90933e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core
@@ -0,0 +1,346 @@
+Mellanox programmable device control.
+-------------------------------------
+This binding defines the device control interface over I2C bus for Mellanox BMC
+based switches.
+
+Required properties:
+- compatible = "mellanox,mlxreg-i2c",
+	       "mellanox,mlxreg-i2c-16",
+	       "mellanox,mlxreg-core";
+- #address-cells : must be 1;
+- #size-cells : must be 0;
+- reg : I2C address;
+
+Optional properties:
+- interrupt-parent : phandle of parent interrupt controller;
+- interrupts : interrupt line;
+- deferred - I2C deferred bus phandle;
+	     For example, for the case when device attached to I2C bus number 4
+	     performs dynamic attachment of device to bus 12 upon some event.
+	     Due to this reason bus 4 is enforced to be activated after bus 12;
+- cell - top aggregation register offset;
+- mask - top aggregation register mask;
+- psu - power supply unit nodes:
+	- aggr_mask - effective bit in aggregation mask;
+	- reg - register offset for all group members;
+	- mask - register mask;
+	- phandles - list of relevant device nodes;
+- fan - fan unit nodes:
+	- aggr_mask - effective bit in aggregation mask;
+	- reg - register offset for all group members;
+	- mask - register mask;
+	- phandles - list of relevant device nodes;
+- pwr - power cable nodes.
+	- aggr_mask - effective bit in aggregation mask;
+	- reg - register offset for all group members;
+	- mask - register mask;
+	- phandles - list of relevant device nodes;
+- host - host side nodes (CPU host side for BMC):
+	- aggr_mask - effective bit in aggregation mask;
+	- reg - register offset for all group members;
+	- mask - register mask;
+	- phandles - list of relevant device nodes;
+- asic - asic nodes.
+	- aggr_mask - effective bit in aggregation mask;
+	- regs - register offsets array per group member;
+	- masks = register masks  array per group member;
+	- phandles - list of relevant device nodes;
+- reset - reset nodes:
+	- #address-cells : must be 1;
+	- #size-cells : must be 0;
+	- reset_name - reset control node:
+		- reg - register offset;
+		- mask - attribute mask;
+- cause - reset cause nodes:
+	- #address-cells : must be 1;
+	- #size-cells : must be 0;
+	- cause_name - cause info node:
+		- reg - register offset;
+		- mask - attribute mask;
+- mux - mux nodes:
+	- #address-cells : must be 1;
+	- #size-cells : must be 0;
+	- mux_name - mux control node:
+		- reg - register offset;
+		- mask - attribute mask;
+		- bit - effective bit;
+- gprw - general purpose register nodes:
+	- #address-cells : must be 1;
+	- #size-cells : must be 0;
+	- gprw_name - general purpose read-write register;
+		- reg - register offset;
+		- mask - attribute mask;
+- gpro - general purpose register nodes:
+	- #address-cells : must be 1;
+	- #size-cells : must be 0;
+	- gpro_name - general purpose read only register.
+		- reg - register offset.
+		- mask - attribute mask.
+- led - led nodes:
+	- #address-cells : must be 1;
+	- #size-cells : must be 0;
+	- led_name-color - led control node:
+		- label - symbolic name;
+		- reg - register offset;
+		- mask - attribute mask;
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
+		cell = <0x3a>;
+		mask = <0x4c>;
+
+		psu {
+			aggr_mask = <0x08>;
+			reg = <0x58>;
+			mask = <0x03>;
+			phandles = <&psu1_eeprom &psu2_eeprom>;
+		};
+
+		pwr {
+			aggr_mask = <0x08>;
+			reg = <0x64>;
+			mask = <0x03>;
+			phandles = <&psu1_ctrl &psu2_ctrl>;
+		};
+
+		fan {
+			aggr_mask = <0x40>;
+			reg = <0x88>;
+			mask = <0x0f>;
+			phandles = <&fan1_eeprom &fan2_eeprom &fan3_eeprom
+				    &fan4_eeprom>;
+		};
+
+		mux {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			uart_sel {
+				reg = <0x30>;
+				mask = <0xef>;
+				bit = <0x00>;
+			};
+			spi_burn_bios_ci {
+				reg = <0x32>;
+				mask = <0xfe>;
+				bit = <0x00>;
+				of-phandle = <&spi2>;
+			};
+			spi_burn_ncsi {
+				reg = <0x32>;
+				mask = <0xfd>;
+				bit = <0x00>;
+				of-phandle = <&spi2>;
+			};
+			bmc_uart_en {
+				reg = <0x32>;
+				mask = <0xdf>;
+				bit = <0x00>;
+			};
+			safe_bios1 {
+				reg = <0x35>;
+				mask = <0xfb>;
+				bit = <0x01>;
+			};
+			safe_bios2 {
+				reg = <0x35>;
+				mask = <0xf7>;
+				bit = <0x01>;
+			};
+			safe_bios_disable {
+				reg = <0x35>;
+				mask = <0xdf>;
+				bit = <0x01>;
+			};
+		};
+
+		led {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status-green {
+				reg = <0x20>;
+				mask = <0xf0>;
+			};
+			status-red {
+				reg = <0x20>;
+				mask = <0xf0>;
+			};
+			status-amber {
+				reg = <0x20>;
+				mask = <0xf0>;
+			};
+			fan1-green {
+				reg = <0x21>;
+				mask = <0xf0>;
+			};
+			fan1-red {
+				reg = <0x21>;
+				mask = <0xf0>;
+			};
+			fan2-green {
+				reg = <0x21>;
+				mask = <0x0f>;
+			};
+			fan2-red {
+				reg = <0x21>;
+				mask = <0x0f>;
+			};
+			fan3-green {
+				reg = <0x22>;
+				mask = <0xf0>;
+			};
+			fan3-red {
+				label = "fan3:red";
+				reg = <0x22>;
+				mask = <0xf0>;
+			};
+			fan4-green {
+				reg = <0x22>;
+				mask = <0x0f>;
+			};
+			fan4-red {
+				reg = <0x22>;
+				mask = <0x0f>;
+			};
+		};
+
+		reset {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			bmc_reset_soft {
+				reg = <0x17>;
+				mask = <0xfd>;
+			};
+			system_reset_hard {
+				reg = <0x17>;
+				mask = <0xfe>;
+			};
+			cpu_reset_soft {
+				reg = <0x17>;
+				mask = <0xf7>;
+			};
+			ps1_on {
+				reg = <0x30>;
+				mask = <0xfe>;
+			};
+			ps2_on {
+				label = "ps2_on";
+				reg = <0x30>;
+				mask = <0xfd>;
+			};
+			sys_power_cycle {
+				reg = <0x30>;
+				mask = <0xfb>;
+			};
+			mng_pg_ovrd {
+				reg = <0x30>;
+				mask = <0xf7>;
+			};
+			cpu_reset_hard {
+				reg = <0x30>;
+				mask = <0xdf>;
+			};
+		};
+
+		cause {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			ac_power_cycle {
+				reg = <0x1d>;
+				mask = <0xfe>;
+			};
+			dc_power_cycle {
+				reg = <0x1d>;
+				mask = <0xfd>;
+			};
+			cpu_power_down {
+				reg = <0x1d>;
+				mask = <0xfb>;
+			};
+			cpu_reboot {
+				reg = <0x1d>;
+				mask = <0xf7>;
+			};
+			cpu_shutdown {
+				reg = <0x1d>;
+				mask = <0xef>;
+			};
+			cpu_watchdog {
+				reg = <0x1d>;
+				mask = <0xef>;
+			};
+			cpu_kernel_panic {
+				reg = <0x1d>;
+				mask = <0xef>;
+			};
+			bmc_warm_reset {
+				reg = <0x71>;
+				mask = <0xfe>;
+			};
+			bmc_upgrade {
+				reg = <0x2e>;
+				mask = <0xf7>;
+			};
+		};
+
+		gpro {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			version {
+				reg = <0x00>;
+				mask = <0xff>;
+				bit = <0xff>;
+			};
+		};
+	};
+
+	mlxcpld-swb-ctrl@72 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupt-parent = <&gpio>;
+		interrupts = <ASPEED_GPIO(S, 1) 2>;
+		compatible = "mellanox,mlxcpld-ctrl-i2c";
+		reg = <0x72>;
+		deferred = <&i2c12>;
+		cell = <0x40>;
+		mask = <0x01>;
+
+		asic {
+			aggr_mask = <0x01>;
+			regs = <0x50>;
+			masks = <0x03>;
+			phandles = <&asic_thermal>;
+		};
+
+		gpro {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			version {
+				reg = <0x01>;
+				mask = <0xff>;
+				bit = <0xff>;
+			};
+		};
+
+		reset {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			asic_reset {
+				reg = <0x19>;
+				mask = <0xf7>;
+			};
+			phy_reset {
+				reg = <0x19>;
+				mask = <0xef>;
+			};
+		};
+
+	};
-- 
2.1.4

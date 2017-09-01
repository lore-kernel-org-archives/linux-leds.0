From: Rob Herring <robh@kernel.org>
Subject: Re: [patch v4 1/2] mfd: Add Mellanox regmap core driver
Date: Fri, 1 Sep 2017 11:14:33 -0500
Message-ID: <20170901161433.gpkrpjx53pjv4mid@rob-hp-laptop>
References: <1504029616-192277-1-git-send-email-vadimp@mellanox.com>
 <1504029616-192277-2-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1504029616-192277-2-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: lee.jones@linaro.org, pavel@ucw.cz, devicetree@vger.kernel.org, j.anaszewski@samsung.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, jiri@resnulli.us, gregkh@linuxfoundation.org, platform-driver-x86@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Tue, Aug 29, 2017 at 06:00:15PM +0000, Vadim Pasternak wrote:
> This patch adds core regmap platform driver for Mellanox BMC cards with
> the programmable devices based chassis control. The device logics,
> controlled by software includes:
> - Interrupt handling for chassis, ASIC, CPU events;
> - LED handling;
> - Exposes through sysfs mux, reset signals, reset cause notification;
> The patch provides support for the access to programmable device through
> the register map and allows dynamic device tree manipulation at runtime
> for removable devices.
> 
> This driver requires activator driver, which responsibility is to create
> register map and pass it to regmap core. Such activator could be based for
> example on I2C, SPI or MMIO interface.
> 
> Drivers exposes the number of hwmon attributes to sysfs according to the
> attribute groups, defined in the device tree. These attributes will be
> located for example in /sys/class/hwmon/hwmonX folder, which is a symbolic
> link to for example:
> /sys/bus/i2c/devices/4-0072/mlxreg-core.1138/hwmon/hwmon10.
> The attributes are divided to the groups, like in the below example:
>  MUX nodes
>  - safe_bios_disable
>  - spi_burn_bios_ci
>  - spi_burn_ncsi
>  - uart_sel
>  Reset nodes:
>  - sys_power_cycle
>  - bmc_upgrade
>  - asic_reset
>  Cause of reset nodes:
>  - cpu_kernel_panic
>  - cpu_shutdown
>  - bmc_warm_reset
>  General purpose RW nodes:
>  - version
> 
> Drivers also probes LED and hotplug drivers, in case device tree
> description contains LED and hotplug nodes.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
> v3->v4:
>  Comments pointed out by Lee:
>  - Split interrupt related logic into separate module and place this logic
>    within the existing Mellanox hotplug driver. Move for this reason this
>    driver from drivers/platform/x86 to drivers/platform/mellanox folder;
>  Comments pointed out by Rob:
>  - Make a separate patch /devicetree/bindings/vendor-prefixes.txt;
>  - Add .txt to Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core
>    and send it within this series;

Why did you combine this? Bindings should be separate patches.

>  - Modify "compatible" property;
>  - Modify explanation for "deferred" property;
>  - Describe each subnode by its own section;
>  - Don't use underscore in attribute names;
>  Changes added by Vadim:
>  - Add mlxreg_hotplug_device and mlxreg_core_item structures to mlxreg.h
>    and modify mlxreg_core_led_platform_data structure;
> v2->v3:
>  Changes added by Vadim:
>  - Change name of field led data in struct mlxreg_core_led_platform_data
>    in mlxreg.h;
>  - fix data position assignment in mlxreg_core_get;
>  - update name of field led data in mlxreg_core_set_led;
> v1->v2:
>  Comments pointed out by Pavel:
>  - Remove extra new line in mellanox,mlxreg-core;
>  - Replace three NOT with one in mlxreg_core_attr_show;
>  - Make error message in mlxreg_core_work_helper shorter;
>  - Make attribute assignment more readable;
>  - Separate mellanox,mlxreg-core file for sending to DT maintainers.
>  Comments pointed out by Jacek:
>  - Since  brightness_set_blocking is used instead of
>    brightness_set, three fields from mlxreg_core_led_data are removed.
> ---
>  .../bindings/mfd/mellanox,mlxreg-core.txt          | 367 +++++++++
>  MAINTAINERS                                        |   7 +
>  drivers/mfd/Kconfig                                |  15 +
>  drivers/mfd/Makefile                               |   1 +
>  drivers/mfd/mlxreg-core.c                          | 839 +++++++++++++++++++++
>  include/linux/platform_data/mlxreg.h               | 138 ++++
>  6 files changed, 1367 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core.txt
>  create mode 100644 drivers/mfd/mlxreg-core.c
>  create mode 100644 include/linux/platform_data/mlxreg.h
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core.txt b/Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core.txt
> new file mode 100644
> index 0000000..f8c776a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core.txt
> @@ -0,0 +1,367 @@
> +Mellanox programmable device control.
> +-------------------------------------
> +This binding defines the device control interface over I2C bus for Mellanox BMC
> +based switches.
> +
> +Required properties:
> +- compatible =  "mellanox,mlxreg-i2c" or
> +		"mellanox,mlxreg-i2c-16"
> +
> +- #address-cells : must be 1;
> +- #size-cells : must be 0;
> +- reg : I2C address;
> +
> +Optional properties:
> +- interrupt-parent : phandle of parent interrupt controller;
> +- interrupts : interrupt line;
> +- deferred : I2C deferred bus phandle;
> +	     I2C bus activation order enforce for the cases when hot-plug
> +	     devices are attached to I2C bus, which is initialized after the
> +	     I2C bus, where programmable device is attached;
> +- cell : top aggregation register offset;
> +- mask : top aggregation register mask;
> +
> +Optional nodes and their properties:
> + - psu : power supply unit nodes:
> +	Required properties:
> +	- aggr : effective bit in aggregation mask;
> +	- reg : register offset for all group members;
> +	- mask : register mask;
> +	- phandles - list of relevant device nodes;
> + - fan : fan unit nodes:
> +	Required properties:
> +	- aggr : effective bit in aggregation mask;
> +	- reg : register offset for all group members;
> +	- mask : register mask;
> +	- phandles - list of relevant device nodes;
> + - pwr : power cable nodes:
> +	Required properties:
> +	- aggr : effective bit in aggregation mask;
> +	- reg : register offset for all group members;
> +	- mask : register mask;
> +	- phandles : list of relevant device nodes;
> + - host : host side nodes (CPU host side for BMC):
> +	Required properties:
> +	- aggr : effective bit in aggregation mask;
> +	- reg : register offset for all group members;
> +	- mask : register mask;
> +	- phandles : list of relevant device nodes;
> + - asic : asic nodes:
> +	Required properties:
> +	- aggr : effective bit in aggregation mask;
> +	- regs : register offsets array per group member;
> +	- masks : register masks  array per group member;
> +	- phandles : list of relevant device nodes;
> + - reset : reset nodes:
> +	Required properties:
> +	- #address-cells : must be 1;
> +	- #size-cells : must be 0;
> +	- reset control subnodes:
> +		Required properties:
> +		- reg : register offset;
> +		- mask : attribute mask;
> + - cause - reset cause nodes:
> +	Required properties:
> +	- #address-cells : must be 1;
> +	- #size-cells : must be 0;
> +	- cause info subnodes:
> +		Required properties:
> +		- reg : register offset;
> +		- mask : attribute mask;
> + - mux - mux nodes:
> +	Required properties:
> +	- #address-cells : must be 1;
> +	- #size-cells : must be 0;
> +	- mux control subnodes:
> +		Required properties:
> +		- reg : register offset;
> +		- mask : attribute mask;
> +		- bit : effective bit;
> +	Optional property:
> +		- phandles : relevant device node;
> + - gprw - general purpose register nodes:
> +	Required properties:
> +	- #address-cells : must be 1;
> +	- #size-cells : must be 0;
> +	- general purpose read-write register subnodes:
> +		Required properties:
> +		- reg : register offset;
> +		- mask : attribute mask;
> + - gpro - general purpose register nodes:
> +	Required properties:
> +	- #address-cells : must be 1;
> +	- #size-cells : must be 0;
> +	- general purpose read only register  subnodes:
> +		Required properties:
> +		- reg : register offset.
> +		- mask : attribute mask.
> + - led - led nodes:
> +	Required properties:
> +	- #address-cells : must be 1;
> +	- #size-cells : must be 0;
> +	- led control nodes:
> +		Required properties:
> +		- label : symbolic name;
> +		- reg : register offset;
> +		- mask : attribute mask;
> +
> +Example:
> +	mlxcpld-mng-ctrl@71 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		interrupt-parent = <&gpio>;
> +		interrupts = <ASPEED_GPIO(S, 1) 2>;
> +		compatible = "mellanox,mlxcpld-ctrl-i2c";
> +		reg = <0x71>;
> +		deferred = <&i2c6>;
> +		cell = <0x3a>;
> +		mask = <0x4c>;
> +
> +		psu {
> +			aggr = <0x08>;
> +			reg = <0x58>;
> +			mask = <0x03>;
> +			phandles = <&psu1_eeprom &psu2_eeprom>;
> +		};
> +
> +		pwr {
> +			aggr = <0x08>;
> +			reg = <0x64>;
> +			mask = <0x03>;
> +			phandles = <&psu1_ctrl &psu2_ctrl>;
> +		};
> +
> +		fan {
> +			aggr = <0x40>;
> +			reg = <0x88>;
> +			mask = <0x0f>;
> +			phandles = <&fan1_eeprom &fan2_eeprom &fan3_eeprom
> +				    &fan4_eeprom>;
> +		};
> +
> +		mux {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			uart_sel {
> +				reg = <0x30>;
> +				mask = <0xef>;
> +				bit = <0x00>;
> +			};
> +			spi_burn_bios_ci {
> +				reg = <0x32>;
> +				mask = <0xfe>;
> +				bit = <0x00>;
> +				phandles = <&spi2>;
> +			};
> +			spi_burn_ncsi {
> +				reg = <0x32>;

You can't have duplicate reg values. This will also generate warnings. 
Build your dtb with "W=2".

Again, this all looks too low level to me. You described the high level 
differences in terms of number of cards, fans, PSUs, etc., but I don't 
see that here. This isn't reviewable for anyone not familiar with your 
systems.

> +				mask = <0xfd>;
> +				bit = <0x00>;
> +				phandles = <&spi2>;

Not a good name other than giving type information. Name it for what 
function is being provided (e.g. clocks, interrupts, gpios).

> +			};
> +			bmc_uart_en {
> +				reg = <0x32>;
> +				mask = <0xdf>;
> +				bit = <0x00>;
> +			};
> +			safe_bios1 {
> +				reg = <0x35>;
> +				mask = <0xfb>;
> +				bit = <0x01>;
> +			};
> +			safe_bios2 {
> +				reg = <0x35>;
> +				mask = <0xf7>;
> +				bit = <0x01>;
> +			};
> +			safe_bios_disable {
> +				reg = <0x35>;
> +				mask = <0xdf>;
> +				bit = <0x01>;
> +			};
> +		};
> +
> +		led {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status-green {
> +				reg = <0x20>;
> +				mask = <0xf0>;
> +			};
> +			status-red {
> +				reg = <0x20>;
> +				mask = <0xf0>;
> +			};
> +			status-amber {
> +				reg = <0x20>;
> +				mask = <0xf0>;
> +			};
> +			fan1-green {
> +				reg = <0x21>;
> +				mask = <0xf0>;
> +			};
> +			fan1-red {
> +				reg = <0x21>;
> +				mask = <0xf0>;
> +			};
> +			fan2-green {
> +				reg = <0x21>;
> +				mask = <0x0f>;
> +			};
> +			fan2-red {
> +				reg = <0x21>;
> +				mask = <0x0f>;
> +			};
> +			fan3-green {
> +				reg = <0x22>;
> +				mask = <0xf0>;
> +			};
> +			fan3-red {
> +				label = "fan3:red";
> +				reg = <0x22>;
> +				mask = <0xf0>;
> +			};
> +			fan4-green {
> +				reg = <0x22>;
> +				mask = <0x0f>;
> +			};
> +			fan4-red {
> +				reg = <0x22>;
> +				mask = <0x0f>;
> +			};
> +		};
> +
> +		reset {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			bmc_reset_soft {
> +				reg = <0x17>;
> +				mask = <0xfd>;
> +			};
> +			system_reset_hard {
> +				reg = <0x17>;
> +				mask = <0xfe>;
> +			};
> +			cpu_reset_soft {
> +				reg = <0x17>;
> +				mask = <0xf7>;
> +			};
> +			ps1_on {
> +				reg = <0x30>;
> +				mask = <0xfe>;
> +			};
> +			ps2_on {
> +				label = "ps2_on";
> +				reg = <0x30>;
> +				mask = <0xfd>;
> +			};
> +			sys_power_cycle {
> +				reg = <0x30>;
> +				mask = <0xfb>;
> +			};
> +			mng_pg_ovrd {
> +				reg = <0x30>;
> +				mask = <0xf7>;
> +			};
> +			cpu_reset_hard {
> +				reg = <0x30>;
> +				mask = <0xdf>;
> +			};
> +		};
> +
> +		cause {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			ac_power_cycle {
> +				reg = <0x1d>;
> +				mask = <0xfe>;
> +			};
> +			dc_power_cycle {
> +				reg = <0x1d>;
> +				mask = <0xfd>;
> +			};
> +			cpu_power_down {
> +				reg = <0x1d>;
> +				mask = <0xfb>;
> +			};
> +			cpu_reboot {
> +				reg = <0x1d>;
> +				mask = <0xf7>;
> +			};
> +			cpu_shutdown {
> +				reg = <0x1d>;
> +				mask = <0xef>;
> +			};
> +			cpu_watchdog {
> +				reg = <0x1d>;
> +				mask = <0xef>;
> +			};
> +			cpu_kernel_panic {
> +				reg = <0x1d>;
> +				mask = <0xef>;
> +			};
> +			bmc_warm_reset {
> +				reg = <0x71>;
> +				mask = <0xfe>;
> +			};
> +			bmc_upgrade {
> +				reg = <0x2e>;
> +				mask = <0xf7>;
> +			};
> +		};
> +
> +		gpro {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			version {
> +				reg = <0x00>;
> +				mask = <0xff>;
> +				bit = <0xff>;
> +			};
> +		};
> +	};
> +
> +	mlxcpld-swb-ctrl@72 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		interrupt-parent = <&gpio>;
> +		interrupts = <ASPEED_GPIO(S, 1) 2>;
> +		compatible = "mellanox,mlxcpld-ctrl-i2c";
> +		reg = <0x72>;
> +		deferred = <&i2c12>;
> +		cell = <0x40>;
> +		mask = <0x01>;
> +
> +		asic {
> +			aggr = <0x01>;
> +			regs = <0x50>;
> +			masks = <0x03>;
> +			phandles = <&asic_thermal>;
> +		};
> +
> +		gpro {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			version {
> +				reg = <0x01>;
> +				mask = <0xff>;
> +				bit = <0xff>;
> +			};
> +		};
> +
> +		reset {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			asic_reset {
> +				reg = <0x19>;
> +				mask = <0xf7>;
> +			};
> +			phy_reset {
> +				reg = <0x19>;
> +				mask = <0xef>;
> +			};
> +		};
> +
> +	};

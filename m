From: Rob Herring <robh@kernel.org>
Subject: Re: [patch v3 1/2] mfd: Add Mellanox regmap core driver
Date: Thu, 10 Aug 2017 12:29:21 -0500
Message-ID: <20170810172921.xjc4uz7rnrwe3fjx@rob-hp-laptop>
References: <1501761733-21885-1-git-send-email-vadimp@mellanox.com>
 <1501761733-21885-2-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:33513 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752629AbdHJR3X (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Aug 2017 13:29:23 -0400
Content-Disposition: inline
In-Reply-To: <1501761733-21885-2-git-send-email-vadimp@mellanox.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: lee.jones@linaro.org, pavel@ucw.cz, devicetree@vger.kernel.org, j.anaszewski@samsung.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, jiri@resnulli.us, jacek.anaszewski@gmail.com

On Thu, Aug 03, 2017 at 12:02:12PM +0000, Vadim Pasternak wrote:
> This patch adds core regmap platform driver for Mellanox BMC cards with
> the programmable devcies based chassis control. The device logics,
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
> example on I2C, SPI or  MMIO interface.
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
>  PSU nodes' statuses
>  - psu1
>  - psu2
>  FAN nodes' statuses:
>  - fan1
>  - fan2
>  Power cable nodes' statuses:
>  - pwr1
>  - pwr2
>  Asic nodes' statuses:
>  - asic1
>  - asic2
>  General purpose RW nodes:
>  - version
> 
> Drivers also probes LED platform driver, in case device tree description
> contains LED nodes.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
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
>  - Separate mellanox,mlxreg-core file for sending to DT mainataners.
>  Comments pointed out by Jacek:
>  - Since  brightness_set_blocking is used instead of
>    brightness_set, three fields from mlxreg_core_led_data.
> ---
>  .../devicetree/bindings/vendor-prefixes.txt        |    1 +

Please make this a separate patch.

>  MAINTAINERS                                        |    7 +
>  drivers/mfd/Kconfig                                |   15 +
>  drivers/mfd/Makefile                               |    1 +
>  drivers/mfd/mlxreg-core.c                          | 1263 ++++++++++++++++++++
>  include/linux/platform_data/mlxreg.h               |   87 ++
>  6 files changed, 1374 insertions(+)
>  create mode 100644 drivers/mfd/mlxreg-core.c
>  create mode 100644 include/linux/platform_data/mlxreg.h


> diff --git a/MAINTAINERS b/MAINTAINERS
> index 767e9d2..bcb7f45 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8294,6 +8294,13 @@ S:	Supported
>  F:	drivers/input/touchscreen/melfas_mip4.c
>  F:	Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt
>  
> +MELLANOX BMC MFD DRIVERS
> +M:	Vadim Pasternak <vadimp@mellanox.com>
> +S:	Supported
> +F:	Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core

The binding should be part of this series. And add a ".txt" to this 
file.

> +F:	drivers/mfd/mlxreg-core.c
> +F:	include/linux/platform_data/mlxreg.h
> +
>  MELLANOX ETHERNET DRIVER (mlx4_en)
>  M:	Tariq Toukan <tariqt@mellanox.com>
>  L:	netdev@vger.kernel.org

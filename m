From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [patch v2 1/2] mfd: Add Mellanox regmap core driver
Date: Mon, 7 Aug 2017 16:58:36 +0100
Message-ID: <20170807155836.uqa2nezqqheg6so6@dell>
References: <1501108094-16898-1-git-send-email-vadimp@mellanox.com>
 <1501108094-16898-2-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:38512 "EHLO
        mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751443AbdHGP6k (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 7 Aug 2017 11:58:40 -0400
Received: by mail-wm0-f47.google.com with SMTP id m85so10537617wma.1
        for <linux-leds@vger.kernel.org>; Mon, 07 Aug 2017 08:58:39 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1501108094-16898-2-git-send-email-vadimp@mellanox.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: robh+dt@kernel.org, pavel@ucw.cz, devicetree@vger.kernel.org, j.anaszewski@samsung.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, jiri@resnulli.us, jacek.anaszewski@gmail.com

On Wed, 26 Jul 2017, Vadim Pasternak wrote:

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
>  MAINTAINERS                                        |    7 +
>  drivers/mfd/Kconfig                                |   15 +
>  drivers/mfd/Makefile                               |    1 +
>  drivers/mfd/mlxreg-core.c                          | 1257 ++++++++++++++++++++
>  include/linux/platform_data/mlxreg.h               |   87 ++
>  6 files changed, 1368 insertions(+)
>  create mode 100644 drivers/mfd/mlxreg-core.c
>  create mode 100644 include/linux/platform_data/mlxreg.h

I'm not sure what this driver is, but it isn't an MFD driver.  MFD
drivers purpose is to set up shared resources, then register child
device drivers which live in other subsystems.  Since this device
appears to be networking related, perhaps it might find a suitable
home in drivers/net.  Failing that, you need to split out each of the
functions into their own subsystems; drivers/input, drivers/hwmon,
drivers/reset, etc and supply an MFD driver to register them all.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

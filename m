From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [patch v5 1/2] mfd: Add Mellanox regmap core driver
Date: Thu, 14 Sep 2017 10:43:14 +0100
Message-ID: <20170914094314.qadkjvc6kup2nchx@dell>
References: <1505371738-128683-1-git-send-email-vadimp@mellanox.com>
 <1505371738-128683-2-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:45202 "EHLO
        mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751699AbdINJnS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 14 Sep 2017 05:43:18 -0400
Received: by mail-wm0-f53.google.com with SMTP id g206so9166158wme.0
        for <linux-leds@vger.kernel.org>; Thu, 14 Sep 2017 02:43:17 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1505371738-128683-2-git-send-email-vadimp@mellanox.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: robh+dt@kernel.org, pavel@ucw.cz, devicetree@vger.kernel.org, jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, jiri@resnulli.us, gregkh@linuxfoundation.org, andy.shevchenko@gmail.com, platform-driver-x86@vger.kernel.org

On Thu, 14 Sep 2017, Vadim Pasternak wrote:

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
> v4->v5:
>  Comments pointed out by Lee:
>  - Remove mlxreg-i2c module from the patchset;
>  Changes added by Vadim:
>  - Remove include/linux/platform_data/mlxreg.h from the patcheset, since
>    it have been sent with
>  - Modify dts parsing routines;
>  - Disable compliation of_update_property if CONFIG_COMPILE_TEST is set;
> v3->v4:
>  Comments pointed out by Lee:
>  - Split interrupt related logic into separate module and place this logic
>    within the existing Mellanox hotplug driver. Move for this reason this
>    driver from drivers/platform/x86 to drivers/platform/mellanox folder;
>  Comments pointed out by Rob:
>  - Make a separate patch /devicetree/bindings/vendor-prefixes.txt;
>  - Add .txt to Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core
>    and send it within this series;
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
>  MAINTAINERS               |   6 +
>  drivers/mfd/Kconfig       |  14 +
>  drivers/mfd/Makefile      |   1 +
>  drivers/mfd/mlxreg-core.c | 843 ++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 864 insertions(+)
>  create mode 100644 drivers/mfd/mlxreg-core.c

I thought we agreed that this was not an MFD driver?

If it doesn't use the MFD framework, it's not an MFD driver.

Looking at it very briefly, it appears at though it should actually be
split up.  In your commit message you say that this is a platform
driver that does LED handling and deals with the regmap and HWMON
subsystem.

I suggest moving the core code into /drivers/platform/* and split the
other sections into their own drivers within their own subsystems.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

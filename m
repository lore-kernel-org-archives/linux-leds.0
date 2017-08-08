From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [patch v2 1/2] mfd: Add Mellanox regmap core driver
Date: Tue, 8 Aug 2017 08:02:11 +0100
Message-ID: <20170808070211.ikxbzkygymlolavv@dell>
References: <1501108094-16898-1-git-send-email-vadimp@mellanox.com>
 <1501108094-16898-2-git-send-email-vadimp@mellanox.com>
 <20170807155836.uqa2nezqqheg6so6@dell>
 <AM4PR05MB3330A1043B618D723EFF4C8DA28A0@AM4PR05MB3330.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AM4PR05MB3330A1043B618D723EFF4C8DA28A0-n5Jp0YuYvM1LPiJj6BpYmdqRiQSDpxhJvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pavel-+ZI9xUNit7I@public.gmane.org" <pavel-+ZI9xUNit7I@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org" <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, "linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "jiri-rHqAuBHg3fBzbRFIqnYvSA@public.gmane.org" <jiri-rHqAuBHg3fBzbRFIqnYvSA@public.gmane.org>, "jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Tue, 08 Aug 2017, Vadim Pasternak wrote:
> > -----Original Message-----
> > From: Lee Jones [mailto:lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org]
> > Sent: Monday, August 07, 2017 6:59 PM
> > To: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> > Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; pavel-+ZI9xUNit7I@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> > j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org; rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org; linux-
> > leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; jiri-rHqAuBHg3fBzbRFIqnYvSA@public.gmane.org; jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> > Subject: Re: [patch v2 1/2] mfd: Add Mellanox regmap core driver
> > 
> > On Wed, 26 Jul 2017, Vadim Pasternak wrote:
> > 
> > > This patch adds core regmap platform driver for Mellanox BMC cards
> > > with the programmable devcies based chassis control. The device
> > > logics, controlled by software includes:
> > > - Interrupt handling for chassis, ASIC, CPU events;
> > > - LED handling;
> > > - Exposes through sysfs mux, reset signals, reset cause notification;
> > > The patch provides support for the access to programmable device
> > > through the register map and allows dynamic device tree manipulation
> > > at runtime for removable devices.
> > >
> > > This driver requires activator driver, which responsibility is to
> > > create register map and pass it to regmap core. Such activator could
> > > be based for example on I2C, SPI or  MMIO interface.
> > >
> > > Drivers exposes the number of hwmon attributes to sysfs according to
> > > the attribute groups, defined in the device tree. These attributes
> > > will be located for example in /sys/class/hwmon/hwmonX folder, which
> > > is a symbolic link to for example:
> > > /sys/bus/i2c/devices/4-0072/mlxreg-core.1138/hwmon/hwmon10.
> > > The attributes are divided to the groups, like in the below example:
> > >  MUX nodes
> > >  - safe_bios_disable
> > >  - spi_burn_bios_ci
> > >  - spi_burn_ncsi
> > >  - uart_sel
> > >  Reset nodes:
> > >  - sys_power_cycle
> > >  - bmc_upgrade
> > >  - asic_reset
> > >  Cause of reset nodes:
> > >  - cpu_kernel_panic
> > >  - cpu_shutdown
> > >  - bmc_warm_reset
> > >  PSU nodes' statuses
> > >  - psu1
> > >  - psu2
> > >  FAN nodes' statuses:
> > >  - fan1
> > >  - fan2
> > >  Power cable nodes' statuses:
> > >  - pwr1
> > >  - pwr2
> > >  Asic nodes' statuses:
> > >  - asic1
> > >  - asic2
> > >  General purpose RW nodes:
> > >  - version
> > >
> > > Drivers also probes LED platform driver, in case device tree
> > > description contains LED nodes.
> > >
> > > Signed-off-by: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> > > ---
> > > v1->v2:
> > >  Comments pointed out by Pavel:
> > >  - Remove extra new line in mellanox,mlxreg-core;
> > >  - Replace three NOT with one in mlxreg_core_attr_show;
> > >  - Make error message in mlxreg_core_work_helper shorter;
> > >  - Make attribute assignment more readable;
> > >  - Separate mellanox,mlxreg-core file for sending to DT mainataners.
> > >  Comments pointed out by Jacek:
> > >  - Since  brightness_set_blocking is used instead of
> > >    brightness_set, three fields from mlxreg_core_led_data.
> > > ---
> > >  .../devicetree/bindings/vendor-prefixes.txt        |    1 +
> > >  MAINTAINERS                                        |    7 +
> > >  drivers/mfd/Kconfig                                |   15 +
> > >  drivers/mfd/Makefile                               |    1 +
> > >  drivers/mfd/mlxreg-core.c                          | 1257 ++++++++++++++++++++
> > >  include/linux/platform_data/mlxreg.h               |   87 ++
> > >  6 files changed, 1368 insertions(+)
> > >  create mode 100644 drivers/mfd/mlxreg-core.c  create mode 100644
> > > include/linux/platform_data/mlxreg.h
> > 
> > I'm not sure what this driver is, but it isn't an MFD driver.  MFD drivers
> > purpose is to set up shared resources, then register child device drivers
> > which live in other subsystems.  Since this device appears to be networking
> > related, perhaps it might find a suitable home in drivers/net.  Failing that, you
> > need to split out each of the functions into their own subsystems;
> > drivers/input, drivers/hwmon, drivers/reset, etc and supply an MFD driver to
> > register them all.
> 
> Hi Lee,
> 
> Thank you for your reply.
> 
> This driver sets the shared resources of programmable (CPLD or FPGA) devices. This devices are used to control different functionalities, like LED, Watchdog,  PWM, IC.
> System can be equipped with several programmable devices, each of them can contain logic for LED, WD, PWM, IC. Configuration is coming from DTS.
> 
> Actually it doesn't deal with the networking at all.
> In core driver I put code, which parses device table tree, exposes several types of registers to sysfs and then register a child device.
> 
> This version of the driver has been provided for system with BMC card. This system is equipped with four CPLDs. One of these CPLD has LED control logic, all of them have IC logic.
> On these system WD and PWM are controlled by BMC SoC (Aspeed 2520).
> 
> Registers with reset and reset cause info, just exposed to the user space through sysfs and in BMC they just used by IPMI demon and doesn't have special handling in kernel and doesn't require kernel driver.
> 
> I am planning to add the drivers for WD and PWM in the future, when we'll have the systems required such functionalities.
> Currently I support only LED driver, which is located in drivers/leds.
> And there is no special place for IC, so I located this code within  the regmap core driver.
> 
> Main purpose of IC part is hotplug control for the dynamic units or components, for example for PSUs, FANs.
> For example the below record specifies programmable device register and mask, which triggers probing or removing relevant PSU controller driver:  
> 		pwr {
> 			aggr_mask = <0x08>;
> 			reg = <0x64>;
> 			mask = <0x03>;
> 			phandles = <&psu1_ctrl &psu2_ctrl>;
> 		};
> 
> So, currently I have mfd related driver in drivers/leds, and going to have also drivers in drivers/watchdog and drivers/hwmon (or drivers/pwm).
> And for IC functionality there is no suitable place, so it seems to be logical to not split it into the separate driver and keep it within mlxreg-core.
> 
>  What do you think?

Why don't you extend the support you already provide in
drivers/platform?  This seems like a logical place for an all
encompassing device which cannot be split out to individual
subsystems.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

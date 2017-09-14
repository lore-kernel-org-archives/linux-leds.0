From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [patch v5 1/2] mfd: Add Mellanox regmap core driver
Date: Thu, 14 Sep 2017 13:12:19 +0100
Message-ID: <20170914121219.bgk77tbv7w3qaay6@dell>
References: <1505371738-128683-1-git-send-email-vadimp@mellanox.com>
 <1505371738-128683-2-git-send-email-vadimp@mellanox.com>
 <20170914094314.qadkjvc6kup2nchx@dell>
 <AM4PR05MB3330C8A2EC48D27BC66C7FB4A26F0@AM4PR05MB3330.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AM4PR05MB3330C8A2EC48D27BC66C7FB4A26F0@AM4PR05MB3330.eurprd05.prod.outlook.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "pavel@ucw.cz" <pavel@ucw.cz>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Thu, 14 Sep 2017, Vadim Pasternak wrote:

> 
> > > v4->v5:
> > >  Comments pointed out by Lee:
> > >  - Remove mlxreg-i2c module from the patchset;  Changes added by
> > > Vadim:
> > >  - Remove include/linux/platform_data/mlxreg.h from the patcheset, since
> > >    it have been sent with
> > >  - Modify dts parsing routines;
> > >  - Disable compliation of_update_property if CONFIG_COMPILE_TEST is
> > > set;
> > > v3->v4:
> > >  Comments pointed out by Lee:
> > >  - Split interrupt related logic into separate module and place this logic
> > >    within the existing Mellanox hotplug driver. Move for this reason this
> > >    driver from drivers/platform/x86 to drivers/platform/mellanox
> > > folder;  Comments pointed out by Rob:
> > >  - Make a separate patch /devicetree/bindings/vendor-prefixes.txt;
> > >  - Add .txt to Documentation/devicetree/bindings/mfd/mellanox,mlxreg-
> > core
> > >    and send it within this series;
> > >  - Modify "compatible" property;
> > >  - Modify explanation for "deferred" property;
> > >  - Describe each subnode by its own section;
> > >  - Don't use underscore in attribute names;  Changes added by Vadim:
> > >  - Add mlxreg_hotplug_device and mlxreg_core_item structures to mlxreg.h
> > >    and modify mlxreg_core_led_platform_data structure;
> > > v2->v3:
> > >  Changes added by Vadim:
> > >  - Change name of field led data in struct mlxreg_core_led_platform_data
> > >    in mlxreg.h;
> > >  - fix data position assignment in mlxreg_core_get;
> > >  - update name of field led data in mlxreg_core_set_led;
> > > v1->v2:
> > >  Comments pointed out by Pavel:
> > >  - Remove extra new line in mellanox,mlxreg-core;
> > >  - Replace three NOT with one in mlxreg_core_attr_show;
> > >  - Make error message in mlxreg_core_work_helper shorter;
> > >  - Make attribute assignment more readable;
> > >  - Separate mellanox,mlxreg-core file for sending to DT maintainers.
> > >  Comments pointed out by Jacek:
> > >  - Since  brightness_set_blocking is used instead of
> > >    brightness_set, three fields from mlxreg_core_led_data are removed.
> > > ---
> > >  MAINTAINERS               |   6 +
> > >  drivers/mfd/Kconfig       |  14 +
> > >  drivers/mfd/Makefile      |   1 +
> > >  drivers/mfd/mlxreg-core.c | 843
> > > ++++++++++++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 864 insertions(+)
> > >  create mode 100644 drivers/mfd/mlxreg-core.c
> > 
> > I thought we agreed that this was not an MFD driver?
> 
> Your comment was regarding mlxreg-i2c module, which I removed from the
> patchset. So I was under impression that we agreed about mlx reg-i2c, but not
> about mlxreg-core.
> 
> > 
> > If it doesn't use the MFD framework, it's not an MFD driver.
> > 
> > Looking at it very briefly, it appears at though it should actually be split up.
> > In your commit message you say that this is a platform driver that does LED
> > handling and deals with the regmap and HWMON subsystem.
> > 
> > I suggest moving the core code into /drivers/platform/* and split the other
> > sections into their own drivers within their own subsystems.
> 
> According to your suggestion for patch v2 IC related code was splitted in v3,
> while LED driver has been separated in initial patchset version.
> Which other sections you suggested to split?
> There is now hwmon driver functionality within mlxreg-core. It expose some
> Registers with, f.e. reset and reset cause info to the user space through sysfs. 
> Also regmap is just the common interface, which is used by driver.
> 
> This driver, LED, IC and as I wrote before, there is a plan to extend it with WD
> and PWM drivers work against the same programmable device.
> So at the moment I provided two child devices for led and platform subsystems
> and planned to add  two more for hwmon or pwm and watchdog subsystems.
> 
> And all of them uses the same register space, accessible through regmap
> Interface.
> Based on the above I considered such driver as MFD.
> 
> Why do you think that drivers/platform is more suitable location, is it because
> I am using for subsystem drivers activation platform_device_add and not
> mfd_add_devices?
> Or there are some others considerations?

After a closer look, it seems as though some of it could be converted
into an MFD driver, but my prediction is that it's going to require
almost a complete re-write and we're going to need to re-work it over
several submissions.

The first thing you need to do is convert all of the hand rolled
platform device registration over to the MFD API.

The rest of the code is a mess.  It's over-complicated and mostly
unreadable.  What is it that you're trying to achieve?  What does the
device do and how does it function?  Do you have a datasheet that
you're working from?

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

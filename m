From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 6/9] mfd: add TI LMU hardware fault monitoring driver
Date: Tue, 12 Jan 2016 07:37:32 +0000
Message-ID: <20160112073732.GI19803@x1>
References: <1448521025-2796-1-git-send-email-milo.kim@ti.com>
 <1448521025-2796-7-git-send-email-milo.kim@ti.com>
 <20160111102117.GU14104@x1>
 <569474DB.3090408@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:34801 "EHLO
	mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933814AbcALHhg (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 Jan 2016 02:37:36 -0500
Received: by mail-wm0-f49.google.com with SMTP id u188so243754496wmu.1
        for <linux-leds@vger.kernel.org>; Mon, 11 Jan 2016 23:37:35 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <569474DB.3090408@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: robh+dt@kernel.org, j.anaszewski@samsung.com, broonie@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 12 Jan 2016, Milo Kim wrote:

> On 01/11/2016 07:21 PM, Lee Jones wrote:
> >On Thu, 26 Nov 2015, Milo Kim wrote:
> >
> >>LM3633 and LM3697 are TI LMU MFD device.
> >>Those devices have hardware monitoring feature which detects open o=
r
> >>short circuit case.
> >>
> >>Debugfs
> >>-------
> >>   Two files are created.
> >>     open_fault:  check light output channel is open or not.
> >>     short_fault: check light output channel is shorted or not.
> >>
> >>   The driver checks the status of backlight output channels.
> >>   LM3633 and LM3697 have same sequence to check channels, so commo=
n
> >>   functions are used.
> >>   ABI/testing document is also included.
> >>
> >>Operations
> >>----------
> >>   Two devices have common control flow but register addresses are =
different.
> >>   The structure, 'ti_lmu_reg' is used for register configuration.
> >>
> >>Event notifier
> >>--------------
> >>   After fault monitoring is done, LMU device is reset. So backligh=
t and
> >>   LED device should be reinitialized. It notifies an event as soon=
 as
> >>   the monitoring is done. Then, LM3633 and LM3697 backlight and LE=
D drivers
> >>   handle this event.
> >>
> >>Cc: Lee Jones <lee.jones@linaro.org>
> >>Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> >>Cc: Mark Brown <broonie@kernel.org>
> >>Cc: Rob Herring <robh+dt@kernel.org>
> >>Cc: devicetree@vger.kernel.org
> >>Cc: linux-leds@vger.kernel.org
> >>Cc: linux-kernel@vger.kernel.org
> >>Signed-off-by: Milo Kim <milo.kim@ti.com>
> >>---
> >>  .../ABI/testing/debugfs-ti-lmu-fault-monitor       |  32 ++
> >>  drivers/mfd/Kconfig                                |  10 +
> >>  drivers/mfd/Makefile                               |   1 +
> >>  drivers/mfd/ti-lmu-fault-monitor.c                 | 405 ++++++++=
+++++++++++++
> >
> >I think this device is part of the MFD, rather than an MFD itself.
> >Please relocate it to somewhere more appropriate.
>=20
> Actually, initial patch driver was created under 'drivers/hwmon/'
> but HWMON maintainer pointed this driver doesn't include HW sensor
> feature.
> So I moved here.
>=20
> This driver doesn't need any subsystem infrastructure,
> 'drivers/misc/' could be OK. Does it make sense?

Either drivers/misc or drivers/platform I guess.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

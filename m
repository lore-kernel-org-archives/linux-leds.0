From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH/RFC 6/8] leds: Add support for max77693 mfd flash cell
Date: Fri, 21 Mar 2014 09:36:11 +0000
Message-ID: <20140321093611.GD15213@lee--X1>
References: <1395327070-20215-1-git-send-email-j.anaszewski@samsung.com>
 <1395327070-20215-7-git-send-email-j.anaszewski@samsung.com>
 <20140320153443.GD8207@lee--X1>
 <532BF6E3.10003@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <532BF6E3.10003@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-media@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, s.nawrocki@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, SangYoung Son <hello.son@smasung.com>, Samuel Ortiz <sameo@linux.intel.com>
List-Id: linux-leds@vger.kernel.org

> >>This patch adds led-flash support to Maxim max77693 chipset.
> >>Device can be exposed to user space through LED subsystem
> >>sysfs interface or through V4L2 subdevice when the support
> >>for Multimedia Framework is enabled. Device supports up to
> >>two leds which can work in flash and torch mode. Leds can
> >>be triggered externally or by software.
> >>
> >>Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> >>Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> >>Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> >>Cc: Bryan Wu <cooloney@gmail.com>
> >>Cc: Richard Purdie <rpurdie@rpsys.net>
> >>Cc: SangYoung Son <hello.son@smasung.com>
> >>Cc: Samuel Ortiz <sameo@linux.intel.com>
> >>Cc: Lee Jones <lee.jones@linaro.org>
> >>---
> >>  drivers/leds/Kconfig         |    9 +
> >>  drivers/leds/Makefile        |    1 +
> >>  drivers/leds/leds-max77693.c |  768 +++++++++++++++++++++++++++++=
+++++++++++++
> >>  drivers/mfd/max77693.c       |   21 +-
> >>  include/linux/mfd/max77693.h |   32 ++
> >>  5 files changed, 825 insertions(+), 6 deletions(-)
> >>  create mode 100644 drivers/leds/leds-max77693.c
> >
> >[...]
> >>-static const struct mfd_cell max77693_devs[] =3D {
> >>-	{ .name =3D "max77693-pmic", },
> >>-	{ .name =3D "max77693-charger", },
> >>-	{ .name =3D "max77693-flash", },
> >>-	{ .name =3D "max77693-muic", },
> >>-	{ .name =3D "max77693-haptic", },
> >>+enum mfd_devs_idx {
> >>+	IDX_PMIC,
> >>+	IDX_CHARGER,
> >>+	IDX_LED,
> >>+	IDX_MUIC,
> >>+	IDX_HAPTIC,
> >>+};
> >>+
> >>+static struct mfd_cell max77693_devs[] =3D {
> >>+	[IDX_PMIC]      =3D { .name =3D "max77693-pmic", },
> >>+	[IDX_CHARGER]   =3D { .name =3D "max77693-charger", },
> >>+	[IDX_LED]       =3D { .name =3D "max77693-led",
> >>+			    .of_compatible =3D "maxim,max77693-led"},
> >>+	[IDX_MUIC]      =3D { .name =3D "max77693-muic", },
> >>+	[IDX_HAPTIC]    =3D { .name =3D "max77693-haptic", },
> >>  };
> >
> >What is the purpose of this change?
> >
> Introducing mfd_devs_idx itself is a cosmetic change, which
> actually could be avoided. Initialization of the of_compatible field
> is required for the led driver to get matched properly. And as I've
> just realized also max77693-flash name should be preserved.
> I will fix this in the next version of the patch.

I'm happy with the addition of any .of_compatible strings, however
please leave out the IDXs in your next version(s).

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

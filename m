From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH/RFC v5 2/3] leds: Add support for max77693 mfd flash cell
Date: Thu, 21 Aug 2014 17:00:54 +0100
Message-ID: <20140821160054.GQ4266@lee--X1>
References: <1408542221-375-1-git-send-email-j.anaszewski@samsung.com>
 <1408542221-375-3-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1408542221-375-3-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, b.zolnierkie@samsung.com, Andrzej Hajda <a.hajda@samsung.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, SangYoung Son <hello.son@smasung.com>, Samuel Ortiz <sameo@linux.intel.com>
List-Id: linux-leds@vger.kernel.org

On Wed, 20 Aug 2014, Jacek Anaszewski wrote:

> This patch adds led-flash support to Maxim max77693 chipset.
> A device can be exposed to user space through LED subsystem
> sysfs interface or through V4L2 subdevice when the support
> for V4L2 Flash sub-devices is enabled. Device supports up to
> two leds which can work in flash and torch mode. Leds can
> be triggered externally or by software.
>=20
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: SangYoung Son <hello.son@smasung.com>
> Cc: Samuel Ortiz <sameo@linux.intel.com>
> ---
>  drivers/leds/Kconfig                 |    9 +
>  drivers/leds/Makefile                |    1 +
>  drivers/leds/leds-max77693.c         | 1048 ++++++++++++++++++++++++=
++++++++++
>  drivers/mfd/max77693.c               |    5 +-
>  include/linux/mfd/max77693-private.h |   59 ++
>  include/linux/mfd/max77693.h         |   40 ++

Please break the MFD changes out into a separate patch, I can't (at
first glace) see any reason why the changed need to be bundled
together like this.

[...]

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [patch v1 0/3] drivers/platform: replace module
 x86/mlxcpld-hotplug with mellanox/mlxreg-hotplug
Date: Wed, 30 Aug 2017 22:32:17 +0300
Message-ID: <CAHp75VcQjgDd5Eut5Ln6Di57-_DXRH5dyS92qtjwUb4tchx3VA@mail.gmail.com>
References: <1504029745-192558-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:33851 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750811AbdH3TcT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Aug 2017 15:32:19 -0400
In-Reply-To: <1504029745-192558-1-git-send-email-vadimp@mellanox.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>, Pavel Machek <pavel@ucw.cz>

On Tue, Aug 29, 2017 at 9:02 PM, Vadim Pasternak <vadimp@mellanox.com> wrote:
> The patchset modifies x86/mlxcpld-hotplug.c for making it architecture
> independent, renames to mlxreg-hotplug and moves it from
> drivers/platform/x86 folder to new drivers/platform/mellanox folder.
> This modification also introduces regmap interface for mlxreg-hotplug
> driver to allow hotplug event functionality over programmable devices
> logic, when these devices can be attached to different interfaces types,
> like I2C, LPC, SPI.
> Module include/linux/platform_data/mlxcpld-hotplug.h is removed and new
> module include/linux/platform_data/mlxreg.h is to be used instead.
> Driver drivers/platform/x86/mlx-platform.c is updated according to new
> interface.
> Relevant Makefile and Kconfig are updated.
>
> This patchset depends on previously sent:
> [patch v4 1/2] mfd: Add Mellanox regmap core driver
> because it includes include/linux/platform_data/mlxreg.h from this patch.
>

I'm fine with this from PDx86 prospective (since driver is going to be
multiplatform).

While I'm giving you my...

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

...I would still like to have a consensus with Darren on it.


> Vadim Pasternak (3):
>   platform/mellanox: Introduce Mellanox hardware platform hotplug driver
>   platform/x86: mlx-platform: modify hotplug device activation
>   platform/x86: mlxcpld-hotplug: driver removing
>
>  MAINTAINERS                                   |  12 +-
>  drivers/platform/Kconfig                      |   2 +
>  drivers/platform/Makefile                     |   1 +
>  drivers/platform/mellanox/Kconfig             |  25 +
>  drivers/platform/mellanox/Makefile            |   1 +
>  drivers/platform/mellanox/mlxreg-hotplug.c    | 712 ++++++++++++++++++++++++++
>  drivers/platform/x86/Kconfig                  |   9 -
>  drivers/platform/x86/Makefile                 |   1 -
>  drivers/platform/x86/mlx-platform.c           | 225 ++++++--
>  drivers/platform/x86/mlxcpld-hotplug.c        | 515 -------------------
>  include/linux/platform_data/mlxcpld-hotplug.h |  99 ----
>  11 files changed, 918 insertions(+), 684 deletions(-)
>  create mode 100644 drivers/platform/mellanox/Kconfig
>  create mode 100644 drivers/platform/mellanox/Makefile
>  create mode 100644 drivers/platform/mellanox/mlxreg-hotplug.c
>  delete mode 100644 drivers/platform/x86/mlxcpld-hotplug.c
>  delete mode 100644 include/linux/platform_data/mlxcpld-hotplug.h
>
> --
> 2.1.4
>



-- 
With Best Regards,
Andy Shevchenko

From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [GIT PULL] LM3532 backlight support improvements and relocation
Date: Wed, 8 May 2019 09:04:16 +0100
Message-ID: <20190508080416.GB3995@dell>
References: <20190407182514.15427-1-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190407182514.15427-1-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: tony@atomide.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Sun, 07 Apr 2019, Jacek Anaszewski wrote:

> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/lm3532-driver-improvements

Pulled, thanks.

> for you to fetch changes up to b3e9d18dc4a5e4d329dea32b59bdde5e012ae64a:
> 
>   leds: lm3532: Introduce the lm3532 LED driver (2019-04-06 21:06:07 +0200)
> 
> Thanks,
> Jacek Anaszewski
> 
> ----------------------------------------------------------------
> LM3532 backlight driver improvements and relocation.
> ----------------------------------------------------------------
> Dan Murphy (4):
>       dt: lm3532: Add lm3532 dt doc and update ti_lmu doc
>       ARM: dts: omap4-droid4: Update backlight dt properties
>       mfd: ti-lmu: Remove LM3532 backlight driver references
>       leds: lm3532: Introduce the lm3532 LED driver
> 
>  .../devicetree/bindings/leds/leds-lm3532.txt       | 101 +++
>  Documentation/devicetree/bindings/mfd/ti-lmu.txt   |  20 -
>  arch/arm/boot/dts/omap4-droid4-xt894.dts           |  27 +-
>  drivers/leds/Kconfig                               |  10 +
>  drivers/leds/Makefile                              |   1 +
>  drivers/leds/leds-lm3532.c                         | 683 +++++++++++++++++++++
>  drivers/mfd/ti-lmu.c                               |  11 -
>  include/linux/mfd/ti-lmu-register.h                |  44 --
>  include/linux/mfd/ti-lmu.h                         |   1 -
>  9 files changed, 813 insertions(+), 85 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3532.txt
>  create mode 100644 drivers/leds/leds-lm3532.c

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

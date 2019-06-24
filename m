From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 0/5] LM36274 Introduction
Date: Mon, 24 Jun 2019 15:42:17 +0100
Message-ID: <20190624144217.GJ4699@dell>
References: <20190605125634.7042-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190605125634.7042-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, broonie@kernel.org, lgirdwood@gmail.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Wed, 05 Jun 2019, Dan Murphy wrote:

> Hello
> 
> The v5 patchset missed adding in the new validation code.
> Patch 1 of the v5 series was squashed into patch 4 of the v5 series.
> So this will reduce the patchset by 1.
> 
> Sorry for the extra noise on the patchsets.  The change was lost when I converted
> the patches from the mainline branch to the LED branch.
> 
> This change was made on top of the branch
> 
> repo: https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git
> branch: ti-lmu-led-drivers
> 
> 
> Dan Murphy (5):
>   dt-bindings: mfd: Add lm36274 bindings to ti-lmu
>   mfd: ti-lmu: Add LM36274 support to the ti-lmu
>   regulator: lm363x: Add support for LM36274
>   dt-bindings: leds: Add LED bindings for the LM36274
>   leds: lm36274: Introduce the TI LM36274 LED driver
> 
>  .../devicetree/bindings/leds/leds-lm36274.txt |  82 +++++++++
>  .../devicetree/bindings/mfd/ti-lmu.txt        |  54 ++++++
>  drivers/leds/Kconfig                          |   8 +
>  drivers/leds/Makefile                         |   1 +
>  drivers/leds/leds-lm36274.c                   | 174 ++++++++++++++++++
>  drivers/mfd/Kconfig                           |   5 +-
>  drivers/mfd/ti-lmu.c                          |  14 ++
>  drivers/regulator/Kconfig                     |   2 +-
>  drivers/regulator/lm363x-regulator.c          |  78 +++++++-
>  include/linux/mfd/ti-lmu-register.h           |  23 +++
>  include/linux/mfd/ti-lmu.h                    |   4 +
>  11 files changed, 437 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm36274.txt
>  create mode 100644 drivers/leds/leds-lm36274.c

Can you finish of satisfying everyone's comments and re-send with all
the Acks you've collected so far?  If you turn this around quickly,
you might still get into v5.3.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

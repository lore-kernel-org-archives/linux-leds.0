From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [GIT PULL] Immutable branch between LEDs, MFD and REGULATOR
Date: Wed, 22 May 2019 06:42:56 +0100
Message-ID: <20190522054256.GA4574@dell>
References: <20190521203038.31946-1-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190521203038.31946-1-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org
List-Id: linux-leds@vger.kernel.org

On Tue, 21 May 2019, Jacek Anaszewski wrote:

> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/ti-lmu-led-drivers
> 
> for you to fetch changes up to 13f5750a60b923d8f3f0e23902f2ece46dd733d7:
> 
>   leds: lm36274: Introduce the TI LM36274 LED driver (2019-05-21 20:34:19 +0200)
> 
> ----------------------------------------------------------------
> TI LMU LED support rework and introduction of two new drivers
> with DT bindings:
> 
> - leds-lm3697 (entails additions to lm363x-regulator.c)
> - leds-lm36274
> ----------------------------------------------------------------
> Dan Murphy (12):

>       dt-bindings: mfd: LMU: Add the ramp up/down property
>       dt-bindings: mfd: LMU: Add ti,brightness-resolution
>       mfd: ti-lmu: Remove support for LM3697
>       mfd: ti-lmu: Add LM36274 support to the ti-lmu

These patches were Acked "for my own reference", which means I'd
at least expect a discussion on how/where they would be applied.

It's fine for them to go in via the LED tree in this instance and I do
thank you for sending a PR.  Next time can we at least agree on the
route-in though please?

>       leds: TI LMU: Add common code for TI LMU devices
>       dt-bindings: ti-lmu: Modify dt bindings for the LM3697
>       leds: lm3697: Introduce the lm3697 driver
>       regulator: lm363x: Make the gpio register enable flexible
>       dt-bindings: mfd: Add lm36274 bindings to ti-lmu
>       regulator: lm363x: Add support for LM36274
>       dt-bindings: leds: Add LED bindings for the LM36274
>       leds: lm36274: Introduce the TI LM36274 LED driver
> 
>  .../devicetree/bindings/leds/leds-lm36274.txt      |  82 +++++
>  .../devicetree/bindings/leds/leds-lm3697.txt       |  73 ++++
>  Documentation/devicetree/bindings/mfd/ti-lmu.txt   |  88 +++--
>  drivers/leds/Kconfig                               |  23 ++
>  drivers/leds/Makefile                              |   3 +
>  drivers/leds/leds-lm36274.c                        | 174 +++++++++
>  drivers/leds/leds-lm3697.c                         | 395 +++++++++++++++++++++
>  drivers/leds/leds-ti-lmu-common.c                  | 156 ++++++++
>  drivers/mfd/Kconfig                                |   5 +-
>  drivers/mfd/ti-lmu.c                               |  23 +-
>  drivers/regulator/Kconfig                          |   2 +-
>  drivers/regulator/lm363x-regulator.c               |  56 ++-
>  include/linux/leds-ti-lmu-common.h                 |  47 +++
>  include/linux/mfd/ti-lmu-register.h                |  63 ++--
>  include/linux/mfd/ti-lmu.h                         |   5 +-
>  15 files changed, 1112 insertions(+), 83 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm36274.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
>  create mode 100644 drivers/leds/leds-lm36274.c
>  create mode 100644 drivers/leds/leds-lm3697.c
>  create mode 100644 drivers/leds/leds-ti-lmu-common.c
>  create mode 100644 include/linux/leds-ti-lmu-common.h

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

From: Lee Jones <lee.jones@linaro.org>
Subject: [GIT PULL] MFD: Immutable branch between HWMON, LEDs and Watchdog
Date: Wed, 24 Sep 2014 15:49:36 +0100
Message-ID: <20140924144936.GL32069@lee--X1>
References: <cover.1409161615.git.andreas.werner@men.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1409161615.git.andreas.werner@men.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Werner <andreas.werner@men.de>
Cc: linux-kernel@vger.kernel.org, sameo@linux.intel.com, linux@roeck-us.net, lm-sensors@lm-sensors.org, wim@iguana.be, linux-watchdog@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Guenter, Bryan, Wim,

The following changes since commit 52addcf9d6669fa439387610bc65c92fa098=
0cef:
 =20
  Linux 3.17-rc2 (2014-08-25 15:36:20 -0700)
 =20
are available in the git repository at:
 =20
  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/mfd-hw=
mon-leds-watchdog-v3.18

for you to fetch changes up to 964356938fcd3c0001a786f55b9f0a0fbe47656a=
:

  hwmon: (menf21bmc) Introduce MEN14F021P00 BMC HWMON driver (2014-09-2=
4 15:36:33 +0100)

----------------------------------------------------------------
Immutable branch between MFD, HWMON, LEDs and Watchdog for v3.18

----------------------------------------------------------------
Andreas Werner (4):
      mfd: menf21bmc: Introduce MEN 14F021P00 BMC MFD Core driver
      watchdog: menf21bmc_wdt: Introduce MEN 14F021P00 BMC Watchdog dri=
ver
      leds: leds-menf21bmc: Introduce MEN 14F021P00 BMC LED driver
      hwmon: (menf21bmc) Introduce MEN14F021P00 BMC HWMON driver

 Documentation/hwmon/menf21bmc    |  50 +++++++++
 drivers/hwmon/Kconfig            |  10 ++
 drivers/hwmon/Makefile           |   1 +
 drivers/hwmon/menf21bmc_hwmon.c  | 230 +++++++++++++++++++++++++++++++=
++++++++
 drivers/leds/Kconfig             |   9 ++
 drivers/leds/Makefile            |   1 +
 drivers/leds/leds-menf21bmc.c    | 131 ++++++++++++++++++++++
 drivers/mfd/Kconfig              |  15 +++
 drivers/mfd/Makefile             |   1 +
 drivers/mfd/menf21bmc.c          | 132 ++++++++++++++++++++++
 drivers/watchdog/Kconfig         |  10 ++
 drivers/watchdog/Makefile        |   1 +
 drivers/watchdog/menf21bmc_wdt.c | 203 +++++++++++++++++++++++++++++++=
+++
 13 files changed, 794 insertions(+)
 create mode 100644 Documentation/hwmon/menf21bmc
 create mode 100644 drivers/hwmon/menf21bmc_hwmon.c
 create mode 100644 drivers/leds/leds-menf21bmc.c
 create mode 100644 drivers/mfd/menf21bmc.c
 create mode 100644 drivers/watchdog/menf21bmc_wdt.c

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

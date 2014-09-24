From: Lee Jones <lee.jones@linaro.org>
Subject: [GIT PULL] Immutable branch between MFD, HWMON, LEDs and Watchdog
Date: Wed, 24 Sep 2014 14:45:40 +0100
Message-ID: <20140924134540.GF32069@lee--X1>
References: <cover.1409161615.git.andreas.werner@men.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ig0-f182.google.com ([209.85.213.182]:62231 "EHLO
	mail-ig0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751551AbaIXNpq (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 24 Sep 2014 09:45:46 -0400
Received: by mail-ig0-f182.google.com with SMTP id hn15so6502889igb.3
        for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2014 06:45:46 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <cover.1409161615.git.andreas.werner@men.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andreas Werner <andreas.werner@men.de>
Cc: linux-kernel@vger.kernel.org, sameo@linux.intel.com, linux@roeck-us.net, lm-sensors@lm-sensors.org, wim@iguana.be, linux-watchdog@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org

The following changes since commit 52addcf9d6669fa439387610bc65c92fa098=
0cef:

  Linux 3.17-rc2 (2014-08-25 15:36:20 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/mfd-hw=
mon-leds-watchdog-v3.17

for you to fetch changes up to 25b1efbf5ff8a2475e29572065cac3d89cee24b1=
:

  hwmon: (menf21bmc) Introduce MEN14F021P00 BMC HWMON driver (2014-09-2=
4 13:31:20 +0100)

----------------------------------------------------------------
Immutable branch between MFD, HWMON, LEDs and Watchdog for v3.17

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

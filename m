From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v6 0/4] Introduce MEN 14F021P00 BMC driver series
Date: Wed, 24 Sep 2014 08:45:03 -0700
Message-ID: <20140924154503.GA12403@roeck-us.net>
References: <cover.1409161615.git.andreas.werner@men.de>
 <20140924144829.GK32069@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:32770 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752050AbaIXPpJ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 24 Sep 2014 11:45:09 -0400
Content-Disposition: inline
In-Reply-To: <20140924144829.GK32069@lee--X1>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Andreas Werner <andreas.werner@men.de>, linux-kernel@vger.kernel.org, sameo@linux.intel.com, lm-sensors@lm-sensors.org, wim@iguana.be, linux-watchdog@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org

On Wed, Sep 24, 2014 at 03:48:29PM +0100, Lee Jones wrote:
> Guenter, Bryan, Wim,
>=20
> The following changes since commit 52addcf9d6669fa439387610bc65c92fa0=
980cef:
>=20
>   Linux 3.17-rc2 (2014-08-25 15:36:20 -0700)
>=20
> are available in the git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/mfd-=
hwmon-leds-watchdog-v3.18
>=20
> for you to fetch changes up to 964356938fcd3c0001a786f55b9f0a0fbe4765=
6a:
>=20
>   hwmon: (menf21bmc) Introduce MEN14F021P00 BMC HWMON driver (2014-09=
-24 15:36:33 +0100)
>=20
> ----------------------------------------------------------------
> Immutable branch between MFD, HWMON, LEDs and Watchdog for v3.18
>=20
I assume you'll push it all through mfd, correct ?

Thanks,
Guenter

> ----------------------------------------------------------------
> Andreas Werner (4):
>       mfd: menf21bmc: Introduce MEN 14F021P00 BMC MFD Core driver
>       watchdog: menf21bmc_wdt: Introduce MEN 14F021P00 BMC Watchdog d=
river
>       leds: leds-menf21bmc: Introduce MEN 14F021P00 BMC LED driver
>       hwmon: (menf21bmc) Introduce MEN14F021P00 BMC HWMON driver
>=20
>  Documentation/hwmon/menf21bmc    |  50 +++++++++
>  drivers/hwmon/Kconfig            |  10 ++
>  drivers/hwmon/Makefile           |   1 +
>  drivers/hwmon/menf21bmc_hwmon.c  | 230 +++++++++++++++++++++++++++++=
++++++++++
>  drivers/leds/Kconfig             |   9 ++
>  drivers/leds/Makefile            |   1 +
>  drivers/leds/leds-menf21bmc.c    | 131 ++++++++++++++++++++++
>  drivers/mfd/Kconfig              |  15 +++
>  drivers/mfd/Makefile             |   1 +
>  drivers/mfd/menf21bmc.c          | 132 ++++++++++++++++++++++
>  drivers/watchdog/Kconfig         |  10 ++
>  drivers/watchdog/Makefile        |   1 +
>  drivers/watchdog/menf21bmc_wdt.c | 203 +++++++++++++++++++++++++++++=
+++++
>  13 files changed, 794 insertions(+)
>  create mode 100644 Documentation/hwmon/menf21bmc
>  create mode 100644 drivers/hwmon/menf21bmc_hwmon.c
>  create mode 100644 drivers/leds/leds-menf21bmc.c
>  create mode 100644 drivers/mfd/menf21bmc.c
>  create mode 100644 drivers/watchdog/menf21bmc_wdt.c
>=20
> --=20
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog

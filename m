From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 2/4] drivers/watchdog/menf21bmc_wdt: introduce MEN
 14F021P00 BMC Watchdog driver
Date: Wed, 24 Sep 2014 13:35:48 +0100
Message-ID: <20140924123548.GE32069@lee--X1>
References: <cover.1409161615.git.andreas.werner@men.de>
 <f21b275c79866e0aa9bbc59e195ae5424e538300.1409161615.git.andreas.werner@men.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ig0-f177.google.com ([209.85.213.177]:36096 "EHLO
	mail-ig0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750936AbaIXMfy (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 24 Sep 2014 08:35:54 -0400
Received: by mail-ig0-f177.google.com with SMTP id h3so6384581igd.16
        for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2014 05:35:54 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <f21b275c79866e0aa9bbc59e195ae5424e538300.1409161615.git.andreas.werner@men.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andreas Werner <andreas.werner@men.de>
Cc: linux-kernel@vger.kernel.org, sameo@linux.intel.com, linux@roeck-us.net, lm-sensors@lm-sensors.org, wim@iguana.be, linux-watchdog@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org

On Wed, 27 Aug 2014, Andreas Werner wrote:

> Added driver to support the 14F021P00 BMC Watchdog.
> The BMC is a Board Management Controller including watchdog functiona=
lity.
>=20
> Signed-off-by: Andreas Werner <andreas.werner@men.de>
> ---
>  drivers/watchdog/Kconfig         |  10 ++
>  drivers/watchdog/Makefile        |   1 +
>  drivers/watchdog/menf21bmc_wdt.c | 203 +++++++++++++++++++++++++++++=
++++++++++
>  3 files changed, 214 insertions(+)
>  create mode 100644 drivers/watchdog/menf21bmc_wdt.c

I see no reason to keep this dragging on.  I'm going to apply this
along with the remainder of the set and send a pull-request to all the
other Maintainers.  This branch is currently under test.

Any fix-ups for review comments can go in subsequently.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

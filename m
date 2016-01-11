From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 5/9] mfd: add TI LMU driver
Date: Mon, 11 Jan 2016 10:17:29 +0000
Message-ID: <20160111101729.GT14104@x1>
References: <1448521025-2796-1-git-send-email-milo.kim@ti.com>
 <1448521025-2796-6-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:36440 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758130AbcAKKRd (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 11 Jan 2016 05:17:33 -0500
Received: by mail-wm0-f46.google.com with SMTP id l65so204545491wmf.1
        for <linux-leds@vger.kernel.org>; Mon, 11 Jan 2016 02:17:33 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1448521025-2796-6-git-send-email-milo.kim@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: robh+dt@kernel.org, j.anaszewski@samsung.com, broonie@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 26 Nov 2015, Milo Kim wrote:

> TI LMU (Lighting Management Unit) driver supports lighting devices be=
low.
>=20
>   LM3532, LM3631, LM3632, LM3633, LM3695 and LM3697.
>=20
> LMU devices have common features.
>   - I2C interface for accessing device registers
>   - Hardware enable pin control
>   - Backlight brightness control
>   - Notifier for hardware fault monitoring
>   - Regulators for LCD display bias
>=20
> It contains fault monitor, backlight, LED and regulator driver.
>=20
> LMU fault monitor
> -----------------
>   LM3633 and LM3697 provide hardware monitoring feature.
>   It enables open or short circuit detection.
>   After monitoring is done, each device should be re-initialized.
>   Notifier is used for this case.
>   Please refer to separate patch for 'ti-lmu-fault-monitor'.
>=20
> Backlight
> ---------
>   It's handled by TI LMU backlight consolidated driver and
>   chip dependent data. Please refer to separate patches for
>   'ti-lmu-backlight'.
>=20
> LED indicator
> -------------
>   LM3633 has 6 indicator LEDs. Programmable dimming pattern is also
>   supported. Please refer to separate patch for 'leds-lm3633'.
>=20
> Regulator
> ---------
>   LM3631 has 5 regulators for the display bias.
>   LM3632 supports 3 regulators. One consolidated driver enables it.
>   Please refer to separate patch for 'lm363x-regulator'.
>=20
> Cc: Lee Jones <lee.jones@linaro.org>=20
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-leds@vger.kernel.org=20
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Milo Kim <milo.kim@ti.com>
> ---
>  drivers/mfd/Kconfig                 |  12 ++
>  drivers/mfd/Makefile                |   2 +
>  drivers/mfd/ti-lmu.c                | 259 ++++++++++++++++++++++++++=
+++++++
>  include/linux/mfd/ti-lmu-register.h | 280 ++++++++++++++++++++++++++=
++++++++++
>  include/linux/mfd/ti-lmu.h          |  87 +++++++++++
>  5 files changed, 640 insertions(+)
>  create mode 100644 drivers/mfd/ti-lmu.c
>  create mode 100644 include/linux/mfd/ti-lmu-register.h
>  create mode 100644 include/linux/mfd/ti-lmu.h

Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

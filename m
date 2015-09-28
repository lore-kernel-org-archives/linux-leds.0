From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCHv3 2/3] backlight: add led-backlight driver
Date: Mon, 28 Sep 2015 11:31:54 +0100
Message-ID: <20150928103154.GO27197@x1>
References: <1441976857-26548-1-git-send-email-tomi.valkeinen@ti.com>
 <1441976857-26548-3-git-send-email-tomi.valkeinen@ti.com>
 <5608F66E.8020703@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:34429 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932198AbbI1Kb6 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 28 Sep 2015 06:31:58 -0400
Received: by wicfx3 with SMTP id fx3so97760469wic.1
        for <linux-leds@vger.kernel.org>; Mon, 28 Sep 2015 03:31:57 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <5608F66E.8020703@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-fbdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>

On Mon, 28 Sep 2015, Tomi Valkeinen wrote:
> > This patch adds a led-backlight driver (led_bl), which is similar t=
o
> > pwm_bl except the driver uses a LED class driver to adjust the
> > brightness in the HW.
> >=20
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > ---
> >  drivers/video/backlight/Kconfig  |   7 ++
> >  drivers/video/backlight/Makefile |   1 +
> >  drivers/video/backlight/led_bl.c | 246 +++++++++++++++++++++++++++=
++++++++++++
> >  3 files changed, 254 insertions(+)
> >  create mode 100644 drivers/video/backlight/led_bl.c
>=20
> Any comments on the backlight side of this series? It is very similar=
 to
> the pwm_bl.c, so I presume the approach is acceptable?

Jingoo?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

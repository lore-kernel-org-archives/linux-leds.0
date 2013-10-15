From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] leds: Added driver for the NXP PCA9685 I2C chip
Date: Tue, 15 Oct 2013 09:37:38 +0900
Message-ID: <006b01cec93e$c00a2a10$401e7e30$%han@samsung.com>
References: <2819232.mPNW6mO2uH@titan>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:16530 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752529Ab3JOAhn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 14 Oct 2013 20:37:43 -0400
In-reply-to: <2819232.mPNW6mO2uH@titan>
Content-language: ko
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?ISO-8859-1?Q?'Maximilian_G=FCntner'?= <maximilian.guentner@gmail.com>
Cc: 'Bryan Wu' <cooloney@gmail.com>, 'Richard Purdie' <rpurdie@rpsys.net>, 'linux-kernel' <linux-kernel@vger.kernel.org>, 'linux-leds' <linux-leds@vger.kernel.org>, 'Jingoo Han' <jg1.han@samsung.com>

On Tuesday, October 15, 2013 2:32 AM, Maximilian Guntner wrote:
>=20
> The NXP PCA9685 supports 16 channels/leds using a 12-bit PWM (4095
> levels of brightness)
> This driver supports configuration using platform_data.
>=20
> Signed-off-by: Maximilian G=FCntner <maximilian.guentner@gmail.com>

I added some nit-picking comments. :-)

> ---
>  drivers/leds/Kconfig                       |  10 ++
>  drivers/leds/Makefile                      |   1 +
>  drivers/leds/leds-pca9685.c                | 219 +++++++++++++++++++=
++++++++++
>  include/linux/platform_data/leds-pca9685.h |  34 +++++
>  4 files changed, 264 insertions(+)
>  create mode 100644 drivers/leds/leds-pca9685.c
>  create mode 100644 include/linux/platform_data/leds-pca9685.h
>=20

[.....]

> +
> +#include <linux/module.h>
> +#include <linux/string.h>
> +#include <linux/delay.h>
> +#include <linux/ctype.h>
> +#include <linux/leds.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/workqueue.h>
> +#include <linux/slab.h>
> +
> +#include <linux/platform_data/leds-pca9685.h>

Please, sort these header inclusions alphabetically for
better readability.

[.....]

> +#ifndef __LINUX_PCA9685_H
> +#define __LINUX_PCA9685_H

You can add one empty line here.

> +#include <linux/leds.h>
> +

Best regards,
Jingoo Han

--
To unsubscribe from this list: send the line "unsubscribe linux-leds" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

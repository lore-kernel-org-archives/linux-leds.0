From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: ktd2692: pass flags parameter to devm_gpiod_get
Date: Fri, 12 Jun 2015 13:35:25 +0200
Message-ID: <557AC3FD.2080601@samsung.com>
References: <1434094343-10349-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:11200 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750753AbbFLLf3 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 12 Jun 2015 07:35:29 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NPT00F5TXJ2CUA0@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 12 Jun 2015 12:35:27 +0100 (BST)
In-reply-to: <1434094343-10349-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, kernel@pengutronix.de, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Ingi Kim <ingi2.kim@samsung.com>, Varka Bhadram <varkabhadram@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>

Hi Uwe,

On 06/12/2015 09:32 AM, Uwe Kleine-K=C3=B6nig wrote:
> Since 39b2bbe3d715 (gpio: add flags argument to gpiod_get*() function=
s)
> which appeared in v3.17-rc1, the gpiod_get* functions take an additio=
nal
> parameter that allows to specify direction and initial value for outp=
ut.
>
> In this case the driver cannot easily be simplified but as the flags
> parameter will become mandatory soon this change is necessary
> beforehand.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>

--=20
Best Regards,
Jacek Anaszewski

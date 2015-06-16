From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] leds: ktd2692: pass flags parameter to devm_gpiod_get
Date: Tue, 16 Jun 2015 12:12:22 -0700
Message-ID: <CAK5ve-K0zS6oGNg_hjQcO+EqRjo+OG7ggwQaj6admvfdvF7CGA@mail.gmail.com>
References: <1434094343-10349-1-git-send-email-u.kleine-koenig@pengutronix.de> <557AC3FD.2080601@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:35668 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932303AbbFPTMn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 16 Jun 2015 15:12:43 -0400
Received: by pacyx8 with SMTP id yx8so18347728pac.2
        for <linux-leds@vger.kernel.org>; Tue, 16 Jun 2015 12:12:43 -0700 (PDT)
In-Reply-To: <557AC3FD.2080601@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, kernel@pengutronix.de, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Ingi Kim <ingi2.kim@samsung.com>, Varka Bhadram <varkabhadram@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>

On Fri, Jun 12, 2015 at 4:35 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> Hi Uwe,
>
> On 06/12/2015 09:32 AM, Uwe Kleine-K=C3=B6nig wrote:
>>
>> Since 39b2bbe3d715 (gpio: add flags argument to gpiod_get*() functio=
ns)
>> which appeared in v3.17-rc1, the gpiod_get* functions take an additi=
onal
>> parameter that allows to specify direction and initial value for out=
put.
>>
>> In this case the driver cannot easily be simplified but as the flags
>> parameter will become mandatory soon this change is necessary
>> beforehand.
>>
>> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de=
>
>
>
> Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>
Thanks, merged.
-Bryan

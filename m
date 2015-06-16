From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] leds: aat1290: pass flags parameter to devm_gpiod_get
Date: Tue, 16 Jun 2015 12:17:05 -0700
Message-ID: <CAK5ve-LK5B01H3+HMxwNDNLYLujbXG3WPWZSpZSDg8iZAewd1g@mail.gmail.com>
References: <1434094543-18665-1-git-send-email-u.kleine-koenig@pengutronix.de> <557AC431.1000406@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:33872 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757093AbbFPTR1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 16 Jun 2015 15:17:27 -0400
Received: by pacgb13 with SMTP id gb13so18423913pac.1
        for <linux-leds@vger.kernel.org>; Tue, 16 Jun 2015 12:17:26 -0700 (PDT)
In-Reply-To: <557AC431.1000406@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, kernel@pengutronix.de, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Sakari Ailus <sakari.ailus@linux.intel.com>

On Fri, Jun 12, 2015 at 4:36 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> Hi Uwe,
>
> On 06/12/2015 09:35 AM, Uwe Kleine-K=C3=B6nig wrote:
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
merged into my tree and it will be merged into 4.2 merge window.
Thanks,
-Bryan

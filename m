From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/2] leds: trigger: gpio: Add update point / use threaded IRQ
Date: Sat, 27 May 2017 18:02:31 +0300
Message-ID: <CAHp75VdCiMoJjBg3UTSXoAoTZsDDhWYrzeHYV8Yds1hF4oX6xw@mail.gmail.com>
References: <cover.1495804666.git.jan.kiszka@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qt0-f181.google.com ([209.85.216.181]:35857 "EHLO
        mail-qt0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751209AbdE0PCd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 27 May 2017 11:02:33 -0400
In-Reply-To: <cover.1495804666.git.jan.kiszka@siemens.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Fri, May 26, 2017 at 4:17 PM, Jan Kiszka <jan.kiszka@siemens.com> wrote:
> See patches for details.
>

FWIW:
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

P.S. Of course it would be also nice to convert to GPIO descriptors,
though it's not related to this series.

> Jan Kiszka (2):
>   leds: trigger: gpio: Refresh LED state after GPIO change
>   leds: trigger: gpio: Use threaded IRQ
>
>  drivers/leds/trigger/ledtrig-gpio.c | 29 +++++++----------------------
>  1 file changed, 7 insertions(+), 22 deletions(-)
>
> --
> 2.12.0
>



-- 
With Best Regards,
Andy Shevchenko

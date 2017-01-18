From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 4/6] platform/x86: dell-laptop: import
 dell_micmute_led_set() from drivers/leds/dell-led.c
Date: Wed, 18 Jan 2017 21:12:10 +0200
Message-ID: <CAHp75Vcp8vriBqR0ZUbPCZ2Q+Dio3=hkjSLBG2PH2ys71rfBug@mail.gmail.com>
References: <20170116132204.6421-1-kernel@kempniu.pl> <20170116132204.6421-5-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:34993 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752690AbdARTMQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Jan 2017 14:12:16 -0500
In-Reply-To: <20170116132204.6421-5-kernel@kempniu.pl>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Anthony Wong <anthony.wong@canonical.com>, linux-leds@vger.kernel.org, Platform Driver <platform-driver-x86@vger.kernel.org>, ALSA Development Mailing List <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jan 16, 2017 at 3:22 PM, Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempn=
iu.pl> wrote:
> To ensure all users of dell-smbios are in drivers/platform/x86, move the
> dell_micmute_led_set() method from drivers/leds/dell-led.c to
> drivers/platform/x86/dell-laptop.c.
>

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Couple of nitpicks below.

> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -30,6 +30,7 @@
>  #include <linux/i8042.h>
>  #include <linux/debugfs.h>

>  #include <linux/seq_file.h>
> +#include <linux/dell-led.h>

Perhaps move this one line above

> +#define GLOBAL_MIC_MUTE_ENABLE 0x364
> +#define GLOBAL_MIC_MUTE_DISABLE 0x365

Same as Pali told.

--=20
With Best Regards,
Andy Shevchenko

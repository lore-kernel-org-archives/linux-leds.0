From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 4/5] leds: clevo-mail: fix incorrect placement of
 __initdata marker
Date: Wed, 26 Feb 2014 09:30:37 +0100
Message-ID: <20140226083037.GB6865@pengutronix.de>
References: <000b01cf32b0$eb62fe40$c228fac0$%han@samsung.com>
 <000e01cf32b1$ac754340$055fc9c0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:35035 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750814AbaBZIal (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2014 03:30:41 -0500
Content-Disposition: inline
In-Reply-To: <000e01cf32b1$ac754340$055fc9c0$%han@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: 'Bryan Wu' <cooloney@gmail.com>, linux-leds@vger.kernel.org, 'Richard Purdie' <rpurdie@rpsys.net>, =?iso-8859-1?Q?'M=E1rton_N=E9meth'?= <nm127@freemail.hu>, 'Ondrej Zary' <linux@rainbow-software.org>

Hello,

On Wed, Feb 26, 2014 at 02:14:49PM +0900, Jingoo Han wrote:
> diff --git a/drivers/leds/leds-clevo-mail.c b/drivers/leds/leds-clevo=
-mail.c
> index d93e245..5974810 100644
> --- a/drivers/leds/leds-clevo-mail.c
> +++ b/drivers/leds/leds-clevo-mail.c
> @@ -19,7 +19,7 @@ MODULE_AUTHOR("M=E1rton N=E9meth <nm127@freemail.hu=
>");
>  MODULE_DESCRIPTION("Clevo mail LED driver");
>  MODULE_LICENSE("GPL");
> =20
> -static bool __initdata nodetect;
> +static bool nodetect __initdata;
>  module_param_named(nodetect, nodetect, bool, 0);
>  MODULE_PARM_DESC(nodetect, "Skip DMI hardware detection");
not sure why I'm on Cc, but yes, the change is in line with gcc docs.
But I wonder if __initdata is ok for a variable backing a module
parameter as it appears in /sys. Does

	cat /sys/module/leds-clevo-mail/parameters/nodetect

result in an oops? If yes, better drop the __initdata instead of moving
it.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |

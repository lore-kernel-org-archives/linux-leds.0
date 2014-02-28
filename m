From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/2] leds: clevo-mail: remove unnecessary __initdata
 marker
Date: Fri, 28 Feb 2014 11:29:43 +0100
Message-ID: <20140228102943.GO6865@pengutronix.de>
References: <000c01cf3456$34b8ecc0$9e2ac640$%han@samsung.com>
 <001101cf3456$593bd940$0bb38bc0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:43124 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751342AbaB1K3r (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 28 Feb 2014 05:29:47 -0500
Content-Disposition: inline
In-Reply-To: <001101cf3456$593bd940$0bb38bc0$%han@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: 'Bryan Wu' <cooloney@gmail.com>, linux-leds@vger.kernel.org, 'Richard Purdie' <rpurdie@rpsys.net>, =?iso-8859-1?Q?'M=E1rton_N=E9meth'?= <nm127@freemail.hu>, 'Ondrej Zary' <linux@rainbow-software.org>

Hi,

On Fri, Feb 28, 2014 at 04:26:08PM +0900, Jingoo Han wrote:
> Remove unnecessary __initdata marker, because it is not right
> for a module parameter. It may make the kernel oops problem.
I wouldn't call it "unnecessary". Does the kernel oops if you access th=
e
parameter's sysfs file with __initdata in place or doesn't it? If so
it's definitly not unnecessary but plain wrong.

Best regards
Uwe
>=20
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  drivers/leds/leds-clevo-mail.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/leds/leds-clevo-mail.c b/drivers/leds/leds-clevo=
-mail.c
> index d93e245..19202f5 100644
> --- a/drivers/leds/leds-clevo-mail.c
> +++ b/drivers/leds/leds-clevo-mail.c
> @@ -19,7 +19,7 @@ MODULE_AUTHOR("M=E1rton N=E9meth <nm127@freemail.hu=
>");
>  MODULE_DESCRIPTION("Clevo mail LED driver");
>  MODULE_LICENSE("GPL");
> =20
> -static bool __initdata nodetect;
> +static bool nodetect;
>  module_param_named(nodetect, nodetect, bool, 0);
>  MODULE_PARM_DESC(nodetect, "Skip DMI hardware detection");
> =20
> --=20
> 1.7.10.4
>=20
>=20
>=20

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |

From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 3/3] leds/pwm: fix driver description and make license
 match the header
Date: Thu, 19 Nov 2015 20:17:37 +0100
Message-ID: <20151119191737.GF22022@pengutronix.de>
References: <1385412225-29740-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1385412225-29740-4-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:47388 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756314AbbKSTRm (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 19 Nov 2015 14:17:42 -0500
Content-Disposition: inline
In-Reply-To: <1385412225-29740-4-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Shawn Guo <shawn.guo@linaro.org>, Matt Sealey <matt@genesi-usa.com>

Hello,

while the other two patches in this thread are controversal, this one
shouldn't. It still sits in my branch with unapplied patches since
nearly two years, which is enormous considering it's such an easy patch=
=2E

Best regards
Uwe

On Mon, Nov 25, 2013 at 09:43:45PM +0100, Uwe Kleine-K=F6nig wrote:
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/leds/leds-pwm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> index cdc3e4d..0796ca3 100644
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -239,6 +239,6 @@ static struct platform_driver led_pwm_driver =3D =
{
>  module_platform_driver(led_pwm_driver);
> =20
>  MODULE_AUTHOR("Luotao Fu <l.fu@pengutronix.de>");
> -MODULE_DESCRIPTION("PWM LED driver for PXA");
> -MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("generic PWM LED driver");
> +MODULE_LICENSE("GPL v2");
>  MODULE_ALIAS("platform:leds-pwm");
> --=20
> 1.8.4.2
>=20
>=20

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |

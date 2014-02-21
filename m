From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 0/3] leds/pwm: don't call pwm_disable when setting
 brightness
Date: Fri, 21 Feb 2014 15:15:07 +0100
Message-ID: <20140221141507.GB12555@pengutronix.de>
References: <1385412225-29740-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:36230 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755191AbaBUOPQ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 21 Feb 2014 09:15:16 -0500
Content-Disposition: inline
In-Reply-To: <1385412225-29740-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Shawn Guo <shawn.guo@linaro.org>, Matt Sealey <matt@genesi-usa.com>

On Mon, Nov 25, 2013 at 09:43:42PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> some time ago I pointed out a problem with leds-pwm on i.MX28, becaus=
e
> on this SoC it can happen that after:
>=20
> 	pwm_config(pwm, 0, period);
> 	pwm_disable(pwm);
>=20
> the connected LED stays on. The mail thread is available at
>=20
> 	http://thread.gmane.org/gmane.linux.kernel/1381289
>=20
> This series implements the outcome that didn't get any opposition, i.=
e.
> the pin state is explicitly undefined after pwm_disable. The first pa=
tch
> adds this fact to the general pwm docs, the second patch fixes the
> leds-pwm driver accordingly. The third patch is just a trivial fix th=
at
> I noticed while patching the leds-pwm driver and not really related t=
o
> any problem.
>=20
> Best regards
> Uwe
Ping. Even if patches 1 and 2 are maybe controversal, patch 3 should be
ok.

Do you still have the problem addressed by the first two patches on you=
r
radar?

Best regards
Uwe
=20
> Uwe Kleine-K=F6nig (3):
>   pwm/doc: Clearify that the pin state after pwm_disable is undefined
>   leds/pwm: Don't disable pwm when setting brightness to 0
>   leds/pwm: fix driver description and make license match the header
>=20
>  Documentation/pwm.txt   |  5 +++++
>  drivers/leds/leds-pwm.c | 14 +++++++-------
>  2 files changed, 12 insertions(+), 7 deletions(-)

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |

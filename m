From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/3] leds/pwm: Don't disable pwm when setting brightness
 to 0
Date: Mon, 2 Dec 2013 14:18:07 +0100
Message-ID: <20131202131807.GC29721@pengutronix.de>
References: <1385412225-29740-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1385412225-29740-3-git-send-email-u.kleine-koenig@pengutronix.de>
 <20131202123318.GC12793@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:39700 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751039Ab3LBNSM (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 2 Dec 2013 08:18:12 -0500
Content-Disposition: inline
In-Reply-To: <20131202123318.GC12793@ulmo.nvidia.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Shawn Guo <shawn.guo@linaro.org>, Matt Sealey <matt@genesi-usa.com>

On Mon, Dec 02, 2013 at 01:33:19PM +0100, Thierry Reding wrote:
> On Mon, Nov 25, 2013 at 09:43:44PM +0100, Uwe Kleine-K=F6nig wrote:
> > This fixes disabling the LED on i.MX28. The PWM hardware delays usi=
ng
> > the newly set pwm-config until the beginning of a new period. It's =
very
> > likely that pwm_disable is called before the current period ends. I=
n
> > case the LED was on brightness=3Dmax before the LED stays on becaus=
e in
> > the disabled PWM block the period never ends.
> >=20
> > Also only call pwm_enable only once in the probe call back and the
> > matching pwm_disable in .remove(). Moreover the pwm is explicitly
> > initialized to off.
>=20
> While I do understand the reasoning behind this, if this is really th=
e
> behaviour that we need then there's no use in having pwm_enable() and
> pwm_disable() at all. They can just be folded into pwm_get() and
> pwm_put(), respectively.
So after the first pwm_get the pwm starts with an unspecified duty
cycle? That's not that nice, is it?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |

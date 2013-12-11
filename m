From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/3] leds/pwm: Don't disable pwm when setting brightness
 to 0
Date: Wed, 11 Dec 2013 16:30:51 +0100
Message-ID: <20131211153050.GE31617@ulmo.nvidia.com>
References: <1385412225-29740-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1385412225-29740-3-git-send-email-u.kleine-koenig@pengutronix.de>
 <20131202123318.GC12793@ulmo.nvidia.com>
 <20131202131807.GC29721@pengutronix.de>
 <20131205212641.GC4707@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ytoMbUMiTKPMT3hY"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-bk0-f51.google.com ([209.85.214.51]:54143 "EHLO
	mail-bk0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750971Ab3LKPcI (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 11 Dec 2013 10:32:08 -0500
Received: by mail-bk0-f51.google.com with SMTP id 6so373632bkj.24
        for <linux-leds@vger.kernel.org>; Wed, 11 Dec 2013 07:32:07 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20131205212641.GC4707@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Shawn Guo <shawn.guo@linaro.org>, Matt Sealey <matt@genesi-usa.com>


--ytoMbUMiTKPMT3hY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 05, 2013 at 10:26:41PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello Thierry,
>=20
> On Mon, Dec 02, 2013 at 02:18:07PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > On Mon, Dec 02, 2013 at 01:33:19PM +0100, Thierry Reding wrote:
> > > On Mon, Nov 25, 2013 at 09:43:44PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > > > This fixes disabling the LED on i.MX28. The PWM hardware delays usi=
ng
> > > > the newly set pwm-config until the beginning of a new period. It's =
very
> > > > likely that pwm_disable is called before the current period ends. In
> > > > case the LED was on brightness=3Dmax before the LED stays on becaus=
e in
> > > > the disabled PWM block the period never ends.
> > > >=20
> > > > Also only call pwm_enable only once in the probe call back and the
> > > > matching pwm_disable in .remove(). Moreover the pwm is explicitly
> > > > initialized to off.
> > >=20
> > > While I do understand the reasoning behind this, if this is really the
> > > behaviour that we need then there's no use in having pwm_enable() and
> > > pwm_disable() at all. They can just be folded into pwm_get() and
> > > pwm_put(), respectively.
> > So after the first pwm_get the pwm starts with an unspecified duty
> > cycle? That's not that nice, is it?
> How can we come forward here? After all it's a real bug being fixed.

I've thought about this some more, and this isn't actually fixing a bug.
Rather it's working around some quirk of the hardware in your setup. So
in the long run I think the best option would have to be to define the
behaviour of the PWM subsystem, and then make sure in drivers that they
behave accordingly. So if we define, or rather keep with the existing
implied behaviour, that the configuration is active when pwm_config()
returns, we can easily write generic client drivers because it means
they can rely on said behaviour. If a driver doesn't behave accordingly
it needs to be fixed.

If that means that a particular PWM controller applies the configuration
only after the current period has expired, then that's something only
the driver can now and therefore the driver should handle this by only
returning from pwm_config() when that's actually happened.

That seems to me the only reasonable approach. Otherwise we'll have to
keep changing API whenever some new controller comes around that behaves
slightly differently.

Thierry

--ytoMbUMiTKPMT3hY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSqIUqAAoJEN0jrNd/PrOhseUQAKWlGtRVuI6N6yrj3W3tna77
TF9hSrYqbcHb7QQumTzc9VXSmN+08tpd38+AHSoka4x4zeSLMuwJlPLc8lKk5M1Y
NR7qUrAKP/GAfGDlvzLmLRK09dzc3ClIcb8CwywUkzqvrEvnarVKDPiCbMaHYYVK
kAE6shjpq7E7izvOa1VS2gmMSz0dkYPmqOoK9/ZaymWW/efQNQhC4HQHkvFjhIrA
K63/UBenTQWauoJ4irI9LzSQRKBofDMj39vCFHKnjtZ29EBipPksoSOlc//UMmfp
x3LKS8wQbbiOfvx7s7lMIOklZ4rGHsk4EKEClAWYkoMMzYEF18POrg1svw9QHyxJ
1C6wTfVi7hLDMqWN/rUVJIloXB5/FlfjIkU6Qa19gZXMXxcdpmozZD7rVf8Oghwc
kNAn7M03ufpmMJFnLkRxdHcCaPEa6mKiFggUncsRQanREKsFS1l3uw8eg8zm7tDt
PQPfqMWkLDbnsxTYFLzsffzIOL/JFYltN8LdFGGRpW142559Kq5axCEyeYKe1dZi
hR75pfDZctMRXMc9buXdDDTpRyYYCWJ8vIlGy8UB/uiaVFVtU4BDfwoXXbp9J/Ae
PvQmGHFxter3/TaRal2QrxefFd8PszD7SB0gg7pYtxrKnDqptNtSPzEKdwM4CDeA
JMBIvsXQ1Rz2YgJ20+HG
=NHos
-----END PGP SIGNATURE-----

--ytoMbUMiTKPMT3hY--

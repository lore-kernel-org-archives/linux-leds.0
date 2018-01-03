From: Pavel Machek <pavel@ucw.cz>
Subject: Re: Add driver for MCP45HV51 (digital potentiometer)
Date: Wed, 3 Jan 2018 21:02:38 +0100
Message-ID: <20180103200237.GA6261@amd>
References: <17da226a-247b-153a-6743-3e33264a1f0c@gmail.com>
 <20180103175628.GA31502@amd>
 <b4331c91-b35c-5e02-d70e-daf7cc689442@gmail.com>
 <20180103190026.GA4564@amd>
 <48a0948b-daca-5526-2fa4-f82fa0074606@gmail.com>
 <13bcf912-56c7-5f18-aef7-4a5f5332e30d@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:35395 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750989AbeACUCj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 3 Jan 2018 15:02:39 -0500
Content-Disposition: inline
In-Reply-To: <13bcf912-56c7-5f18-aef7-4a5f5332e30d@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?iso-8859-1?Q?Ga=EBtan?= Carlier <gcembed@gmail.com>
Cc: linux-leds@vger.kernel.org


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>Is that _output_ device? What does it control?
> >>
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Pavel
> >>
> >
> >It is an output with a variable resistance (like DAC is an output with a
> >variable voltage).[1]
> >So regarding the webpage of IIO[2], digital potentiometer must be coded =
on
> >IIO API.

Well.. you could argue soundcard is DAC with variable output voltage,
too.

In kernel, we group devices according to the function, not hw implementatio=
n.

Anyway, go for IIO, its likely good match.


> >[1] https://en.wikipedia.org/wiki/Digital_potentiometer
> >[2] https://wiki.analog.com/software/linux/docs/iio/iio
> After a deeper search on a recent branch, potentiometer are already handl=
ed
> in IIO layer :D

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlpNNt0ACgkQMOfwapXb+vKYUgCdH8dqulf41dOGL6nJc3WpPVxV
ZvEAn2rZp56FQ5eUvazcNooK1cqu/3EG
=NYAc
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--

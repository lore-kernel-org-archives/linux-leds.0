From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] Documentation: small fixes for LEDs, hide notes about
 vibration
Date: Tue, 29 Aug 2017 22:38:46 +0200
Message-ID: <20170829203846.GB21650@amd>
References: <20170828095051.GA19930@amd>
 <991f8a29-75b7-891d-cd33-a1e50f91e67d@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:33414 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750909AbdH2Uis (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Aug 2017 16:38:48 -0400
Content-Disposition: inline
In-Reply-To: <991f8a29-75b7-891d-cd33-a1e50f91e67d@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net, Andrew Morton <akpm@osdl.org>, linux-leds@vger.kernel.org


--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > -As a specific example of this use-case, let's look at vibrate feature =
on
> > -phones. Vibrate function on phones is implemented using PWM pins on So=
C or
> > -PMIC. There is a need to activate one shot timer to control the vibrate
> > -feature, to prevent user space crashes leaving the phone in vibrate mo=
de
> > -permanently causing the battery to drain.
>=20
> I'm not sure if it is a good idea to remove this description. Users will
> still be able to use transient trigger this way. It has been around for
> five years already and there are users which employ it in this
> particular way [0].

I am. Yes, people were doing that, but no, vibration motor is not a
LED. PWM behaviour is different, for example, motor is likely to stop
at low PWM values. We do not want people to do that.

> Apart from that it's the only documented kernel API for vibrate devices
> AFAICT.

Input subsystem has force-feedback protocol, which is very often just
vibrations. Documentation/input/ff.rst . Nokia N900 phone actually
uses that API.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlml0NYACgkQMOfwapXb+vJ1KgCguJqcgrYCnbuEBsmqwefdGJ7a
KXcAn1hCPbviUBFIo0oXHBAkMJTzFQvC
=WoUb
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--

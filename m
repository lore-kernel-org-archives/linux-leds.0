From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] Documentation: small fixes for LEDs, hide notes about
 vibration
Date: Thu, 31 Aug 2017 10:09:11 +0200
Message-ID: <20170831080911.GA9597@amd>
References: <20170828095051.GA19930@amd>
 <991f8a29-75b7-891d-cd33-a1e50f91e67d@gmail.com>
 <20170829203846.GB21650@amd>
 <08225c07-9467-c146-98e7-66ccb4265624@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <08225c07-9467-c146-98e7-66ccb4265624@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net, Andrew Morton <akpm@osdl.org>, linux-leds@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: linux-leds@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2017-08-30 22:44:00, Jacek Anaszewski wrote:
> Hi,
>=20
> On 08/29/2017 10:38 PM, Pavel Machek wrote:
> > Hi!
> >=20
> >>> -As a specific example of this use-case, let's look at vibrate featur=
e on
> >>> -phones. Vibrate function on phones is implemented using PWM pins on =
SoC or
> >>> -PMIC. There is a need to activate one shot timer to control the vibr=
ate
> >>> -feature, to prevent user space crashes leaving the phone in vibrate =
mode
> >>> -permanently causing the battery to drain.
> >>
> >> I'm not sure if it is a good idea to remove this description. Users wi=
ll
> >> still be able to use transient trigger this way. It has been around for
> >> five years already and there are users which employ it in this
> >> particular way [0].

Actually, I checked, and no ARM mainline board does that.

> > I am. Yes, people were doing that, but no, vibration motor is not a
> > LED. PWM behaviour is different, for example, motor is likely to stop
> > at low PWM values. We do not want people to do that.
>=20
> Could you elaborate on how it can be harmful?

Well, you can safely route low current to the LEDs. What will it to do
vibration motor, if you leave it on forever? Can the motor safely be
run forever on high current? Not sure.

> I really don't see any merit in removing this from documentation.

There's right API to use for vibrations, and that's force-feedback
support in input/. Not here.

> You can convince me by collecting some acks from involved people.
> I'd like to especially see Rob's opinion. Adding Rob to this thread.

Rob is device tree maintainer. This has little to do with device tree.

> >> Apart from that it's the only documented kernel API for vibrate devices
> >> AFAICT.
> >=20
> > Input subsystem has force-feedback protocol, which is very often just
> > vibrations. Documentation/input/ff.rst . Nokia N900 phone actually
> > uses that API.
>=20
> Word "vibration" doesn't appear there, so what this patch does
> is remove explicit advertisement of kernel support for vibrate
> devices without redirecting people to the replacement.

Well... this is LED documentation. If there's other documentation
missing somewhere else... we can fix it :-).
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmnxCcACgkQMOfwapXb+vJ35wCeKe4oQ0hOonEpD7QQmCurtM+Q
IxIAn3Ufb7XoJVczDZLCczkTXC8g7l5/
=nagz
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--

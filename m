From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] Documentation: small fixes for LEDs, hide notes about
 vibration
Date: Thu, 31 Aug 2017 10:05:02 +0200
Message-ID: <20170831080502.GA9071@amd>
References: <20170828095051.GA19930@amd>
 <991f8a29-75b7-891d-cd33-a1e50f91e67d@gmail.com>
 <20170829203846.GB21650@amd>
 <87k21k898y.fsf@intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87k21k898y.fsf@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net, Andrew Morton <akpm@osdl.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> > -As a specific example of this use-case, let's look at vibrate featu=
re on
> >> > -phones. Vibrate function on phones is implemented using PWM pins on=
 SoC or
> >> > -PMIC. There is a need to activate one shot timer to control the vib=
rate
> >> > -feature, to prevent user space crashes leaving the phone in vibrate=
 mode
> >> > -permanently causing the battery to drain.
> >>=20
> >> I'm not sure if it is a good idea to remove this description. Users wi=
ll
> >> still be able to use transient trigger this way. It has been around for
> >> five years already and there are users which employ it in this
> >> particular way [0].
> >
> > I am. Yes, people were doing that, but no, vibration motor is not a
> > LED. PWM behaviour is different, for example, motor is likely to stop
> > at low PWM values. We do not want people to do that.
> >
> >> Apart from that it's the only documented kernel API for vibrate devices
> >> AFAICT.
> >
> > Input subsystem has force-feedback protocol, which is very often just
> > vibrations. Documentation/input/ff.rst . Nokia N900 phone actually
> > uses that API.
>=20
> N900 as shipped by Nokia used an ad hoc sysfs interface. Because that
> sucked, I advocated using the force feedback API for N950 and
> N9. Because what is vibration but force feedback? It's a much more
> versatile API for vibration than a simple trigger. You get to upload
> effects and have the kernel play them for you, also stopping them in a
> timely manner regardless of the userspace dying and whatnot. I didn't
> double check now, but IIRC you could also link the input to force
> feedback, e.g. for touch vibrations.

Ok, N900 support in mainline actually uses force feedback, as in N9,
N950. It is the right interface.

AFAICT, no mainline ARM board uses LEDs for vibrations. And I hope to
keep it that way :-).

(OpenMoko gta01 did that, IIRC. But that is not mainline, good).
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmnwy4ACgkQMOfwapXb+vK5IgCgu3BgYdb0CldZqsCi8vprJ+qd
oGAAnjQijDujh0iCkjK4CCIPGdJMJtru
=0bD9
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--

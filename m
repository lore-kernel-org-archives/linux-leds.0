From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH AUTOSEL for 4.14 065/110] led: core: Fix brightness
 setting when setting delay_off=0
Date: Sun, 4 Feb 2018 18:17:36 +0100
Message-ID: <20180204171736.GA1388@amd>
References: <20180203180015.29073-1-alexander.levin@microsoft.com>
 <20180203180015.29073-65-alexander.levin@microsoft.com>
 <20180203203525.GA5860@amd>
 <20180204003029.2lkcmh6wvzpnlrls@sasha-lappy>
 <20180204090531.GA29468@amd>
 <20180204111500.GB14797@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180204111500.GB14797@kroah.com>
Sender: stable-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Sasha Levin <Alexander.Levin@microsoft.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Matthieu CASTET <matthieu.castet@parrot.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>
List-Id: linux-leds@vger.kernel.org


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > >> *** if brightness=3D0, led off
> > > >> *** else apply brightness if next timer <--- timer is stop, and wi=
ll never apply new setting
> > > >> ** otherwise set led_set_brightness_nosleep
> > > >>
> > > >> To fix that, when we delete the timer, we should clear LED_BLINK_S=
W.
> > > >
> > > >Can you run the tests on the affected stable kernels? I have feeling
> > > >that the problem described might not be present there.
> > >=20
> > > Hm, I don't seem to have HW to test that out. Maybe someone else does?
> >=20
> > Why are you submitting patches you have no way to test?
>=20
> What?  This is stable tree backporting, why are you trying to make a
> requirement for something that we have never had before?

I don't think random patches should be sent to stable just because
they appeared in mainline. Plus, I don't think I'm making new rules:

submit-checklist.rst:

13) Has been build- and runtime tested with and without ``CONFIG_SMP``
and
    ``CONFIG_PREEMPT.``

stable-kernel-rules.rst:

Rules on what kind of patches are accepted, and which ones are not,
into the "-stable" tree:

 - It must be obviously correct and tested.
 - It must fix a real bug that bothers people (not a, "This could be a
   problem..." type thing).
  =20
> This is a backport of a patch that is already upstream.  If it doesn't
> belong in a stable tree, great, let us know that, saying why it is so.

See jacek.anaszewski@gmail.com 's explanation.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlp3QDAACgkQMOfwapXb+vI/YACffveTs3Hsz10azlO9o1ZZOYLJ
GU8AoJ1cPi0/+F5IdeTNnCrf+fnwIwFq
=R7Be
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--

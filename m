From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH AUTOSEL for 4.14 065/110] led: core: Fix brightness
 setting when setting delay_off=0
Date: Tue, 6 Feb 2018 22:51:04 +0100
Message-ID: <20180206215104.GA25631@amd>
References: <20180203180015.29073-1-alexander.levin@microsoft.com>
 <20180203180015.29073-65-alexander.levin@microsoft.com>
 <20180203203525.GA5860@amd>
 <20180204003029.2lkcmh6wvzpnlrls@sasha-lappy>
 <20180204090531.GA29468@amd>
 <20180204111500.GB14797@kroah.com>
 <20180204171736.GA1388@amd>
 <20180206020210.m6gl7vai4p6azb6s@sasha-lappy>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180206020210.m6gl7vai4p6azb6s@sasha-lappy>
Sender: linux-kernel-owner@vger.kernel.org
To: Sasha Levin <Alexander.Levin@microsoft.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Matthieu CASTET <matthieu.castet@parrot.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>
List-Id: linux-leds@vger.kernel.org


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2018-02-06 02:02:19, Sasha Levin wrote:
> On Sun, Feb 04, 2018 at 06:17:36PM +0100, Pavel Machek wrote:
> >
> >> > > >> *** if brightness=3D0, led off
> >> > > >> *** else apply brightness if next timer <--- timer is stop, and=
 will never apply new setting
> >> > > >> ** otherwise set led_set_brightness_nosleep
> >> > > >>
> >> > > >> To fix that, when we delete the timer, we should clear LED_BLIN=
K_SW.
> >> > > >
> >> > > >Can you run the tests on the affected stable kernels? I have feel=
ing
> >> > > >that the problem described might not be present there.
> >> > >
> >> > > Hm, I don't seem to have HW to test that out. Maybe someone else d=
oes?
> >> >
> >> > Why are you submitting patches you have no way to test?
> >>
> >> What?  This is stable tree backporting, why are you trying to make a
> >> requirement for something that we have never had before?
> >
> >I don't think random patches should be sent to stable just because
> >they appeared in mainline. Plus, I don't think I'm making new rules:
> >
> >submit-checklist.rst:
> >
> >13) Has been build- and runtime tested with and without ``CONFIG_SMP``
> >and
> >    ``CONFIG_PREEMPT.``
> >
> >stable-kernel-rules.rst:
> >
> >Rules on what kind of patches are accepted, and which ones are not,
> >into the "-stable" tree:
> >
> > - It must be obviously correct and tested.
> > - It must fix a real bug that bothers people (not a, "This could be a
> >   problem..." type thing).
>=20
> So you're saying that this doesn't qualify as a bug?

I'm saying that this does not qualitfy as severe enough
bug. stable-kernel-rules.rst describes what bugs are severe enough,
and this is not one of them.

Best regards,
									Pavel=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlp6I0cACgkQMOfwapXb+vJtaQCeO4CM+FW1QjGoVcVUqRdPfqMx
rGAAmQEA1D7NoqhRYYevjqcBF7hjDaUO
=MHSV
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--

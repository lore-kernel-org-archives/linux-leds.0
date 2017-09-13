From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 0/3] led: ledtrig-transient: add support for hrtimer
Date: Wed, 13 Sep 2017 23:34:24 +0200
Message-ID: <20170913213424.GA2493@amd>
References: <20170913175400.42744-1-dtwlin@google.com>
 <20170913202032.GA30844@amd>
 <CAPzFB+U_d+Jz4MFPJgpF3gbPt7hE_DhSjcz0LTF8csMgjdA5dw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPzFB+U_d+Jz4MFPJgpF3gbPt7hE_DhSjcz0LTF8csMgjdA5dw@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: David Lin <dtwlin@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, rpurdie@rpsys.net, Jacek Anaszewski <jacek.anaszewski@gmail.com>, hdegoede@redhat.com, Greg KH <gregkh@linuxfoundation.org>, robh@kernel.org, Rom Lemarchand <romlem@google.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2017-09-13 14:20:58, David Lin wrote:
> On Wed, Sep 13, 2017 at 1:20 PM, Pavel Machek <pavel@ucw.cz> wrote:
> >
> > Hi!
> >
> > > These patch series add the LED_BRIGHTNESS_FAST flag support for
> > > ledtrig-transient to use hrtimer so that platforms with high-resoluti=
on timer
> > > support can have better accuracy in the trigger duration timing. The =
need for
> > > this support is driven by the fact that Android has removed the timed=
_ouput [1]
> > > and is now using led-trigger for handling vibrator control which requ=
ires the
> > > timer to be accurate up to a millisecond. However, this flag support =
would also
> > > allow hrtimer to co-exist with the ktimer without causing warning to =
the
> > > existing drivers [2].
> >
> > NAK.
> >
> > LEDs do not need extra overhead, and vibrator control should not go
> > through LED subsystem.
> >
> > Input subsystem includes support for vibrations and force
> > feedback. Please use that instead.
>=20
> I thought we are already over this discussion. As of now, the support
> of vibrator through ledtrig is documented
> (Documentation/leds/ledtrig-transient.txt) and there are users using
> it.

I also thought we are over with that discussion.

Yes, I'm working on fixing the docs.

What mainline users are doing that?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlm5pGAACgkQMOfwapXb+vLsQgCgm+d8OBMBssGf1X8bBhjcpHoA
CxIAnRj3oY4psS4bQNOaZr2vzYPiQXkL
=M/MU
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--

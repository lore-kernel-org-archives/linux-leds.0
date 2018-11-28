From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 0/6] Introduce audio-mute LED trigger (and
 conversions to it)
Date: Wed, 28 Nov 2018 13:25:05 +0100
Message-ID: <20181128122505.GA1193@amd>
References: <20181126171126.20280-1-tiwai@suse.de> <20181127084418.GA20504@amd>
 <20181128111806.cb3cncpjeq73sptg@pali>
 <s5hy39dv3dg.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3236401021432971733=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <s5hy39dv3dg.wl-tiwai@suse.de>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Ayman Bagabas <ayman.bagabas@gmail.com>, platform-driver-x86@vger.kernel.org, Hui Wang <hui.wang@canonical.com>, ibm-acpi-devel@lists.sourceforge.net, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--===============3236401021432971733==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2018-11-28 12:38:19, Takashi Iwai wrote:
> On Wed, 28 Nov 2018 12:18:06 +0100,
> Pali Roh=E1r wrote:
> >=20
> > On Tuesday 27 November 2018 09:44:18 Pavel Machek wrote:
> > > Looks good... except one detail: you have "tpacpi::micmute" and
> > > "dell::micmute". I know it follows "tradition", but we are trying to
> > > fix that at the moment. Laptop micmute button is a laptop micmute
> > > button, and userspace should not need to know what prefix to use
> > > depending on vendor.
> > >=20
> > > I'd suggest using "sys::micmute".
> >=20
> > I can imagine that in future some devices like keyboards would have also
> > mute led. We already have keyboards with mute key, so it is something
> > not unrealistic. What should be name convention for these mute leds?
> >=20
> > Is not "sys::" prefix too generic?
>=20
> Good point.  I thought of "laptop::" but it's not always laptop.
> "builtin::"?  Doesn't sound great, either.
>=20
> A nice godfather is required here...

Just use sys:: :-).

laptop:: would work for me, too. (It is always laptop in the cases we
are handling now, right?)

When we get a keyboard with mute led, we'll have to decide if it
should be input6::mute -- because it is on keyboard, or if it is
sys::mute -- because the key is expected to mute whole system.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlv+iSEACgkQMOfwapXb+vIddgCdFNMlExNpidT0JPqw83Zn61us
YkwAoJ9ZWjqqjfdp1q9U5bMo0rMSYH8V
=rmtW
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--

--===============3236401021432971733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============3236401021432971733==--

From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 0/6] Introduce audio-mute LED trigger (and
 conversions to it)
Date: Wed, 28 Nov 2018 21:34:10 +0100
Message-ID: <20181128203410.GA20670@amd>
References: <20181126171126.20280-1-tiwai@suse.de> <20181127084418.GA20504@amd>
 <20181128111806.cb3cncpjeq73sptg@pali>
 <s5hy39dv3dg.wl-tiwai@suse.de> <20181128122505.GA1193@amd>
 <8bb45cc6-9f98-9fed-9676-7f1429328c4a@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4546472435826580132=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <8bb45cc6-9f98-9fed-9676-7f1429328c4a@gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: alsa-devel@alsa-project.org, Ayman Bagabas <ayman.bagabas@gmail.com>, Takashi Iwai <tiwai@suse.de>, platform-driver-x86@vger.kernel.org, Hui Wang <hui.wang@canonical.com>, ibm-acpi-devel@lists.sourceforge.net, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--===============4546472435826580132==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>>> Looks good... except one detail: you have "tpacpi::micmute" and
> >>>> "dell::micmute". I know it follows "tradition", but we are trying to
> >>>> fix that at the moment. Laptop micmute button is a laptop micmute
> >>>> button, and userspace should not need to know what prefix to use
> >>>> depending on vendor.
> >>>>
> >>>> I'd suggest using "sys::micmute".
> >>>
> >>> I can imagine that in future some devices like keyboards would have a=
lso
> >>> mute led. We already have keyboards with mute key, so it is something
> >>> not unrealistic. What should be name convention for these mute leds?
> >>>
> >>> Is not "sys::" prefix too generic?
> >>
> >> Good point.  I thought of "laptop::" but it's not always laptop.
> >> "builtin::"?  Doesn't sound great, either.
> >>
> >> A nice godfather is required here...
> >=20
> > Just use sys:: :-).
> >=20
> > laptop:: would work for me, too. (It is always laptop in the cases we
> > are handling now, right?)
> >=20
> > When we get a keyboard with mute led, we'll have to decide if it
> > should be input6::mute -- because it is on keyboard, or if it is
> > sys::mute -- because the key is expected to mute whole system.
>=20
> drivers/input/input-leds.c seems to already support mute LED.
> It will be exposed as inputN::mute.
>=20
> Documentation/leds/leds-class.txt defines LED naming pattern
> to <devicename:color:function> and "sys" does not look as
> something resembling device name.

So what is your suggestion?

I don't care much as long as it is same in tpacpi and dell
case. (Neither are device names, btw :-).

Actually "::mute" would make sense, too.
								=09
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlv++8IACgkQMOfwapXb+vLsyQCgozDgDKoWvq5OqGEZ0mRLcTXv
VRkAn2DZjgCV/xDE0hjjuWrfkLI4bjwB
=qitW
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--

--===============4546472435826580132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============4546472435826580132==--

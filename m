From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 0/6] Introduce audio-mute LED trigger (and
 conversions to it)
Date: Wed, 28 Nov 2018 22:22:13 +0100
Message-ID: <20181128212212.GE20670@amd>
References: <20181126171126.20280-1-tiwai@suse.de> <20181127084418.GA20504@amd>
 <20181128111806.cb3cncpjeq73sptg@pali>
 <s5hy39dv3dg.wl-tiwai@suse.de> <20181128122505.GA1193@amd>
 <8bb45cc6-9f98-9fed-9676-7f1429328c4a@gmail.com>
 <20181128203410.GA20670@amd> <20181128204612.l3bayhop4qmep2hj@pali>
 <0ed37870-c7b6-fd6b-2f6e-7325fdde3629@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6175940629705471447=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <0ed37870-c7b6-fd6b-2f6e-7325fdde3629@gmail.com>
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


--===============6175940629705471447==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cPi+lWm09sJ+d57q"
Content-Disposition: inline


--cPi+lWm09sJ+d57q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > If external USB keyboard is identified as "input7" device, then
> > "input7::mute" is a good name for mute key. But "sys::mute" does not say
> > anything to which device or hardware it belongs nor does not solve
> > problem that which device/driver/subsystem should have privilege to take
> > this "sys" name.
>=20
> How about just "platform" for the LEDs being part of the device
> on which the system is running?

"platform" works for me.

Are we in agreement that this name will be used for all similar LEDs,
as long as they are on the "main box" of the device, no matter if they
are connected using acpi, gpio, i2c, ...?

Should we start Documentation file explaining common names we want
people to use?

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--cPi+lWm09sJ+d57q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlv/BwQACgkQMOfwapXb+vKb2ACfZJfWC+Arq4KD0vrx1ko3Sca0
kDIAoI+CXAJl3Ca37mFYly/Hhi+Ydz6H
=DHC4
-----END PGP SIGNATURE-----

--cPi+lWm09sJ+d57q--

--===============6175940629705471447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============6175940629705471447==--

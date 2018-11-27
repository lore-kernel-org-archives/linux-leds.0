From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 0/6] Introduce audio-mute LED trigger (and
 conversions to it)
Date: Tue, 27 Nov 2018 09:44:18 +0100
Message-ID: <20181127084418.GA20504@amd>
References: <20181126171126.20280-1-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0837932930531882148=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20181126171126.20280-1-tiwai@suse.de>
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


--===============0837932930531882148==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> this is patch series I've hacked after useful conversation with
> Pavel.  Basically this adds a new LED trigger audio-mute and
> audio-micmute, and convert the HD-audio driver and the platform
> drivers to use the LED trigger instead of the ugly direct dynamic
> symbol binding.

Thanks a lot for doing this!

> The latest version of patches are found in topic/leds-trigger branch
> in my sound git tree.
>   git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
>=20
> As these are cross-tree patches, the branch above is based cleanly on
> v4.20-rc3, so that it can be merged well to multiple trees.
>=20
> Once after getting the ACK's, I'll add tags and fixate for merges.
>=20
> This patch series don't include huawei-wmi stuff; so Huawei patches
> need rework.  I already have some piece of changes for huawei-wmi, so
> please ping me if needed.
>=20
> I checked briefly on my Dell laptop, and a Thinkpad model.
> Wider tests are appreciated, of course.

Looks good... except one detail: you have "tpacpi::micmute" and
"dell::micmute". I know it follows "tradition", but we are trying to
fix that at the moment. Laptop micmute button is a laptop micmute
button, and userspace should not need to know what prefix to use
depending on vendor.

I'd suggest using "sys::micmute".

With that:

Acked-by: Pavel Machek <pavel@ucw.cz>

								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlv9A+IACgkQMOfwapXb+vLBsACgra1PraOEcBCMo5EbZ6z86T1F
gv8Anj0Mgc1uTlJ0pApuknp6UrsME1Ct
=1GT3
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--

--===============0837932930531882148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============0837932930531882148==--

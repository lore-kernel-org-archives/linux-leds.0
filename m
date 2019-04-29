From: Pavel Machek <pavel@ucw.cz>
Subject: Re: linux-next: Tree for Apr 29 (drivers/leds/leds-turris-omnia)
Date: Mon, 29 Apr 2019 20:12:45 +0200
Message-ID: <20190429181245.GA24658@amd>
References: <20190429190354.0d5e2e93@canb.auug.org.au>
 <d3822785-0683-28df-ffa6-ab679aa27c73@infradead.org>
 <20190429153200.GA11761@amd>
 <20190429173842.06f02852@nic.cz>
 <20190429163753.GA16782@amd>
 <20190429184439.68049050@nic.cz>
 <20190429165319.GB16782@amd>
 <c045db7f-2147-1a58-8d65-8b52fddd932c@metux.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c045db7f-2147-1a58-8d65-8b52fddd932c@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Marek Behun <marek.behun@nic.cz>, Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-04-29 19:51:40, Enrico Weigelt, metux IT consult wrote:
> On 29.04.19 18:53, Pavel Machek wrote:
> >>> Theoretically. But we both now that probability of that is very low,
> >>> and that likely driver would need other updates, too... right?
> >>
> >> What would be the benefit to add ARM dependency? So that distro
> >> compilations don't ship the turris_omnia driver unnecesarily?
> >=20
> > That, and so that people are not asked "do you want to enable omnia
> > LEDs?" when they update their kernel on i386.
>=20
> Is that controller only built-in into some SoCs, or also available
> as a separate chip ?

AFAIU.. separate chip, but runs firmware not likely to be available
outside Turris routers.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzHPpwACgkQMOfwapXb+vIcBQCgtBmnpmXzcHNXsdDgB5Gwe2ws
iSQAnj9N+Ez+Ex9vtroCNqCGYUal3/AG
=mzAP
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--

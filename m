From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: ledtrig-morse: send out morse code
Date: Fri, 29 Jun 2018 11:23:27 +0200
Message-ID: <20180629092327.GB31718@amd>
References: <20180628185630.GA6095@amd>
 <20180628202955.GA1534@imap.1und1.de>
 <20180628204516.GA29146@amd>
 <20180629064147.GA3219@arbeit>
 <20180629071724.GA10079@amd>
 <CAMuHMdXaPz3ckT1cPZed4e=iwk3nb75UBGC66hm+b+xRDNNnNg@mail.gmail.com>
 <20180629072912.GB10079@amd>
 <CAMuHMdW1NX=BwJE0eauRLkRj1se4iRNGdxHXeajNQ-dKDhnPKw@mail.gmail.com>
 <20180629080717.GA12112@amd>
 <20180629082439.GA15660@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180629082439.GA15660@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andreas Klinger <ak@it-klinger.de>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Ben Whitten <ben.whitten@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Willy Tarreau <w@1wt.eu>, Philippe Ombredanne <pombredanne@nexb.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2018-06-29 04:24:39, Greg KH wrote:
> On Fri, Jun 29, 2018 at 10:07:17AM +0200, Pavel Machek wrote:
> > Hi!
> >=20
> > > > There's no reason 2. should be in kernel ("mechanism, not policy").
> > > >
> > > > Given 1. is not really more complicated than the morse
> > > > trigger... please just help with pattern trigger if you want this to
> > > > happen.
> > >=20
> > > Ah, you want to do the conversion to morse code in userspace?
> > > Yes, that makes sense.
> >=20
> > Yes, that's what I want.
>=20
> We all want a pony :)

I already have a pony :-).

> Seriously, this is a very simple module, works well, and makes some
> system's life much easier as there is no external dependancy on a
> text-to-morse-code library needed.

It still does not belong into kernel.

It is interesting. You deleted bluetooth driver people used from
staging because of "not enough cleanups" and you want me to maintain
text-to-morse-code in the kernel?!

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAls1+o8ACgkQMOfwapXb+vIi+wCeIbMHYOvUMzsomFPAiOJz5gPF
oS0AoLhHUDhUopw8FKMLS/t9q+ti7dDF
=7f5U
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--

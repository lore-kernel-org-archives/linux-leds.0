From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 2/2] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
Date: Wed, 16 Jan 2019 23:04:01 +0100
Message-ID: <20190116220401.GA28024@amd>
References: <20190114211723.11186-1-dmurphy@ti.com>
 <20190114211723.11186-2-dmurphy@ti.com>
 <ce911fdf-c7c2-63e8-5c7a-b0be965ab69b@gmail.com>
 <20190115222223.GA17363@amd>
 <79394d17-3124-75b2-ccac-dc1046499d14@ti.com>
 <20190116105537.GA1803@amd>
 <86299268-3202-814a-134b-04bd2170faab@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <86299268-3202-814a-134b-04bd2170faab@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dachaac@gmail.com, robh+dt@kernel.org
List-Id: linux-leds@vger.kernel.org


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

=2E.snip. Let me read it and reply when I have a time.

> > You know what? First, submit driver with similar functionality to
> > existing RGB drivers, using same interface existing drivers are
> > using. When that is accepted, we can talk about extending
> > kernel<->user interfaces.
> >=20
>=20
> I could do that but then there is no way for users to have any other colo=
r but "white" with this driver.
> That defeats the purpose of the device itself.

No, that is not what I meant.

We do have RGB drivers in tree, they just present three separate LEDs
-- red, green and blue. I ask you to do the same for initial
submission.

You'll still be able to set brightness independently on the
red/green/blue LEDs...

> I am not sure if you are aware of this or care but I found this recent bl=
og on this effort:
> https://www.phoronix.com/scan.php?page=3Dnews_item&px=3DLinux-RGB-LED-Int=
erface
> See some of the comments.

I went through the comments quickly, but see nothing really
interesting.

Best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlw/qlEACgkQMOfwapXb+vJx4QCfXBqAKUAZw9Cu9PftPLc3wRcO
YtkAn1O/2trkfkYCSmKPbfD56kJgtqTl
=c3vh
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--

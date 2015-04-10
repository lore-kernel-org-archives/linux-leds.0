From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [patch 2/2 v2] leds: netxbig: silence a static checker warning
Date: Fri, 10 Apr 2015 16:41:23 +0200
Message-ID: <20150410144123.GI1509@kw.sim.vm.gnt>
References: <20150410083040.GA2189@mwanda>
 <5527DBBA.9060109@samsung.com>
 <20150410143056.GI16501@mwanda>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GRKD41aUwel8EP/I"
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150410143056.GI16501@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--GRKD41aUwel8EP/I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2015 at 05:30:56PM +0300, Dan Carpenter wrote:
> On Fri, Apr 10, 2015 at 04:18:34PM +0200, Jacek Anaszewski wrote:
> > Hi Dan,
> >=20
> > On 04/10/2015 10:30 AM, Dan Carpenter wrote:
> > >Static checkers complain that "timers[i].delay_on" is an unsigned long
> > >but we're writing to only 32 bits of it.  The code works on 32 bit
> > >systems and little endian 64 bit systems so it doesn't cause a problem
> > >in practise but it's still better to silence the warning.
> > >
> > >Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > >---
> > >v2: use a temporary variable
> > >
> > >diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
> > >index 028686f2..6cb4537 100644
> > >--- a/drivers/leds/leds-netxbig.c
> > >+++ b/drivers/leds/leds-netxbig.c
> > >@@ -444,12 +444,17 @@ static int netxbig_leds_get_of_pdata(struct devi=
ce *dev,
> > >  		if (!timers)
> > >  			return -ENOMEM;
> > >  		for (i =3D 0; i < num_timers; i++) {
> > >+			u32 delay_on =3D 0;
> > >+			u32 delay_off =3D 0;
> >=20
> > These variables don't need initialization, as they are assigned
> > a new value in of_property_read_u32_index anyway.
>=20
> I don't know this hardware and I can't even test it so I didn't feel
> comfortable leaving it out.  Also static checkers will complain that
> we are ignoring the error paths.

Yes, Jacek is right, you don't need to initialize the variables. Please,
don't worry about testing, I'll take care of that.

Simon

>=20
> regards,
> dan carpenter

--GRKD41aUwel8EP/I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlUn4RMACgkQgtp0PDeOcDrGvgCgg3/y285NJr/+tBsfoavBPmjP
YUEAmQFMA4972ISWxDANUYcTugO27Tkr
=oJbx
-----END PGP SIGNATURE-----

--GRKD41aUwel8EP/I--

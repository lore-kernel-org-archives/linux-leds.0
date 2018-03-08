From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 4.4 16/34] led: core: Fix brightness setting when setting
 delay_off=0
Date: Thu, 8 Mar 2018 19:04:04 +0100
Message-ID: <20180308180403.GA16940@amd>
References: <20180302084435.842679610@linuxfoundation.org>
 <20180302084437.007951262@linuxfoundation.org>
 <1520436743.23626.33.camel@codethink.co.uk>
 <86d4536e-11d5-40c4-4186-21955f809005@gmail.com>
 <20180308172401.GB22224@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180308172401.GB22224@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Ben Hutchings <ben.hutchings@codethink.co.uk>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Matthieu CASTET <matthieu.castet@parrot.com>, stable@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2018-03-08 09:24:01, Greg Kroah-Hartman wrote:
> On Wed, Mar 07, 2018 at 09:39:08PM +0100, Jacek Anaszewski wrote:
> > Hi Ben,
> >=20
> > On 03/07/2018 04:32 PM, Ben Hutchings wrote:
> > > On Fri, 2018-03-02 at 09:51 +0100, Greg Kroah-Hartman wrote:
> > >> 4.4-stable review patch.  If anyone has any objections, please let me
> > >> know.
> > >>
> > >> ------------------
> > >>
> > >> From: Matthieu CASTET <matthieu.castet@parrot.com>
> > >>
> > >>
> > >> [ Upstream commit 2b83ff96f51d0b039c4561b9f95c824d7bddb85c ]
> > >>
> > >> With the current code, the following sequence won't work :
> > >> echo timer > trigger
> > >>
> > >> echo 0 >  delay_off
> > >> * at this point we call
> > >> ** led_delay_off_store
> > >> ** led_blink_set
> > > [...]
> > >=20
> > > The commit message got cut truncated here, which resulted in addresses
> > > being omitted when it was sent out for review.  The upstream commit
> > > message refers to a LED_BLINK_SW flag which is not used in 4.4.  So
> > > this fix probably isn't needed, though I can't tell whether it does a=
ny
> > > harm.
> >=20
> > We discussed it in [0]. This patch is not needed for 4.4 and what's
> > more more it is harmful. It introduces a bug, fixed in [1].
> >=20
> > [0] https://lkml.org/lkml/2018/2/6/726
> > [1[ https://patchwork.kernel.org/patch/10253933/
>=20
> So, did I mess something up here?  Am I missing some patch that I need
> to apply, or do I need to revert something?

Well, patch [PATCH 4.4 16/34] led: core: Fix brightness setting when settin=
g delay_off=3D0
is not suitable for -stable. It is not needed there.

(And it is also buggy and does not fix serious-enough problem to
warrant -stable).

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlqhexMACgkQMOfwapXb+vLrzgCeKJIQO0nmNRPy2vqNb3yLZYgi
GfsAn2bqY1B2I9JYIyDODHKAdUw1FdnX
=GIJ7
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--

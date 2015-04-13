From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [patch 2/2 v2] leds: netxbig: silence a static checker warning
Date: Mon, 13 Apr 2015 11:20:19 +0200
Message-ID: <20150413092019.GK1509@kw.sim.vm.gnt>
References: <20150410002507.GF1509@kw.sim.vm.gnt>
 <20150410083040.GA2189@mwanda>
 <20150410143054.GH1509@kw.sim.vm.gnt>
 <552B7D89.2070307@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KpCUdp8leBmyQdIa"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:40040 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753236AbbDMJUY (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 13 Apr 2015 05:20:24 -0400
Content-Disposition: inline
In-Reply-To: <552B7D89.2070307@free-electrons.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>


--KpCUdp8leBmyQdIa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2015 at 10:25:45AM +0200, Gregory CLEMENT wrote:
> Hi Simon, Dan,
>=20
> On 10/04/2015 16:30, Simon Guinot wrote:
> > On Fri, Apr 10, 2015 at 11:30:41AM +0300, Dan Carpenter wrote:
> >> Static checkers complain that "timers[i].delay_on" is an unsigned long
> >> but we're writing to only 32 bits of it.  The code works on 32 bit
> >> systems and little endian 64 bit systems so it doesn't cause a problem
> >> in practise but it's still better to silence the warning.
> >>
> >> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >=20
> > Acked-by: Simon Guinot <simon.guinot@sequanux.org>
> >=20
> > Note that your patch applies on the top of a patch "leds: netxbig: add=
=20
> > device tree binding" which has not been merged yet by Bryan. For now,
> > this patch only sits in the mvebu/for-next branch for testing purpose.
> > And it is still not clear to me in which tree the patch will go. That's
> > why I think you should resend your patch to the mvebu maintainers (added
> > in Cc) on the LAKML. Probably they will be interested in merging your
> > clean-up patch in the mvebu/for-next branch as well.
>=20
> Actually the reason to get all the series in mvebu/for-next was to be
> confident enough to make a pull request as soon as the driver part was
> acked by the maintainer. Unfortunately it didn't occur until now and
> the merge windows for arm-soc is now closed so it won't be part of
> v4.1 (at least the mvebu related part).

Hi Gregory,

Thanks for your efforts. I'll try again with v4.2 ...

Simon

--KpCUdp8leBmyQdIa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlUrilMACgkQgtp0PDeOcDrSgwCfSP/9vdPCli9+ubns4pYp6qk7
qq0AnRxwVv5tdPjAUXdWkanpVXP/Yhdo
=BgNH
-----END PGP SIGNATURE-----

--KpCUdp8leBmyQdIa--

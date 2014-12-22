From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH] leds: netxbig: fix oops at probe time
Date: Mon, 22 Dec 2014 12:57:37 +0100
Message-ID: <20141222115737.GL19261@kw.sim.vm.gnt>
References: <1417534330-13154-1-git-send-email-simon.guinot@sequanux.org>
 <20141211090400.GB18449@kw.sim.vm.gnt>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KDy5+/kaQUC2a3Gw"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:44140 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754457AbaLVL5k (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 22 Dec 2014 06:57:40 -0500
Content-Disposition: inline
In-Reply-To: <20141211090400.GB18449@kw.sim.vm.gnt>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Johan Hovold <johan@kernel.org>, Vincent Donnefort <vdonnefort@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, linux-leds@vger.kernel.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>


--KDy5+/kaQUC2a3Gw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2014 at 10:04:00AM +0100, Simon Guinot wrote:
> On Tue, Dec 02, 2014 at 04:32:10PM +0100, Simon Guinot wrote:
> > This patch fixes a NULL pointer dereference on led_dat->mode_val. Due to
> > this bug, a kernel oops can be observed at probe time on the LaCie 2Big
> > and 5Big v2 boards:
> >=20
> > Unable to handle kernel NULL pointer dereference at virtual address 000=
00008
> > [...]
> > [<c03f244c>] (netxbig_led_probe) from [<c02c8c6c>] (platform_drv_probe+=
0x4c/0x9c)
> > [<c02c8c6c>] (platform_drv_probe) from [<c02c72d0>] (driver_probe_devic=
e+0x98/0x25c)
> > [<c02c72d0>] (driver_probe_device) from [<c02c7520>] (__driver_attach+0=
x8c/0x90)
> > [<c02c7520>] (__driver_attach) from [<c02c5c24>] (bus_for_each_dev+0x68=
/0x94)
> > [<c02c5c24>] (bus_for_each_dev) from [<c02c6408>] (bus_add_driver+0x124=
/0x1dc)
> > [<c02c6408>] (bus_add_driver) from [<c02c7ac0>] (driver_register+0x78/0=
xf8)
> > [<c02c7ac0>] (driver_register) from [<c000888c>] (do_one_initcall+0x80/=
0x1cc)
> > [<c000888c>] (do_one_initcall) from [<c0733618>] (kernel_init_freeable+=
0xe4/0x1b4)
> > [<c0733618>] (kernel_init_freeable) from [<c058db9c>] (kernel_init+0xc/=
0xec)
> > [<c058db9c>] (kernel_init) from [<c0009850>] (ret_from_fork+0x14/0x24)
> > [...]
> >=20
> > This bug was introduced by commit 588a6a99286ae30afb1339d8bc2163517b1b7=
dd1
> > ("leds: netxbig: fix attribute-creation race").
> >=20
> > Signed-off-by: Simon Guinot <simon.guinot@sequanux.org>
> > Cc: <stable@vger.kernel.org> # 3.17+
> > ---
> >  drivers/leds/leds-netxbig.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> Hi Bryan,
>=20
> Please apply up this patch.

Hi Bryan,

Is there any news about this patch on your side ?

Jason, Andrew, Sebastian,

Maybe this patch can go through the SoC branch ?

Thanks in advance.

Simon

--KDy5+/kaQUC2a3Gw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlSYBzEACgkQgtp0PDeOcDoN7ACdHE9OAOrwDFY5nKusXknO77xQ
SCkAn3QH/GnTgsN6g0gIqIO0vW1PBsi6
=FF1L
-----END PGP SIGNATURE-----

--KDy5+/kaQUC2a3Gw--

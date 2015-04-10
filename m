From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [patch 2/2 v2] leds: netxbig: silence a static checker warning
Date: Fri, 10 Apr 2015 21:52:24 +0200
Message-ID: <20150410195224.GJ1509@kw.sim.vm.gnt>
References: <20150410083040.GA2189@mwanda>
 <5527DBBA.9060109@samsung.com>
 <20150410143056.GI16501@mwanda>
 <20150410144123.GI1509@kw.sim.vm.gnt>
 <20150410155034.GK16501@mwanda>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="c4f09764zL97bxnm"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:54696 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753564AbbDJTw2 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 10 Apr 2015 15:52:28 -0400
Content-Disposition: inline
In-Reply-To: <20150410155034.GK16501@mwanda>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org


--c4f09764zL97bxnm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2015 at 06:50:34PM +0300, Dan Carpenter wrote:
> I've looked at this some more.  Most of the places which call
> of_property_read_u32_index() check the return code.  The ones that don't
> mostly initialize their values going in.  The remainder introduce static
> checker warnings like:
>=20
> 	drivers/clk/ti/divider.c:472 ti_clk_get_div_table()
> 	error: potentially using uninitialized 'val'.
>=20
> These warnings cause me pain.  It calls of_get_property() earlier so
> it won't return -EINVAL.  I don't know if it can return -ENODATA or
> -EOVERFLOW?
>=20
> I guess not.

I think it can't. Above, we are calling of_property_count_u32_elems() to
count the number of u32 elements in the "timers" property. After we are
ensuring that there is three u32 elements available per timer. That's
why the return codes for the three of_property_read_u32_index() calls
are not checked.

Regards,

Simon

>=20
> Honestly, I hate ambigous code like this.  If it were just a clear bug
> then I could fix it but I invest more time in ambiguous code and end
> up not writing a patch.
>=20
> regards,
> dan carpenter

--c4f09764zL97bxnm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlUoKfgACgkQgtp0PDeOcDqzjACgiwlZRMcj9cnsPdI7LD4XxfVl
aYUAniqdv/+S/0R9hNI/ez83KVbyvjIM
=Unc3
-----END PGP SIGNATURE-----

--c4f09764zL97bxnm--

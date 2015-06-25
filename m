From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH v3 1/3] leds: netxbig: add device tree binding
Date: Thu, 25 Jun 2015 10:46:03 +0200
Message-ID: <20150625084603.GG4853@kw.sim.vm.gnt>
References: <1434639590-27389-1-git-send-email-simon.guinot@sequanux.org>
 <1434639590-27389-2-git-send-email-simon.guinot@sequanux.org>
 <55894D0A.8000306@samsung.com>
 <20150623211711.GF4853@kw.sim.vm.gnt>
 <558A736D.8030503@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jQblWL/lOOo35ApW"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:38316 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751636AbbFYIqK (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 25 Jun 2015 04:46:10 -0400
Content-Disposition: inline
In-Reply-To: <558A736D.8030503@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Bryan Wu <cooloney@gmail.com>, Vincent Donnefort <vdonnefort@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-arm-kernel@lists.infradead.org, Gregory Clement <gregory.clement@free-electrons.com>, Dan Carpenter <dan.carpenter@oracle.com>, Alexandre Courbot <gnurou@gmail.com>, linux-leds@vger.kernel.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>


--jQblWL/lOOo35ApW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2015 at 11:07:57AM +0200, Jacek Anaszewski wrote:
> >>BTW how do you compile the driver? I've tried to use
> >>multi_v5_defconfig and mvebu_v5_defconfig and I have build breaks
> >>with both of them on the recent linux-next.
> >
> >For the original patch set version (Linux 4.0 at the time), I have used
> >the mvebu_v5_defconfig. Now I am using a lighter configuration because
> >I don't need to build the whole mvebu stuff.
> >
> >What kind of error do you get ? I remember something about setting
> >CONFIG_HZ to 250.
>=20
> I am getting:
>=20
> drivers/crypto/mv_cesa.c:1037:2: error: implicit declaration of
> function =E2=80=98of_get_named_gen_pool=E2=80=99
> [-Werror=3Dimplicit-function-declaration]
>=20
> Compilation succeeded after disabling CONFIG_CRYPTO_DEV_MV_CESA.

It is because the merge in linux-next missed the renaming of
of_get_named_gen_pool() in of_gen_pool_get() for the mv_cesa driver.

I have sent a patch, just in case.

Simon

--jQblWL/lOOo35ApW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlWLv8sACgkQgtp0PDeOcDo+dwCggPZSw/wmFL9Eq05+hIzfzdw0
/wIAnAiBlLN7JVwqt38aNBgkpGxkIzrH
=KNM2
-----END PGP SIGNATURE-----

--jQblWL/lOOo35ApW--

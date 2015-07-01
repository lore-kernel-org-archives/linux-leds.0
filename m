From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH/RFC v2 1/5] leds: Use set_brightness_work for
 brightness_set ops that can sleep
Date: Wed, 1 Jul 2015 10:42:58 +0100
Message-ID: <20150701094258.GS11162@sirena.org.uk>
References: <1435672770-4261-1-git-send-email-j.anaszewski@samsung.com>
 <20150630222450.GR5904@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uNvczuo8OWfsyO2w"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:34739 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753953AbbGAJng (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 1 Jul 2015 05:43:36 -0400
Content-Disposition: inline
In-Reply-To: <20150630222450.GR5904@valkosipuli.retiisi.org.uk>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, pavel@ucw.cz, sakari.ailus@linux.intel.com, andreas.werner@men.de, andrew@lunn.ch, ospite@studenti.unina.it, anemo@mba.ocn.ne.jp, ben@simtec.co.uk, bootc@bootc.net, dmurphy@ti.com, daniel.jeong@ti.com, daniel@zonque.org, davem@davemloft.net, fabio.baltieri@gmail.com, balbi@ti.com, florian@openwrt.org, gshark.jeong@gmail.com, g.liakhovetski@gmx.de, ingi2.kim@samsung.com, dl9pf@gmx.de, johan@kernel.org, lenz@cs.wisc.edu, jogo@openwrt.org, q1.kim@samsung.com, kris@krisk.org, kristoffer.ericson@gmail.com, linus.walleij@linaro.org, michael.hennerich@analog.com, milo.kim@ti.com, nm127@freemail.hu, ncase@xes-inc.com, neilb@suse.de, nick.forbes@incepta.com, lost.distance@yahoo.com, p.meerwald@bct-electronic.co


--uNvczuo8OWfsyO2w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 01, 2015 at 01:24:50AM +0300, Sakari Ailus wrote:

> The documentation should be improved to tell how the API is expected to be
> have, e.g. which functions may block. I think this is out of scope for this
> patch though.

> I think all the existing drivers that implement the set_brightness()
> callback have a fast (and non-blocking) implementation, and some of these

Yes, they need to be since triggers can happen in any context.

--uNvczuo8OWfsyO2w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVk7YhAAoJECTWi3JdVIfQ3OYH/RQtZW9ymtugHgQ8PoWZr1K5
Hj8pakgYu95XjLjFTPOJRxsgCQCdLD7/cooPbf9EIXtPdyVvSIjm6RwHjXLeUx9F
LB2IyZKYyZ+dOOC8ZRjY3PvL6LpTrF3yUq4Uvb+HiTbi1RdhSWkYTNJo2bUvXJod
IMpwL6ti6eFPD9YDyGVocBAKKtQNLCCWs3muXt0Hbt9569s9jt50WCkDSlrlsT24
gwJzMC5DdOtwKliEzrz9kEvmsORFjfPckAKCb4mv2xomnZKRsBMmOIOgwdYnBBcT
dw6DVEN+2EAaEAXbdm4XQUUpSmaLIcNFWqSEwQ3gd4gjB42ScRSWHUNLthuT1l4=
=KEuz
-----END PGP SIGNATURE-----

--uNvczuo8OWfsyO2w--

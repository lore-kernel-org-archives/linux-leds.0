From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH v4 1/3] leds: netxbig: add device tree binding
Date: Fri, 18 Sep 2015 15:10:11 +0200
Message-ID: <20150918131011.GN7306@kw.sim.vm.gnt>
References: <1442505571-9744-1-git-send-email-simon.guinot@sequanux.org>
 <1442505571-9744-2-git-send-email-simon.guinot@sequanux.org>
 <55FBD679.2020402@samsung.com>
 <20150918103006.GM7306@kw.sim.vm.gnt>
 <55FBEC38.6020209@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oSMU0HVueUMCAvn0"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:41583 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752160AbbIRNBt (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 18 Sep 2015 09:01:49 -0400
Content-Disposition: inline
In-Reply-To: <55FBEC38.6020209@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Bryan Wu <cooloney@gmail.com>, Vincent Donnefort <vdonnefort@gmail.com>, devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, linux-arm-kernel@lists.infradead.org, Gregory Clement <gregory.clement@free-electrons.com>, Yoann Sculo <yoann@sculo.fr>, linux-leds@vger.kernel.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>


--oSMU0HVueUMCAvn0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2015 at 12:49:28PM +0200, Jacek Anaszewski wrote:
> >>
> >>Moreover, if you switched to using devm* prefixed version of
> >>gpio_request_one and led_classdev_reqister, you could simplify
> >>the error paths in the driver.
> >
> >Yes, I have a pending patch for this conversion. But since it is not
> >really related with the subject of this patch series (add DT support),
> >I was planning to send it next.
> >
> >Do you want me to include this patch into this series.
>=20
> Why not, if you have it ready to go. If it needs some polishing,
> we can live with what we have now.

No, the patch is ready. I'll add it.

> >>>+static const struct of_device_id of_netxbig_leds_match[] =3D {
> >>>+	{ .compatible =3D "lacie,netxbig-leds", },
> >>>+	{},
> >>>+};
> >>>+#else
> >>>+static int netxbig_leds_get_of_pdata(struct device *dev,
> >>>+				     struct netxbig_led_platform_data *pdata)
> >>
> >>s/static int/static inline int/
> >
> >Is that not already the case with modern compiler ?
>=20
> Could you elaborate on this?

There is not much to say. netxbig_leds_get_of_pdata is a single line of
code. I am not a gcc expert but I am quite confident that this function
will be inlined anyway (given the optimisation level used to compile the
Linux kernel). That's it.

But there is nothing wrong by adding "inline" neither.

Thanks,

Simon

--oSMU0HVueUMCAvn0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlX8DTMACgkQgtp0PDeOcDppSACgmZQtmm7aBFVKmM9SOJZKzT4j
RdsAnjAJXjM2U+xPYPtfCEbs9zoZ+sIN
=smec
-----END PGP SIGNATURE-----

--oSMU0HVueUMCAvn0--

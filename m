Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643A0C433DB
	for <linux-leds@archiver.kernel.org>; Wed, 24 Mar 2021 08:26:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27416619E5
	for <linux-leds@archiver.kernel.org>; Wed, 24 Mar 2021 08:26:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233466AbhCXI0I (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 24 Mar 2021 04:26:08 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:40830 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233509AbhCXIZ5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Mar 2021 04:25:57 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 435F61C0B82; Wed, 24 Mar 2021 09:25:55 +0100 (CET)
Date:   Wed, 24 Mar 2021 09:25:52 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Alexander Dahl <ada@thorsis.com>
Cc:     Hermes Zhang <chenhui.zhang@axis.com>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Hermes Zhang <chenhuiz@axis.com>, kernel@axis.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-binding: leds: Document leds-multi-gpio bindings
Message-ID: <20210324082551.GA15591@amd>
References: <20210324024844.15796-1-chenhui.zhang@axis.com>
 <558944059.12080.1616565502073@seven.thorsis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline
In-Reply-To: <558944059.12080.1616565502073@seven.thorsis.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2021-03-24 06:58:21, Alexander Dahl wrote:
> Hello Hermes,
>=20
> > Hermes Zhang <chenhui.zhang@axis.com> hat am 24.03.2021 03:48 geschrieb=
en:
> >=20
> > =20
> > From: Hermes Zhang <chenhuiz@axis.com>
> >=20
> > Document the device tree bindings of the multiple GPIOs LED driver
> > Documentation/devicetree/bindings/leds/leds-multi-gpio.yaml.
> >=20
> > Signed-off-by: Hermes Zhang <chenhuiz@axis.com>
> > ---
> >=20
> > Notes:
> >     Add maxItems
>=20
> What about the other part of the series? I think you should send both pat=
ches together with an introduction message on both. If you only change one =
patch for a new version spin of the series, just send the other one unchang=
ed.
>

Please wrap emails after 72 columns or so.

> (It makes no sense to merge the binding as long as the driver is not merg=
ed, otherwise you would end up with a binding without driver. So keeping th=
em together should help reviewers and maintainers.)
>

This is actually okay to do if you expect discussion and not a patch
merge. Series works, too.

Best regads,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmBa944ACgkQMOfwapXb+vLk8QCgtSvbyMuPzySVEpULrFzkLDJW
h2sAoKfzvd80JBUMmw6/8FCq9G2wYetL
=I59e
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--

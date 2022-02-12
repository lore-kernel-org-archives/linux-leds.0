Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BAE4C433F5
	for <linux-leds@archiver.kernel.org>; Sat, 12 Feb 2022 17:03:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231942AbiBLRDe (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 12 Feb 2022 12:03:34 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231926AbiBLRDe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 12 Feb 2022 12:03:34 -0500
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 958EB240A4;
        Sat, 12 Feb 2022 09:03:30 -0800 (PST)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 9CBBE1C0B7A; Sat, 12 Feb 2022 18:03:27 +0100 (CET)
Date:   Sat, 12 Feb 2022 18:03:27 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc:     Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: leds: sgm3140: Document ocp8110
 compatible
Message-ID: <20220212170327.GA29488@duo.ucw.cz>
References: <20211117091405.7412-1-git@apitzsch.eu>
 <20220207230638.56730-1-git@apitzsch.eu>
 <20220207230638.56730-3-git@apitzsch.eu>
 <YgaQAwfYnt6E9buG@robh.at.kernel.org>
 <9a89a99872ff2fd67f097224584121e50b8a2f07.camel@apitzsch.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline
In-Reply-To: <9a89a99872ff2fd67f097224584121e50b8a2f07.camel@apitzsch.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2022-02-12 14:13:32, Andr=E9 Apitzsch wrote:
> Am Freitag, dem 11.02.2022 um 10:34 -0600 schrieb Rob Herring:
> > On Tue, Feb 08, 2022 at 12:06:37AM +0100, Andr=E9 Apitzsch wrote:
> > > Signed-off-by: Andr=E9 Apitzsch <git@apitzsch.eu>
> >=20
> > Commit msg? What's this h/w?
> >=20
> Thanks for the feedback.
>=20
> Would the following message be sufficient?
>=20
> """
> dt-bindings: leds: sgm3140: Document ocp8110 compatible
>=20
> Add devicetree binding for Orient Chip OCP8110 charge pump used for
> camera flash LEDs.
> """

Sounds good to me.
							Pavel
--=20
http://www.livejournal.com/~pavelmachek

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYgfoXwAKCRAw5/Bqldv6
8syWAJ4puUHUxTAucCpUsUpqlPzm+5nhGACgva2c+OUSx6mDeGGx4ztyVbDsfi4=
=E7z2
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--

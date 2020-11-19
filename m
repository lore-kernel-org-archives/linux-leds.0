Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8297DC63777
	for <linux-leds@archiver.kernel.org>; Thu, 19 Nov 2020 21:57:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 400752222F
	for <linux-leds@archiver.kernel.org>; Thu, 19 Nov 2020 21:57:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgKSV53 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 19 Nov 2020 16:57:29 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:50896 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbgKSV51 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Nov 2020 16:57:27 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 1A8D11C0B87; Thu, 19 Nov 2020 22:57:22 +0100 (CET)
Date:   Thu, 19 Nov 2020 22:57:21 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Gene Chen <gene.chen.richtek@gmail.com>, robh+dt@kernel.org,
        matthias.bgg@gmail.com, dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: Re: [PATCH v7 2/5] dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT
 definitions
Message-ID: <20201119215721.GA5337@amd>
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
 <20201118213712.GA22371@amd>
 <6068b1e3-a4c8-6c7d-d33d-f2238e905e43@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline
In-Reply-To: <6068b1e3-a4c8-6c7d-d33d-f2238e905e43@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-11-19 22:03:14, Jacek Anaszewski wrote:
> Hi Pavel, Gene,
>=20
> On 11/18/20 10:37 PM, Pavel Machek wrote:
> >Hi!
> >
> >>From: Gene Chen <gene_chen@richtek.com>
> >>
> >>Add LED_COLOR_ID_MOONLIGHT definitions
> >
> >Why is moonlight a color? Camera flashes are usually white, no?
> >
> >At least it needs a comment...
>=20
> That's my fault, In fact I should have asked about adding
> LED_FUNCTION_MOONLIGHT, it was evidently too late for me that evening...

Aha, that makes more sense.

But please let's call it "torch" if we do that, as that is already
used in kernel sources... and probably in the interface, too:

=2E/arch/arm/mach-pxa/ezx.c:    	       	  .name =3D "a910::torch",

Best regards,
							Pavel

--=20
http://www.livejournal.com/~pavelmachek

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+26kEACgkQMOfwapXb+vKrkQCeOnUki/+AAb7OvcuVl9km4zJ7
pT8AoLcioYOxJI356ZmTRwZvWeNdo/i3
=YtzM
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--

Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D65BFC4338F
	for <linux-leds@archiver.kernel.org>; Wed, 28 Jul 2021 11:17:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB64860FC2
	for <linux-leds@archiver.kernel.org>; Wed, 28 Jul 2021 11:17:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232111AbhG1LRF (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 28 Jul 2021 07:17:05 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:33656 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231631AbhG1LRF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Jul 2021 07:17:05 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A8DE91C0B7C; Wed, 28 Jul 2021 13:17:02 +0200 (CEST)
Date:   Wed, 28 Jul 2021 13:17:02 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@denx.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: LED subsystem lagging maintenance
Message-ID: <20210728111701.GA894@amd>
References: <CAHp75VeWKgyz32scczN0c+iJwGZXVP42g0NG0oXrdJ34GyHB8w@mail.gmail.com>
 <20210728103551.GA31304@amd>
 <CAHp75VcrYRkzGwe=K98Augy=jb2RtWjiF6P6kietN8Lz7f_okA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline
In-Reply-To: <CAHp75VcrYRkzGwe=K98Augy=jb2RtWjiF6P6kietN8Lz7f_okA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Thanks for your _prompt_ response!
>=20
> > > I have noticed that in the last couple of cycles the LED subsystem is
> > > a bit laggish in terms of maintenance (*). I think it's time that
> > > someone can help Pavel to sort things out.
> > >
> > > In any case, I wonder if we have any kind of procedure for what to do
> > > in such cases. Do we need to assume that the subsystem is in a
> > > (pre-)orphaned state? If so, who is the best to take care of patch
> > > flow?
>=20
> > To be honest, patches were not applied because they were not that
> > important to begin with,
>=20
> Reference counting disbalance is not critical, but what is then?

Things with end-user impact. What is end-user impact here? How much
memory is leaked in usual config?

								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEBPK0ACgkQMOfwapXb+vISRwCgm3B7k0uw3dg7Phcg20qqjuvT
N5MAn0YZDFv5/PAha2lLj1lozaPTne/7
=1zQ7
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--

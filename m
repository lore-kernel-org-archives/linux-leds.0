Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69783C432BE
	for <linux-leds@archiver.kernel.org>; Tue,  3 Aug 2021 21:51:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FA346103C
	for <linux-leds@archiver.kernel.org>; Tue,  3 Aug 2021 21:51:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbhHCVvj (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 3 Aug 2021 17:51:39 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:40088 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbhHCVvi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 3 Aug 2021 17:51:38 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 4F4001C0B76; Tue,  3 Aug 2021 23:51:26 +0200 (CEST)
Date:   Tue, 3 Aug 2021 23:51:25 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     andy@surfacebook.localdomain
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 12/13] leds: rt8515: Put fwnode in any case during
 ->probe()
Message-ID: <20210803215125.GD30387@amd>
References: <20210529111935.3849707-1-andy.shevchenko@gmail.com>
 <20210529111935.3849707-12-andy.shevchenko@gmail.com>
 <CACRpkdb21tMWyoxHuv8CwUB9fZeD332B_ui2jtMP7ocfbi6LSQ@mail.gmail.com>
 <YLtH45iTFAn9QcpQ@surfacebook.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="wULyF7TL5taEdwHz"
Content-Disposition: inline
In-Reply-To: <YLtH45iTFAn9QcpQ@surfacebook.localdomain>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--wULyF7TL5taEdwHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2021-06-05 12:46:11, andy@surfacebook.localdomain wrote:
> Tue, Jun 01, 2021 at 12:06:05PM +0200, Linus Walleij kirjoitti:
> > On Sat, May 29, 2021 at 1:19 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> >=20
> > > fwnode_get_next_available_child_node() bumps a reference counting of
> > > a returned variable. We have to balance it whenever we return to
> > > the caller.
> > >
> > > Fixes: e1c6edcbea13 ("leds: rt8515: Add Richtek RT8515 LED driver")
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >=20
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> Thanks!
>=20
> Pavel, can you, please, review this batch? I think I addressed most of yo=
ur
> comments if not all.

Your original email is: From: andy@surfacebook.localdomain . I don't
believe that's right.

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--wULyF7TL5taEdwHz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEJul0ACgkQMOfwapXb+vKkwQCgiKGNe5VZmqG5rkBTgkbNofob
wLUAnA4PfBVNO2HjVetvu3Wifm4D9z7J
=fEin
-----END PGP SIGNATURE-----

--wULyF7TL5taEdwHz--

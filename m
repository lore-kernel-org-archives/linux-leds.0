Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A01EC432BE
	for <linux-leds@archiver.kernel.org>; Thu, 26 Aug 2021 12:45:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC6A3610A3
	for <linux-leds@archiver.kernel.org>; Thu, 26 Aug 2021 12:45:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234420AbhHZMqA (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 26 Aug 2021 08:46:00 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:36404 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233687AbhHZMp7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Aug 2021 08:45:59 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 573BA1C0B7A; Thu, 26 Aug 2021 14:45:11 +0200 (CEST)
Date:   Thu, 26 Aug 2021 14:45:11 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     andrew@lunn.ch, Heiner Kallweit <hkallweit1@gmail.com>,
        Michael Walle <michael@walle.cc>, anthony.l.nguyen@intel.com,
        bigeasy@linutronix.de, davem@davemloft.net,
        dvorax.fuxbrumer@linux.intel.com, f.fainelli@gmail.com,
        jacek.anaszewski@gmail.com, kuba@kernel.org, kurt@linutronix.de,
        linux-leds@vger.kernel.org, netdev@vger.kernel.org,
        sasha.neftin@intel.com, vinicius.gomes@intel.com,
        vitaly.lifshits@intel.com
Subject: Re: [PATCH net-next 5/5] igc: Export LEDs
Message-ID: <20210826124511.GA20480@duo.ucw.cz>
References: <20210727172828.1529c764@thinkpad>
 <8edcc387025a6212d58fe01865725734@walle.cc>
 <20210727183213.73f34141@thinkpad>
 <25d3e798-09f5-56b5-5764-c60435109dd2@gmail.com>
 <20210810172927.GB3302@amd>
 <20210810195550.261189b3@thinkpad>
 <20210810195335.GA7659@duo.ucw.cz>
 <20210810225353.6a19f772@thinkpad>
 <20210817190241.GA15389@amd>
 <20210825172613.71b62113@dellmb>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline
In-Reply-To: <20210825172613.71b62113@dellmb>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > > Pavel, one point of the discussion is that in this case the LED
> > > > > is controlled by MAC, not PHY. So the question is whether we
> > > > > want to do "ethmacN" (in addition to "ethphyN").   =20
> > > >=20
> > > > Sorry, I missed that. I guess that yes, ethmacX is okay, too.
> > > >=20
> > > > Even better would be to find common term that could be used for
> > > > both ethmacN and ethphyN and just use that. (Except that we want
> > > > to avoid ethX). Maybe "ethportX" would be suitable? =20
> > >=20
> > > See
> > >   https://lore.kernel.org/linux-leds/YQAlPrF2uu3Gr+0d@lunn.ch/
> > > and
> > >   https://lore.kernel.org/linux-leds/20210727172828.1529c764@thinkpad/
> > > =20
> >=20
> > Ok, I guess I'd preffer all LEDs corresponding to one port to be
> > grouped, but that may be hard to do.
>=20
> Hi Pavel (and Andrew),
>=20
> The thing is that normally we are creating LED classdevs when the
> parent device is probed. In this case when the PHY is probed. But we
> will know the corresponding MAC only once the PHY is attached to it's
> network interface.
>=20
> Also, a PHY may be theoretically attached to multiple different
> interfaces during it's lifetime. I guess there isn't many boards
> currently that have such a configuration wired (maybe none), but
> kernel's API is prepared for this.
>=20
> So we really can't group them under one parent device, unless:

Ok, I guess my proposal is just too complex to implement. Let's go
with "ethmacN" + "ethphyN".

Best regards,

								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYSeM1wAKCRAw5/Bqldv6
8m3NAJ0SaXSb1eLxRSoS70fUthbhXQWgZwCffU3LxqEOW5OkapVMWOvbKWr4JRM=
=kpK9
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--

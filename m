Return-Path: <SRS0=0zGl=BP=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 822D1C433E0
	for <linux-leds@archiver.kernel.org>; Wed,  5 Aug 2020 21:57:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5FA712086A
	for <linux-leds@archiver.kernel.org>; Wed,  5 Aug 2020 21:57:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725969AbgHEV5L (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 5 Aug 2020 17:57:11 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53612 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgHEV5K (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 5 Aug 2020 17:57:10 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 6E0FF1C0BD2; Wed,  5 Aug 2020 23:57:06 +0200 (CEST)
Date:   Wed, 5 Aug 2020 23:57:06 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     truart@gmx.de
Cc:     linux-leds@vger.kernel.org
Subject: Re: led block trigger patch
Message-ID: <20200805215706.zgfuo4kdb6avsinu@duo.ucw.cz>
References: <trinity-ff7f1644-b76d-424b-9a6f-8caaf9961ffe-1595962052162@3c-app-gmx-bap12>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="nkxojcveixqwrdd7"
Content-Disposition: inline
In-Reply-To: <trinity-ff7f1644-b76d-424b-9a6f-8caaf9961ffe-1595962052162@3c-app-gmx-bap12>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--nkxojcveixqwrdd7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-07-28 20:47:32, truart@gmx.de wrote:
> Hej hej,
>=20
> I already asked on the linux-block list, but that was likely the wrong pl=
ace, so I try here.
>=20
> All our new thinkpads are missing a hard disk led, and when trying to use=
 some keyboard led it turned out that this is not really working. The LED i=
s either just blinking or showing nothing. When googling we found https://w=
ww.spinics.net/lists/linux-scsi/msg132286.html
> All the laptops have nvme disks, so this is exactly what we need. But it =
seems to be missing in the latest kernel.
>

> So may I ask what happened to this patch? Is it scheduled for being added=
? It's definitely needed as every new notebook I'm aware of doesn't have ha=
rd disk leds while nvme disks are default for most new notebooks now. So li=
nux should be able to show disk traffic not only for ide and sata but also =
for up-to-date disk technologies. Any chance we get that patch? Is there a =
place to vote for a patch?
>=20

Not scheduled. And we don't do voting.

Find out what is wrong with the patch, fix it, resubmit it.

Oh. It appears to register trigger per block device. That's no-no.

Are you willing to seriously work on that?
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--nkxojcveixqwrdd7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXysrMgAKCRAw5/Bqldv6
8q1gAJ4jNwsY8zq4nZxZK394S8ROz1PrugCgqpevs/H0YvI0UN5AJ+WrErJMzU8=
=neLf
-----END PGP SIGNATURE-----

--nkxojcveixqwrdd7--

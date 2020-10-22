Return-Path: <SRS0=TsxB=D5=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F06C4363A
	for <linux-leds@archiver.kernel.org>; Thu, 22 Oct 2020 10:06:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AC7D223BF
	for <linux-leds@archiver.kernel.org>; Thu, 22 Oct 2020 10:06:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896283AbgJVKGt (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 22 Oct 2020 06:06:49 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:35596 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2896266AbgJVKGt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 22 Oct 2020 06:06:49 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D9B541C0B78; Thu, 22 Oct 2020 12:06:46 +0200 (CEST)
Date:   Thu, 22 Oct 2020 12:06:46 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     "Bollinger, Seth" <Seth.Bollinger@digi.com>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>,
        Seth Bollinger <seth.boll@gmail.com>
Subject: Re: Strange timer LED behavior
Message-ID: <20201022100646.GA26350@duo.ucw.cz>
References: <3D108EE8-F4B6-490B-9B97-59B8E008F63B@digi.com>
 <2A80CF0E-1022-4673-86E8-12BF0696708E@digi.com>
 <20201020122149.GA19856@duo.ucw.cz>
 <DF67F732-7B99-4C32-A7E9-4595E2B1E82A@digi.com>
 <20201020180813.GA25906@duo.ucw.cz>
 <CF36FC5F-6FA9-4797-A6D6-6533D795DAD1@digi.com>
 <20201020183300.GB25906@duo.ucw.cz>
 <78785807-3DB7-4A70-B135-2B20A260EA57@digi.com>
 <20201020184054.GC25906@duo.ucw.cz>
 <31E37AC2-589B-41F0-B7AA-9E520160F8A6@digi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline
In-Reply-To: <31E37AC2-589B-41F0-B7AA-9E520160F8A6@digi.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Yeah. Don't do that! :-). For solid on/solid off, just turn the
> > trigger off. For blinking, use timer trigger.
>=20
> If I want to go from on or off to flashing, I need to set the timer trigg=
er, which results in a 500 ms flash rate until the real rates are set.  Thi=
s results in a noticeably different first blink.  I guess we=E2=80=99re loo=
king for smooth control of the LED.
>

Okay, that's fair requirement, I guess.

If you have proposals how to solve this in a nice way, go ahead.

As a hack...

I believe you can go from on to off like this:

on:9999,off:0 -> on:9999,off:1 -> on:1,off:9999 -> on:0,off:9999.

(And I believe we should document this somewhere).

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX5FZtgAKCRAw5/Bqldv6
8kWoAJ9XicjirlWd/qjK46D/SbI1kkA46QCfdj9+G3+i/3+09PIO7AtgtuzilBg=
=TJcT
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--

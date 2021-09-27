Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA16C433EF
	for <linux-leds@archiver.kernel.org>; Mon, 27 Sep 2021 14:23:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F07B460FD7
	for <linux-leds@archiver.kernel.org>; Mon, 27 Sep 2021 14:23:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234804AbhI0OZ3 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 27 Sep 2021 10:25:29 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53834 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234817AbhI0OZY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Sep 2021 10:25:24 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 3CFE01C0B7A; Mon, 27 Sep 2021 16:23:46 +0200 (CEST)
Date:   Mon, 27 Sep 2021 16:23:45 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        johannes.berg@intel.com
Cc:     linux-leds@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] leds: trigger: Disable CPU trigger on PREEMPT_RT
Message-ID: <20210927142345.GB18276@duo.ucw.cz>
References: <20210924111501.m57cwwn7ahiyxxdd@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="DBIVS5p969aUjpLe"
Content-Disposition: inline
In-Reply-To: <20210924111501.m57cwwn7ahiyxxdd@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--DBIVS5p969aUjpLe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The CPU trigger is invoked on ARM from CPU-idle. That trigger later
> invokes led_trigger_event() which acquires a read lock in an IRQ-off
> section. The problematic part on PREEMPT_RT is that this lock is turned
> into a sleeping lock and must not be acquired with disabled interrupts.
>=20
> The problem continues as that the LED driver underneath must not acquire
> any sleeping locks itself.
>=20
> Disable the CPU trigger on PREEMPT_RT.

I know locking with leds is problematic, but I believe you'll hit
similar problem elsewhere... Disabling triggers is not solution.

Can you take a look at:

Subject: [PATCH] leds: trigger: use RCU to protect the led_cdevs list
=46rom: Johannes Berg <johannes.berg@intel.com>

It changes affected area, and there's good chance RCU solves your
problem. (And you may be better person to review it than I am).

I'll apply Johanness' patch to the -next, and see what happens. If
someone sees a problem, speak up.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--DBIVS5p969aUjpLe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYVHT8QAKCRAw5/Bqldv6
8okCAJoDNQtfu1IgYJ0KRoWLhN38+9eyIQCfdK82dskiCKdiLl18gmAVpxbaack=
=JHBB
-----END PGP SIGNATURE-----

--DBIVS5p969aUjpLe--

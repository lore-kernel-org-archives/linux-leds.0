Return-Path: <SRS0=b3MX=IF=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 829AAC433E0
	for <linux-leds@archiver.kernel.org>; Sun,  7 Mar 2021 16:14:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A2DA64FC8
	for <linux-leds@archiver.kernel.org>; Sun,  7 Mar 2021 16:14:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232406AbhCGQOP (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sun, 7 Mar 2021 11:14:15 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:39488 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232377AbhCGQOA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 7 Mar 2021 11:14:00 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id DA7101C0B76; Sun,  7 Mar 2021 17:13:57 +0100 (CET)
Date:   Sun, 7 Mar 2021 17:13:57 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Marc Kleine-Budde <mkl@pengutronix.de>, hdegoede@redhat.com
Cc:     Andrea Righi <andrea.righi@canonical.com>,
        Boqun Feng <boqun.feng@gmail.com>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, schuchmann@schleissheimer.de
Subject: Re: [PATCH] leds: trigger: fix potential deadlock with libata
Message-ID: <20210307161357.GA2933@duo.ucw.cz>
References: <20201102104152.GG9930@xps-13-7390>
 <20210306203954.ya5oqgkdalcw45c4@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline
In-Reply-To: <20210306203954.ya5oqgkdalcw45c4@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > --- a/drivers/leds/led-triggers.c
> > +++ b/drivers/leds/led-triggers.c
> > @@ -378,14 +378,15 @@ void led_trigger_event(struct led_trigger *trig,
> >  			enum led_brightness brightness)
> >  {
> >  	struct led_classdev *led_cdev;
> > +	unsigned long flags;
> > =20
> >  	if (!trig)
> >  		return;
> > =20
> > -	read_lock(&trig->leddev_list_lock);
> > +	read_lock_irqsave(&trig->leddev_list_lock, flags);
> >  	list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list)
> >  		led_set_brightness(led_cdev, brightness);
> > -	read_unlock(&trig->leddev_list_lock);
> > +	read_unlock_irqrestore(&trig->leddev_list_lock, flags);
> >  }
> >  EXPORT_SYMBOL_GPL(led_trigger_event);
>=20
> meanwhile this patch hit v5.10.x stable and caused a performance
> degradation on our use case:
>=20
> It's an embedded ARM system, 4x Cortex A53, with an SPI attached CAN
> controller. CAN stands for Controller Area Network and here used to
> connect to some automotive equipment. Over CAN an ISOTP (a CAN-specific
> Transport Protocol) transfer is running. With this patch, we see CAN
> frames delayed for ~6ms, the usual gap between CAN frames is 240=B5s.
>=20
> Reverting this patch, restores the old performance.
>=20
> What is the best way to solve this dilemma? Identify the critical path
> in our use case? Is there a way we can get around the irqsave in
> led_trigger_event()?

Hans was pushing for this patch, perhaps he has some ideas...
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYET7xQAKCRAw5/Bqldv6
8vKIAKDCxR0yuLq5ex211qqLUpFiWAZK+ACfc2M1gGpIsYkKLbgDIDuOujybruM=
=/uEM
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--

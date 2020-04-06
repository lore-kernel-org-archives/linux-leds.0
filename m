Return-Path: <SRS0=CrCS=5W=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65EF7C2BA2B
	for <linux-leds@archiver.kernel.org>; Mon,  6 Apr 2020 21:08:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3EFAA206B8
	for <linux-leds@archiver.kernel.org>; Mon,  6 Apr 2020 21:08:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbgDFVIG (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 6 Apr 2020 17:08:06 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:44506 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbgDFVIF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 Apr 2020 17:08:05 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 9D7EE1C47EB; Mon,  6 Apr 2020 23:08:03 +0200 (CEST)
Date:   Mon, 6 Apr 2020 23:08:03 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Marek Behun <marek.behun@nic.cz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH RFC leds-next] leds: initial support for Turris Omnia LEDs
Message-ID: <20200406210802.GB12611@amd.ucw.cz>
References: <20200319181604.2425-1-marek.behun@nic.cz>
 <20200321153325.GD8386@duo.ucw.cz>
 <943a5770-ea9c-24ac-5ab3-a9a24fc6a856@gmail.com>
 <20200328132729.5e628fe6@nic.cz>
 <20200328133629.79603fe3@nic.cz>
 <00b6737b-47f8-7ea4-74b7-eee3d2aefdf3@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
Content-Disposition: inline
In-Reply-To: <00b6737b-47f8-7ea4-74b7-eee3d2aefdf3@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > I decided to abandon the microcontroller driver path.
> > But nonetheless there is still one thing I would like to solve.
> >=20
> > The front button on Omnia is used to control the global brightness of
> > the RGB LEDs, so that user can change it if the LEDs glow too much.
> > The microcontroller does this as such: there is another PWM on top of
> > all the LED PWMs, and this value can be manipulated via the same i2c
> > interface as the LEDs, but via another command.
> >=20
> > The thing is that I would like to somehow export this global brightness
> > setting to userspace, because otherwise it gets reset after reboot, and
> > I want the user to be able to set this global brightness by software,
> > so that they won't have to change it after every reboot manually by
> > pressing the front button.
> >=20
> > I am wondering how to do this. Last year I proposed this by adding a
> > sysfs attribute file to the device which is parent to the LEDs, but you
> > did not agree :(

This is really special feature, with button interaction. I don't
expect to see it elsewhere. Can you put it into /sys somewhere close
to the other controls for your platform? I have /proc/acpi/ibm on this
machine. It should not be /proc in new code, but you get the idea...

> I already proposed adding a "luma" LED class device for similar
> case [0], but didn't here any feedback from Pavel so far.

I dislike that. Luma is not really a color. Plus, this is different
case AFAICT, as global brightness affects all the LEDs at the same
time.

> [0]
> https://lore.kernel.org/linux-leds/1583502010-16210-1-git-send-email-nbel=
in@baylibre.com/T/#mf52c8d4f68260a445223c26957c61e6267e0932d

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--4bRzO86E/ozDv8r1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXouaMgAKCRAw5/Bqldv6
8s2JAJ0Xq78fgTdexDEWzO+U6awj0PN99ACeOT+7qI5I2LpvpInlazCsOtJKC0E=
=Lz7d
-----END PGP SIGNATURE-----

--4bRzO86E/ozDv8r1--

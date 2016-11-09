From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v4 1/3] leds: Introduce userspace leds driver
Date: Wed, 9 Nov 2016 08:05:14 +0100
Message-ID: <20161109070514.GA18969@amd>
References: <1474053410-24387-1-git-send-email-david@lechnology.com>
 <CGME20160916191722eucas1p1ceadfd878f28c36bae4c8bf33f582e6b@eucas1p1.samsung.com>
 <1474053410-24387-2-git-send-email-david@lechnology.com>
 <0bfdfd46-35e5-321c-5759-0cc96be862fd@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:40631 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752397AbcKIHFS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Nov 2016 02:05:18 -0500
Content-Disposition: inline
In-Reply-To: <0bfdfd46-35e5-321c-5759-0cc96be862fd@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: David Lechner <david@lechnology.com>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >+struct uleds_device {
> >+	struct uleds_user_dev	user_dev;
> >+	struct led_classdev	led_cdev;
> >+	struct mutex		mutex;
> >+	enum uleds_state	state;
> >+	wait_queue_head_t	waitq;
> >+	unsigned char		brightness;
>=20
> I've just noticed that this is wrong, since LED subsystem
> brightness type is enum led_brightness, i.e. int.
> LED_FULL (255) value is a legacy enum value that can be overridden
> by max_brightness property.
>=20
> Please submit a fix so that I could merge it with the original
> patch before sending it upstream.

Actually... perhaps you want to wait with merging the userspace driver
till the locking is solved in the LED subsystem? Maybe I'm wrong, but
I have feeling that userspace driver will have unusual requirements
w.r.t. locking, and that it would be good to have that solved,
first...

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlgiyqoACgkQMOfwapXb+vKwJgCfdD32k8NapBf8kU4wLRQ7JGa6
+3YAnjy0EVs/v9BNePC0MtX5HWPTmaQu
=RykP
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--

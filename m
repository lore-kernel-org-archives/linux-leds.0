From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: Allow drivers to update the core, and generate
 events on changes
Date: Tue, 27 Dec 2016 21:07:56 +0100
Message-ID: <20161227200755.GA6345@amd>
References: <20161227191136.4516-1-gabriele.mzt@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:53812 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755038AbcL0UH7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Dec 2016 15:07:59 -0500
Content-Disposition: inline
In-Reply-To: <20161227191136.4516-1-gabriele.mzt@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Similarily to commit 325253a6b2de ("backlight: Allow drivers to update
> the core, and generate events on changes"), inform userspace about
> brightness changes and allow drivers to request updates of the
> brightness value.

First... we had similar patch in tree, and it caused problems, we are
now trying to figure out how to do it properly.

LED can be updated many times per second, uevent is probably _not_
good mechanism to achieve that.

Generating uevent for /sys changes does not make much sense, right?

> +extern void led_brightness_force_update(struct led_classdev *led_cdev,
> +				enum led_brightness_update_reason reason);

I see this may make some sense, but there are no uses for this in this
patch.

My preffered solution would be ... for hardware that changes led
brightness itself, introduce a "trigger", so that userspace knows this
led is special, and then provide poll()able /sys fs file interested
parties can read.

Best regards,

								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlhiyhsACgkQMOfwapXb+vJAUQCeMdXklJ8zIz+/FELD3LaDmXch
vOEAoIJJeUnpEq51xE66F8wNKceif/0D
=UGQG
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--

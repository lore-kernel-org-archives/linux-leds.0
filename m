From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: Allow drivers to update the core, and generate
 events on changes
Date: Tue, 27 Dec 2016 22:02:45 +0100
Message-ID: <20161227210245.GA7952@amd>
References: <20161227191136.4516-1-gabriele.mzt@gmail.com>
 <20161227200755.GA6345@amd>
 <5f442764-825b-1bdc-2763-1c4c8dc1c098@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:54924 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752216AbcL0VFQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Dec 2016 16:05:16 -0500
Content-Disposition: inline
In-Reply-To: <5f442764-825b-1bdc-2763-1c4c8dc1c098@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Generating uevent for /sys changes does not make much sense, right?
>=20
> I planned to use this patch mostly for keyboard backlights, for
> which some DEs provide a UI similar to the one for screen backlights.
> Having uevents also for /sys changes means having the UI always in
> sync with the kernel/hardware, as it happens for screen backlights.
> In case of LEDs only the application changing the brightness is
> aware of the change.
>=20
> >> +extern void led_brightness_force_update(struct led_classdev *led_cdev,
> >> +				enum led_brightness_update_reason reason);
> >=20
> > I see this may make some sense, but there are no uses for this in this
> > patch.
> >=20
> > My preffered solution would be ... for hardware that changes led
> > brightness itself, introduce a "trigger", so that userspace knows this
> > led is special, and then provide poll()able /sys fs file interested
> > parties can read.
>=20
> OK, I'll see if I can come up something good.

Please see this thread:

Date: Tue, 15 Nov 2016 13:06:14 +0100
=46rom: Hans de Goede <hdegoede@redhat.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Jacek Anaszewski
        <jacek.anaszewski@gmail.com>, Tony Lindgren
	<tony@atomide.com>,
 	linux-leds@vger.kernel.org,
 	linux-omap@vger.kernel.org,
 	linux-arm-kernel@lists.infradead.org,
 	linux-kernel@vger.kernel.org, Darren Hart
 	<dvhart@infradead.org>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: LEDs that change brightness "itself" -- that's a
trigger. Re: PM regression with LED changes in next-20161109


=2E..and you may want to cc: Hans de Goede <hdegoede@redhat.com> . He is
apparently solving same problem.

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlhi1vUACgkQMOfwapXb+vL9TACdEmWxU6Vv0XdJYL4DbF9hcieB
QyQAoJ3inEHzoBi1OMRdPMj0ZAfAwpHS
=/iLe
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--

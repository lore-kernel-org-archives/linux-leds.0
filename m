From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] cleanup LED documentation and make it match reality
Date: Mon, 3 Oct 2016 11:38:41 +0200
Message-ID: <20161003093841.GA9131@amd>
References: <CGME20161003081122eucas1p1d125c5f55f171b1ca5e4e1d28a3ad4b1@eucas1p1.samsung.com>
 <20161003081049.GA12419@amd>
 <a9dcb6e9-a1bf-df4e-7030-8480392a7955@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:50902 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753200AbcJCJit (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 3 Oct 2016 05:38:49 -0400
Content-Disposition: inline
In-Reply-To: <a9dcb6e9-a1bf-df4e-7030-8480392a7955@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>, Greg KH <greg@kroah.com>


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Thanks for the patch.
>=20
> On 10/03/2016 10:10 AM, Pavel Machek wrote:
> >
> >sysfs-class-led fails to mention some important details. Also fix led
> >vs LED and english.
> >
> >Signed-off-by: Pavel Machek <pavel@ucw.cz>
> >
> >--- a/Documentation/ABI/testing/sysfs-class-led
> >+++ b/Documentation/ABI/testing/sysfs-class-led
> >@@ -4,16 +4,25 @@ KernelVersion:	2.6.17
> > Contact:	Richard Purdie <rpurdie@rpsys.net>
> > Description:
> > 		Set the brightness of the LED. Most LEDs don't
> >-		have hardware brightness support so will just be turned on for
> >+		have hardware brightness support, so will just be turned on for
> > 		non-zero brightness settings. The value is between 0 and
> > 		/sys/class/leds/<led>/max_brightness.
> >
> >+		Writing 0 to this file clears active trigger.
> >+
> >+		Writing non-zero to this file while trigger is active changes the
> >+		top brightness trigger is going to use.
>=20
> This is true only in case of timer trigger, as it uses blink_brightness
> property from struct led_classdev to cache current brightness, when the
> the LED is in the off cycle. This is part of software blink fallback
> functionality.
>=20
> In case of heartbeat trigger max_brightness is always used for top level
> brightness. We'd need to refactor the trigger a bit to allow for
> different top brightness levels.

Ok, do you think you could update the documenation to match the
reality? It is quite important to know what is the intended behaviour
and what are the bugs.

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlfyJyEACgkQMOfwapXb+vLlTwCdF5WfpBjaTWs0o6l/OW5LIafy
rwYAoKhMSReGS1YbPUumV1rdq2TY+2sa
=S7J1
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--

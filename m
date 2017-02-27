From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2] leds: core: use deferred probing if default trigger
 isn't available yet
Date: Mon, 27 Feb 2017 12:12:13 +0100
Message-ID: <20170227111213.GA19403@amd>
References: <001fb4b9-a83f-7b01-efb5-9fde715b35a1@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:57616 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751813AbdB0LWf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Feb 2017 06:22:35 -0500
Content-Disposition: inline
In-Reply-To: <001fb4b9-a83f-7b01-efb5-9fde715b35a1@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2017-02-24 07:41:48, Heiner Kallweit wrote:
> When registering a LED device we have the option to set a default trigger.
> Depending on load order of drivers this trigger may not be available yet.
> (affected LED device in my case: a DT-configured GPIO LED)
> So far if the default trigger can't be found this error is silently
> ignored.
>=20
> Let's change this to return EPROBE_DEFER if the default trigger can't be
> found. This gives the system the chance to probe the LED device later
> once the trigger is available.
>=20
> In addition in led_trigger_set_default break out of the loop when trigger
> has been found.

Hmm. Problem with this is that if the we configure non-existing
trigger, or trigger not configured in current kernel, LED will
disappear and user will have "fun" debugging why, right?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAli0CY0ACgkQMOfwapXb+vJrIgCeMPoop6gfVndBhHXHPXdvc+Ju
EQYAn3NdqGpQ1SdFfAciIBgArKudoXzj
=K2rv
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--

From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: core: use deferred probing if default trigger
 isn't available yet
Date: Thu, 23 Feb 2017 22:08:11 +0100
Message-ID: <20170223210811.GC19376@amd>
References: <39873979-0231-1605-1d37-9ee29c6a0286@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5QAgd0e35j3NYeGe"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:34293 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751222AbdBWVIO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Feb 2017 16:08:14 -0500
Content-Disposition: inline
In-Reply-To: <39873979-0231-1605-1d37-9ee29c6a0286@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>


--5QAgd0e35j3NYeGe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2017-02-22 21:35:52, Heiner Kallweit wrote:
> When registering a LED device we have the option to set a default trigger.
> Depending on load order of drivers this trigger may not be available yet.
> (affected LED device in my case: a DT-configured GPIO LED)
> So far if the default trigger can't be found this error is silently
> ignored.
>=20
> Let's change this to return EPROBE_DEFER if the default trigger can't be
> found. This gives the system the chance to probe the LED device later
> once the trigger is available.

I see a lot of EPROBE_DEFERs on N900, and it is quite nasty, as it
spams a log a lot.

Rather then re-trying LED registration few times, could we make sure
leds are always registered after triggers or something like that?

     	 		   	 	     	       	    Pavel


>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> ---
>  drivers/leds/led-class.c    |  6 +++++-
>  drivers/leds/led-triggers.c | 11 ++++++++---
>  include/linux/leds.h        |  5 +++--
>  3 files changed, 16 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index f2b0a80a..efe4f5a3 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -295,7 +295,11 @@ int led_classdev_register(struct device *parent, str=
uct led_classdev *led_cdev)
>  	led_init_core(led_cdev);
> =20
>  #ifdef CONFIG_LEDS_TRIGGERS
> -	led_trigger_set_default(led_cdev);
> +	ret =3D led_trigger_set_default(led_cdev);
> +	if (ret) {
> +		led_classdev_unregister(led_cdev);
> +		return ret;
> +	}

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--5QAgd0e35j3NYeGe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlivTzsACgkQMOfwapXb+vJsIACfWO6G5/hUDFsZ5hCPZjdIR7ax
6qMAnAsKPbka5hNZWd8uA11S3UhNfJDB
=viTG
-----END PGP SIGNATURE-----

--5QAgd0e35j3NYeGe--

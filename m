From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] led-triggers: allow writing 'default' to sysfs trigger
 attr
Date: Tue, 28 Nov 2017 13:07:52 +0100
Message-ID: <20171128120752.GA14905@amd>
References: <20171128063820.87534-1-craig.mcqueen@innerrange.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:48312 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752512AbdK1MHz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 Nov 2017 07:07:55 -0500
Content-Disposition: inline
In-Reply-To: <20171128063820.87534-1-craig.mcqueen@innerrange.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Craig McQueen <craig.mcqueen@innerrange.com>
Cc: linux-leds@vger.kernel.org


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2017-11-28 17:38:20, Craig McQueen wrote:
> It calls led_trigger_set_default() to set the LED to its default
> trigger.

This needs corresponding change to documentation, at the very least.

									Pavel
>  drivers/leds/led-triggers.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index 431123b048a2..f090a7806017 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -49,6 +49,11 @@ ssize_t led_trigger_store(struct device *dev, struct d=
evice_attribute *attr,
>  		goto unlock;
>  	}
> =20
> +	if (sysfs_streq(buf, "default")) {
> +		led_trigger_set_default(led_cdev);
> +		goto unlock;
> +	}
> +
>  	down_read(&triggers_list_lock);
>  	list_for_each_entry(trig, &trigger_list, next_trig) {
>  		if (sysfs_streq(buf, trig->name)) {

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlodUZgACgkQMOfwapXb+vJPygCfRLsWFoQC4oMAKU1okcuS6h5Q
BwMAn3aX8Y6ro+yNcYjb07ROMjtIGhqw
=VeEb
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--

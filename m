From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: Add mutex protection in brightness_show()
Date: Wed, 9 Nov 2016 13:38:00 +0100
Message-ID: <20161109123800.GB3488@amd>
References: <1478245962-15706-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="OwLcNYc0lM97+oe1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1478245962-15706-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>
List-Id: linux-leds@vger.kernel.org


--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Initially the claim about no need for lock in brightness_show()
> was valid as the function was just returning unchanged
> LED brightness. After the addition of led_update_brightness() this

The claim was probably wrong from the day one, unless brightness is of
type "atomic_t".

             /* Ensures consistent access to the LED Flash Class device */
	        struct mutex            led_access;
		};

This should really list fields that are protected by led_access.

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--OwLcNYc0lM97+oe1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlgjGKgACgkQMOfwapXb+vIxrwCdGTR0RbgD5NA6YN1x/DWqvZpe
b/IAniQs5JGkdiPr4EjHG63jIszjc453
=04Ip
-----END PGP SIGNATURE-----

--OwLcNYc0lM97+oe1--

From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 03/24] leds: dt-bindings: Add LED_FUNCTION definitions
Date: Sun, 11 Nov 2018 21:20:56 +0100
Message-ID: <20181111202056.GB20160@amd>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-4-git-send-email-jacek.anaszewski@gmail.com>
 <20181111113157.GK27666@amd>
 <96296b4d-d49e-2b08-4306-196605a9f5dc@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <96296b4d-d49e-2b08-4306-196605a9f5dc@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Dan Murphy <dmurphy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>, Xiaotong Lu <xiaotong.lu@spreadtrum.com>
List-Id: linux-leds@vger.kernel.org


--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> +#define LED_FUNCTION_BACKLIGHT "backlight"
> >> +#define LED_FUNCTION_BACKLIGHT_CLUSTER "backlight_cluster"
> >=20
> > Sounds like one of backlight and backlight_cluster should be deprecated?
>=20
> I think so.

Agreed.

> >> +#define LED_FUNCTION_DEBUG "debug"
> >> +#define LED_FUNCTION_DIA "dia"
> >=20
> > What does this one do?
>=20
> I'd opt for something like "diagnostics", but this is a blind shot.
> Let's remove it then and, and let people add more meaningful
> definition in case it is needed.
>=20
> >> +#define LED_FUNCTION_DISK "disk"
> >=20
> > We have disk, hd, hdd and sata. Deprecate some?
>=20
> Disk should be the best choice, especially given that we have
> identically named trigger.

Ok.

> >> +#define LED_FUNCTION_HD "hd"
> >> +#define LED_FUNCTION_HDD "hdd"
> >> +#define LED_FUNCTION_HDDERR "hdderr"
> >=20
> > Ok, I'll=20
>=20
> Hmm?

I was going to say that I'll bring it up in different email.

I believe we should have disk:green:activity and disk:red:error, not
"green:hdd" and "red:hdderr".

> >> +#define LED_FUNCTION_HEALTH "health"
> >> +#define LED_FUNCTION_HEARTBEAT "heartbeat"
> >=20
> > Sounds same as alive, deprecate alive?
>=20
> Heartbeat may be designated specifically for registration
> for events from the trigger with the same name.

Ok. What is "alive" then?

> >> +#define LED_FUNCTION_WIFI "wifi"
> >> +#define LED_FUNCTION_WIRELESS "wireless"
> >> +#define LED_FUNCTION_WLAN "wlan"
> >=20
> > Same as wifi and wireless, I guess, deprecate some?
>=20
> I'd remove "wireless" and "wlan".

Actually I'd keep wlan, but... :-).

We may want to do add some comments there, and sort it "most
common/recommended first" or something.

Best regards (and thanks for doing the work),
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvojycACgkQMOfwapXb+vI7SACfW93uH8rBuPN5hycAP36oG2sk
Iw0An1ppzjzwqhiG2q/mlkJqKjLroxAG
=6Be5
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--

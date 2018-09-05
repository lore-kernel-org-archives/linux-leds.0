From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: leds-gpio: Add a condition check for active low
 leds.
Date: Wed, 5 Sep 2018 11:52:54 +0200
Message-ID: <20180905095254.GA9579@amd>
References: <20180905023436.11826-1-songqiang.1304521@gmail.com>
 <13a8d001-a44a-51a0-146b-ba5aa3f6e621@ysoft.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <13a8d001-a44a-51a0-146b-ba5aa3f6e621@ysoft.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc: Song Qiang <songqiang1304521@gmail.com>, jacek.anaszewski@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Song Qiang <songqiang.1304521@gmail.com>
List-Id: linux-leds@vger.kernel.org


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2018-09-05 09:44:04, Michal Vok=C3=A1=C4=8D wrote:
> Hi Song,
> On 5.9.2018 04:34, Song Qiang wrote:
> >Some leds on our board are active low leds, which means these leds
> >are lighted when the corresponding gpio line is low, while the
> >original leds-gpio driver default all leds are active high leds.
> >This patch adds a devicetree node "light-state", whose value should
> >be "high" for active high leds and "low" for active low leds.
> >The default value is "high" for compatible for the original driver.
> >
> >Signed-off-by: Song Qiang <songqiang.1304521@gmail.com>
> >---
> >  .../devicetree/bindings/leds/leds-gpio.txt    | 15 +++++++++++
> >  drivers/leds/leds-gpio.c                      | 25 +++++++++++++++++--
> >  2 files changed, 38 insertions(+), 2 deletions(-)
> >
> >diff --git a/Documentation/devicetree/bindings/leds/leds-gpio.txt b/Docu=
mentation/devicetree/bindings/leds/leds-gpio.txt
> >index a48dda268f81..0a8fad75c704 100644
> >--- a/Documentation/devicetree/bindings/leds/leds-gpio.txt
> >+++ b/Documentation/devicetree/bindings/leds/leds-gpio.txt
> >@@ -23,6 +23,9 @@ LED sub-node properties:
> >    remains up.
> >  - panic-indicator : (optional)
> >    see Documentation/devicetree/bindings/leds/common.txt
> >+- light-state: (optional) Values should be "high" or "low", which indic=
ates
> >+	the state of the GPIO pin when the led is on.
> >+  see Documentation/devicetree/bindings/leds/common.txt
> >  Examples:
> >@@ -64,3 +67,15 @@ leds {
> >  		retain-state-suspended;
> >  	};
> >  };
> >+
> >+leds {
> >+	compatible =3D "gpio-leds";
> >+
> >+	led0 {
> >+		label =3D "led0";
> >+		gpios =3D <&gpio1 19 GPIO_ACTIVE_HIGH>;
>=20
> With this patch you are introducing one more way to invert the logic.
> If your LED is active LOW, you should use GPIO_ACTIVE_LOW in your DT.
> All should work as expected then.

Exactly, GPIO subsystem already has ways to specify active-low and
active-high.

NAK.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAluPp3YACgkQMOfwapXb+vKGQwCgssYzLEADPlcHF0mc1LMt1UF6
XiEAn3GbSIgmQFeR5Isg715BwiNUh6ZH
=Utpm
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--

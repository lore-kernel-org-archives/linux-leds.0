From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 1/5] dt-bindings: leds: Add pattern initialization
 from Device Tree
Date: Wed, 12 Dec 2018 13:32:21 +0100
Message-ID: <20181212123221.GA12040@amd>
References: <1544613406-27026-1-git-send-email-krzk@kernel.org>
 <1544613406-27026-2-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544613406-27026-2-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Baolin Wang <baolin.wang@linaro.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2018-12-12 12:16:42, Krzysztof Kozlowski wrote:
> Document new linux,trigger-pattern property for initialization of LED
> pattern trigger.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/leds/common.txt | 36 +++++++++++++++++=
++++++
>  1 file changed, 36 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Document=
ation/devicetree/bindings/leds/common.txt
> index aa1399814a2a..3daccd4ea8a3 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -37,6 +37,42 @@ Optional properties for child nodes:
>       "ide-disk" - LED indicates IDE disk activity (deprecated),
>                    in new implementations use "disk-activity"
>       "timer" - LED flashes at a fixed, configurable rate
> +     "pattern" - LED alters the brightness for the specified duration wi=
th one
> +                 software timer (requires "led-pattern" property)
> +
> +- led-pattern : String with default pattern for certain triggers. Each t=
rigger
> +                may parse this string differently:
> +                - one-shot : two numbers specifying delay on and delay o=
ff,
> +                - timer : two numbers specifying delay on and delay
off,

Needs specifying that numbers are in miliseconds, at the very least.


> +                - pattern : The pattern is given by a series of tuples, =
of
> +                  brightness and duration (ms).  The LED is expected to =
traverse
> +                  the series and each brightness value for the specified
> +                  duration.  Duration of 0 means brightness should immed=
iately
> +                  change to new value.
> +
> +                  1. For gradual dimming, the dimming interval now is se=
t as 50
> +                  milliseconds. So the tuple with duration less than dim=
ming
> +                  interval (50ms) is treated as a step change of brightn=
ess,
> +                  i.e. the subsequent brightness will be applied without=
 adding
> +                  intervening dimming intervals.
> +
> +                  The gradual dimming format of the software pattern val=
ues should be:
> +                  "brightness_1 duration_1 brightness_2 duration_2 brigh=
tness_3
> +                  duration_3 ...".
> +                  For example "0 1000 255 2000" will make the LED go gra=
dually
> +                  from zero-intensity to max (255) intensity in 1000
> +                  milliseconds, then back to zero intensity in 2000
> +                  milliseconds.
> +
> +                  2. To make the LED go instantly from one brightness va=
lue to
> +                  another, pattern should use zero-time lengths (the bri=
ghtness
> +                  must be same as the previous tuple's). So the format s=
hould be:
> +                  "brightness_1 duration_1 brightness_1 0 brightness_2
> +                  duration_2 brightness_2 0 ...".
> +                  For example "0 1000 0 0 255 2000 255 0" will make the =
LED
> +                  stay off for one second, then stay at max brightness f=
or two
> +                  seconds.
> +

No. Duplicated code is bad, and so is duplicated documentation. Maybe
the documentation should be in device tree part, but lets put it into
separate file, and reference it from the sysfs docs.

50msec for step change is really a implementation detail of Linux. May
be worth documenting for sysfs, but not for device tree
description. People should always specify 0 if they want step change.

Actually, no, I don't think this is quite suitable.

These are arrays of integers. They probably should not be specified as
strings in dts...?

(Plus, of course, timer and one-shot are subset of pattern, all we
need is to specify number of repeats...)

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlwQ/9UACgkQMOfwapXb+vJuIACgwVel+/rEsO4/9GtijwtQpWM4
vvQAoIr6iGtaRO2AJLJAOy5Px8Lx5jOY
=YvTw
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--

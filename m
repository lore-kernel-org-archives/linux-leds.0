From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v10 2/2] leds: sc27xx: Add pattern_set/clear interfaces
 for LED controller
Date: Thu, 6 Sep 2018 23:16:05 +0200
Message-ID: <20180906211605.GA16899@amd>
References: <5a502ec29251c019ddad8f3314ab45fc0f6feaf7.1536200860.git.baolin.wang@linaro.org>
 <975a9570c75fb4469c0cef55cc9ed42266f933af.1536200860.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <975a9570c75fb4469c0cef55cc9ed42266f933af.1536200860.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: jacek.anaszewski@gmail.com, rteysseyre@gmail.com, bjorn.andersson@linaro.org, broonie@kernel.org, linus.walleij@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> diff --git a/Documentation/ABI/testing/sysfs-class-led-driver-sc27xx b/Do=
cumentation/ABI/testing/sysfs-class-led-driver-sc27xx
> new file mode 100644
> index 0000000..d8056d5
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-led-driver-sc27xx
> @@ -0,0 +1,22 @@
> +What:		/sys/class/leds/<led>/hw_pattern
> +Date:		September 2018
> +KernelVersion:	4.20
> +Description:
> +		Specify a hardware pattern for the SC27XX LED. For the SC27XX
> +		LED controller, it only supports 4 stages to make a single
> +		hardware pattern, which is used to configure the rise time,
> +		high time, fall time and low time for the breathing mode.
> +
> +		For the breathing mode, the SC27XX LED only expects one brightness
> +		for the high stage. To be compatible with the hardware pattern
> +		format, we should set brightness as 0 for rise stage, fall
> +		stage and low stage.
> +
> +		Min stage duration: 125 ms
> +		Max stage duration: 31875 ms
> +
> +		Since the stage duration step is 125 ms, the duration must be
> +		a multiplier of 125, like 125ms, 250ms, 375ms, 500ms ... 31875ms.
> +
> +		Thus the format of the hardware pattern values should be:
> +		"0 rise_duration brightness high_duration 0 fall_duration 0 low_durati=
on".

If I'm not mistaken, this is:

                "0 rise_duration brightness high_duration brightness
                fall_duration 0 low_duration".

Right?

With that fixed:

Acked-by: Pavel Machek <pavel@ucw.c>

And... thanks!
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAluRmRUACgkQMOfwapXb+vICHgCgtiOu/xFEJVBwfeVTAq9LGsrM
l3wAn3pxOT5EToHJ3ttCATrg66GJJ3Bu
=t3ro
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--

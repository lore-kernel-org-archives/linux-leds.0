From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 1/2] leds: core: Introduce generic pattern interface
Date: Fri, 27 Jul 2018 10:36:05 +0200
Message-ID: <20180727083605.GA20233@amd>
References: <2c3a8911-150a-9b25-2a66-a9432047f96b@lechnology.com>
 <68996338-a902-2b57-0bb9-df274a496b06@gmail.com>
 <20180718075637.GA10279@amd>
 <913151e4-c19f-9a22-697c-52a9fb48cb32@gmail.com>
 <0e0cd8f7-dc73-6733-65f2-9a14506b0f0e@gmail.com>
 <20180718221717.GA5451@amd>
 <20180719202005.GA7763@amd>
 <CAMz4kuKGcnDqyF29vGDqjRDMWmmk=c=QVQExYrx_Ymomm3qh+g@mail.gmail.com>
 <20180724114147.GA26036@amd>
 <CAMz4kuKbjUDvqyM3rovRmUpeSabNL6yHX1HpFUYD0pc9d4PNMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMz4kuKbjUDvqyM3rovRmUpeSabNL6yHX1HpFUYD0pc9d4PNMg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, David Lechner <david@lechnology.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > This should be a bit better. I attempted to compile it with your
> > driver, but whether it works is an open question.
>=20
> Sorry for late reply. I've compiled and tested this version on my
> platform, the hardware pattern can work with one small fix as below.
>=20
>  if (led_cdev->pattern_set && !led_cdev->pattern_set(led_cdev,
> data->steps, data->nsteps)) {
>         return;
>  }
>=20
> But I saw there are lots coding style issues and something can be
> improved in this patch, so will you send out one clean patch (I will
> help to test the hardware pattern support)? Or I can help to improve
> this code and try to upstream it again?

If you could do the upstreaming, that would be great.

I tried to get hardware accelerated LED to work on N900, but that
hardware is rather complex, so it would take me some time...

Best regards,
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlta2XUACgkQMOfwapXb+vKNNACfSmyhzdm3AqIKCmGsmg90g9mL
7UgAnAnztEKImnrROnu4kDaQyaZ1kB3K
=0Njs
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--

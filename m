From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 1/2] leds: core: Introduce generic pattern interface
Date: Wed, 18 Jul 2018 09:56:37 +0200
Message-ID: <20180718075637.GA10279@amd>
References: <CAMz4kuJfPKykB6G-8C25mmMCfQgefv-Y=k2OQYZR_e0Tvg3guQ@mail.gmail.com>
 <8da1b769-8aa3-9698-467a-2e7b0707fecf@gmail.com>
 <CAMz4kuKZ6Z1h=yzFYJihEH1ARC5FKtDC6RLz0u8SmaekOZ=utw@mail.gmail.com>
 <20180714212033.GA31950@amd>
 <00fa2693-9308-8d74-0124-04066a76c35a@gmail.com>
 <20180714222924.GA2776@amd>
 <20180714223907.GB2776@amd>
 <1138f834-e805-6076-bb5b-aa1fdc1f2606@gmail.com>
 <2c3a8911-150a-9b25-2a66-a9432047f96b@lechnology.com>
 <68996338-a902-2b57-0bb9-df274a496b06@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <68996338-a902-2b57-0bb9-df274a496b06@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: David Lechner <david@lechnology.com>, Baolin Wang <baolin.wang@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>>>I believe I meant "changing patterns from kernel in response to events
> >>>>is probably overkill"... or something like that.
> >>>
> >>>Anyway -- to clean up the confusion -- I'd like to see
> >>>
> >>>echo pattern > trigger
> >>>echo "1 2 3 4 5 6 7 8" > somewhere
> >>
> >>s/somewhere/pattern/
> >>
> >>pattern trigger should create "pattern" file similarly how ledtrig-timer
> >>creates delay_{on|off} files.

Yes, that sounds reasonable. v5 still says

+               Writing non-empty string to this file will activate the pat=
tern,
+               and empty string will disable the pattern.

I'd deactivate the pattern by simply writing something else to the
trigger file.

Best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAltO8rUACgkQMOfwapXb+vLjKACfW012LpW5uoDBam3r2Qm2oF5E
gvkAn0KKqm3gCQfLbptNBNf5B4nOoEv3
=uDUf
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--

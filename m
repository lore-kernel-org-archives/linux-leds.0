From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 1/2] leds: core: Introduce generic pattern interface
Date: Wed, 18 Jul 2018 14:08:36 +0200
Message-ID: <20180718120836.GB23157@amd>
References: <CAMz4kuKZ6Z1h=yzFYJihEH1ARC5FKtDC6RLz0u8SmaekOZ=utw@mail.gmail.com>
 <20180714212033.GA31950@amd>
 <00fa2693-9308-8d74-0124-04066a76c35a@gmail.com>
 <20180714222924.GA2776@amd>
 <20180714223907.GB2776@amd>
 <1138f834-e805-6076-bb5b-aa1fdc1f2606@gmail.com>
 <2c3a8911-150a-9b25-2a66-a9432047f96b@lechnology.com>
 <68996338-a902-2b57-0bb9-df274a496b06@gmail.com>
 <20180718075637.GA10279@amd>
 <CAMz4kuJa=s19q7wQFQT1giUe0AN4hpux4PG2koUcnE7q_x7LCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMz4kuJa=s19q7wQFQT1giUe0AN4hpux4PG2koUcnE7q_x7LCQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, David Lechner <david@lechnology.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org


--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2018-07-18 19:32:01, Baolin Wang wrote:
> On 18 July 2018 at 15:56, Pavel Machek <pavel@ucw.cz> wrote:
> > Hi!
> >
> >> >>>>I believe I meant "changing patterns from kernel in response to ev=
ents
> >> >>>>is probably overkill"... or something like that.
> >> >>>
> >> >>>Anyway -- to clean up the confusion -- I'd like to see
> >> >>>
> >> >>>echo pattern > trigger
> >> >>>echo "1 2 3 4 5 6 7 8" > somewhere
> >> >>
> >> >>s/somewhere/pattern/
> >> >>
> >> >>pattern trigger should create "pattern" file similarly how ledtrig-t=
imer
> >> >>creates delay_{on|off} files.
> >
> > Yes, that sounds reasonable. v5 still says
> >
> > +               Writing non-empty string to this file will activate the=
 pattern,
> > +               and empty string will disable the pattern.
> >
> > I'd deactivate the pattern by simply writing something else to the
> > trigger file.
>=20
> For the case we met in patch 2, it is not related with trigger things.
> We just set some series of tuples including brightness and duration
> (ms) to the hardware to enable the breath mode of the LED, we did not
> trigger anything. So it is weird to write something to trigger file to
> deactive the pattern.

Confused. I thought that "breathing mode" would be handled similar way
to hardware blinking: userland selects pattern trigger, pattern file
appears (similar way to delay_on/delay_off files with blinking), he
configures it, hardware brightness follows the pattern ("breathing
mode"). If pattern is no longer required, echo none > trigger stops
it.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAltPLcQACgkQMOfwapXb+vITKACggizU9AyFWdBvTJMivab2zinn
2xYAnAmLBJ942JjLk9lwPLy8z1Kqs9ca
=gQ7h
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--

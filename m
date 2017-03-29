From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/2] leds: Add driver for Qualcomm LPG
Date: Thu, 30 Mar 2017 00:23:02 +0200
Message-ID: <20170329222301.GB7977@amd>
References: <20170323055435.29197-1-bjorn.andersson@linaro.org>
 <20170323203749.GB8563@amd>
 <20170329021734.afhqmfpmbcjyv7bu@rob-hp-laptop>
 <20170329190725.GN20094@minitux>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170329190725.GN20094@minitux>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2017-03-29 12:07:25, Bjorn Andersson wrote:
> On Tue 28 Mar 19:17 PDT 2017, Rob Herring wrote:
>=20
> > On Thu, Mar 23, 2017 at 09:37:49PM +0100, Pavel Machek wrote:
> > > Hi!
> > >=20
> > > > The Light Pulse Generator (LPG) is a PWM-block found in a wide rang=
e of
> > > > PMICs from Qualcomm. It can operate on fixed parameters or based on=
 a
> > > > lookup-table, altering the duty cycle over time - which provides the
> > > > means for e.g. hardware assisted transitions of LED brightness.
> > >=20
> > > Ok, this is not first hardware that supports something like this. We
> > > have similar hardware that can do blinking on Nokia N900 -- please
> > > take a look at leds-lp55*.c
> >=20
> > And perhaps some alignment on the bindings too if the N900 has bindings.
> >=20
>=20
> There is a binding for ti,lp55xx, but there's nothing I can reuse from
> that binding...because it's completely different hardware.

Agreed, if you drop the pattern stuff from the binding, at least for now.=
=20

> > > And it would be really good to provide hardware abstraction. We really
> > > don't want to have different userspace for LPG and for N900 and for
> >=20
> > I'm interested in what this looks like as several AOSP platforms do=20
> > tri-color LEDs with custom sysfs extensions.
>=20
> How to model RGB LEDs has been discussed many times before and I was
> hoping for that discussion to come to some conclusion during the last 2
> years, but now I couldn't wait more - we need this driver for
> db820c.

If you want driver merged quickly, I believe the best way would be to
leave out pattern support for now. We can merge the basic driver
easily to 4.12.

> With this driver, as with many existing, you will have 3 LEDs that you
> set independently.
>=20
> I did implement blinking by using the PWM straight off, so you can't set
> brightness or synchronize the multiple channels. Perhaps this should be
> changed to use the ramp generator.
>=20
> To synchronize patterns I suggest that we extend the LUT binding to
> describe groups and when any LPG trigger a restart of the pattern-walker
> we trigger all that are grouped.
>=20
> These two changes combined allows you to set brightness and blink with a
> RGB-LED.
>=20
>=20
> But I will have to dig up some hardware that uses the LPG for driving a
> RGB-LED to be able to test this (and I do prefer that to be done with
> some incremental patches at some later time, if acceptable).

Incremental patches sound like a good idea, yes.

I'd say that testing with actual RGB LED is not a requirement... as
long as we design reasonable interface where the synchronizaction will
be easy.

Thanks and best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljcM8UACgkQMOfwapXb+vKsCQCfXfhGqxNcKDaj3DECV7ukfIVE
AUsAn1rOuukk88cS9/rwyzMPDmqZbDPm
=F0EA
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--

From: Mark Brown <broonie@kernel.org>
Subject: Re: [RESEND PATCH v4 1/6] regulator: lm363x: Make the gpio register
 enable flexible
Date: Sun, 26 May 2019 13:48:38 +0100
Message-ID: <20190526124838.GH2456@sirena.org.uk>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-2-dmurphy@ti.com>
 <20190523130311.GA17245@sirena.org.uk>
 <d4673abc-442c-83eb-1830-7f7ed9d8419e@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8/pVXlBMPtxfSuJG"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d4673abc-442c-83eb-1830-7f7ed9d8419e@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, lgirdwood@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--8/pVXlBMPtxfSuJG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 23, 2019 at 08:50:20AM -0500, Dan Murphy wrote:
> On 5/23/19 8:03 AM, Mark Brown wrote:
> > On Wed, May 22, 2019 at 02:27:28PM -0500, Dan Murphy wrote:

> > Is it guaranteed that the bitmask for enabling the use of the GPIO is
> > going to be the same for all regulators?  The bitmasks for the regulator
> > enable look to be different, and it also looks like this setting might
> > affect multiple regulators since it seems there are multiple enable bits
> > in the same register.  If this affects multiple regulators then how's
> > that working at the minute?

> Yes for the 3632 and 36274 bit0 is the EXT_EN for LCM on these chips.
> LM3631 does not have LCM GPIO control so there is no setting and this should not be called.
> If it is then the developer implemented the DT wrong.

This feels fragile - it works for the current users but it's just
assuming that the placement of this bit will always be in the same
position in the same register as the enable and will silently fail if a
new chip variant does things differently.  Either storing the data
separately somewhere driver specific or just having explicit switch
statements would be more robust.

--8/pVXlBMPtxfSuJG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzqiyUACgkQJNaLcl1U
h9DtKwgAgwYVujK+ai00tAc8vMnYP77hZtQP9CqqTq6PKk5xDoaPXdedWl0j84c6
4cf103WBzETd4ECf09dnm5ssZQBw/KQCjspYm20+oQdMqVytCdxRzq3nhC3YBbpy
Wg2Bg550H8KDNNvHLwoFn7H1FdMtpD98mdJJ7vTXuLFx14vdKZ4Ya5oDEqHXAI4u
ed5a4UPMTW7ptNb2jk2Mo5vDYP+9K7Z1+pLaCBo7EWUMlYkTKfHk1gnXea/6zCKa
A6AZtafNbxcsToTsVoWBML7bw3FLH8oyWkm79NFIUZuGB+Zw0Ms98pR63gJXihLf
rm1njloC7RIodeEOcKIzPVqSKwsjcg==
=wc2b
-----END PGP SIGNATURE-----

--8/pVXlBMPtxfSuJG--

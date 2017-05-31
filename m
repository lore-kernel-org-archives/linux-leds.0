From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH V1 1/2] leds: leds-qti-rgb: Add LED driver for QTI
 TRI_LED module
Date: Wed, 31 May 2017 18:55:40 +0200
Message-ID: <20170531165540.GA9371@amd>
References: <20170531061541.10808-1-fenglinw@codeaurora.org>
 <20170531061541.10808-2-fenglinw@codeaurora.org>
 <20170531075536.GA13028@amd>
 <001301d2d9e7$3102b720$93082560$@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <001301d2d9e7$3102b720$93082560$@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Wu Fenglin <fenglinw@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 'Richard Purdie' <rpurdie@rpsys.net>, 'Jacek Anaszewski' <jacek.anaszewski@gmail.com>, 'Rob Herring' <robh+dt@kernel.org>, 'Mark Rutland' <mark.rutland@arm.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, subbaram@quicinc.com, aghayal@qti.qualcomm.com, wruan@quicinc.com, kgunda@qti.qualcomm.com
List-Id: linux-leds@vger.kernel.org


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Thanks for the reviewing.
>=20
> For the order, the hardware register mapping has this order (blue/green/r=
ed)
> from bit0/1/2, I can revert it to (red/green/blue) if there is a strong
> concern.

I'd do that.

> For these two properties: qcom,off-ms/ qcom,on-ms, I am using them to ass=
ign
> the default blinking on/off time, then the LEDs would have a default
> blinking pattern if you do "echo 1 > /sys/class/leds/red/blink"

Normally, dts describes hardware; this does not seem to be hardware
description, so I'd leave it out.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlku9YwACgkQMOfwapXb+vIa3ACfYl1XNqzEjZI914rKh3cWswSh
6ocAnjKU/PhpkgCvEzdQno5ZPLA0XeQQ
=P31m
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--

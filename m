From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 0/5] leds: trigger: Add pattern initialization from
 Device Tree
Date: Wed, 12 Dec 2018 13:16:04 +0100
Message-ID: <20181212121604.GA11088@amd>
References: <1544434201-14190-1-git-send-email-krzk@kernel.org>
 <be526095-5af9-38bb-7c72-629a82d318e0@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <be526095-5af9-38bb-7c72-629a82d318e0@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Baolin Wang <baolin.wang@linaro.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2018-12-10 22:03:18, Jacek Anaszewski wrote:
> Hi Krzysztof,
>=20
> Thank you for the update.
>=20
> On 12/10/18 10:29 AM, Krzysztof Kozlowski wrote:
> >Hi,
> >
> >I rebased on top of Jacek's patches and, as I could not find them on git=
 kernel
> >tree, I included them here. Also with small fixup.
> >
> >Changes since v1:
> >1. Rebase on Jacek's patches.
>=20
> Made following amendments to 2/5:
>=20
> - removed extra empty line
> - fixed language in the commit message as proposed by Pavel
>=20
> >2. Add patch 3/5 for fixup of Jacek's solution.
> >3. Drop first two patches from the series (applied).
> >4. Patch 5/5: Use LED_INIT_DEFAULT_TRIGGER (suggested by Jacek Anaszewsk=
i).
> >5. Patch 5/5: Return-on-error and log warning (suggested by Pavel Machek)
> Applied to the for-next branch of linux-leds.git, thanks.
>=20
> Pavel - I'm still awaiting your acks, just wanted to have
> the patch set in linux-next quicker, taking into account that
> merge window is imminent.

Ok, let me take a look. But this really should have Rob's acknowledge,
so...

								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlwQ/AQACgkQMOfwapXb+vKCwgCfTQH49a52KNzJN45oXo7Z+s78
oVAAni2YJQfVPZAUcHPe5tYJxsu6N8sL
=mLtb
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--

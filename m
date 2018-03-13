From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH AUTOSEL for 4.14 065/110] led: core: Fix brightness
 setting when setting delay_off=0
Date: Tue, 13 Mar 2018 08:50:22 +0100
Message-ID: <20180313075022.GA13394@amd>
References: <20180204003029.2lkcmh6wvzpnlrls@sasha-lappy>
 <20180204090531.GA29468@amd>
 <20180204111500.GB14797@kroah.com>
 <20180204171736.GA1388@amd>
 <20180206020210.m6gl7vai4p6azb6s@sasha-lappy>
 <713113d8-7662-d80c-c62f-af020469d0bf@gmail.com>
 <f072a5c1-95f1-e81b-c629-ebdea723e6f4@universe-factory.net>
 <20180312152811.GB16944@kroah.com>
 <5747831a-b237-aa2c-cb47-9773cd2b5956@universe-factory.net>
 <0cd72fe4-2b98-e6f7-6ae7-530524786cec@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0cd72fe4-2b98-e6f7-6ae7-530524786cec@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Matthias Schiffer <mschiffer@universe-factory.net>, Greg KH <gregkh@linuxfoundation.org>, Sasha Levin <Alexander.Levin@microsoft.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Matthieu CASTET <matthieu.castet@parrot.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > At least 7b6af2c531 ("leds: core: Fix regression caused by commit
> > 2b83ff96f51d") is missing, causing visible regressions (LEDs not workin=
g at
> > all) on some OpenWrt devices. This was fixed in 4.4.121 by reverting the
> > offending commit, but if I followed the discussion correctly, 4.9 should
> > get the follow-up commit 7b6af2c531 instead (like 4.14 already did).
> >=20
> > Jacek's mail I replied to mentions that eb1610b4c273 ("led: core: Fix
> > blink_brightness setting race") should be included in 4.9 as well, but I
> > don't know the impact of the issue it fixes.
>=20
> It doesn't fix any reported issue, but is just an improvement
> aiming at preventing potential races while changing blink brightness.
>=20
> After taking closer look it turns out that for the patches in question
> to apply cleanly we need in 4.9 also a patch which introduces atomic
> bit fields for blink flags.
>=20
> Effectively, here is the list of patches required in 4.9 stable:
>=20
> Revert "led: core: Fix brightness setting when setting delay_off=3D0"
>=20
> followed by:
>=20
> a9c6ce57ec ("led: core: Use atomic bit-field for the blink-flags")
> eb1610b4c2 ("led: core: Fix blink_brightness setting race")
> 2b83ff96f5 ("led: core: Fix brightness setting when setting delay_off=3D0=
")
> 7b6af2c531 ("leds: core: Fix regression caused by commit 2b83ff96f51d")

For the record... there's no serious problem in LED subsystem in
v4.9. Just leave LED subsystem alone in v4.9-stable (reverting any
patches that were backported by some kind of bot that did not even
test them), and things will be fine.
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlqngr4ACgkQMOfwapXb+vJOAwCglQhsELLghisDZKNOd4Ql6uht
SQEAnA/KmCxz/hDnc1hUasIKmbEwcXD2
=LInh
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--

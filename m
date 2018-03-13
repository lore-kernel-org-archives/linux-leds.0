From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH AUTOSEL for 4.14 065/110] led: core: Fix brightness
 setting when setting delay_off=0
Date: Tue, 13 Mar 2018 14:27:48 +0100
Message-ID: <20180313132748.GA20246@amd>
References: <20180204090531.GA29468@amd>
 <20180204111500.GB14797@kroah.com>
 <20180204171736.GA1388@amd>
 <20180206020210.m6gl7vai4p6azb6s@sasha-lappy>
 <713113d8-7662-d80c-c62f-af020469d0bf@gmail.com>
 <f072a5c1-95f1-e81b-c629-ebdea723e6f4@universe-factory.net>
 <20180312152811.GB16944@kroah.com>
 <5747831a-b237-aa2c-cb47-9773cd2b5956@universe-factory.net>
 <0cd72fe4-2b98-e6f7-6ae7-530524786cec@gmail.com>
 <20180313093703.GB27669@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180313093703.GB27669@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Matthias Schiffer <mschiffer@universe-factory.net>, Sasha Levin <Alexander.Levin@microsoft.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Matthieu CASTET <matthieu.castet@parrot.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > At least 7b6af2c531 ("leds: core: Fix regression caused by commit
> > > 2b83ff96f51d") is missing, causing visible regressions (LEDs not work=
ing at
> > > all) on some OpenWrt devices. This was fixed in 4.4.121 by reverting =
the
> > > offending commit, but if I followed the discussion correctly, 4.9 sho=
uld
> > > get the follow-up commit 7b6af2c531 instead (like 4.14 already did).
> > >=20
> > > Jacek's mail I replied to mentions that eb1610b4c273 ("led: core: Fix
> > > blink_brightness setting race") should be included in 4.9 as well, bu=
t I
> > > don't know the impact of the issue it fixes.
> >=20
> > It doesn't fix any reported issue, but is just an improvement
> > aiming at preventing potential races while changing blink brightness.
> >=20
> > After taking closer look it turns out that for the patches in question
> > to apply cleanly we need in 4.9 also a patch which introduces atomic
> > bit fields for blink flags.
> >=20
> > Effectively, here is the list of patches required in 4.9 stable:
> >=20
> > Revert "led: core: Fix brightness setting when setting delay_off=3D0"
> >=20
> > followed by:
> >=20
> > a9c6ce57ec ("led: core: Use atomic bit-field for the blink-flags")
> > eb1610b4c2 ("led: core: Fix blink_brightness setting race")
> > 2b83ff96f5 ("led: core: Fix brightness setting when setting delay_off=
=3D0")
> > 7b6af2c531 ("leds: core: Fix regression caused by commit 2b83ff96f51d")
>=20
> Odd, I just got another report that the 4.9.87 release fixed some
> reported LED issues, so why do I need all of these?
>=20
> Should I just revert the single 2b83ff96f51d commit here instead?

I believe so, yes.

I'm not aware of any _really bad_ issues with LED subsystem in
4.9. Take a look at changelog of
2b83ff96f51d0b039c4561b9f95c824d7bddb85c -- it fixes rather
theoretical issue; user can reproduce it by hand in shell, but,
well... don't do it then.

The rest of fixes ... fix some more theoretical races. I don't think
it is -stable material, as I pointed out before.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlqn0dQACgkQMOfwapXb+vKZTwCgpCZaexLrN23mORvHiMe4/dJu
8koAoLdpi2/7/21hWSl3YGY5SS+uShI8
=y1T1
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--

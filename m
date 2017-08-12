From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: add LED driver for CR0014114 board
Date: Sat, 12 Aug 2017 21:13:00 +0200
Message-ID: <20170812191300.GA23619@amd>
References: <20170812090935.3129-1-oleg@kaa.org.ua>
 <20170812093024.GA21428@amd>
 <83fdd755-c978-079c-32c0-9b1ab7fa0039@kaa.org.ua>
 <20170812105620.GA23543@amd>
 <e07da9fe-4875-ad1e-08bc-3b3a7414c6fd@kaa.org.ua>
 <20170812174623.GA2545@amd>
 <00efd6b5-494f-0f8d-d32b-321236ed8aaa@kaa.org.ua>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:45018 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750948AbdHLTNB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 12 Aug 2017 15:13:01 -0400
Content-Disposition: inline
In-Reply-To: <00efd6b5-494f-0f8d-d32b-321236ed8aaa@kaa.org.ua>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Oleh Kravchenko <oleg@kaa.org.ua>
Cc: linux-leds@vger.kernel.org


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Hmm. Well, this works if you can't provide better names. Still "board"
> > is somehow generic, andsomeone else might want to use it. "board" ->
> > "crms"?
>=20
> It's specified in device tree by defining label.
> In my examples:
> board@0 {
>        compatible =3D "ccs,cr0014114";
>        reg =3D <0>;
>        spi-max-frequency =3D <50000>;
>        spi-cpha;
>        label =3D "board0";
> };
>=20
> board@1 {
>        compatible =3D "ccs,cr0014114";
>        reg =3D <1>;
>        spi-max-frequency =3D <50000>;
>        spi-cpha;
>        label =3D "board1";
> };

Ok, makes sense. How does the board look?

> >>>>>> +	while (i--)
> >>>>>> +		led_classdev_unregister(&priv->leds[i].ldev);
> >>>>>
> >>>>> Can devm_* be used to simplify this?
> >>>>
> >>>> I think no, because it will cause race condition.
> >>>
> >>> Please take a look at devm_led_classdev_register() and friends. It
> >>> should be possible to simplify code without races.
> >>
> >> I don't understand how I can call destroy_workqueue() after calling un=
register leds.
> >=20
> > Do you actually need the workqueues? It should be possible to avoid
> > them, using workqueue support in the core.
>=20
> The delay between data sends to SPI board should be at least 10 ms
> I think it will be bad idea to use shared workqueue from kernel,
> so I create separate single threaded work queue :)

If workqueue support in led core can not take 10 msec wait, we should
fix it, not add hacks around...
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmPUzwACgkQMOfwapXb+vIHzACfS8x+e1PDYNCk2ANi3uyowrEh
kCoAoIaYaH9cnUu/hAUR8O0/tQO2WjyI
=n4GC
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--

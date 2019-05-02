From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH] leds: avoid races with workqueue
Date: Thu, 2 May 2019 22:06:06 +0200
Message-ID: <20190502200606.GC4845@amd>
References: <20190427193411.GA9709@amd>
 <2578a614-beb9-1c9d-9f74-208a8a7ab64f@gmail.com>
 <20190427223207.GA3585@amd>
 <d2373c8b-5c66-c875-16c7-0c5a93470793@gmail.com>
 <20190429152259.GB10501@amd>
 <36e1fdd7-a220-4b0d-d558-829f522b0841@gmail.com>
 <20190501183600.GA20452@amd>
 <9337b5fb-0ff8-9925-29e6-a781884af861@gmail.com>
 <20190502191321.GB4845@amd>
 <62a99fe8-5c61-c681-3f9d-54e0a27a63d2@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8040321903146779796=="
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <62a99fe8-5c61-c681-3f9d-54e0a27a63d2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, stable-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--===============8040321903146779796==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bAmEntskrkuBymla"
Content-Disposition: inline


--bAmEntskrkuBymla
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2019-05-02 21:28:06, Jacek Anaszewski wrote:
> On 5/2/19 9:13 PM, Pavel Machek wrote:
> >Hi!
> >
> >>>>>+++ b/drivers/leds/led-class.c
> >>>>>@@ -57,6 +57,7 @@ static ssize_t brightness_store(struct device *dev,
> >>>>>  	if (state =3D=3D LED_OFF)
> >>>>>  		led_trigger_remove(led_cdev);
> >>>>>  	led_set_brightness(led_cdev, state);
> >>>>>+	flush_work(&led_cdev->set_brightness_work);
> >>>>
> >>>>Is this really required here? It creates non-uniform brightness
> >>>>setting behavior depending on whether it is set from sysfs or
> >>>>by in-kernel call to led_set_brightness().
> >>>
> >>>This fixes the echo 0 > brightness; echo 1 > brightness. It has to be
> >>>at a place where we can sleep.
> >>>
> >>>If you have better idea, it is welcome, but it would be good to fix
> >>>the bug.
> >>
> >>Currently not, so I applied the patch in this shape.
> >
> >Thanks!
> >
> >This is actually something that makes sense for stable.. perhaps the
> >bots can pick it up.
>=20
> I was thinking of it, but finally decided to submit this patch
> to linux-stable when it will prove not having side effects.
>=20
> But if you think it is ready for stable then I can add
> relevant "Fixes" tag. Do you think that below will be an appropriate
> base to refer to?
>=20
> Fixes 1afcadfcd184 ("leds: core: Use set_brightness_work for the blocking
> op")

Yes, that looks right. If you can add fixes: and cc: stable tags, the
rest should happen automagically.

Thanks!
									Pavel



--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--bAmEntskrkuBymla
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzLTa4ACgkQMOfwapXb+vLwhQCgi3JeQuNX0skWytw+vdvS2HyA
mtwAnR4DCTMLMBJ+uEuZyH2iBTfLXTPJ
=3aC0
-----END PGP SIGNATURE-----

--bAmEntskrkuBymla--


--===============8040321903146779796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============8040321903146779796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ibm-acpi-devel mailing list
ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel

--===============8040321903146779796==--

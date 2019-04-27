From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: Thinkpad ACPI led -- it keeps blinking
Date: Sat, 27 Apr 2019 23:45:56 +0200
Message-ID: <20190427214556.GA19758@amd>
References: <20190426123513.GA18172@amd> <20190426214246.GA24966@amd>
 <84fac57d-1121-a1da-fb45-16a2521bdef9@gmail.com>
 <20190427193411.GA9709@amd>
 <2578a614-beb9-1c9d-9f74-208a8a7ab64f@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3581202643413206402=="
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <2578a614-beb9-1c9d-9f74-208a8a7ab64f-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--===============3581202643413206402==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2019-04-27 22:35:35, Jacek Anaszewski wrote:
> On 4/27/19 9:34 PM, Pavel Machek wrote:
> >On Sat 2019-04-27 18:55:37, Jacek Anaszewski wrote:
> >>On 4/26/19 11:42 PM, Pavel Machek wrote:
> >>>Hi!
> >>>
> >>>>Kernel 5.1.0-rc1 + some unrelated bits.
> >>>
> >>>I tried adding
> >>>https://marc.info/?l=3Dlinux-kernel&m=3D151622365715313&q=3Draw as Jac=
ek
> >>>suggested, and it is still broken.
> >>>
> >>>Test code is this: ledtest actually works as expected on first try,
> >>>but keeps blinking on second run. Strange.
> >>
> >>Did it work for previous releases? If yes, then bisect should help here.
> >
> >Absolutely no idea :-(. I assume "no". Capslock LED on the same system
> >works as expected.
> >
> >I still hope thinkpad people will speak up, notice it does not work
> >for them, and debug it :-).
>=20
> I see this driver implements blink_set:
>=20
> tpacpi_leds[led].led_classdev.blink_set =3D &led_sysfs_blink_set;
>=20
> and also applies some internal logic related to the type
> of supported LEDs, and the way how the hardware is accessed.
>=20
> To eliminate the problem on the LED core side you could
> disable initialization of blink_set op in the driver.

Yep, software blinking will very likely work ok.

[  226.949924] LED set 0 to 2
[  226.950766] LED set 0 to 2... 0
[  232.613577] LED set 0 to 2
[  232.613991] LED set 0 to 0
[  232.614467] LED set 0 to 2... 0
[  232.616442] LED set 0 to 0... 0

Thinkpad ACPI driver is being asked to turn led to blink [232.613577]
LED set 0 to 2 and turn it off [  232.613991] LED set 0 to 0
simultaneously. It has no internal locking and ACPI is slow. That
can't end well.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzEzZQACgkQMOfwapXb+vJS2ACdELxAVLLsxfoqrCYKatyXFDTM
ueYAnRWaffAg2FE3OkRUTeZQ3InSww0b
=zsJ+
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--


--===============3581202643413206402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============3581202643413206402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ibm-acpi-devel mailing list
ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel

--===============3581202643413206402==--

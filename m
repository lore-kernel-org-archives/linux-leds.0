From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: Thinkpad ACPI led -- it keeps blinking
Date: Sat, 27 Apr 2019 21:34:11 +0200
Message-ID: <20190427193411.GA9709@amd>
References: <20190426123513.GA18172@amd> <20190426214246.GA24966@amd>
 <84fac57d-1121-a1da-fb45-16a2521bdef9@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3174741954605100154=="
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <84fac57d-1121-a1da-fb45-16a2521bdef9-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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


--===============3174741954605100154==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2019-04-27 18:55:37, Jacek Anaszewski wrote:
> On 4/26/19 11:42 PM, Pavel Machek wrote:
> >Hi!
> >
> >>Kernel 5.1.0-rc1 + some unrelated bits.
> >
> >I tried adding
> >https://marc.info/?l=3Dlinux-kernel&m=3D151622365715313&q=3Draw as Jacek
> >suggested, and it is still broken.
> >
> >Test code is this: ledtest actually works as expected on first try,
> >but keeps blinking on second run. Strange.
>=20
> Did it work for previous releases? If yes, then bisect should help here.

Absolutely no idea :-(. I assume "no". Capslock LED on the same system
works as expected.

I still hope thinkpad people will speak up, notice it does not work
for them, and debug it :-).
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzErrMACgkQMOfwapXb+vLKJACdGdMknMjibGT8TIGHFW715nwt
21QAoKtFVQVTYn3a8xaLrfm6upBBiQPW
=qhtX
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--


--===============3174741954605100154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============3174741954605100154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ibm-acpi-devel mailing list
ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel

--===============3174741954605100154==--

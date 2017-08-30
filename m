From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [patch v4 1/2] mfd: Add Mellanox regmap core driver
Date: Wed, 30 Aug 2017 12:59:56 +0200
Message-ID: <20170830105955.GB4926@amd>
References: <1504029616-192277-1-git-send-email-vadimp@mellanox.com>
 <1504029616-192277-2-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="VrqPEDrXMn8OVzN4"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1504029616-192277-2-git-send-email-vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jiri-rHqAuBHg3fBzbRFIqnYvSA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

>  Cause of reset nodes:
>  - cpu_kernel_panic
>  - cpu_shutdown
>  - bmc_warm_reset

This is not really suitable for hwmon, right?

Can you talk to

Date: Mon, 28 Aug 2017 09:31:30 -0700
=46rom: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org,
Subject: [PATCH v6 1/2] platform: Add driver for RAVE Supervisory Processor

? He's currently trying to add very similar interface to the kernel,
too.

+What:          /sys/devices/platform/*/serial*/serial*-*/reset_reason
+Date:          Aug 2017
+Contact:       "Andrey Smirnov" <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+Description:    (RO) Indicates reason for last reset.
+
+               The following values can be reported:
+                   * 0  -> Normal Power Off
+                   * 1  -> Hardware Watchdog
+                   * 2  -> Software Watchdog
+                   * 3  -> Input Voltage Out Of Range
+                   * 4  -> Host Requested
+                   * 5  -> Temperature Out Of Range
+                   * 6  -> User Requested (via long Power Button
press)
+                   * 7  -> Illegal Configuration Word
+                   * 8  -> Illegal Insturction
+                   * 9  -> Illegal Trap
+                   * 10 -> Unknown
+                   * 11 -> Crew Panel Requested
+
+                NOTE: Codes 7,8 and 9 pertain to exceptions happening
+                in supervisory processor/its firmware and not host
+                CPU.

We really want something common between different machines.

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmmmqsACgkQMOfwapXb+vLGygCbBSbk1mindegCEwIDTXj16SZF
xDMAn2B9ALeAGthjTmCG6dS0YglNmN8O
=hpKn
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

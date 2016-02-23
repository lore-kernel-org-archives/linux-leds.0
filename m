From: Evan McClain <aeroevan@gmail.com>
Subject: Re: [PATCH] leds: Add Chrome OS keyboard LEDs driver
Date: Tue, 23 Feb 2016 07:21:46 -0500
Message-ID: <1456230106.20438.2.camel@gmail.com>
References: <1456156814-9619-1-git-send-email-aeroevan@gmail.com>
	 <56CC1BC7.9000108@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-53mj8dg3vqyrikYQhsrm"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qk0-f170.google.com ([209.85.220.170]:35974 "EHLO
	mail-qk0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750850AbcBWMVy (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 23 Feb 2016 07:21:54 -0500
Received: by mail-qk0-f170.google.com with SMTP id s68so66806923qkh.3
        for <linux-leds@vger.kernel.org>; Tue, 23 Feb 2016 04:21:54 -0800 (PST)
In-Reply-To: <56CC1BC7.9000108@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Simon Que <sque@chromium.org>, Duncan Laurie <dlaurie@chromium.org>


--=-53mj8dg3vqyrikYQhsrm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-02-23 at 09:43 +0100, Jacek Anaszewski wrote:
> On 02/22/2016 05:00 PM, Evan McClain wrote:
> > +static int keyboard_led_remove(struct platform_device *pdev)
> > +{
> > +	struct led_classdev *cdev =3D platform_get_drvdata(pdev);
> > +
> > +	platform_set_drvdata(pdev, NULL);
>=20
> Empty line here please.

Unless I'm reading things wrong, I don't think keyboard_led_remove is
needed at all.

--=20
Evan McClain
https://keybase.io/aeroevan

--=-53mj8dg3vqyrikYQhsrm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJWzE7bAAoJEPQx78gG1JMfQ6gH/3stdOrDhGmLcBcvhEYHOkkB
i/+8svE2sbjXEuR4kGILmKMwvQ9H3yTGjpWWJXMidOP0aZX8XGafOut/b0Inyc6B
aXAdJWKQSLoVqlOCf0FrTSWcSNtgjncgr/XAm+hpXXVeFJ0XfvzxjrYIzRE+soYJ
7kRkssPGkU9YSTt2tk6hMS3ZizNLGzsShXfjH45SyFEWoWQ1LRGPi+AtzQfGhyKN
iDWUB57KLeGs3vk+pZQb6FpnN0i0uwIR05019YN2DLzS2fkTac6vzof4gTGuMD7c
jvBm1yHsKKKX7Y5CSWlhIBPjA/xwJvXFPXmADPIDpPnVJkRMJzca8+aQAlYt0RU=
=0vhE
-----END PGP SIGNATURE-----

--=-53mj8dg3vqyrikYQhsrm--

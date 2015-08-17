From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH RESEND v6 0/2] Driver for TI tlc591xx 8/16 Channel i2c
 LED driver
Date: Mon, 17 Aug 2015 15:11:48 +0300
Message-ID: <55D1CF84.8040906@ti.com>
References: <1426630107-25057-1-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="WDJ5qBUsqMFotHIqW5Ia6xXNTKfm7aDud"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:43701 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751427AbbHQMML (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 17 Aug 2015 08:12:11 -0400
In-Reply-To: <1426630107-25057-1-git-send-email-andrew@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, cooloney@gmail.com
Cc: rpurdie@rpsys.net, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Matthew.Fatheree@belkin.com

--WDJ5qBUsqMFotHIqW5Ia6xXNTKfm7aDud
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Andrew, (and Brian),

On 18/03/15 00:08, Andrew Lunn wrote:
> This patchset is a driver for the TI tlc59116 16 Channel i2c LED
> driver and tlc59108 8 Channel i2c LED driver. This driver is used on
> the Belkin WRT1900AC access point and the C code is derived from code
> Belkin contributed to OpenWRT.  However it has been extensively
> re-written, and a device tree binding added to replace platform data.

I see this is now in 4.2-rc... And I see you dropped me from Cc in this
resend series. Because of that, I missed this resend, and couldn't
object to merging.

I'm not very happy about this getting merged. I think I had valid
comments to the driver, to which I did get no answers. You knew my
objections, but you did not even bother mentioning those in the resend
intro.

 Tomi


--WDJ5qBUsqMFotHIqW5Ia6xXNTKfm7aDud
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJV0c+EAAoJEPo9qoy8lh71ntkQAJhJ2UygiIGwnw7Rcv/QwVJF
7VLV+DH6QC5YZFDE8LwgAEXtd0QGuwaCuFKZnzGYtuCOLulXwqmxcs4ARIzZmbXF
A9JmR4iE9X/Iyf3jqAFTArnF4xm2xvjAPAI/d3/u+F4kc2SEcuqcZNgA4YipklU8
bq7lstvYMcyTC2M+TpZrqwpOqG8zuvCuHRsjpHDt/bDjvOdVj5tAvWuHDq+nkfXs
32kJNOw0FEtTTBUor0BbwGfnRW6/jFAwnqvlQN6ayqJmFrShVBdtsm540C+CrIpV
QGy/OEmE0A7IQTqHCVGinaoyada90jiBWuJgntz8wiHr7IWOTdevIOMOdlbexMOr
IXbZUw8D84YbgMtayqqFcTjkcKQwFr5iafF2sYQU51b8Llhl0KezAyAxmKZilG3y
howBwwAUWgJ+Z7dmapjSwV4d4d/2rSOlvGiSFgZ3FNCsLX6dZjRiD7QhZEvFjwkS
0fEP8MNaPWCNmAjl2hy/HPJzygbodQrotvRt6z1FP1hDU2YcxjIMFfxTXid3kpgO
7clh1obMpFet5POrJ2NauZTeldNjcVs+uTXpv9UxMNfLQG5d+PtJnTTRdlo9YztJ
lD7Ot6e875Ty2nX3kaI8EXez/Ml/+HUBi+sksGeRZ1T2JtBtzb/jZomJywYt4E52
AqyfTDBH0dTmVCvTKoZD
=edXK
-----END PGP SIGNATURE-----

--WDJ5qBUsqMFotHIqW5Ia6xXNTKfm7aDud--

From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv6 0/2] Driver for TI tlc591xx 8/16 Channel i2c LED driver
Date: Mon, 9 Feb 2015 13:50:37 +0200
Message-ID: <54D89F0D.9050506@ti.com>
References: <1422367161-16487-1-git-send-email-andrew@lunn.ch> <20150206031048.GA9614@lunn.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="g9MdToEW9sw8u6JiCQDtSpkAxKJIQAXc8"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:56703 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755700AbbBILve (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 9 Feb 2015 06:51:34 -0500
In-Reply-To: <20150206031048.GA9614@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux ARM <linux-arm-kernel@lists.infradead.org>, kaloz@openwrt.org, vigneshr@ti.com, Matthew.Fatheree@belkin.com

--g9MdToEW9sw8u6JiCQDtSpkAxKJIQAXc8
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 06/02/15 05:10, Andrew Lunn wrote:
> On Tue, Jan 27, 2015 at 02:59:19PM +0100, Andrew Lunn wrote:
>> This patchset is a driver for the TI tlc59116 16 Channel i2c LED
>> driver and tlc59108 8 Channel i2c LED driver. This driver is used on
>> the Belkin WRT1900AC access point and the C code is derived from code
>> Belkin contributed to OpenWRT.  However it has been extensively
>> re-written, and a device tree binding added to replace platform data.
>=20
> Hi Bryan
>=20
> Do you have any further comments on this driver? Are you likely to
> queue it up for the next merge window?

Hi Andrew,

You didn't comment anything on my and Peter's questions on v5 thread
about this being a PWM driver.

 Tomi



--g9MdToEW9sw8u6JiCQDtSpkAxKJIQAXc8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU2J8UAAoJEPo9qoy8lh71+k0P/1fgEgL7wgEj6fn24hGUJwR5
JrfjpAbuheB5DccFy5RF9k3i/nAhxB71ilz+g2PLabrBaze8tyuszgKCANrDP7k4
iPE2h1ETjo35ZTRndFWRtSFBb1XukRzuU266ugwM7vwqM3I4DTu6mDJKQH9D4ntC
2p63E9HUiDcZFiHuBYPJbhz0hVckG44ENbFmT/pSKPiVUDsouFiwuk2HW4piW46T
7h6vlrvizzLQvPX7KI8gVf7i9J7cSiYGOmlEGz+IfW53fa7jymANDhbiuk/zDykh
0WGHQsmHf6eFh2P9+oUPfyZsqi0puioEgOmGkAsw1a31ima4LVjJSuhS3+STsuQX
7sID7y1nsbMExsX7kDFUYd+0H9OLVhvE2BsNH+oTQKRZEaLz9lzoXui9yjDLwSm3
B2n1L59DvvcoiWmA4eeKxE0s4yjp4K+e5GNRKyBtiN6yVhTTUlcp9Fhu1o582Swu
FHc5/JeqfQUCjWsIiKkz1FRmlgpZrJ3Ns1qv3NMOGt2COe2AQczHsrW6ZKMOjakj
VYUTBfocK8g3+I7zVZoIfdYVwQFwp+v1rFynj/txwCcLiR7wYmcuyLl+o6kkrB1u
3nxOVnEBTvN0RPcg1Kw4erLAcqQrErsOyBlWtKqXDPTPRMnowFC642wpx14sN4vP
pdJTNpai23OEwaIuI6uE
=t7bh
-----END PGP SIGNATURE-----

--g9MdToEW9sw8u6JiCQDtSpkAxKJIQAXc8--

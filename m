From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv3 0/2] Driver for TI tlc59116 16 Channel i2c LED driver
Date: Tue, 20 Jan 2015 11:53:14 +0200
Message-ID: <54BE258A.10808@ti.com>
References: <1421277308-3477-1-git-send-email-andrew@lunn.ch> <54B9259C.3070403@ti.com> <20150116191734.GB31577@lunn.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="SmIcaVK7xMDQfsSfxcXtpGkE6TMV3HS5G"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:55176 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752357AbbATJyM (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 20 Jan 2015 04:54:12 -0500
In-Reply-To: <20150116191734.GB31577@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, "R, Vignesh" <vigneshr@ti.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux ARM <linux-arm-kernel@lists.infradead.org>, kaloz@openwrt.org, Matthew.Fatheree@belkin.com, Sekhar Nori <nsekhar@ti.com>

--SmIcaVK7xMDQfsSfxcXtpGkE6TMV3HS5G
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 16/01/15 21:17, Andrew Lunn wrote:
> On Fri, Jan 16, 2015 at 04:52:12PM +0200, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 15/01/15 01:15, Andrew Lunn wrote:
>>> This patchset is a driver for the TI tlc59116 16 Channel i2c LED
>>> driver. This driver is used on the Belkin WRT1900AC access point and
>>> the C code is derived from code Belkin contributed to OpenWRT.
>>> However it has been extensively re-written, and a device tree binding=

>>> added to replace platform data.
>>
>> We have a TLC59108 on one of our boards, and with a quick glance it
>> looks about the same as TLC59116, except the amount of outputs.
>=20
> Hi Tomi
>=20
> I took a look at the TLC59108. The hardware designs have not made it
> easy, but it does look similar enough that my driver can be extended
> to cover both. These extensions It will not change the DT binding, it
> will just gain a new compatibility string. So i would prefer my driver
> is first fully reviewed and accepted, and then i will take a stab at
> extending it for the TLC59108. I will need help testing it, but i hope
> you can help there.

Ok.

I'm not familiar with the LED/PWM frameworks, so I want to summarize our
use case and how I guess this should be done:

We use the TLC59108 to provide backlight to a LCD, but in addition to
that, it is used as a GPIO expander (or GPO, as it cannot do input). In
your earlier patch versions there were some 'gpio' leftovers. Does your
board have such GPIO use also?

So my current thinking is that TLC591xx should be a LED driver (as it
sounded to me that PWM is not quite suitable for it). On top of that, we
need generic 'led-backlight' and 'led-gpio' drivers, each of which uses
the given LED driver to do the hardware manipulation, and they expose a
backlight device and gpio device, respectively.

Another option would be an mfd device, but that doesn't sound good as I
think the backlight and gpio functionality here is not related to
TLC591xx as such, but to a LED device in general.

Does this sound sane?

 Tomi



--SmIcaVK7xMDQfsSfxcXtpGkE6TMV3HS5G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUviWKAAoJEPo9qoy8lh712PQP+wZeDpOPMxo9XQ5YSBjCbxFS
qPZJQHWVlgfSBVT5EHk6iQ8AgA+HenwnTkrPt1tQzgJXdmOhvGtkiWu7vc6sq8n0
3Q7/ObExPjBzcYnGPlvsMbM1ja4C71eCQk7pZ4+UzC5fwUs+vZZFubpMQrG8994m
ABemLLmTtWaUtayl1zCt9ENNl3/mvE5pRqlb/cywlCsun9TC5/qly7xNR0aZl3Ce
wO/wWpya/Khqp+hg9AdiB13Fv6Q1Q7w0gcIZ9r8Ue9UnwhHwBdMv1Tv0xS5EWUl/
dqlDuntTKM/j9KY168j2dYmQ+4R4hMDtWtUGhU7XPC5zw2E3r7w/4o0cL96nHktB
sJvAPIiBLRhiIhbvz+1RQAl2HhHhCV7hJUWF8gkBZODSHAsCEIlG8a3rTN4xdpsP
5NrV4qFCp9Drhzt7MvPYuuNxzwW2kocrcG/0C9yRu0xur4cEOOcwsgplvv76YJrq
m377jbrv1wFkKUcqaUbVT1BJdrAok61mt9wMZLZLl1i/vtm62TItN7SjW9LZkz0+
Wt4+ETlpzSq6eqsX5WF0wHgapnktIu0JchDOpsp86M3evCM3kJA1s4dKGAvAfFj7
ToSP1EvOly93hea+7ibw4UQ5fr4vAcTUsrgnQfg6V97NVvQlIAORwK852ygQoeET
5Z5lAL9QYNb3EFlXHPGZ
=TLnM
-----END PGP SIGNATURE-----

--SmIcaVK7xMDQfsSfxcXtpGkE6TMV3HS5G--

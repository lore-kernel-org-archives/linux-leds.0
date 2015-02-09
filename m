From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv6 0/2] Driver for TI tlc591xx 8/16 Channel i2c LED driver
Date: Mon, 9 Feb 2015 16:25:21 +0200
Message-ID: <54D8C351.5020702@ti.com>
References: <1422367161-16487-1-git-send-email-andrew@lunn.ch> <20150206031048.GA9614@lunn.ch> <54D89F0D.9050506@ti.com> <20150209141343.GA5631@lunn.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="8goRmoXGxP7jVF0RLJREWLo2nTNg35aTJ"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:34902 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932352AbbBIO0K (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 9 Feb 2015 09:26:10 -0500
In-Reply-To: <20150209141343.GA5631@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux ARM <linux-arm-kernel@lists.infradead.org>, kaloz@openwrt.org, vigneshr@ti.com, Matthew.Fatheree@belkin.com

--8goRmoXGxP7jVF0RLJREWLo2nTNg35aTJ
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 09/02/15 16:13, Andrew Lunn wrote:
> On Mon, Feb 09, 2015 at 01:50:37PM +0200, Tomi Valkeinen wrote:
>> On 06/02/15 05:10, Andrew Lunn wrote:
>>> On Tue, Jan 27, 2015 at 02:59:19PM +0100, Andrew Lunn wrote:
>>>> This patchset is a driver for the TI tlc59116 16 Channel i2c LED
>>>> driver and tlc59108 8 Channel i2c LED driver. This driver is used on=

>>>> the Belkin WRT1900AC access point and the C code is derived from cod=
e
>>>> Belkin contributed to OpenWRT.  However it has been extensively
>>>> re-written, and a device tree binding added to replace platform data=
=2E
>>>
>>> Hi Bryan
>>>
>>> Do you have any further comments on this driver? Are you likely to
>>> queue it up for the next merge window?
>>
>> Hi Andrew,
>>
>> You didn't comment anything on my and Peter's questions on v5 thread
>> about this being a PWM driver.
>=20
> Hi Tomi
>=20
> I don't comment, because it is not our decision to make any more. We
> have been around this argument many times, so we are not going to
> resolve it. The LED and PWM maintainers need to decide, not us.

Well, I wasn't asking for decisions. I asked what are the technical
differences between the options. If this driver would be implemented as
a PWM driver, and you'd use pwm-leds, how would that affect your use case=
?

If I'm not mistaken, the only argument so far you've given was that the
device cannot implement the pwm_config() call correctly, but Peter
argued that it doesn't matter, other PWM devices cannot do that either.

I want the driver to work for all the users, and as I'm not that
familiar with leds and pwms I need to ask these questions.

 Tomi



--8goRmoXGxP7jVF0RLJREWLo2nTNg35aTJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU2MNRAAoJEPo9qoy8lh71gegP/1aL3pWFsVe8qMNPx5D4YhNX
KO8vE8zK9az3m36qjuZb977J2EWiW+/Dp0YCtFi1B6OjIB4bwGy1No/MQrcG97kd
l7+MTdwqNB6UJngJdejlB4g/9n86G4oeszIRnFRL8hfIUkLkoph+dgoF97j9GbnZ
a9ymm8JzfeOp2zJ+mP1OhU9qfllV6j6DgCPqryOD33PG7NPtDxuwOsGJq8RmqTAJ
TvBAzUelZamIXvPPsEKKwnIoPicv79mQJKmRYu7nPgMKZEZDG2ekB+drcxHdan8h
ui6aCiSVLY0IcepJGSt8LGnnqEHAhnYtvse+hm9WNL+L6R4aM0i/wAxw1vC7srMx
g5UI895BBEipoR5jNCApOdFKGsQ51wILkEQY0NxdCVm2SJ+U33OHcLnQ4JFn1yIp
AtjGO/4Gl4rlFTgyWbjbIYYDaHVq7m8q4boHyUZ8xEarJ1chyq4ky35ugh6ONXEp
jgUJEFfhc8uwntAmfMZGxldevA0U4bgmf6HFv7bE+ozpRg3asP2PBKmKVLkhXJCx
gzzy4m41aI2unQ8N8kleB8BxQwW30nJp5+K9kEyoFIsJviXOh+mpMXY2p+wnAEX5
+AjZm0XY7elJx5H0IQR9IYfRCiyZt5Op/eVEYRuGeg9u9p8UPywVEagciLl+ZNGU
7vStn2vnBV8i6VnoKkpd
=DeXX
-----END PGP SIGNATURE-----

--8goRmoXGxP7jVF0RLJREWLo2nTNg35aTJ--

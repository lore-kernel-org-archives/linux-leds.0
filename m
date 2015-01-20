From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCHv3 0/2] Driver for TI tlc59116 16 Channel i2c LED driver
Date: Tue, 20 Jan 2015 15:32:10 +0200
Message-ID: <54BE58DA.7050707@ti.com>
References: <1421277308-3477-1-git-send-email-andrew@lunn.ch> <54B9259C.3070403@ti.com> <20150116191734.GB31577@lunn.ch> <54BE258A.10808@ti.com> <20150120132613.GJ2938@lunn.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="eBBlwW4HvejOqqOpCfhASFd95hREkJkAP"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150120132613.GJ2938-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, "R, Vignesh" <vigneshr-l0cyMroinI0@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, Matthew.Fatheree-REUqjI8E1xrQT0dZR+AlfA@public.gmane.org, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

--eBBlwW4HvejOqqOpCfhASFd95hREkJkAP
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 20/01/15 15:26, Andrew Lunn wrote:
>> I'm not familiar with the LED/PWM frameworks, so I want to summarize o=
ur
>> use case and how I guess this should be done:
>>
>> We use the TLC59108 to provide backlight to a LCD, but in addition to
>> that, it is used as a GPIO expander (or GPO, as it cannot do input). I=
n
>> your earlier patch versions there were some 'gpio' leftovers. Does you=
r
>> board have such GPIO use also?
>=20
> No, only LEDs.
> =20
>> So my current thinking is that TLC591xx should be a LED driver (as it
>> sounded to me that PWM is not quite suitable for it). On top of that, =
we
>> need generic 'led-backlight' and 'led-gpio' drivers, each of which use=
s
>> the given LED driver to do the hardware manipulation, and they expose =
a
>> backlight device and gpio device, respectively.
>=20
> That sounds sensible. led-backlight seems to be mostly implemented
> already via the led trigger code. Adding a minimal backlight_ops does
> not look too hard. You might also be able to do some cleanup of the
> other led based backlight drivers.=20
>=20
> led-gpio looks like more work, but i don't see why it should not be
> possible. One thing i do need to check is that if the brightness is
> set to 255 the output is not set to 255/256 on and you have a regular
> glitch. For an LED that does not really matter, but for GPIO it would
> not be good.

Right. TLC591xx has the constant output mode which should be used for
GPIO. Perhaps that mode could be always used when the brightness is
turned to maximum. I haven't read the spec carefully enough to know if
there are some downsides.

 Tomi



--eBBlwW4HvejOqqOpCfhASFd95hREkJkAP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUvljaAAoJEPo9qoy8lh712DQP/38bb8zp/2qqyjSJMj1hPis9
CfwPFXvaHxDEHYZGQLX9PddeiGi7O1FU5xtUK9FB5LZ41CKaKggbODGp4GcExzQt
00JaTT7RQVpbkM8A/vYlIleHNdQ3Z1qEVbWqQTvACjXOrr8p/HvN+7VHTvarlEQC
tagnYifwamAPYIb0LdtAoe+b6nTrVNvs3USz7TxoNdCKXqBpJC7UQ9OJTtNzLe12
EmOUsdnIKU0P3w9qmW5QttRIIi1XkC0k7oIlO0Z3Zzv9UEdQ5nERcLZZklPh2Wsw
MYMbmTI5vIuRSjOAOCtOZXEbryUucKqN9wAwVZyHyf08MIoyBVkubHxloTbz9non
GBB4xeuOQgQQxSVXPTBotPqkGVickshQlOOB+pC3YTbASUy1PbuFgD2cF+Sop3Ak
Q0qIq8w0pJrh25Z7/hoR3FExV4Vklvfjb2ITTAaZjY0/m44UVRKCboqGS7JBDvis
UvA/5SmHANyb5cqffli+gkF7Ty0XSMt6EU93G94RaLdViyirs1fsocvkgosUFpMs
k0ho8qxa9xtVCFq41tCOTBKvOMTJxxZAkPmmLJcddzW5wDV6tqgMbIJwpjMYmNoY
dAY13DFZ7ZAbwYVleYpphfqLJAkovuHbmjR8uk3Fsgl2d78Zn3nUxhDQOQAaW8Vt
VGu73MfJyhpvSXOAv7aC
=CPer
-----END PGP SIGNATURE-----

--eBBlwW4HvejOqqOpCfhASFd95hREkJkAP--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2 2/2] leds: cpcap: new driver
Date: Thu, 23 Mar 2017 02:04:43 +0100
Message-ID: <20170323010443.uzv4xs3ne2mjpm7i@earth>
References: <20170322000912.24210-1-sre@kernel.org>
 <20170322000912.24210-2-sre@kernel.org>
 <30b1d220-730e-445d-cab1-8bb776a5b917@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gzotn4vkdd4ws2f5"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <30b1d220-730e-445d-cab1-8bb776a5b917-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--gzotn4vkdd4ws2f5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jacek,

On Wed, Mar 22, 2017 at 09:24:35PM +0100, Jacek Anaszewski wrote:
> > +#define CPCAP_LED_OFF 0x0000
> > +#define CPCAP_LED_ON 0x01
>=20
> In this case you can do very well without CPCAP_LED_OFF and
> CPCAP_LED_ON, since we have both counterparts in the core:
> LED_OFF and LED_ON.

I will use them in PATCHv3.

> > +static const struct of_device_id cpcap_led_of_match[] =3D {
> > +	{ .compatible =3D "motorola,cpcap-led-red", .data =3D &cpcap_led_red =
},
>=20
> checkpatch.pl complains here:
>=20
> WARNING: DT compatible string vendor "motorola" appears un-documented
>=20
> Are you adding vendor prefix in some other patch?

Yes, the vendor prefix is added in rtc-next [0].

Since it's just a checkpatch warning and fixed in linux-next I
suggest to ignore it instead of bothering with an immutable branch.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git/comm=
it/?h=3Drtc-next&id=3D0522de00929e9e9ee51235fc40035179e4d45381

-- Sebastian

--gzotn4vkdd4ws2f5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAljTHysACgkQ2O7X88g7
+pr4bw//QtXecG2osrnIcD1NSEZB6kBsvNDNhHEhtFM7j/d8C+5mV/m06kcKto2O
jZ9iNz79B21+eyBrDVm2Y54y4MohKXxTHc9gq3DYsdaO4X91fZ9cpr/3xTeMOEnN
yJszTQrQt5xdUytVt22TpZkC009t/+yRjA/ZAbHahOPeEbzIqR9iSfU0PVNaCUGF
RdnoBkPs+LywzEoh4ImOjYXk0phSVePVGnHgiCRzKbA2pMkU41luL9koKHhuRDcP
h8LzI6uv5FgEJJ3OYm7Ky73pRClb4dll/poPZxGG3BKU1Y6AGWrk8+IzoLxh2Sa6
SDEjiopHwR5fPY3sCsIta3zmOSKGsNaV/j2Us9MH4a4LCEEemen6tVugX4udUEe3
Plbiv7gpf0EYdaAANfGNmI2tutAsJn+1IjmUMY3C8Fu16pGUaX+GWuQ0YcWjs9eC
EzJycBfAXShCRtfNHD8NOOKJqGMjF3RzjcVaEOTclM4s2MQOu7Gm0MEtPwNoMeHv
O7jhMBkB65yFe17IGoRnPZnr1ROnNONqZS4MwRpw9c6l1ziOBaGQhYT9vX3CjnVE
3VYPXcjVqURBuHeOHeJflB5COn/4ycITpSsmzmnuYkTvwEXtQA/P21X0VHowHNYr
SyAAsxdIH2BpBxJe4L2nQcXlIHyETc+DBFkgSHz4pRLOdJ3qqPo=
=XLx9
-----END PGP SIGNATURE-----

--gzotn4vkdd4ws2f5--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] leds: cpcap: new driver
Date: Tue, 7 Mar 2017 18:19:26 +0100
Message-ID: <20170307171926.wscaogsrdmxc2opz@earth>
References: <20170305172234.24120-1-sre@kernel.org>
 <20170306221147.GA24272@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7of5ntnwxxw6g7b7"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170306221147.GA24272@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--7of5ntnwxxw6g7b7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 06, 2017 at 11:11:47PM +0100, Pavel Machek wrote:
> > Motorola CPCAP is a PMIC found in multiple smartphones.
> > This driver adds support for the chip's LED controllers.
> > It has explicit support for all controllers used by the
> > Droid 4. Since no datasheets are available the other
> > available controllers are not supported until somebody
> > verified, that the register layout matches.
>=20
> This of course leads me to two questions:
>=20
> 1) Where can I get Droid 4?

I got a used one on Ebay for 42=E2=82=AC incl. shipping & customs. The trick
is clicking the worldwide option, since they are pretty expensive in
EU (they only exist with US LTE modem, so they were not sold here
officially).

> 2) How well is it supported?

UART + WLAN works with mainline master branch. As written by Tony
we have a couple of patches ready for 4.12. Big open tasks are the
cameras and the modems. Cameras are handled via co-processor in the
stock system (that's about all I know about them so far) and modems are
connected via USB + GPIOs (and for the 2G/3G modem an additional UART).
LTE modem support seems simple (USB-CDC based), but does not work
in EU and 2G/3G looks like much work. Modem voice support will be
simpler than on N900, though (data goes directly to the audio codec).
Speaking about audio codec: I'm currently working on that.

> > index 000000000000..d523f8c3c358
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/cpcap-leds.txt
> > @@ -0,0 +1,29 @@
> > +Motorola CPCAP PMIC LEDs
> > +------------------------
> > +
> > +This module is part of the CPCAP. For more details about the whole
> > +chip see Documentation/devicetree/bindings/mfd/motorola-cpcap.txt.
> > +
> > +Requires node properties:
> > +- compatible: should be one of
> > +   * "motorola,cpcap-led-mdl"		(Main Display Lighting)
> > +   * "motorola,cpcap-led-kl"		(Keyboard Lighting)
> > +   * "motorola,cpcap-led-adl"		(Aux Display Lighting)
> > +   * "motorola,cpcap-led-red"		(Red Triode)
> > +   * "motorola,cpcap-led-green"		(Green Triode)
> > +   * "motorola,cpcap-led-blue"		(Blue Triode)
> > +   * "motorola,cpcap-led-cf"		(Camera Flash)
> > +   * "motorola,cpcap-led-bt"		(Bluetooth)
> > +   * "motorola,cpcap-led-cp"		(Camera Privacy LED)
>=20
> BTW. Does the RGB controller support any kind of "patterns" similar
> to what n900 can do?

No. Motorola CPCAP has simple blink support for the RGB leds, though.
It can potentially save some CPU cycles, but I did not yet add support
for that. CPCAP also has a few more LED interfaces, that are unused
on Droid 4.

> > +&cpcap {
> > +	cpcap_led_red: red-led {
> > +		compatible =3D "motorola,cpcap-led-red";
> > +		label =3D "cpcap:red";
> > +		vdd-supply =3D <&sw5>;
> > +	};
> > +};
>=20
> This should be copied to the device tree people.

They are already in CC.

> > index 275f467956ee..043f02a4fe73 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -76,6 +76,15 @@ config LEDS_BCM6358
> >  	  This option enables support for LEDs connected to the BCM6358
> >  	  LED HW controller accessed via MMIO registers.
> > =20
> > +config LEDS_CPCAP
> > +	tristate "LED Support for Motorola CPCAP"
> > +	depends on LEDS_CLASS
> > +	depends on MFD_CPCAP
> > +	depends on OF
> > +	help
> > +	  This option enables support for LEDs offered by Motorola's
> > +	  CPCAP PMIC.
> > +
>=20
> Umm. That help explains exactly what I oculd tell from the name. Can
> you spell out "CPCAP" and "PMIC"... and maybe mention that it is used
> on the Droid 4 phone?

PMIC =3D power management integrated circuit

https://en.wikipedia.org/wiki/Power_management_integrated_circuit

CPCAP =3D a chip similar to TWL6040.

CPCAP it used on multiple motorola smartphones, just like TWL6040
is often used as PMIC. Usually we do not add a list of boards using
some feature to config description (except when the option is only
useful for a single one).

> > +#define DEBUG
>=20
> Remove for production?

Yes, thanks.

> > +	err =3D device_property_read_string(&pdev->dev, "label", &led->led.na=
me);
> > +	if (err) {
> > +		dev_err(led->dev, "Couldn't read led label: %d", err);
>=20
> s/led/LED/.

ok.

>=20
> > +	if (err) {
> > +		dev_err(led->dev, "Couldn't register led: %d", err);
> > +		return err;
>=20
> And here.

ok.

> Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>

Thanks.

-- Sebastian

--7of5ntnwxxw6g7b7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAli+65sACgkQ2O7X88g7
+poutg//boSSxGl2bwdcEaqpoUh6Eg17wrBkXLIPmKm6UbElZ9WCF4L0O4WJrwVa
SiuL2z2m6i/7FABy04/oPXiGV2SfTj2FiAH01JWYsVlo+AYDOy3EL997tXUvjLrZ
k2xo1eypX3rV98LDlmngJBgoQDDxk/MiXxhunDcpJCVxAGhxu0QhJtmSBaLcRdbt
u3lioaXoTiJljKztlN2NwdjjlQX+zgVl4YYN7fIJ0sHqITPI6I6/fTAkRRisUz19
yG9DC+aDdfbzvsY08EHwDhiyncAeojVgXSBXYKVmuY+R6OlNI0Z8XcZ6pRylVBek
Nx35hFPlPFjOxVwbI98oC7Btec+gCARc6NWfC8sw+7WMoD930/W8bhyePuK+Kv/S
mqOixpRCxNOXu4R1n7aXtyJ6XsVsam1Cx49e3PTC7b8ISEiRSGU6jbOD18IJQcN2
y2h/dXHbpPPXqO8WY3kDHhkv17LMv60ZnMetD+b+WfXUbouMg2kVIY3lGE70wJmU
5qMdbG9M0HCeSMrtVQJfARgm/WVnYpAeHd+SC6PvjfqxT/qi2glIsyU45R7lsNkL
Q/1eYD/1Ee5GGimyeD5NT7GUdj8Kkkd2CR0jGmawkpsPqcNOyWLt5GxkEyMJN/ZB
E9+C2+KUfCrBkPwnpeI/e56Z0oboJ8yPdPU+O3qHRg6VIdjstPk=
=mESW
-----END PGP SIGNATURE-----

--7of5ntnwxxw6g7b7--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

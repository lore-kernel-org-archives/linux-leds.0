From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 1/8] leds: Add support for AXP20X CHGLED
Date: Fri, 15 Feb 2019 19:32:40 +0100
Message-ID: <20190215183239.GB3280@amd>
References: <20190215115013.11098-1-stefan@olimex.com>
 <20190215115013.11098-2-stefan@olimex.com>
 <20190215155732.nmtshldcjk2qyhx4@flea>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ADZbWkCsHQ7r3kzd"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190215155732.nmtshldcjk2qyhx4@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Stefan Mavrodiev <stefan@olimex.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Lee Jones <lee.jones@linaro.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:X-POWERS MULTIFUNCTION PMIC DEVICE DRIVERS" <linux-kernel@vger.kernel.org>, "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-leds@vger.kernel.org


--ADZbWkCsHQ7r3kzd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> On Fri, Feb 15, 2019 at 01:50:06PM +0200, Stefan Mavrodiev wrote:

> > +static ssize_t control_store(struct device *dev, struct device_attribu=
te *attr,
> > +			     const char *buf, size_t size)
> > +{
> > +	struct led_classdev *cdev =3D dev_get_drvdata(dev);
> > +	struct axp20x_led *priv =3D to_axp20x_led(cdev);
> > +	unsigned long val;
> > +	int ret;
> > +
> > +	ret =3D kstrtoul(buf, 0, &val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/**
> > +	 * Supported values are:
> > +	 *   - 0 : Manual control
> > +	 *   - 1 : Charger control
> > +	 */
=2E..
> > +static struct attribute *axp20x_led_attrs[] =3D {
> > +	&dev_attr_control.attr,
> > +	&dev_attr_mode.attr,
> > +	NULL,
> > +};
> > +ATTRIBUTE_GROUPS(axp20x_led);
>=20
> I can't really say whether adding sysfs handles for this is the right
> thing to do, but if it is you should document the interface.

It is not. See "Add Intel Cherry Trail Whiskey Cove PMIC LEDs" thread
in the last few days.

> > +	if (!of_property_read_u8(np, "x-powers,charger-mode", &value)) {
> > +		priv->ctrl =3D AXP20X_CHGLED_CTRL_CHARGER;
> > +		priv->mode =3D (value < 2) ? value : 0;
> > +	} else {
> > +		priv->ctrl =3D AXP20X_CHGLED_CTRL_MANUAL;
> > +	}
>=20
> I'm not sure we want to make this a property of the device
> tree. Changing the device tree isn't an option for some users, so we
> need to make sure we can change it even if we can't change the device
> tree.

We want this to be configurable at run time. It can get default from
the device tree.

If we go for the "hardware" trigger, you'll get it for free.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ADZbWkCsHQ7r3kzd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlxnBccACgkQMOfwapXb+vKlTgCgwIfqaui3iA1stvAe0/CTXIh8
KCIAn1R8vkC9KvroWOwgGcFWmxzzS7wT
=5x+c
-----END PGP SIGNATURE-----

--ADZbWkCsHQ7r3kzd--

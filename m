From: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: RE: [patch v1 1/2] mfd: Add Mellanox regmap core driver
Date: Wed, 26 Jul 2017 17:18:20 +0000
Message-ID: <AM4PR05MB3330F7C7913391C906CB2069A2B90@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <1501001499-21971-1-git-send-email-vadimp@mellanox.com>
 <1501001499-21971-2-git-send-email-vadimp@mellanox.com>
 <20170726111846.GB6033@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170726111846.GB6033@amd>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: "lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org" <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, "linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "jiri-rHqAuBHg3fBzbRFIqnYvSA@public.gmane.org" <jiri-rHqAuBHg3fBzbRFIqnYvSA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org



> -----Original Message-----
> From: Pavel Machek [mailto:pavel-+ZI9xUNit7I@public.gmane.org]
> Sent: Wednesday, July 26, 2017 2:19 PM
> To: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org; rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org; linux-
> leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; jiri-rHqAuBHg3fBzbRFIqnYvSA@public.gmane.org
> Subject: Re: [patch v1 1/2] mfd: Add Mellanox regmap core driver
>=20
> Hi!
>=20
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core
> > @@ -0,0 +1,347 @@
> > +Mellanox programmable device control.
> > +-------------------------------------
> > +This binding defines the device control interface over I2C bus for
> > +Mellanox BMC based switches.
>=20
> You'll need to cc dt maintainers here.

Hi Pavel,

Thank you very much for review.

I have in to: Rob Herring and in c: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Should it be separate mail, or it's OK?


>=20
> > +Required properties:
> > +- compatible =3D "mellanox,mlxreg-i2c",
> > +	       "mellanox,mlxreg-i2c-16",
> > +	       "mellanox,mlxreg-core";
> > +- #address-cells : must be 1;
> > +- #size-cells : must be 0;
> > +- reg : I2C address;
>=20
> > +			cpu_watchdog {
> > +				reg =3D <0x1d>;
> > +				mask =3D <0xef>;
> > +			};
> > +
> > +			cpu_kernel_panic {
> > +				reg =3D <0x1d>;
> > +				mask =3D <0xef>;
> > +			};
> > +			bmc_warm_reset {
> > +				reg =3D <0x71>;
> > +				mask =3D <0xfe>;
> > +			};
>=20
> Extra newline.
>=20
> > +static ssize_t mlxreg_core_attr_show(struct device *dev,
> > +				     struct device_attribute *attr,
> > +				     char *buf)
> > +{
> > +	struct mlxreg_core_priv_data *priv =3D dev_get_drvdata(dev);
> > +	int index =3D to_sensor_dev_attr_2(attr)->index;
> > +	int nr =3D to_sensor_dev_attr_2(attr)->nr;
> > +	struct mlxreg_core_data *data;
> > +	u32 regval =3D 0;
> > +	int ret;
> > +
> > +	switch (nr) {
> > +	case MLXREG_CORE_ATTR_PSU:
> > +	case MLXREG_CORE_ATTR_FAN:
> > +		/* Bit =3D 0 : item is functional. */
> > +		ret =3D regmap_read(priv->regmap,
> > +				  priv->item[mlxreg_core_grp[nr].type]->reg,
> > +				  &regval);
> > +		if (ret)
> > +			goto access_error;
> > +
> > +		regval =3D !!!(regval & BIT(mlxreg_core_get_pos(priv,
> > +					  &mlxreg_core_grp[nr],
>=20
> Uff. You really really mean it. But one ! should be enough.
>=20
> > +static int
> > +mlxreg_core_add_attr_group(struct mlxreg_core_priv_data *priv,
> > +			   struct mlxreg_core_grp *grp, int id) {
> > +	struct mlxreg_core_data *data =3D priv->item[grp->type]->data;
> > +	int i;
> > +
> > +	/* Skip group with negative access value. */
> > +	if (grp->access < 0)
> > +		return id;
> > +
> > +	priv->item[grp->type]->ind =3D id;
> > +	for (i =3D 0; i < priv->item[grp->type]->count; i++, id++, data++) {
> > +		priv->mlxreg_core_attr[id] =3D
> > +				&priv-
> >mlxreg_core_dev_attr[id].dev_attr.attr;
> > +		if (grp->use_grp_name)
> > +			priv->mlxreg_core_attr[id]->name =3D
> > +				devm_kasprintf(priv->dev, GFP_KERNEL,
> > +					       "%s%u", grp->name, id %
> > +						priv->item[grp->type]-
> >count
> > +						+ 1);
> > +		else
> > +			priv->mlxreg_core_attr[id]->name =3D
> > +				devm_kasprintf(priv->dev, GFP_KERNEL,
> > +					       data->label);
>=20
> Is it really neccessary to dynamically generate it? Static table could be
> simpler...

But I don't know how many groups and attributes can be defined for particul=
ar device.
On the system I am working on know I have four programmable device with dif=
ferent purposes and different set of attributes.

>=20
> > +static void
> > +mlxreg_core_work_helper(struct mlxreg_core_priv_data *priv,
> > +			struct mlxreg_core_item *item, u8 is_inverse,
> > +			u16 off, u32 mask, u32 *cache)
> > +{
> > +	struct mlxreg_core_data *data;
> > +	u32 asserted, regval, bit;
> > +	int ret;
> > +
> > +	/*
> > +	 * Validate if item related to received signal type is valid.
> > +	 * It should never happen, excepted the situation when some
> > +	 * piece of hardware is broken. In such situation just produce
> > +	 * error message and return. Caller must continue to handle the
> > +	 * signals from other devices if any.
> > +	 */
> > +	if (unlikely(!item)) {
> > +		dev_err(priv->dev, "False signal is received: register at offset
> 0x%02x, mask 0x%02x.\n",
> > +			off, mask);
>=20
> Slightly too long line.
>=20
> Thanks,
> 									Pavel
>=20
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures)
> http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

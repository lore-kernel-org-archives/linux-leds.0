From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH v4 1/3] leds: netxbig: add device tree binding
Date: Fri, 18 Sep 2015 12:30:06 +0200
Message-ID: <20150918103006.GM7306@kw.sim.vm.gnt>
References: <1442505571-9744-1-git-send-email-simon.guinot@sequanux.org>
 <1442505571-9744-2-git-send-email-simon.guinot@sequanux.org>
 <55FBD679.2020402@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AA9g+nFNFPYNJKiL"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:40046 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751786AbbIRKVr (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 18 Sep 2015 06:21:47 -0400
Content-Disposition: inline
In-Reply-To: <55FBD679.2020402@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vincent Donnefort <vdonnefort@gmail.com>, Yoann Sculo <yoann@sculo.fr>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org


--AA9g+nFNFPYNJKiL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2015 at 11:16:41AM +0200, Jacek Anaszewski wrote:
> Hi Simon,
>=20
> Please find my comments in the code below.

Hi Jacek,

Thanks for the quick review.

>=20
> On 09/17/2015 05:59 PM, Simon Guinot wrote:
> >This patch adds device tree support for the netxbig LEDs.
> >
> >This also introduces a additionnal DT binding for the GPIO extension bus
> >(netxbig-gpio-ext) used to configure the LEDs. Since this bus could also
> >be used to control other devices, then it seems more suitable to have it
> >in a separate DT binding.
> >
> >Signed-off-by: Simon Guinot <simon.guinot@sequanux.org>
> >Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >---
> >  .../devicetree/bindings/gpio/netxbig-gpio-ext.txt  |  22 ++
> >  .../devicetree/bindings/leds/leds-netxbig.txt      |  92 ++++++++
> >  drivers/leds/leds-netxbig.c                        | 258 +++++++++++++=
++++++--
> >  include/dt-bindings/leds/leds-netxbig.h            |  18 ++
> >  4 files changed, 369 insertions(+), 21 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/gpio/netxbig-gpio=
-ext.txt
> >  create mode 100644 Documentation/devicetree/bindings/leds/leds-netxbig=
=2Etxt
> >  create mode 100644 include/dt-bindings/leds/leds-netxbig.h
> >
> >Changes for v2:
> >- Check timer mode value retrieved from DT.
> >- In netxbig_leds_get_of_pdata, don't use unsigned long variables to get
> >   timer delay values from DT with function of_property_read_u32_index.
> >   Instead, use a temporary u32 variable. This allows to silence a static
> >   checker warning.
> >- Make timer property optional in the binding documentation. It is now
> >   aligned with the driver code.
> >
> >Changes for v3:
> >- Fix pointer usage with the temporary u32 variable while calling
> >   of_property_read_u32_index.
> >
> >Changes for v4:
> >- In DT binding document netxbig-gpio-ext.txt, detail byte order for
> >   registers and latch mechanism for "enable-gpio".
> >- In leds-netxbig.c, add some error messages.
> >- In leds-netxbig.c, fix some "sizeof" style issues.
> >- In leds-netxbig.c, in netxbig_leds_get_of_pdata(), move the
> >   of_property_read_string() calls after the error-prone checks.
> >- Add some Acked-by.

=2E..

> >+#ifdef CONFIG_OF_GPIO
> >+static int gpio_ext_get_of_pdata(struct device *dev, struct device_node=
 *np,
> >+				 struct netxbig_gpio_ext *gpio_ext)
> >+{
> >+	int *addr, *data;
> >+	int num_addr, num_data;
> >+	int ret;
> >+	int i;
> >+
> >+	ret =3D of_gpio_named_count(np, "addr-gpios");
> >+	if (ret < 0) {
> >+		dev_err(dev,
> >+			"Failed to count GPIOs in DT property addr-gpios\n");
> >+		return ret;
> >+	}
> >+	num_addr =3D ret;
> >+	addr =3D devm_kzalloc(dev, num_addr * sizeof(*addr), GFP_KERNEL);
> >+	if (!addr)
> >+		return -ENOMEM;
> >+
> >+	for (i =3D 0; i < num_addr; i++) {
> >+		ret =3D of_get_named_gpio(np, "addr-gpios", i);
> >+		if (ret < 0)
> >+			return ret;
> >+		addr[i] =3D ret;
> >+	}
> >+	gpio_ext->addr =3D addr;
> >+	gpio_ext->num_addr =3D num_addr;
> >+
> >+	ret =3D of_gpio_named_count(np, "data-gpios");
> >+	if (ret < 0) {
> >+		dev_err(dev,
> >+			"Failed to count GPIOs in DT property data-gpios\n");
> >+		return ret;
> >+	}
> >+	num_data =3D ret;
> >+	data =3D devm_kzalloc(dev, num_data * sizeof(*data), GFP_KERNEL);
> >+	if (!data)
> >+		return -ENOMEM;
> >+
> >+	for (i =3D 0; i < num_data; i++) {
> >+		ret =3D of_get_named_gpio(np, "data-gpios", i);
> >+		if (ret < 0)
> >+			return ret;
> >+		data[i] =3D ret;
> >+	}
> >+	gpio_ext->data =3D data;
> >+	gpio_ext->num_data =3D num_data;
> >+
> >+	ret =3D of_get_named_gpio(np, "enable-gpio", 0);
> >+	if (ret < 0) {
> >+		dev_err(dev,
> >+			"Failed to get GPIO from DT property enable-gpio\n");
> >+		return ret;
> >+	}
> >+	gpio_ext->enable =3D ret;
> >+
> >+	return 0;
> >+}
>=20
> Since netxbig-gpio-ext extension bus can be also used to control other
> device, and the related DT bindings are meant for GPIO subsystem, then
> the above parser should also be placed there to make it available
> for reuse by other drivers. The gpio_ext_init function should be also
> moved to GPIO subsystem, presumably to the same module.

Yes, this patch series is a first step. I am planning to move the
netxbig-gpio-ext extension bus into a dedicated driver as soon as I need
need it for an another device/driver. But for the time being, I was
planning to keep it here. If you agree with that of course.

>=20
> Moreover, if you switched to using devm* prefixed version of
> gpio_request_one and led_classdev_reqister, you could simplify
> the error paths in the driver.

Yes, I have a pending patch for this conversion. But since it is not
really related with the subject of this patch series (add DT support),
I was planning to send it next.

Do you want me to include this patch into this series.

>=20
> >+static int netxbig_leds_get_of_pdata(struct device *dev,
> >+				     struct netxbig_led_platform_data *pdata)
> >+{
> >+	struct device_node *np =3D dev->of_node;
> >+	struct device_node *gpio_ext_np;
> >+	struct device_node *child;
> >+	struct netxbig_gpio_ext *gpio_ext;
> >+	struct netxbig_led_timer *timers;
> >+	struct netxbig_led *leds, *led;
> >+	int num_timers;
> >+	int num_leds =3D 0;
> >+	int ret;
> >+	int i;

=2E..

> >+	led =3D leds;
> >+	for_each_child_of_node(np, child) {
> >+		const char *string;
> >+		int *mode_val;
> >+		int num_modes;
> >+
> >+		if (of_property_read_u32(child, "mode-addr",
> >+					 &led->mode_addr))
> >+			return -EINVAL;
> >+
> >+		if (of_property_read_u32(child, "bright-addr",
> >+					 &led->bright_addr))
> >+			return -EINVAL;
>=20
> You don't parse bright-max DT property anywhere, AFAICT.

Yes I don't. I have added this bright-max property thinking ahead of
moving the netxbig-gpio-ext stuff into a dedicated driver. For now, it
is possible to compute bright-max from the number of data GPIOs of the
extension bus. But once it will be removed something else will be
needed. That's why I introduced this property.

But now, I am thinking I should have used this property right now. It
will be more convenient when moving the netxbig-gpio-ext code out.

I'll do that for the next round.

>=20
> >+		mode_val =3D
> >+			devm_kzalloc(dev,
> >+				     NETXBIG_LED_MODE_NUM * sizeof(*mode_val),
> >+				     GFP_KERNEL);
> >+		if (!mode_val)
> >+			return -ENOMEM;
> >+
> >+		for (i =3D 0; i < NETXBIG_LED_MODE_NUM; i++)
> >+			mode_val[i] =3D NETXBIG_LED_INVALID_MODE;
> >+
> >+		ret =3D of_property_count_u32_elems(child, "mode-val");
> >+		if (ret < 0 || ret % 2)
> >+			return -EINVAL;
> >+		num_modes =3D ret / 2;
> >+		if (num_modes > NETXBIG_LED_MODE_NUM)
> >+			return -EINVAL;
> >+
> >+		for (i =3D 0; i < num_modes; i++) {
> >+			int mode;
> >+			int val;
> >+
> >+			of_property_read_u32_index(child,
> >+						   "mode-val", 2 * i, &mode);
> >+			of_property_read_u32_index(child,
> >+						   "mode-val", 2 * i + 1, &val);
> >+			if (mode >=3D NETXBIG_LED_MODE_NUM)
> >+				return -EINVAL;
> >+			mode_val[mode] =3D val;
> >+		}
> >+		led->mode_val =3D mode_val;
> >+
> >+		if (!of_property_read_string(child, "label", &string))
> >+			led->name =3D string;
> >+		else
> >+			led->name =3D child->name;
> >+
> >+		if (!of_property_read_string(child,
> >+					     "linux,default-trigger", &string))
> >+			led->default_trigger =3D string;
> >+
> >+		led++;
> >+	}
> >+
> >+	pdata->leds =3D leds;
> >+	pdata->num_leds =3D num_leds;
> >+
> >+	return 0;
> >+}
> >+
> >+static const struct of_device_id of_netxbig_leds_match[] =3D {
> >+	{ .compatible =3D "lacie,netxbig-leds", },
> >+	{},
> >+};
> >+#else
> >+static int netxbig_leds_get_of_pdata(struct device *dev,
> >+				     struct netxbig_led_platform_data *pdata)
>=20
> s/static int/static inline int/

Is that not already the case with modern compiler ?

I'll add it anyway.

Thanks,

Simon

--AA9g+nFNFPYNJKiL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlX7564ACgkQgtp0PDeOcDrFPgCfa17yIQyNF+pE/QjC88yfGXsV
rlQAn2C67EimLHWU+cqiUSJ3Xh82y9KJ
=lunC
-----END PGP SIGNATURE-----

--AA9g+nFNFPYNJKiL--

From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH v3 1/3] leds: netxbig: add device tree binding
Date: Tue, 23 Jun 2015 23:17:11 +0200
Message-ID: <20150623211711.GF4853@kw.sim.vm.gnt>
References: <1434639590-27389-1-git-send-email-simon.guinot@sequanux.org>
 <1434639590-27389-2-git-send-email-simon.guinot@sequanux.org>
 <55894D0A.8000306@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nivyF5ZmfdQ/+RfC"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:60056 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933858AbbFWVRQ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 23 Jun 2015 17:17:16 -0400
Content-Disposition: inline
In-Reply-To: <55894D0A.8000306@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Dan Carpenter <dan.carpenter@oracle.com>, Vincent Donnefort <vdonnefort@gmail.com>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>


--nivyF5ZmfdQ/+RfC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2015 at 02:11:54PM +0200, Jacek Anaszewski wrote:
> Hi Simon,

Hi Jacek,

Thanks again for taking care of this patch set.

>=20
> On 06/18/2015 04:59 PM, Simon Guinot wrote:
> >This patch adds device tree support for the netxbig LEDs.
> >
> >This also introduces a additionnal DT binding for the GPIO extension bus
> >(netxbig-gpio-ext) used to configure the LEDs. Since this bus could also
> >be used to control other devices, then it seems more suitable to have it
> >in a separate DT binding.
> >
> >Signed-off-by: Simon Guinot <simon.guinot@sequanux.org>
> >---
> >Changes since v1:
> >- Check timer mode value retrieved from DT.
> >- In netxbig_leds_get_of_pdata, don't use unsigned long variables to get
> >   timer delay values from DT with function of_property_read_u32_index.
> >   Instead, use a temporary u32 variable. This allows to silence a static
> >   checker warning.
> >- Make timer property optional in the binding documentation. It is now
> >   aligned with the driver code.
> >
> >Changes since v2:
> >- Fix pointer usage with the temporary u32 variable while calling
> >   of_property_read_u32_index.
> >
> >  .../devicetree/bindings/gpio/netxbig-gpio-ext.txt  |  22 ++
> >  .../devicetree/bindings/leds/leds-netxbig.txt      |  92 ++++++++
> >  drivers/leds/leds-netxbig.c                        | 250 +++++++++++++=
++++++--
> >  include/dt-bindings/leds/leds-netxbig.h            |  18 ++
> >  4 files changed, 361 insertions(+), 21 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/gpio/netxbig-gpio=
-ext.txt
> >  create mode 100644 Documentation/devicetree/bindings/leds/leds-netxbig=
=2Etxt
> >  create mode 100644 include/dt-bindings/leds/leds-netxbig.h
> >
> >diff --git a/Documentation/devicetree/bindings/gpio/netxbig-gpio-ext.txt=
 b/Documentation/devicetree/bindings/gpio/netxbig-gpio-ext.txt
> >new file mode 100644
> >index 000000000000..e4fb2fe11086
> >--- /dev/null
> >+++ b/Documentation/devicetree/bindings/gpio/netxbig-gpio-ext.txt
> >@@ -0,0 +1,22 @@
> >+Binding for the GPIO extension bus found on some LaCie/Seagate boards
> >+(Example: 2Big/5Big Network v2, 2Big NAS).
> >+
> >+Required properties:
> >+- compatible: "lacie,netxbig-gpio-ext".
> >+- addr-gpios: GPIOs representing the address register.
> >+- data-gpios: GPIOs representing the data register.
> >+- enable-gpio: GPIO used to enable the new configuration (address, data=
).
>=20
> Please mention that enable-gpio latches the settings on raising edge.

OK.

>=20
> >+
> >+Example:
> >+
> >+netxbig_gpio_ext: netxbig-gpio-ext {
> >+	compatible =3D "lacie,netxbig-gpio-ext";
> >+
> >+	addr-gpios =3D <&gpio1 15 GPIO_ACTIVE_HIGH
> >+		      &gpio1 16 GPIO_ACTIVE_HIGH
> >+		      &gpio1 17 GPIO_ACTIVE_HIGH>;
> >+	data-gpios =3D <&gpio1 12 GPIO_ACTIVE_HIGH
> >+		      &gpio1 13 GPIO_ACTIVE_HIGH
> >+		      &gpio1 14 GPIO_ACTIVE_HIGH>;
>=20
> You should indicate which element is MSB/LSB.

OK.

>=20
> >+	enable-gpio =3D <&gpio0 29 GPIO_ACTIVE_HIGH>;
> >+};
>=20
> This needs gpio maintainer ack. Adding Linus and Alexandre.
>=20
> Please also cc devicetree@vger.kernel.org always when modifying
> DT bindings.

OK.

>=20
> >diff --git a/Documentation/devicetree/bindings/leds/leds-netxbig.txt b/D=
ocumentation/devicetree/bindings/leds/leds-netxbig.txt
> >new file mode 100644
> >index 000000000000..efadbecbfeb9
> >--- /dev/null
> >+++ b/Documentation/devicetree/bindings/leds/leds-netxbig.txt
> >@@ -0,0 +1,92 @@
> >+Binding for the CPLD LEDs (GPIO extension bus) found on some LaCie/Seag=
ate
> >+boards (Example: 2Big/5Big Network v2, 2Big NAS).
> >+
> >+Required properties:
> >+- compatible: "lacie,netxbig-leds".
> >+- gpio-ext: Phandle for the gpio-ext bus.
> >+
> >+Optional properties:
> >+- timers: Timer array. Each timer entry is represented by three integer=
s:
> >+  Mode (gpio-ext bus), delay_on and delay_off.
> >+
> >+Each LED is represented as a sub-node of the netxbig-leds device.
> >+
> >+Required sub-node properties:
> >+- mode-addr: Mode register address on gpio-ext bus.
> >+- mode-val: Mode to value mapping. Each entry is represented by two int=
egers:
> >+  A mode and the corresponding value on the gpio-ext bus.
> >+- bright-addr: Brightness register address on gpio-ext bus.
> >+- bright-max: Maximum brightness value.
>=20
> We have a property led-max-microamp for this. Since LED subsystem
> brightness level is not suitable for describing hardware properties,
> we've switched to using microamperes. There is pending patch [1] that
> makes the things more precise.

Thanks. I'll have a look at this.

>=20
> >+
> >+Optional sub-node properties:
> >+- label: Name for this LED. If omitted, the label is taken from the nod=
e name.
> >+- linux,default-trigger: Trigger assigned to the LED.
> >+
> >+Example:
> >+
> >+netxbig-leds {
> >+	compatible =3D "lacie,netxbig-leds";
> >+
> >+	gpio-ext =3D &gpio_ext;
> >+
> >+	timers =3D <NETXBIG_LED_TIMER1 500 500
> >+		  NETXBIG_LED_TIMER2 500 1000>;
> >+
> >+	blue-power {
> >+		label =3D "netxbig:blue:power";
> >+		mode-addr =3D <0>;
> >+		mode-val =3D <NETXBIG_LED_OFF 0
> >+			    NETXBIG_LED_ON 1
> >+			    NETXBIG_LED_TIMER1 3
> >+			    NETXBIG_LED_TIMER2 7>;
> >+		bright-addr =3D <1>;
> >+		bright-max =3D <7>;
> >+	};
> >+	red-power {
> >+		label =3D "netxbig:red:power";
> >+		mode-addr =3D <0>;
> >+		mode-val =3D <NETXBIG_LED_OFF 0
> >+			    NETXBIG_LED_ON 2
> >+			    NETXBIG_LED_TIMER1 4>;
> >+		bright-addr =3D <1>;
> >+		bright-max =3D <7>;
> >+	};
> >+	blue-sata0 {
> >+		label =3D "netxbig:blue:sata0";
> >+		mode-addr =3D <3>;
> >+		mode-val =3D <NETXBIG_LED_OFF 0
> >+			    NETXBIG_LED_ON 7
> >+			    NETXBIG_LED_SATA 1
> >+			    NETXBIG_LED_TIMER1 3>;
> >+		bright-addr =3D <2>;
> >+		bright-max =3D <7>;
> >+	};
> >+	red-sata0 {
> >+		label =3D "netxbig:red:sata0";
> >+		mode-addr =3D <3>;
> >+		mode-val =3D <NETXBIG_LED_OFF 0
> >+			    NETXBIG_LED_ON 2
> >+			    NETXBIG_LED_TIMER1 4>;
> >+		bright-addr =3D <2>;
> >+		bright-max =3D <7>;
> >+	};
> >+	blue-sata1 {
> >+		label =3D "netxbig:blue:sata1";
> >+		mode-addr =3D <4>;
> >+		mode-val =3D <NETXBIG_LED_OFF 0
> >+			    NETXBIG_LED_ON 7
> >+			    NETXBIG_LED_SATA 1
> >+			    NETXBIG_LED_TIMER1 3>;
> >+		bright-addr =3D <2>;
> >+		bright-max =3D <7>;
> >+	};
> >+	red-sata1 {
> >+		label =3D "netxbig:red:sata1";
> >+		mode-addr =3D <4>;
> >+		mode-val =3D <NETXBIG_LED_OFF 0
> >+			    NETXBIG_LED_ON 2
> >+			    NETXBIG_LED_TIMER1 4>;
> >+		bright-addr =3D <2>;
> >+		bright-max =3D <7>;
> >+	};
> >+};
> >diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
> >index 25e419752a7b..3649dfebd1d3 100644
> >--- a/drivers/leds/leds-netxbig.c
> >+++ b/drivers/leds/leds-netxbig.c
> >@@ -26,6 +26,7 @@
> >  #include <linux/spinlock.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/gpio.h>
> >+#include <linux/of_gpio.h>
> >  #include <linux/leds.h>
> >  #include <linux/platform_data/leds-kirkwood-netxbig.h>
> >
> >@@ -140,6 +141,11 @@ struct netxbig_led_data {
> >  	spinlock_t		lock;
> >  };
> >
> >+struct netxbig_led_priv {
> >+	struct netxbig_led_platform_data *pdata;
> >+	struct netxbig_led_data leds_data[];
> >+};
> >+
> >  static int netxbig_led_get_timer_mode(enum netxbig_led_mode *mode,
> >  				      unsigned long delay_on,
> >  				      unsigned long delay_off,
> >@@ -304,12 +310,12 @@ static void delete_netxbig_led(struct netxbig_led_=
data *led_dat)
> >  	led_classdev_unregister(&led_dat->cdev);
> >  }
> >
> >-static int
> >-create_netxbig_led(struct platform_device *pdev,
> >-		   struct netxbig_led_data *led_dat,
> >-		   const struct netxbig_led *template)
> >+static int create_netxbig_led(struct platform_device *pdev, int led,
> >+			      struct netxbig_led_priv *priv)
> >  {
> >-	struct netxbig_led_platform_data *pdata =3D dev_get_platdata(&pdev->de=
v);
> >+	struct netxbig_led_platform_data *pdata =3D priv->pdata;
> >+	struct netxbig_led_data *led_dat =3D &priv->leds_data[led];
> >+	const struct netxbig_led *template =3D &priv->pdata->leds[led];
> >
> >  	spin_lock_init(&led_dat->lock);
> >  	led_dat->gpio_ext =3D pdata->gpio_ext;
> >@@ -346,38 +352,241 @@ create_netxbig_led(struct platform_device *pdev,
> >  	return led_classdev_register(&pdev->dev, &led_dat->cdev);
> >  }
> >
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
> >+	if (ret < 0)
> >+		return ret;
>=20
> Please add error messages when parsing fails somewhere. There is a bit
> to parse in this driver and the messages would make debugging easier.

I am not sure it makes sense to add an error message here. It is very
unlikely we will get an error here. The only purpose would be debugging
while writing a DT node for this driver. With the DT binding document,
I think it is quite hard to make it wrong. Moreover, while writing this
code, I didn't need messages here.

But if you think that error messages are needed anyway, I'll be glad to
add them.=20

>=20
> >+	num_addr =3D ret;
> >+	addr =3D devm_kzalloc(dev, num_addr * sizeof(unsigned int), GFP_KERNEL=
);
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
> >+	if (ret < 0)
> >+		return ret;
> >+	num_data =3D ret;
> >+	data =3D devm_kzalloc(dev, num_data * sizeof(unsigned int), GFP_KERNEL=
);
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
> >+	if (ret < 0)
> >+		return ret;
> >+	gpio_ext->enable =3D ret;
> >+
> >+	return 0;
> >+}
> >+
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
> >+
> >+	/* GPIO extension */
> >+	gpio_ext_np =3D of_parse_phandle(np, "gpio-ext", 0);
> >+	if (!gpio_ext_np)
> >+		return -EINVAL;
>=20
> Please add error message here.
>=20
> >+	gpio_ext =3D devm_kzalloc(dev, sizeof(struct netxbig_gpio_ext),
> >+				GFP_KERNEL);
>=20
> Kernel code style would be: sizeof(*gpio_ext). The same is relevant
> to all other occurrences of sizeof in this file.

OK.

>=20
> >+	if (!gpio_ext)
> >+		return -ENOMEM;
> >+	ret =3D gpio_ext_get_of_pdata(dev, gpio_ext_np, gpio_ext);
> >+	if (ret)
> >+		return ret;
> >+	of_node_put(gpio_ext_np);
> >+	pdata->gpio_ext =3D gpio_ext;
> >+
> >+	/* Timers (optional) */
> >+	ret =3D of_property_count_u32_elems(np, "timers");
> >+	if (ret > 0) {
> >+		if (ret % 3)
> >+			return -EINVAL;
> >+		num_timers =3D ret / 3;
> >+		timers =3D devm_kzalloc(dev,
> >+				num_timers * sizeof(struct netxbig_led_timer),
> >+				GFP_KERNEL);
> >+		if (!timers)
> >+			return -ENOMEM;
> >+		for (i =3D 0; i < num_timers; i++) {
> >+			u32 tmp;
> >+
> >+			of_property_read_u32_index(np, "timers", 3 * i,
> >+						   &timers[i].mode);
> >+			if (timers[i].mode >=3D NETXBIG_LED_MODE_NUM)
> >+				return -EINVAL;
> >+			of_property_read_u32_index(np, "timers",
> >+						   3 * i + 1, &tmp);
> >+			timers[i].delay_on =3D tmp;
> >+			of_property_read_u32_index(np, "timers",
> >+						   3 * i + 2, &tmp);
> >+			timers[i].delay_off =3D tmp;
>=20
> You could get rid of tmp by reformatting above as follows:
>=20
> of_property_read_u32_index(np, "timers", 3 * i + 1,
>                            &timers[i].delay_on);
> of_property_read_u32_index(np, "timers", 3 * i + 2,
>                            &timers[i].delay_off);

No we can't. This was the main purpose for the v2. delay_{on,off} are
unsigned long and of_property_read_u32_index expects u32. On an 64-bit
big endian machine, this code is broken. Even if this driver will never
be used on a such architecture, it is still a mistake. Moreover, it has
been reported by Dan Carpenter that the static code checker was not
happy about that.

That's why we are using an intermediary variable here.

>=20
> >+		}
> >+		pdata->timer =3D timers;
> >+		pdata->num_timer =3D num_timers;
> >+	}
> >+
> >+	/* LEDs */
> >+	num_leds =3D of_get_child_count(np);
> >+	if (!num_leds)
> >+		return -ENODEV;
> >+
> >+	leds =3D devm_kzalloc(dev, num_leds * sizeof(struct netxbig_led),
> >+			    GFP_KERNEL);
> >+	if (!leds)
> >+		return -ENOMEM;
> >+
> >+	led =3D leds;
> >+	for_each_child_of_node(np, child) {
> >+		const char *string;
> >+		int *mode_val;
> >+		int num_modes;
> >+
> >+		if (!of_property_read_string(child, "label", &string))
> >+			led->name =3D string;
> >+		else
> >+			led->name =3D child->name;
> >+
> >+		if (!of_property_read_string(child,
> >+					     "linux,default-trigger", &string))
> >+			led->default_trigger =3D string;
>=20
> Please put above calls to of_property_read_string after all the
> below conditions that can end up with returning an error.

OK.

>=20
> >+
> >+		if (of_property_read_u32(child, "mode-addr",
> >+					 &led->mode_addr))
> >+			return -EINVAL;
> >+
> >+		if (of_property_read_u32(child, "bright-addr",
> >+					 &led->bright_addr))
> >+			return -EINVAL;
> >+
> >+		mode_val =3D devm_kzalloc(dev,
> >+					NETXBIG_LED_MODE_NUM * sizeof(int),
> >+					GFP_KERNEL);
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
> >+{
> >+	return -ENODEV;
> >+}
> >+#endif /* CONFIG_OF_GPIO */
> >+
> >  static int netxbig_led_probe(struct platform_device *pdev)
> >  {
> >  	struct netxbig_led_platform_data *pdata =3D dev_get_platdata(&pdev->d=
ev);
> >-	struct netxbig_led_data *leds_data;
> >+	struct netxbig_led_priv *priv;
> >  	int i;
> >  	int ret;
> >
> >-	if (!pdata)
> >-		return -EINVAL;
> >+	if (!pdata) {
> >+		pdata =3D devm_kzalloc(&pdev->dev,
> >+				     sizeof(struct netxbig_led_platform_data),
> >+				     GFP_KERNEL);
> >+		if (!pdata)
> >+			return -ENOMEM;
> >+		ret =3D netxbig_leds_get_of_pdata(&pdev->dev, pdata);
> >+		if (ret)
> >+			return ret;
> >+	}
>=20
> You're removing board file for the device later in this patch set, but
> in the same time you seem to expect pdata from board file as the
> first choice and resort to parsing DT only if pdata is not available.
> This is inconsistent. I'd leave the board file intact for now, also
> because there can be some users of it.

It is probably true that the next patch makes it inconsistent. But even
if there is no more "board setup" code to fill pdata, I think it may be
convenient to still support this mechanism.

About the board file removal, it is safe. AFAIK, for this boards, users
will update the Linux and DTB images together. Backward compatibility
between Linux and the earlier DTB version is not supported. Else we
would have to keep this board file forever and I am pretty sure that
the mvebu maintainers will disagree about that :)

>=20
> BTW how do you compile the driver? I've tried to use
> multi_v5_defconfig and mvebu_v5_defconfig and I have build breaks
> with both of them on the recent linux-next.

For the original patch set version (Linux 4.0 at the time), I have used
the mvebu_v5_defconfig. Now I am using a lighter configuration because
I don't need to build the whole mvebu stuff.

What kind of error do you get ? I remember something about setting
CONFIG_HZ to 250.

Thanks,

Simon

--nivyF5ZmfdQ/+RfC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlWJzNcACgkQgtp0PDeOcDqkMwCeJw/Up7Efd93DwzapDv+QVv5J
JsAAoJDAcxIhW8kWHw/W4F5ZzlUlHxMk
=mdOf
-----END PGP SIGNATURE-----

--nivyF5ZmfdQ/+RfC--

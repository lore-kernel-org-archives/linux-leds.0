From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH v5 1/4] leds: netxbig: add device tree binding
Date: Thu, 24 Sep 2015 15:32:01 +0200
Message-ID: <20150924133201.GX7306@kw.sim.vm.gnt>
References: <1442910248-11380-1-git-send-email-simon.guinot@sequanux.org>
 <1442910248-11380-2-git-send-email-simon.guinot@sequanux.org>
 <5603EA6C.80801@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zOTFI1MayFoZtDo5"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:58063 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753867AbbIXNbi (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 24 Sep 2015 09:31:38 -0400
Content-Disposition: inline
In-Reply-To: <5603EA6C.80801@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vincent Donnefort <vdonnefort@gmail.com>, Yoann Sculo <yoann@printk.fr>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh@kernel.org>, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org


--zOTFI1MayFoZtDo5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2015 at 02:19:56PM +0200, Jacek Anaszewski wrote:
> Hi Simon,

Hi Jacek,

Thanks again for the review. Please see my comments below.

>=20
> On 09/22/2015 10:24 AM, Simon Guinot wrote:
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
> >  .../devicetree/bindings/leds/leds-netxbig.txt      |  92 +++++++
> >  drivers/leds/leds-netxbig.c                        | 265 +++++++++++++=
++++++--
> >  include/dt-bindings/leds/leds-netxbig.h            |  18 ++
> >  .../linux/platform_data/leds-kirkwood-netxbig.h    |   1 +
> >  5 files changed, 376 insertions(+), 22 deletions(-)
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
> >
> >Changes for v5:
> >- Rename DT property "bright-max" into the more common "max-brightness".
> >- Make use of the "max-brightness" DT property. Instead of counting the
> >   data pins of the GPIO extension bus, use "max-brightness" to get the
> >   maximum brightness level.

=2E..

> >@@ -333,7 +339,7 @@ create_netxbig_led(struct platform_device *pdev,
> >  	led_dat->mode_addr =3D template->mode_addr;
> >  	led_dat->mode_val =3D template->mode_val;
> >  	led_dat->bright_addr =3D template->bright_addr;
> >-	led_dat->bright_max =3D (1 << pdata->gpio_ext->num_data) - 1;
> >+	led_dat->bright_max =3D template->bright_max;
>=20
> Could you explain please, why in netxbig_led_set() led_dat->bright_max
> is multiplied by the brightness value to be set as shown below?
>=20
>=20
> void netxbig_led_set(struct led_classdev *led_cdev,
>                      enum led_brightness value)
> {
> ...
>         if (set_brightness) {
>                 bright_val =3D DIV_ROUND_UP(value * led_dat->bright_max,
>                                           LED_FULL);
>                 gpio_ext_set_value(led_dat->gpio_ext,
>                                    led_dat->bright_addr, bright_val);
>         }
> ...
> }

Hardware values for brightness levels are in a range 0 to bright_max
(with bright_max =3D 7).
Software values for brightness levels are in a range 0 to 255.

Here, we are simply converting a software brightness value into an
hardware one. And the resulting value can be written directly into the
CPLD hardware bright register via the gpio-ext bus.

> >+	led =3D leds;
> >+	for_each_child_of_node(np, child) {
> >+		const char *string;
> >+		int *mode_val;
> >+		int num_modes;
> >+
> >+		if (of_property_read_u32(child, "mode-addr",
> >+					 &led->mode_addr))
> >+			return -EINVAL;
>=20
> Since for_each_child_of_node uses of_get_next_child underneath,
> the user is responsible for releasing current child in case
> they are going to break the iteration. In other words you
> need to execute of_node_put(child) then. Assigning error codes
> to ret and following it with "goto exit_for_each" would do here,
> where exit_for_each is defined as follows:
>=20
> exit_for_each:
> 	of_node_put(child);
> 	return ret;

OK, good caught. I'll do that for the next version. Note that a bunch of
other LED drivers are needing a such fix too.

Thanks,

Simon

--zOTFI1MayFoZtDo5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlYD+1EACgkQgtp0PDeOcDo9/QCeMUVX4z5gy4wiaq/gT0pLizhk
5iUAn1GHDXWIE+k74ZY1dWmv7sfplH2p
=LUxR
-----END PGP SIGNATURE-----

--zOTFI1MayFoZtDo5--

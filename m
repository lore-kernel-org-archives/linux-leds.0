From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH v4 1/3] leds: netxbig: add device tree binding
Date: Mon, 5 Oct 2015 10:15:41 +0200
Message-ID: <20151005081541.GF7306@kw.sim.vm.gnt>
References: <1442505571-9744-1-git-send-email-simon.guinot@sequanux.org>
 <1442505571-9744-2-git-send-email-simon.guinot@sequanux.org>
 <56002485.7030802@kernel.org>
 <20150922093015.GU7306@kw.sim.vm.gnt>
 <5608F334.8030103@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3UPJqPzJiScbNEd6"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:58131 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750896AbbJEIMo (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 5 Oct 2015 04:12:44 -0400
Content-Disposition: inline
In-Reply-To: <5608F334.8030103@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Andrew Lunn <andrew@lunn.ch>, Yoann Sculo <yoann@sculo.fr>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Bryan Wu <cooloney@gmail.com>, Vincent Donnefort <vdonnefort@gmail.com>, devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, linux-arm-kernel@lists.infradead.org, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-leds@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>


--3UPJqPzJiScbNEd6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2015 at 09:58:44AM +0200, Jacek Anaszewski wrote:
> Hi Rob.
>=20
> If you are satisfied with Simon's explanation, could you confirm
> that with your ack, please?

Hi Rob,

Please let us know your answer.

Thanks in advance.

Simon

> On 09/22/2015 11:30 AM, Simon Guinot wrote:
> >On Mon, Sep 21, 2015 at 10:38:45AM -0500, Rob Herring wrote:
> >
> >Hi Rob,
> >
> >Thanks for your feedback. Please, see my answers below.
> >
> >>On 09/17/2015 10:59 AM, Simon Guinot wrote:
> >>>This patch adds device tree support for the netxbig LEDs.
> >>>
> >>>This also introduces a additionnal DT binding for the GPIO extension b=
us
> >>>(netxbig-gpio-ext) used to configure the LEDs. Since this bus could al=
so
> >>>be used to control other devices, then it seems more suitable to have =
it
> >>>in a separate DT binding.
> >>>
> >>>Signed-off-by: Simon Guinot <simon.guinot@sequanux.org>
> >>>Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >>>---
> >>>  .../devicetree/bindings/gpio/netxbig-gpio-ext.txt  |  22 ++
> >>>  .../devicetree/bindings/leds/leds-netxbig.txt      |  92 ++++++++
> >>>  drivers/leds/leds-netxbig.c                        | 258 +++++++++++=
++++++++--
> >>>  include/dt-bindings/leds/leds-netxbig.h            |  18 ++
> >>>  4 files changed, 369 insertions(+), 21 deletions(-)
> >>>  create mode 100644 Documentation/devicetree/bindings/gpio/netxbig-gp=
io-ext.txt
> >>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-netxb=
ig.txt
> >>>  create mode 100644 include/dt-bindings/leds/leds-netxbig.h
> >>>
> >>>Changes for v2:
> >>>- Check timer mode value retrieved from DT.
> >>>- In netxbig_leds_get_of_pdata, don't use unsigned long variables to g=
et
> >>>   timer delay values from DT with function of_property_read_u32_index.
> >>>   Instead, use a temporary u32 variable. This allows to silence a sta=
tic
> >>>   checker warning.
> >>>- Make timer property optional in the binding documentation. It is now
> >>>   aligned with the driver code.
> >>>
> >>>Changes for v3:
> >>>- Fix pointer usage with the temporary u32 variable while calling
> >>>   of_property_read_u32_index.
> >>>
> >>>Changes for v4:
> >>>- In DT binding document netxbig-gpio-ext.txt, detail byte order for
> >>>   registers and latch mechanism for "enable-gpio".
> >>>- In leds-netxbig.c, add some error messages.
> >>>- In leds-netxbig.c, fix some "sizeof" style issues.
> >>>- In leds-netxbig.c, in netxbig_leds_get_of_pdata(), move the
> >>>   of_property_read_string() calls after the error-prone checks.
> >>>- Add some Acked-by.
> >>>
> >>>diff --git a/Documentation/devicetree/bindings/gpio/netxbig-gpio-ext.t=
xt b/Documentation/devicetree/bindings/gpio/netxbig-gpio-ext.txt
> >>>new file mode 100644
> >>>index 000000000000..50ec2e690701
> >>>--- /dev/null
> >>>+++ b/Documentation/devicetree/bindings/gpio/netxbig-gpio-ext.txt
> >>>@@ -0,0 +1,22 @@
> >>>+Binding for the GPIO extension bus found on some LaCie/Seagate boards
> >>>+(Example: 2Big/5Big Network v2, 2Big NAS).
> >>>+
> >>>+Required properties:
> >>>+- compatible: "lacie,netxbig-gpio-ext".
> >>>+- addr-gpios: GPIOs representing the address register (LSB -> MSB).
> >>>+- data-gpios: GPIOs representing the data register (LSB -> MSB).
> >>>+- enable-gpio: latches the new configuration (address, data) on raisi=
ng edge.
> >>>+
> >>>+Example:
> >>>+
> >>>+netxbig_gpio_ext: netxbig-gpio-ext {
> >>>+	compatible =3D "lacie,netxbig-gpio-ext";
> >>>+
> >>>+	addr-gpios =3D <&gpio1 15 GPIO_ACTIVE_HIGH
> >>>+		      &gpio1 16 GPIO_ACTIVE_HIGH
> >>>+		      &gpio1 17 GPIO_ACTIVE_HIGH>;
> >>>+	data-gpios =3D <&gpio1 12 GPIO_ACTIVE_HIGH
> >>>+		      &gpio1 13 GPIO_ACTIVE_HIGH
> >>>+		      &gpio1 14 GPIO_ACTIVE_HIGH>;
> >>>+	enable-gpio =3D <&gpio0 29 GPIO_ACTIVE_HIGH>;
> >>>+};
> >>>diff --git a/Documentation/devicetree/bindings/leds/leds-netxbig.txt b=
/Documentation/devicetree/bindings/leds/leds-netxbig.txt
> >>>new file mode 100644
> >>>index 000000000000..efadbecbfeb9
> >>>--- /dev/null
> >>>+++ b/Documentation/devicetree/bindings/leds/leds-netxbig.txt
> >>>@@ -0,0 +1,92 @@
> >>>+Binding for the CPLD LEDs (GPIO extension bus) found on some LaCie/Se=
agate
> >>>+boards (Example: 2Big/5Big Network v2, 2Big NAS).
> >>>+
> >>>+Required properties:
> >>>+- compatible: "lacie,netxbig-leds".
> >>>+- gpio-ext: Phandle for the gpio-ext bus.
> >>
> >>Would being a subnode of gpio-ext work instead?
> >
> >Well, it is really unclear to me. I think that the GPIO extension bus
> >can be seen as a "kind of" GPIO chip. And devices which are using a GPIO
> >resource are not represented in DT as sub-nodes of the GPIO node. That's
> >why I chose to use a phandle here.
> >
> >Let me know if this representation is not correct.
> >
> >>
> >>>+
> >>>+Optional properties:
> >>>+- timers: Timer array. Each timer entry is represented by three integ=
ers:
> >>>+  Mode (gpio-ext bus), delay_on and delay_off.
> >>>+
> >>>+Each LED is represented as a sub-node of the netxbig-leds device.
> >>>+
> >>>+Required sub-node properties:
> >>>+- mode-addr: Mode register address on gpio-ext bus.
> >>>+- mode-val: Mode to value mapping. Each entry is represented by two i=
ntegers:
> >>>+  A mode and the corresponding value on the gpio-ext bus.
> >>
> >>I somewhat wonder if this is too low level and should just be in the
> >>driver instead. I guess with only 3 addr and data lines, it is okay. It
> >>wouldn't scale to a large number of registers though.
> >
> >Even if it is not the case now, note that this values could be different
> >for an another board. For example, we already have some x86-based boards
> >(still no mainlined yet) which are using the leds-netxbig driver but
> >with a different gpio-ext configuration. This could happen with some
> >ARM-based boards too.
> >
> >That's why I think it is better to have this properties in the DT rather
> >than hardcoded values in the driver.
> >
> >>
> >>>+- bright-addr: Brightness register address on gpio-ext bus.
> >>>+- bright-max: Maximum brightness value.
> >>
> >>We already have a somewhat standard max-brightness property.
> >
> >Yes, Jacek mentioned that too. It made the change in the v5.
> >
> >Thanks,
> >
> >Simon
> >
>=20
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--3UPJqPzJiScbNEd6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlYSMa0ACgkQgtp0PDeOcDpb4gCfaj37Evca8S1kBub/HWMDEiTS
EWEAoJXma6EFZFGDpu+XvLSBaTRgvWT4
=QtS4
-----END PGP SIGNATURE-----

--3UPJqPzJiScbNEd6--

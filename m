From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v2 1/1 - resend] Documentation: dt-bindings: Add Device
 Tree bindings for Mellanox programming devices
Date: Thu, 10 Aug 2017 19:02:23 +0000
Message-ID: <AM4PR05MB333001900BAF0CCA7439F31AA2880@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <1501761859-22149-1-git-send-email-vadimp@mellanox.com>
 <1501761859-22149-2-git-send-email-vadimp@mellanox.com>
 <20170810174013.lt3vaqe2oq5lfq2j@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-db5eur01on0052.outbound.protection.outlook.com ([104.47.2.52]:28475
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752728AbdHJTC1 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 10 Aug 2017 15:02:27 -0400
In-Reply-To: <20170810174013.lt3vaqe2oq5lfq2j@rob-hp-laptop>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "pavel@ucw.cz" <pavel@ucw.cz>, "j.anaszewski@samsung.com" <j.anaszewski@samsung.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>



> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Thursday, August 10, 2017 8:40 PM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: devicetree@vger.kernel.org; lee.jones@linaro.org; pavel@ucw.cz;
> j.anaszewski@samsung.com; rpurdie@rpsys.net; linux-
> leds@vger.kernel.org; jiri@resnulli.us; jacek.anaszewski@gmail.com
> Subject: Re: [patch v2 1/1 - resend] Documentation: dt-bindings: Add Devi=
ce
> Tree bindings for Mellanox programming devices
>=20
> On Thu, Aug 03, 2017 at 12:04:19PM +0000, Vadim Pasternak wrote:
> > The mlxreg a multifunction device driver handling LEDs, events,
> > exposing through sysfs reset signal, and reset causes info. These
> > components share a common register space.
>=20
> "dt-bindings: mfd: ..." for the subject please.
>=20

Hi Rob,
Thank you for review.

OK, will change the subject.

> >
> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > ---
> >  .../devicetree/bindings/mfd/mellanox,mlxreg-core   | 346
> +++++++++++++++++++++
> >  1 file changed, 346 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core
> >
> > diff --git
> > a/Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core
> > b/Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core
> > new file mode 100644
> > index 0000000..a90933e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core
> > @@ -0,0 +1,346 @@
> > +Mellanox programmable device control.
> > +-------------------------------------
> > +This binding defines the device control interface over I2C bus for
> > +Mellanox BMC based switches.
> > +
> > +Required properties:
> > +- compatible =3D "mellanox,mlxreg-i2c",
> > +	       "mellanox,mlxreg-i2c-16",
> > +	       "mellanox,mlxreg-core";
>=20
> This is all one compatible entry? Why 3 compatibles?

It could be
	"mellanox,mlxreg-i2c" or
	"mellanox,mlxreg-i2c-16"

Is it not correct syntax?

And I think I'll drop "mellanox,mlxreg-core".

>=20
> > +- #address-cells : must be 1;
> > +- #size-cells : must be 0;
> > +- reg : I2C address;
> > +
> > +Optional properties:
> > +- interrupt-parent : phandle of parent interrupt controller;
> > +- interrupts : interrupt line;
> > +- deferred - I2C deferred bus phandle;
> > +	     For example, for the case when device attached to I2C bus
> number 4
> > +	     performs dynamic attachment of device to bus 12 upon some
> event.
> > +	     Due to this reason bus 4 is enforced to be activated after bus
> > +12;
>=20
> I don't understand...

For example I have CPLD device on i2c4, which handles the signals for ASIC =
device. I can connect this device to the bus at initialization time in case=
 it's ready, or upon receiving the relevant signal when it's getting ready:
&i2c4 {
	mlxcpld-swb-ctrl@72 {
		#address-cells =3D <1>;
		#size-cells =3D <0>;
		interrupt-parent =3D <&gpio>;
		interrupts =3D <ASPEED_GPIO(S, 1) 2>;
		compatible =3D "mellanox,mlxreg-i2c";
		reg =3D <0x72>;
		deferred =3D <&i2c12>;
		cell =3D <0x40>;
		mask =3D <0x01>;

		asic {
			aggr_mask =3D <0x01>;
			regs =3D <0x50>;
			masks =3D <0x03>;
			phandles =3D <&asic_thermal>;
		};
....
};

The ASIC device is connected to i2c12:
&i2c12 {
	status =3D "okay";
	#address-cells =3D <1>;
	#size-cells =3D <0>;

	asic_thermal: mlxsw_minimal@48 {
		compatible =3D "mlxsw_minimal";
		reg =3D <0x48>;
		status =3D "disabled";
		cooling-phandle =3D <&cooling>;

		trips {
			/* trip type, temp in mcelsius, temp min, temp max */
			trip@0 {
				trip =3D <0 75000 0 0>;
			};
			trip@1 {
				trip =3D <2 85000 1 5>;
			};
			trip@3 {
				trip =3D <2 105000 5 5>;
			};
		};
	};
};

So, in this case i2c4 should be activated after i2c12 and for this reason d=
evice mlxcpld-swb-ctrl@72 is deferred on activation of i2c12.

>=20
> > +- cell - top aggregation register offset;
> > +- mask - top aggregation register mask;
> > +- psu - power supply unit nodes:
>=20
> This section is "Optional Properties" and this is a sub-node. Each subnod=
e
> should have its own section.

ACK

>=20
> > +	- aggr_mask - effective bit in aggregation mask;
>=20
> Don't use '_' in node or property names.

ACK

>=20
> > +	- reg - register offset for all group members;
> > +	- mask - register mask;
> > +	- phandles - list of relevant device nodes;
>=20
> Other than reg, I don't understand what any of these are.
>=20
> From what I can tell you are describing things down to register bit level=
 which
> generally is too much detail in DT. How many variations of h/w do you hav=
e?
> Do you really need to be able to define any possible combination or have
> some finite set?

We have about 10 different 1U systems with different numbers of FANs, with =
replicable or
non-replaceable PSU. I am also planning to support director systems, which =
has different
configurations - different number of leaf and  spine cards and power supply=
 and FAN units.
This is the wide range of system from smallest with 16x100G ports with bigg=
est with 800x200G ports.
I really need flexibility in device description.

In field mask I assign the affective mask for dynamic devices, f.e. example=
 for system with 4 FANs
mask will be 0x0f, with 6 0x3f and for director system it can be located in=
 several registers with masks
0xff.

Handles have the next purpose. For example for fan nodes I provide the list=
 of EEPROM devices'
handles, which should be connected/disconnected on insert/remove:

		fan {
			aggr_mask =3D <0x40>;
			reg =3D <0x88>;
			mask =3D <0x0f>;
			phandles =3D <&fan1_eeprom &fan2_eeprom &fan3_eeprom
				    &fan4_eeprom>;
		};

And this EEPROM devices are connected to i2c switch device like below:
&i2c6 {
	...
	i2cswitch@71 {
		compatible =3D "nxp,pca9548";
		#address-cells =3D <1>;
		#size-cells =3D <0>;
		reg =3D <0x71>;

                i2c@0 {
                        #address-cells =3D <1>;
                        #size-cells =3D <0>;
                        reg =3D <0>;

                        fan1_eeprom: at24c04@50 {
                                compatible =3D "atmel,24c32";
                                reg =3D <0x50>;
				status =3D "disabled";
                        };
                };

                i2c@1 {
                        #address-cells =3D <1>;
                        #size-cells =3D <0>;
                        reg =3D <1>;

                        fan2_eeprom: at24c04@50 {
                                compatible =3D "atmel,24c32";
                                reg =3D <0x50>;
				status =3D "disabled";
                        };
                };

                i2c@2 {
                        #address-cells =3D <1>;
                        #size-cells =3D <0>;
                        reg =3D <2>;

                        fan3_eeprom: at24c04@50 {
                                compatible =3D "atmel,24c32";
                                reg =3D <0x50>;
				status =3D "disabled";
                        };
                };

                i2c@3 {
                        #address-cells =3D <1>;
                        #size-cells =3D <0>;
                        reg =3D <3>;

                        fan4_eeprom: at24c04@50 {
                                compatible =3D "atmel,24c32";
                                reg =3D <0x50>;
				status =3D "disabled";
                        };
                };

	};
};

>=20
> Rob

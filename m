From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v4 1/2] mfd: Add Mellanox regmap core driver
Date: Tue, 5 Sep 2017 18:21:27 +0000
Message-ID: <AM4PR05MB333091C928607B676067B325A2960@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <1504029616-192277-1-git-send-email-vadimp@mellanox.com>
 <1504029616-192277-2-git-send-email-vadimp@mellanox.com>
 <20170901161433.gpkrpjx53pjv4mid@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20170901161433.gpkrpjx53pjv4mid@rob-hp-laptop>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "lee.jones@linaro.org" <lee.jones@linaro.org>, "pavel@ucw.cz" <pavel@ucw.cz>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "j.anaszewski@samsung.com" <j.anaszewski@samsung.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org



> > folder;  Comments pointed out by Rob:
> >  - Make a separate patch /devicetree/bindings/vendor-prefixes.txt;
> >  - Add .txt to Documentation/devicetree/bindings/mfd/mellanox,mlxreg-
> core
> >    and send it within this series;
>=20
> Why did you combine this? Bindings should be separate patches.

Ack.

>=20
> > +			spi_burn_bios_ci {
> > +				reg =3D <0x32>;
> > +				mask =3D <0xfe>;
> > +				bit =3D <0x00>;
> > +				phandles =3D <&spi2>;
> > +			};
> > +			spi_burn_ncsi {
> > +				reg =3D <0x32>;
>=20
> You can't have duplicate reg values. This will also generate warnings.
> Build your dtb with "W=3D2".

Can I use some logical name for unit, like below?
			spi_burn_bios_ci: mux@1 {
				reg =3D <0x32>;
				mask =3D <0xfe>;
				bit =3D <0x00>;
				hotplugs =3D <&spi2>;
			};
			spi_burn_ncsi: mux@2 {
				reg =3D <0x32>;
				mask =3D <0xfd>;
				bit =3D <0x00>;
				hotplugs =3D <&spi2>;
			};

I verified it with "W=3D2". Also I am running with CONFIG_OF_UNITTEST and
I don't have unites issues.

>=20
> Again, this all looks too low level to me. You described the high level
> differences in terms of number of cards, fans, PSUs, etc., but I don't se=
e that
> here. This isn't reviewable for anyone not familiar with your systems.

The below should describe signals, which triggers hotplugable device
Insertion or removal.
		pwr: hotplugs@1 {
			aggr =3D <0x08>;
			reg =3D <0x64>;
			mask =3D <0x03>;
			hotplugs =3D <&psu1_ctrl &psu2_ctrl>;
		};

		asic: hotplugs@3 {
			aggr =3D <0x01>;
			regs =3D <0x50>;
			mask =3D <0x03>;
			hotplugs =3D <&asic_thermal>;
		};
In DTS I have description for such devices in disabled state and they are
Connected or disconnected dynamically:
&i2c3 {
...
	psu1_ctrl: dps460@59 {
		compatible =3D "dps460";
		reg =3D <0x59>;
		status =3D "disabled";
	};
''

&i2c12 {
...
	asic_thermal: mlxsw_minimal@48 {
		compatible =3D "mlxsw_minimal";
		reg =3D <0x48>;
		status =3D "disabled";
             ...

And the same way I'd like to add spine and leaf cards, but I still don't
Have support for them in my drivers.

>=20
> > +				mask =3D <0xfd>;
> > +				bit =3D <0x00>;
> > +				phandles =3D <&spi2>;
>=20
> Not a good name other than giving type information. Name it for what
> function is being provided (e.g. clocks, interrupts, gpios).

Would it be OK if to use hotplugs instead of phandles?
It could be f.e. FAN EEPROM, PSU controller, ASIC, spine or leaf card, all =
these=20
are hotplugable device, which could be inserted or removed.
It could be remote flashes, which are getting available after mux selection=
, like
in the above example for spi_burn_bios_ci and spi_burn_ncsi.
Or it could be some other device at the remote side, which is getting avail=
able to
BMC, only when remote side (f.e. COMEX) is getting power good.

Thanks,
Vadim.
=20
=20

From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH 02/10] mfd: dt-bindings: Add bindings for the Juniper I2CS MFD
Date: Mon, 17 Oct 2016 22:10:31 +0300
Message-ID: <DA482672-7CBA-491D-9180-7DA70CBFA086@konsulko.com>
References: <1475853669-22480-1-git-send-email-pantelis.antoniou@konsulko.com> <1475853669-22480-3-git-send-email-pantelis.antoniou@konsulko.com> <20161010202341.GA5652@rob-hp-laptop>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:34877 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759049AbcJQTK0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 Oct 2016 15:10:26 -0400
Received: by mail-lf0-f47.google.com with SMTP id l131so255113866lfl.2
        for <linux-leds@vger.kernel.org>; Mon, 17 Oct 2016 12:10:24 -0700 (PDT)
In-Reply-To: <20161010202341.GA5652@rob-hp-laptop>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Jean Delvare <jdelvare@suse.com>, Peter Rosin <peda@axentia.se>, Avirup Banerjee <abanerjee@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>, Guenter Roeck <linux@roeck-us.net>, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, devicetree <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org, linux-hwmon@vger.kernel.org

Hi Rob,

> On Oct 10, 2016, at 23:23 , Rob Herring <robh@kernel.org> wrote:
>=20
> On Fri, Oct 07, 2016 at 06:21:01PM +0300, Pantelis Antoniou wrote:
>> From: Georgi Vlaev <gvlaev@juniper.net>
>>=20
>> Add device tree bindings for the Juniper I2CS MFD driver.
>>=20
>> Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
>> [Ported from Juniper kernel]
>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
>> ---
>> Documentation/devicetree/bindings/mfd/jnx-i2cs.txt | 68 =
++++++++++++++++++++++
>> 1 file changed, 68 insertions(+)
>> create mode 100644 Documentation/devicetree/bindings/mfd/jnx-i2cs.txt
>>=20
>> diff --git a/Documentation/devicetree/bindings/mfd/jnx-i2cs.txt =
b/Documentation/devicetree/bindings/mfd/jnx-i2cs.txt
>> new file mode 100644
>> index 0000000..0ec103b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/jnx-i2cs.txt
>> @@ -0,0 +1,68 @@
>> +Device-Tree bindings for Juniper Networks I2CS FPGA MFD
>> +
>> +Required properties:
>> +- compatible - Must be one of:
>> +	"jnx,i2cs-rcb"	(Routing Engine or Control Board FRUs)
>> +	"jnx,i2cs-fpc"	(Flexible Port Concentrator FRUs)
>> +	"jnx,i2cs-sib"	(Switching Interface Board FRUs)
>> +	"jnx,i2cs-fan"	(Fan Tray FRUs)
>> +
>> +Optional properties:
>> +
>> +Depending on the FRU, the I2CS MFD has varied group of sub-devices:
>> +
>> +Device                   Description
>> +------                   -----------
>> +jnx,i2cs-gpio		: Virtual gpio mapping driver
>> +jnx,i2cs-fan-hwmon	: hwmon driver for fan trays
>> +jnx,i2c-mux-i2cs	: I2C Mux driver for FPC FRUs
>> +jnx,leds-i2cs		: Led driver
>> +
>> +All these optional nodes are described in their respective binding
>> +documents.
>> +
>> +Example node:
>> +
>> +i2cs@54 {
>> +	compatible =3D "jnx,i2cs-fpc";
>> +	reg =3D <0x54>;
>> +	#address-cells =3D <0>;
>> +	#size-cells =3D <0>;
>> +
>> +	fpc2_mux {
>=20
> Generic node names please.
>=20

OK.

> mux {=20
>=20
>> +		compatible =3D "jnx,i2c-mux-i2cs";
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +
>> +		fpc2i2c0: i2c@0 {
>> +			#address-cells =3D <1>;
>> +			#size-cells =3D <0>;
>> +			reg =3D <0>;
>> +		};
>> +	};
>> +
>> +	fpc2_gpiomap: gpio-jnx-i2cs {
>=20
> gpio@54 {
>=20
OK

>> +		compatible =3D "jnx,gpio-i2cs";
>> +		reg =3D <0x54>;
>> +		#gpio-cells =3D <2>;
>> +		gpio-controller;
>> +		interrupt-controller;
>> +
>> +		/*
>> +		 * Map bits [0-3] of reg 0x21 as gpio inputs, bits [4-7]
>> +		 * as gpio outputs
>> +		 */
>> +		i2c-gpio-map =3D <0x21 0x0f>;
>> +	};
>> +
>> +	leds-jnx-i2cs {
>=20
> leds {
>=20

OK.

>> +		compatible =3D "jnx,leds-i2cs";
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +
>> +		sib8-active {
>> +			reg =3D <0>;
>> +			linux,default-trigger =3D "sib8-active";
>> +		};
>> +	};
>> +};
>> --=20
>> 1.9.1

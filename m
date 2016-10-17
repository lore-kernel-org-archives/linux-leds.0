From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH 10/10] hwmon: i2cs-fan: Add hwmon dts binding documentation
Date: Mon, 17 Oct 2016 22:12:58 +0300
Message-ID: <E38D5F40-C626-4143-82C3-916ECFEE30C7@konsulko.com>
References: <1475853669-22480-1-git-send-email-pantelis.antoniou@konsulko.com> <1475853669-22480-11-git-send-email-pantelis.antoniou@konsulko.com> <20161010202903.GA9122@rob-hp-laptop>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <20161010202903.GA9122@rob-hp-laptop>
Sender: linux-i2c-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Jean Delvare <jdelvare@suse.com>, Peter Rosin <peda@axentia.se>, Avirup Banerjee <abanerjee@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>, Guenter Roeck <linux@roeck-us.net>, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org, linux-hwmon@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


> On Oct 10, 2016, at 23:29 , Rob Herring <robh@kernel.org> wrote:
>=20
> On Fri, Oct 07, 2016 at 06:21:09PM +0300, Pantelis Antoniou wrote:
>> From: Georgi Vlaev <gvlaev@juniper.net>
>>=20
>> Adds the I2CS Fan Tray hwmon device tree node documentation.
>>=20
>> Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
>> [Ported from Juniper kernel]
>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
>> ---
>> Documentation/devicetree/bindings/hwmon/i2cs-fan.txt | 19 =
+++++++++++++++++++
>> 1 file changed, 19 insertions(+)
>> create mode 100644 =
Documentation/devicetree/bindings/hwmon/i2cs-fan.txt
>>=20
>> diff --git a/Documentation/devicetree/bindings/hwmon/i2cs-fan.txt =
b/Documentation/devicetree/bindings/hwmon/i2cs-fan.txt
>> new file mode 100644
>> index 0000000..4ef880c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/i2cs-fan.txt
>> @@ -0,0 +1,19 @@
>> +Hwmon driver for Juniper fan trays on I2CS Slave FPGA
>=20
> This is a h/w description, not a driver.
>=20
>> +
>> +Required properties:
>> +
>> +- compatible: "i2cs-fan-hwmon"
>=20
> I doubt any fan control h/w has "hwmon" in the name.
>=20
>> +
>> +Optional properties:
>> +
>> +- num-fans: fans per tray (default 14)
>> +
>> +- tach-factor: TACH count scaling factor (default 120)
>=20
> vendor prefixes needed.
>=20
>> +
>> +Example:
>> +
>> +fan-hwmon {
>> +	compatible =3D "jnx,i2cs-fan-hwmon";
>> +	num-fans =3D <6>;
>> +	tach-factor =3D <33>;
>> +};
>> --=20
>> 1.9.1

OK on all three.=

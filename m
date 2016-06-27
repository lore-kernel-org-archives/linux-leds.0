From: Florian Vaussard <florian.vaussard@heig-vd.ch>
Subject: Re: [PATCH v2 1/2] leds: ncp5623: Add device tree binding
 documentation
Date: Mon, 27 Jun 2016 10:30:07 +0200
Message-ID: <4125a334-2e15-285d-2721-c007b30ed65d@heig-vd.ch>
References: <1467010990-28070-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1467010990-28070-2-git-send-email-florian.vaussard@heig-vd.ch>
 <5770DF98.7010900@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailcl2.heig-vd.ch ([193.134.216.183]:48417 "EHLO heig-vd.ch"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751248AbcF0IaS (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 27 Jun 2016 04:30:18 -0400
In-Reply-To: <5770DF98.7010900@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Florian Vaussard <florian.vaussard@gmail.com>
Cc: devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Vaussard Florian <florian.vaussard@heig-vd.ch>

Hi Jacek,

Le 27. 06. 16 =E0 10:11, Jacek Anaszewski a =E9crit :
> Hi Florian,
>=20
> On 06/27/2016 09:03 AM, Florian Vaussard wrote:
>> Add device tree binding documentation for On Semiconductor NCP5623 I=
2C
>> LED driver. The driver can independently control the PWM of the 3
>> channels with 32 levels of intensity.
>>
>> The current delivered by the current source can also be controlled. =
To
>> do so, the led-max-microamp property is used by each LED sub-node. T=
he
>> maximum value is then found and used as a limit to compute the final
>> intensity of the current source. If a LED happens to have a lower li=
mit,
>> the PWM is then used to limit the current to the requested value.
>>
>> In order to control the current source, it is also necessary to know
>> the current on the Iref pin, hence the onnn,led-iref-microamp proper=
ty.
>> It is usually set using an external bias resistor, following
>> Iref =3D Vref/Rbias with Vref=3D0.6V.
>>
>> Signed-off-by: Florian Vaussard <florian.vaussard@heig-vd.ch>
>> ---
>>   .../devicetree/bindings/leds/leds-ncp5623.txt      | 60 ++++++++++=
++++++++++++
>>   1 file changed, 60 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-ncp=
5623.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-ncp5623.txt
>> b/Documentation/devicetree/bindings/leds/leds-ncp5623.txt
>> new file mode 100644
>> index 0000000..77dd7ad
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-ncp5623.txt
>> @@ -0,0 +1,60 @@
>> +* ON Semiconductor - NCP5623 3-Channel LED Driver
>> +
>> +The NCP5623 is a 3-channel I2C LED driver. The brightness of each
>> +channel can be independently set using 32 levels. Each LED is repre=
sented
>> +as a sub-node of the device.
>> +
>> +Required properties:
>> +  - compatible: Should be "onnn,ncp5623"
>> +  - reg: I2C slave address (fixed to 0x38)
>> +  - #address-cells: must be 1
>> +  - #size-cells: must be 0
>> +  - onnn,led-iref-microamp: Current on the Iref pin in microampere.=
 It depends
>> +    on the value of the external bias resistor Rbias, following
>> +    Iref =3D Vref / Rbias with Vref =3D 0.6V. This is used to set t=
he intensity of
>> +    the current that can be provided by the internal current source=
, based on
>> +    the maximum current permitted by LED sub-nodes (see below), but=
 no more than
>> +    Imax =3D 2400 * Iref.
>> +
>> +LED sub-nodes
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Required properties:
>> +  - reg : LED channel number (0..2)
>> +  - led-max-microamp: Maximum allowable current inside the LED in m=
icroampere.
>> +    This property is used to limit the PWM ratio, based on the inte=
nsity of the
>> +    internal current source (see above).
>> +
>> +Optional properties:
>> +  - label: Used for naming LEDs
>=20
> Instead of the above description use same reference to common led
> bindings as below.
>=20

Ok.

BTW I saw the thread about the "default-state" property on the DT list =
and
realized that it was not implemented in my driver. I wonder if standard=
 LED
properties (with label and default-trigger) should not be parsed by LED=
 core
(i.e. using a helper function) to avoid such mistake. This could also r=
emove
some boilerplate code in other LED drivers.

Best,
=46lorian

>> +  - default-trigger: see Documentation/devicetree/bindings/leds/com=
mon.txt
>> +
>> +Example
>> +=3D=3D=3D=3D=3D=3D=3D
>> +
>> +led1: ncp5623@38 {
>> +    #address-cells =3D <1>;
>> +    #size-cells =3D <0>;
>> +    compatible =3D "onnn,ncp5623";
>> +    reg =3D <0x38>;
>> +    onnn,led-iref-microamp =3D <10>;
>> +
>> +    led1r@0 {
>> +        label =3D "ncp:power:red";
>> +        linux,default-trigger =3D "default-on";
>> +        reg =3D <0>;
>> +        led-max-microamp =3D <20000>;
>> +    };
>> +
>> +    led1b@1 {
>> +        label =3D "ncp:power:blue";
>> +        reg =3D <1>;
>> +        led-max-microamp =3D <20000>;
>> +    };
>> +
>> +    led1g@2 {
>> +        label =3D "ncp:power:green";
>> +        reg =3D <2>;
>> +        led-max-microamp =3D <20000>;
>> +    };
>> +};
>>
>=20
>=20

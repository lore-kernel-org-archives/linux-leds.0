From: Florian Vaussard <florian.vaussard@heig-vd.ch>
Subject: Re: [PATCH 1/2] leds: ncp5623: Add device tree binding documentation
Date: Wed, 22 Jun 2016 08:08:21 +0200
Message-ID: <59143a9b-ab51-bd3b-e9db-93680415d205@heig-vd.ch>
References: <1466494154-3786-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1466494154-3786-2-git-send-email-florian.vaussard@heig-vd.ch>
 <57695D02.2000109@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57695D02.2000109@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Florian Vaussard <florian.vaussard@gmail.com>
Cc: devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Jacek,

Le 21. 06. 16 =E0 17:28, Jacek Anaszewski a =E9crit :
> Hi Florian,
>=20
> Thanks for the patch. I have two remarks below.
>=20
> On 06/21/2016 09:29 AM, Florian Vaussard wrote:
>> Add device tree binding documentation for On Semiconductor NCP5623 I=
2C
>> LED driver. The driver can independently control the PWM of the 3
>> channels with 32 levels of intensity.
>>
>> The current delivered by the current source can be controlled using =
the
>> led-max-microamp property. In order to control this value, it is als=
o
>> necessary to know the current on the Iref pin, hence the
>> onnn,led-iref-microamp property. It is usually set using an external
>> bias resistor, following Iref =3D Vref/Rbias with Vref=3D0.6V.
>>
>> Signed-off-by: Florian Vaussard <florian.vaussard@heig-vd.ch>
>> ---
>>   .../devicetree/bindings/leds/leds-ncp5623.txt      | 44 ++++++++++=
++++++++++++
>>   1 file changed, 44 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-ncp=
5623.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-ncp5623.txt
>> b/Documentation/devicetree/bindings/leds/leds-ncp5623.txt
>> new file mode 100644
>> index 0000000..0dc8345
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-ncp5623.txt
>> @@ -0,0 +1,44 @@
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
>> +  - onnn,led-iref-microamp: Current on the Iref pin in microampere
>=20
> I think that you don't need this property. Just provide the formula f=
or
> calculating led-max-microamp value, similarly as you're doing that in
> the commit message.
>=20

I am not completely sure to understand your suggestion. So at the end, =
I have to
compute the value of the register (let call it 'ILED') that I need to s=
end to
chip to configure the current source. The formula is:

ILED =3D 31 - 2400*Iref/led-max-microamp

I need two pieces of information that depends on the hardware setup; th=
e current
on the Iref pin (which is setup by a bias resistor Iref =3D 0.6V/Rbias)=
, and the
desired output current (usually limited due to the chosen LED or the re=
quired
brightness).

On the other hand, I could also simply ask people to put the right valu=
e of
'ILED' (between 0 - 31) directly in the device tree, but this is less u=
ser-friendly.

>> +  - led-max-microamp: Desired maximum current for each LED in micro=
ampere
>> +                      (maximum 30000uA)
>=20
> Please add instead of (maximum ...):
>=20
> Valid values: min - max, step by N (rounded {up|down})
>=20
> E.g.
>=20
> Valid values: 10000 - 30000, step by 1000 (rounded down)
>=20

This is unfortunately not a linear relationship,

led-max-microamp =3D 2400*Iref/(31-ILED)

thus steps are not constant. This can be seen on figure 5 (p.9) of the =
datasheet
[1].

Thanks for your review,
=46lorian

[1] http://www.onsemi.com/pub/Collateral/NCP5623-D.PDF

From: Ingi Kim <ingi2.kim@samsung.com>
Subject: Re: [PATCH v2 2/3] leds: ktd2692: add device tree bindings for ktd2692
Date: Wed, 18 Mar 2015 10:35:27 +0900
Message-ID: <5508D65F.7070301@samsung.com>
References: <1426581951-11869-1-git-send-email-ingi2.kim@samsung.com>
 <1426581951-11869-3-git-send-email-ingi2.kim@samsung.com>
 <5508AD61.1060005@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <5508AD61.1060005@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sakari.ailus@iki.fi, j.anaszewski@samsung.com, varkabhadram@gmail.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi

On 2015=EB=85=84 03=EC=9B=94 18=EC=9D=BC 07:40, Jaehoon Chung wrote:
> On 03/17/2015 05:45 PM, Ingi Kim wrote:
>> This patch adds the device tree bindings for ktd2692 flash LEDs.
>> Add optional properties 'flash-timeout-us' to control flash timeout
>> and 'vin-supply' for flash-led regulator
>>
>> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
>> ---
>>  .../devicetree/bindings/leds/leds-ktd2692.txt      | 37 +++++++++++=
+++++++++++
>>  1 file changed, 37 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-ktd2=
692.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-ktd2692.txt=
 b/Documentation/devicetree/bindings/leds/leds-ktd2692.txt
>> new file mode 100644
>> index 0000000..1b44225
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-ktd2692.txt
>> @@ -0,0 +1,37 @@
>> +* Kinetic Technologies - KTD2692 Flash LED Driver
>> +
>> +KTD2692 is the ideal power solution for high-power flash LEDs.
>> +It uses ExpressWire single-wire programming for maximum flexibility=
=2E
>> +
>> +The ExpressWire interface through CTRL pin can control LED on/off a=
nd
>> +enable/disable the IC, Movie/Flash mode current, Flash timeout,
>> +LVP(low voltage protection).
>> +
>> +Required properties:
>> +	- compatible: "kinetic,ktd2692"
>> +	- ctrl-gpio : gpio pin in order control ktd2692 flash led.
>> +		There is an internal 300kOhm pull-down resistor at this pin
>> +	- supply : "vin" LED supply
>> +
>> +Optional property:
>> +	- flash-timeout-us : Maximum flash timeout in microseconds.
>> +			flash timeout ranges from 0 to 1835000us and
>> +			default is 1049000us.
>> +
>> +Example:
>> +
>> +vbat: fixedregulator@0 {
>> +	compatible =3D "regulator-fixed";
>> +	regulator-name =3D "vbat-supply";
>> +	regulator-min-microvolt =3D <5000000>;
>> +	regulator-max-microvolt =3D <5000000>;
>> +	gpio =3D <>;
>=20
> gpio =3D <> ? What do you mean?
> And this is described at Documentation/devicetree/bindings/regulator/=
fixed-regulator.txt
> I'm not sure whether this example really needs.
>=20
> Best Regards,
> Jaehoon Chung
>=20

I just want to show that dummy regulator can be used with flash-led.
As you mentioned earlier, remove unnecessary example and add refer comm=
ent=20

Thanks,
Ingi Kim

>> +	regulator-always-on;
>> +};
>> +
>> +flash-led {
>> +	compatible =3D "kinetic,ktd2692";
>> +	ctrl-gpio =3D <&gpc0 1 0>;
>> +	flash-timeout-us =3D <1835000>;
>> +	vin-supply =3D <&vbat>;
>> +};
>>
>=20
>=20

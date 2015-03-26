From: Ingi Kim <ingi2.kim@samsung.com>
Subject: Re: [PATCH v4 2/3] leds: ktd2692: add device tree bindings for ktd2692
Date: Thu, 26 Mar 2015 10:43:04 +0900
Message-ID: <55136428.70603@samsung.com>
References: <1427247044-3748-1-git-send-email-ingi2.kim@samsung.com>
 <1427247044-3748-3-git-send-email-ingi2.kim@samsung.com>
 <55122C2B.6010603@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:23839 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750819AbbCZBnH (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 25 Mar 2015 21:43:07 -0400
In-reply-to: <55122C2B.6010603@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Varka Bhadram <varkabhadram@gmail.com>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sakari.ailus@iki.fi, j.anaszewski@samsung.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Varka,

Thanks for the review

On 2015=EB=85=84 03=EC=9B=94 25=EC=9D=BC 12:31, Varka Bhadram wrote:
> On 03/25/2015 07:00 AM, Ingi Kim wrote:
>> This patch adds the device tree bindings for ktd2692 flash LEDs.
>> Add optional properties 'flash-timeout-us' to control flash timeout
>> and 'vin-supply' for flash-led regulator
>>
>> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
>> ---
>>   .../devicetree/bindings/leds/leds-ktd2692.txt      | 33 ++++++++++=
++++++++++++
>>   1 file changed, 33 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-ktd=
2692.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-ktd2692.txt=
 b/Documentation/devicetree/bindings/leds/leds-ktd2692.txt
>> new file mode 100644
>> index 0000000..f78512f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-ktd2692.txt
>> @@ -0,0 +1,33 @@
>> +* Kinetic Technologies - KTD2692 Flash LED Driver
>> +
>> +KTD2692 is the ideal power solution for high-power flash LEDs.
>> +It uses ExpressWire single-wire programming for maximum flexibility=
=2E
>> +
>> +The ExpressWire interface through CTRL pin can control LED on/off a=
nd
>> +enable/disable the IC, Movie(max 1/3 of Flash current) / Flash mode=
 current,
>> +Flash timeout, LVP(low voltage protection).
>> +
>> +Also, When the AUX pin is pulled high while CTRL pin is high,
>> +LED current will be ramped up to the flash-mode current level.
>> +
>> +Required properties:
>> +    - compatible: "kinetic,ktd2692"
>> +    - ctrl-gpio, aux-gpio : gpio pins in order control ktd2692 flas=
h led.
>> +        There is an internal 300kOhm pull-down resistor at each pin
>> +    - vin-supply : "vin" LED supply (2.7V to 5.5V)
>> +        See Documentation/devicetree/bindings/regulator/regulator.t=
xt
>> +
>=20
> Above bindings are not that readable to me. Remove the tab spaces bef=
ore properties.
>=20

Isn't it clear?
OK, I'll fix it more

>> +Optional property:
>> +    - flash-timeout-us : Maximum flash timeout in microseconds.
>> +            flash timeout ranges from 0 to 1835000us and
>> +            default is 1049000us.
>> +
>> +Example:
>> +
>> +flash-led {
>> +    compatible =3D "kinetic,ktd2692";
>> +    ctrl-gpio =3D <&gpc0 1 0>;
>> +    aux-gpio =3D <&gpc0 2 0>;
>> +    flash-timeout-us =3D <1835000>;
>> +    vin-supply =3D <&vbat>;
>> +};
>=20
>=20

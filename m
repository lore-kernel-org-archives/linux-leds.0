From: Ingi Kim <ingi2.kim@samsung.com>
Subject: Re: [PATCH v7 2/3] leds: ktd2692: add device tree bindings for ktd2692
Date: Mon, 27 Apr 2015 15:32:58 +0900
Message-ID: <553DD81A.1030504@samsung.com>
References: <1429795085-22171-1-git-send-email-ingi2.kim@samsung.com>
 <1429795085-22171-3-git-send-email-ingi2.kim@samsung.com>
 <20150424152936.7e0b101a@ja.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:45117 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752397AbbD0GdA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 27 Apr 2015 02:33:00 -0400
In-reply-to: <20150424152936.7e0b101a@ja.home>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski81@gmail.com>
Cc: sakari.ailus@iki.fi, j.anaszewski@samsung.com, varkabhadram@gmail.com, joe@perches.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Jacek,

Thanks for the review.


On 2015=EB=85=84 04=EC=9B=94 24=EC=9D=BC 22:29, Jacek Anaszewski wrote:
> On Thu, 23 Apr 2015 22:18:04 +0900
> Hi Ingi,
>=20
> Ingi Kim <ingi2.kim@samsung.com> wrote:
>=20
>> This patch adds the device tree bindings for ktd2692 flash LEDs.
>> Add Optional properties of child node for Flash LED
>>
>> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
>> Acked-by: Seung-Woo Kim <sw0312.kim@samsung.com>
>> ---
>>  .../devicetree/bindings/leds/leds-ktd2692.txt      | 47
>> ++++++++++++++++++++++ 1 file changed, 47 insertions(+)
>>  create mode 100644
>> Documentation/devicetree/bindings/leds/leds-ktd2692.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-ktd2692.txt
>> b/Documentation/devicetree/bindings/leds/leds-ktd2692.txt new file
>> mode 100644 index 0000000..708f2d4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-ktd2692.txt
>> @@ -0,0 +1,47 @@
>> +* Kinetic Technologies - KTD2692 Flash LED Driver
>> +
>> +KTD2692 is the ideal power solution for high-power flash LEDs.
>> +It uses ExpressWire single-wire programming for maximum flexibility=
=2E
>> +
>> +The ExpressWire interface through CTRL pin can control LED on/off a=
nd
>> +enable/disable the IC, Movie(max 1/3 of Flash current) / Flash mode
>> current, +Flash timeout, LVP(low voltage protection).
>> +
>> +Also, When the AUX pin is pulled high while CTRL pin is high,
>> +LED current will be ramped up to the flash-mode current level.
>> +
>> +Required properties:
>> +- compatible: "kinetic,ktd2692"
>> +- ctrl-gpio : gpio pin in order control CTRL pin
>> +- aux-gpio : gpio pin in order control AUX pin
>> +
>> +Optional properties:
>> +- vin-supply : "vin" LED supply (2.7V to 5.5V)
>> +  See Documentation/devicetree/bindings/regulator/regulator.txt
>> +
>> +A discrete LED element connected to the device must be represented
>> by a child +node - see
>> Documentation/devicetree/bindings/leds/common.txt. +
>> +Required properties for flash LED child nodes:
>> +  See Documentation/devicetree/bindings/leds/common.txt
>> +- flash-max-microamp : Flash LED maximum current
>> +  Formula : I(mA) =3D 15000 / Rset
>> +- flash-max-timeout-us : Flash LED maximum timeout
>=20
> Patch [1] makes the led-max-microamp property mandatory for
> the LEDs with configurable current for non-flash modes.
>=20
> It hasn't been merged yet as we are waiting for ack from DT maintaine=
r.
>=20
>=20

Ok, I'll add it.

I saw discussion about introduction of new properties for Flash LED,
I also hope that patch[1] would be merged as soon as possible :)

>> +
>> +Optional properties for flash LED child nodes:
>> +- label : see Documentation/devicetree/bindings/leds/common.txt
>> +
>> +Example:
>> +
>> +ktd2692 {
>> +	compatible =3D "kinetic,ktd2692";
>> +	ctrl-gpio =3D <&gpc0 1 0>;
>> +	aux-gpio =3D <&gpc0 2 0>;
>> +	vin-supply =3D <&vbat>;
>> +
>> +	flash-led {
>> +		label =3D "ktd2692-flash";
>> +		flash-max-microamp =3D <1500000>;
>> +		flash-max-timeout-us =3D <1835000>;
>> +	};
>> +};
>=20
> [1] [PATCH v6] DT: leds: Improve description of flash LEDs related
> properties
>=20

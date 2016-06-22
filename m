From: Florian Vaussard <florian.vaussard@heig-vd.ch>
Subject: Re: [PATCH 1/2] leds: ncp5623: Add device tree binding documentation
Date: Wed, 22 Jun 2016 08:17:09 +0200
Message-ID: <029fbebf-1fae-06c1-5cdb-07fe256d5130@heig-vd.ch>
References: <1466494154-3786-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1466494154-3786-2-git-send-email-florian.vaussard@heig-vd.ch>
 <20160621215218.GA12971@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailcl2.heig-vd.ch ([193.134.216.183]:53078 "EHLO heig-vd.ch"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750847AbcFVGV4 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 22 Jun 2016 02:21:56 -0400
In-Reply-To: <20160621215218.GA12971@rob-hp-laptop>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Florian Vaussard <florian.vaussard@gmail.com>
Cc: devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Vaussard Florian <florian.vaussard@heig-vd.ch>

Hi Rob,

Le 21. 06. 16 =E0 23:52, Rob Herring a =E9crit :
> On Tue, Jun 21, 2016 at 09:29:13AM +0200, Florian Vaussard wrote:
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
>>  .../devicetree/bindings/leds/leds-ncp5623.txt      | 44 +++++++++++=
+++++++++++
>>  1 file changed, 44 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-ncp5=
623.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-ncp5623.txt=
 b/Documentation/devicetree/bindings/leds/leds-ncp5623.txt
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
>> +  - led-max-microamp: Desired maximum current for each LED in micro=
ampere
>> +                      (maximum 30000uA)
>> +
>> +LED sub-node properties:
>> +  - reg : LED channel number (0..2)
>> +  - For other LED properties see:
>> +      Documentation/devicetree/bindings/leds/common.txt
>> +
>> +Example:
>> +
>> +led1: ncp5623@38 {
>> +	#address-cells =3D <1>;
>> +	#size-cells =3D <0>;
>> +	compatible =3D "onnn,ncp5623";
>> +	reg =3D <0x38>;
>> +
>> +	led1_r@0 {
>=20
> Don't use underscores in node names.
>=20

Sorry for the mistake, I will fix.

Thanks for the review,
=46lorian

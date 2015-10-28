From: Ingi Kim <ingi2.kim@samsung.com>
Subject: Re: [PATCH v3 1/3] leds: rt5033: Add DT binding for RT5033
Date: Wed, 28 Oct 2015 12:48:52 +0900
Message-ID: <563045A4.1050504@samsung.com>
References: <1445579285-6866-1-git-send-email-ingi2.kim@samsung.com>
 <1445579285-6866-2-git-send-email-ingi2.kim@samsung.com>
 <562DFC47.6050904@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:53377 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751556AbbJ1Dsw (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 27 Oct 2015 23:48:52 -0400
In-reply-to: <562DFC47.6050904@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, lee.jones@linaro.org, rpurdie@rpsys.net, inki.dae@samsung.com, sw0312.kim@samsung.com, beomho.seo@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Jacek,

Oh, I see. I'll add.
Thanks for the review.

On 2015=EB=85=84 10=EC=9B=94 26=EC=9D=BC 19:11, Jacek Anaszewski wrote:
> Hi Ingi,
>=20
> On 10/23/2015 07:48 AM, Ingi Kim wrote:
>> This patch adds the device tree bindings for RT5033 flash LEDs.
>>
>> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> ---
>>   .../devicetree/bindings/leds/leds-rt5033.txt       | 38 ++++++++++=
++++++++++++
>>   1 file changed, 38 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-rt5=
033.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-rt5033.txt =
b/Documentation/devicetree/bindings/leds/leds-rt5033.txt
>> new file mode 100644
>> index 0000000..2ef7bdc
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-rt5033.txt
>> @@ -0,0 +1,38 @@
>> +* Richtek Technology Corporation - RT5033 Flash LED Driver
>> +
>> +The RT5033 Flash LED Circuit is designed for one or two LEDs drivin=
g
>=20
> These bindings don't say how to handle two LEDs case.
>=20
>> +for torch and strobe applications, it provides an I2C software comm=
and
>> +to trigger the torch and strobe operation.
>> +
>> +Required properties:
>> +- compatible : Must be "richtek,rt5033-led".
>> +
>> +A discrete LED element connected to the device must be represented =
by a child
>> +node - see Documentation/devicetree/bindings/leds/common.txt.
>> +
>> +Required properties of the LED child node:
>> +  See Documentation/devicetree/bindings/leds/common.txt
>> +- led-max-microamp : Minimum Threshold for Timer protection
>> +  is defined internally (Maximum 200mA).
>> +- flash-max-microamp : Flash LED maximum current
>> +- flash-max-timeout-us : Flash LED maximum timeout
>> +
>> +Optional properties of the LED child node:
>> +- label : see Documentation/devicetree/bindings/leds/common.txt
>> +
>> +Example:
>> +
>> +rt5033 {
>> +    compatible =3D "richtek,rt5033";
>> +
>> +    led {
>> +        compatible =3D "richtek,rt5033-led";
>> +
>> +        flash-led {
>> +            label =3D "rt5033-flash";
>> +            led-max-microamp =3D <200000>;
>> +            flash-max-microamp =3D <800000>;
>> +            flash-max-timeout-us =3D <1216000>;
>> +        };
>> +    };
>> +}
>>
>=20
>=20

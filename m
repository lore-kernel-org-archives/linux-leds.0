From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 1/2] leds: ncp5623: Add device tree binding documentation
Date: Wed, 22 Jun 2016 10:51:29 +0200
Message-ID: <576A5191.4070402@samsung.com>
References: <1466494154-3786-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1466494154-3786-2-git-send-email-florian.vaussard@heig-vd.ch>
 <57695D02.2000109@samsung.com>
 <59143a9b-ab51-bd3b-e9db-93680415d205@heig-vd.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:18597 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751604AbcFVIve (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 22 Jun 2016 04:51:34 -0400
In-reply-to: <59143a9b-ab51-bd3b-e9db-93680415d205@heig-vd.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Florian Vaussard <florian.vaussard@heig-vd.ch>
Cc: Florian Vaussard <florian.vaussard@gmail.com>, devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Florian,

On 06/22/2016 08:08 AM, Florian Vaussard wrote:
> Hi Jacek,
>
> Le 21. 06. 16 =E0 17:28, Jacek Anaszewski a =E9crit :
>> Hi Florian,
>>
>> Thanks for the patch. I have two remarks below.
>>
>> On 06/21/2016 09:29 AM, Florian Vaussard wrote:
>>> Add device tree binding documentation for On Semiconductor NCP5623 =
I2C
>>> LED driver. The driver can independently control the PWM of the 3
>>> channels with 32 levels of intensity.
>>>
>>> The current delivered by the current source can be controlled using=
 the
>>> led-max-microamp property. In order to control this value, it is al=
so
>>> necessary to know the current on the Iref pin, hence the
>>> onnn,led-iref-microamp property. It is usually set using an externa=
l
>>> bias resistor, following Iref =3D Vref/Rbias with Vref=3D0.6V.
>>>
>>> Signed-off-by: Florian Vaussard <florian.vaussard@heig-vd.ch>
>>> ---
>>>    .../devicetree/bindings/leds/leds-ncp5623.txt      | 44 ++++++++=
++++++++++++++
>>>    1 file changed, 44 insertions(+)
>>>    create mode 100644 Documentation/devicetree/bindings/leds/leds-n=
cp5623.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/leds-ncp5623.tx=
t
>>> b/Documentation/devicetree/bindings/leds/leds-ncp5623.txt
>>> new file mode 100644
>>> index 0000000..0dc8345
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/leds/leds-ncp5623.txt
>>> @@ -0,0 +1,44 @@
>>> +* ON Semiconductor - NCP5623 3-Channel LED Driver
>>> +
>>> +The NCP5623 is a 3-channel I2C LED driver. The brightness of each
>>> +channel can be independently set using 32 levels. Each LED is repr=
esented
>>> +as a sub-node of the device.
>>> +
>>> +Required properties:
>>> +  - compatible: Should be "onnn,ncp5623"
>>> +  - reg: I2C slave address (fixed to 0x38)
>>> +  - #address-cells: must be 1
>>> +  - #size-cells: must be 0
>>> +  - onnn,led-iref-microamp: Current on the Iref pin in microampere
>>
>> I think that you don't need this property. Just provide the formula =
for
>> calculating led-max-microamp value, similarly as you're doing that i=
n
>> the commit message.
>>
>
> I am not completely sure to understand your suggestion. So at the end=
, I have to
> compute the value of the register (let call it 'ILED') that I need to=
 send to
> chip to configure the current source. The formula is:
>
> ILED =3D 31 - 2400*Iref/led-max-microamp

led-max-microamp is the maximum current value for given LED.
According to the documentation it can be calculated as follows:

ILEDmax =3D Iref * 2400 / (31 - n)

Since this is global setting for all LEDs, then I'd always set n to 30,
and calculate max_brightness value for each LED separately, basing on
led-max-microamp property value. Effectively, I'm revoking my previous
statement about setting max_brightness to fixed level.

You can compare drivers/leds/leds-aat1290.c and its bindings, as it
uses similar approach.

>
> I need two pieces of information that depends on the hardware setup; =
the current
> on the Iref pin (which is setup by a bias resistor Iref =3D 0.6V/Rbia=
s), and the
> desired output current (usually limited due to the chosen LED or the =
required
> brightness).
>
> On the other hand, I could also simply ask people to put the right va=
lue of
> 'ILED' (between 0 - 31) directly in the device tree, but this is less=
 user-friendly.
>
>>> +  - led-max-microamp: Desired maximum current for each LED in micr=
oampere
>>> +                      (maximum 30000uA)
>>
>> Please add instead of (maximum ...):
>>
>> Valid values: min - max, step by N (rounded {up|down})
>>
>> E.g.
>>
>> Valid values: 10000 - 30000, step by 1000 (rounded down)
>>
>
> This is unfortunately not a linear relationship,

OK, please define only max and min value then.

> led-max-microamp =3D 2400*Iref/(31-ILED)
>
> thus steps are not constant. This can be seen on figure 5 (p.9) of th=
e datasheet
> [1].
>
> Thanks for your review,
> Florian
>
> [1] http://www.onsemi.com/pub/Collateral/NCP5623-D.PDF
>
>


--=20
Best regards,
Jacek Anaszewski

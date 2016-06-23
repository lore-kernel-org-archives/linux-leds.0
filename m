From: Florian Vaussard <florian.vaussard@heig-vd.ch>
Subject: Re: [PATCH 1/2] leds: ncp5623: Add device tree binding documentation
Date: Thu, 23 Jun 2016 14:01:25 +0200
Message-ID: <576BCF95.4010508@heig-vd.ch>
References: <1466494154-3786-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1466494154-3786-2-git-send-email-florian.vaussard@heig-vd.ch>
 <57695D02.2000109@samsung.com>
 <59143a9b-ab51-bd3b-e9db-93680415d205@heig-vd.ch>
 <576A5191.4070402@samsung.com>
 <c97adf5a-7c5b-8602-83c1-f85854bd64d6@heig-vd.ch>
 <576B8E5D.90000@samsung.com> <576B9EB1.5040601@heig-vd.ch>
 <576BC63D.1030504@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailcl0.heig-vd.ch ([193.134.216.181]:38196 "EHLO heig-vd.ch"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751808AbcFWMBc (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 23 Jun 2016 08:01:32 -0400
In-Reply-To: <576BC63D.1030504@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Florian Vaussard <florian.vaussard@gmail.com>, devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org



On 06/23/2016 01:21 PM, Jacek Anaszewski wrote:
> On 06/23/2016 10:32 AM, Florian Vaussard wrote:
>> Hi Jacek,
>>
>> On 06/23/2016 09:23 AM, Jacek Anaszewski wrote:
>>> On 06/22/2016 04:25 PM, Florian Vaussard wrote:
>>>> Hi Jacek,
>>>>
>>>> Le 22. 06. 16 =E0 10:51, Jacek Anaszewski a =E9crit :
>>>>> Hi Florian,
>>>>>
>>>>> On 06/22/2016 08:08 AM, Florian Vaussard wrote:
>>>>>> Hi Jacek,
>>>>>>
>>>>>> Le 21. 06. 16 =E0 17:28, Jacek Anaszewski a =E9crit :
>>>>>>> Hi Florian,
>>>>>>>
>>>>>>> Thanks for the patch. I have two remarks below.
>>>>>>>
>>>>>>> On 06/21/2016 09:29 AM, Florian Vaussard wrote:
>>>>>>>> Add device tree binding documentation for On Semiconductor NCP=
5623 I2C
>>>>>>>> LED driver. The driver can independently control the PWM of th=
e 3
>>>>>>>> channels with 32 levels of intensity.
>>>>>>>>
>>>>>>>> The current delivered by the current source can be controlled =
using the
>>>>>>>> led-max-microamp property. In order to control this value, it =
is also
>>>>>>>> necessary to know the current on the Iref pin, hence the
>>>>>>>> onnn,led-iref-microamp property. It is usually set using an ex=
ternal
>>>>>>>> bias resistor, following Iref =3D Vref/Rbias with Vref=3D0.6V.
>>>>>>>>
>>>>>>>> Signed-off-by: Florian Vaussard <florian.vaussard@heig-vd.ch>
>>>>>>>> ---
>>>>>>>>      .../devicetree/bindings/leds/leds-ncp5623.txt      | 44
>>>>>>>> ++++++++++++++++++++++
>>>>>>>>      1 file changed, 44 insertions(+)
>>>>>>>>      create mode 100644
>>>>>>>> Documentation/devicetree/bindings/leds/leds-ncp5623.txt
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/leds/leds-ncp56=
23.txt
>>>>>>>> b/Documentation/devicetree/bindings/leds/leds-ncp5623.txt
>>>>>>>> new file mode 100644
>>>>>>>> index 0000000..0dc8345
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/Documentation/devicetree/bindings/leds/leds-ncp5623.txt
>>>>>>>> @@ -0,0 +1,44 @@
>>>>>>>> +* ON Semiconductor - NCP5623 3-Channel LED Driver
>>>>>>>> +
>>>>>>>> +The NCP5623 is a 3-channel I2C LED driver. The brightness of =
each
>>>>>>>> +channel can be independently set using 32 levels. Each LED is=
 represented
>>>>>>>> +as a sub-node of the device.
>>>>>>>> +
>>>>>>>> +Required properties:
>>>>>>>> +  - compatible: Should be "onnn,ncp5623"
>>>>>>>> +  - reg: I2C slave address (fixed to 0x38)
>>>>>>>> +  - #address-cells: must be 1
>>>>>>>> +  - #size-cells: must be 0
>>>>>>>> +  - onnn,led-iref-microamp: Current on the Iref pin in microa=
mpere
>>>>>>>
>>>>>>> I think that you don't need this property. Just provide the for=
mula for
>>>>>>> calculating led-max-microamp value, similarly as you're doing t=
hat in
>>>>>>> the commit message.
>>>>>>>
>>>>>>
>>>>>> I am not completely sure to understand your suggestion. So at th=
e end, I
>>>>>> have to
>>>>>> compute the value of the register (let call it 'ILED') that I ne=
ed to send to
>>>>>> chip to configure the current source. The formula is:
>>>>>>
>>>>>> ILED =3D 31 - 2400*Iref/led-max-microamp
>>>>>
>>>>> led-max-microamp is the maximum current value for given LED.
>>>>> According to the documentation it can be calculated as follows:
>>>>>
>>>>> ILEDmax =3D Iref * 2400 / (31 - n)
>>>>>
>>>>> Since this is global setting for all LEDs, then I'd always set n =
to 30,
>>>>> and calculate max_brightness value for each LED separately, basin=
g on
>>>>> led-max-microamp property value. Effectively, I'm revoking my pre=
vious
>>>>> statement about setting max_brightness to fixed level.
>>>>>
>>>>
>>>> Ok your proposal simplifies a bit the handling. Thus ILEDmax of th=
e current
>>>> source would be always equal to Iref * 2400 and we use the PWM to =
limit the
>>>> current inside the LED. The only downside of this approach is a re=
duced number
>>>> of possible PWM steps, thus a limited number of RGB colors.
>>>
>>> Yes, but by max_brightness being always 31, lowering led-max-microa=
mp
>>> results in decreasing the amount of current per brightness level.
>>> Effectively, a human ability to notice perceived brightness level
>>> change also decreases then.
>>>
>>> In the approach I proposed this limitation is reflected in reduced
>>> amount of available brightness levels.
>>>
>>>> Regarding the DT binding, this would mean something like this:
>>>>
>>>> ncp5623@38 {
>>>>      #address-cells =3D <1>;
>>>>      #size-cells =3D <0>;
>>>>      compatible =3D "onnn,ncp5623";
>>>>      reg =3D <0x38>;
>>>>      led-max-microamp =3D <30000>;
>>>
>>> Please drop it from here. It doesn't need to be configurable.
>>> You can hard code this in the driver.
>>>
>>
>> It is not user configurable, but it is a hardware configuration impo=
sed by the
>> bias resistor on the Iref pin (ILEDmax =3D 2400*Iref =3D 2400*0.6V/R=
bias). So I
>> cannot hard code it as it can change from one design to another. And=
 I need this
>> piece of information to compute the maximum allowable PWM ratio.
>=20
> OK, please keep here the property you initially introduced for that:
>=20
> onnn,led-iref-microamp
>=20

Ok.

>>
>>>>
>>>>      ledr@0 {
>>>>          label =3D "ncp:power:red";
>>>>          reg =3D <0>;
>>>>          linux,default-trigger =3D "default-on";
>>>>          led-max-microamp =3D <5000>;
>>>
>>> Is 5mA the maximum allowed current value for the LEDs on the board
>>> you're using? Is brightness level change easily noticeable by max
>>> current set to 5mA and max_brightness set to 31? It would be good
>>> to empirically check this configuration.
>>>
>>
>> No the maximum is 20mA on our board, but limiting to 5mA is safer to=
 avoid
>> blinding the user :) This RGB led is quite powerful...
>>
>> Some experiments:
>> 1) When setting the current source at 5mA, the PWM steps are easily =
noticeable
>> at low brightness (below 50%). Above the eye is not sensitive enough=
=2E Thus on
>> the 32768 possible colours, I agree that not all will be distinguish=
able.
>> 2) When setting the current source at 20mA, the PWM steps are even m=
ore visible
>> at low brightness. As I have to keep the PWM ratio below 25% to sati=
sfy the 5mA
>> limit, all the 7 steps (brightness =3D [0; 7]) are clearly noticeabl=
e. This also
>> means only 512 different colours. For sure in this case they are all
>> distinguishable :)
>>
>> With your proposal, the hardware fix is probably to decrease Iref by=
 increasing
>> the bias resistor. This way the PWM steps would be smaller and less =
noticeable.
>> But a hardware fix is not always possible.
>=20
> It would be nice to have all 31 levels available per LED, but is it
> feasible having that ILED register is global for all LEDs? It seems t=
hat
> we couldn't set different maximum current for each LED then.
> Am I right or I am missing something?
>=20

If led-max-microamp is different for each LED, we can select the highes=
t one and
use it to compute the ILED register. Then we limit the PWM ratio for th=
e LEDs
that have a lowest led-max-microamp. I guess that this is the best comp=
romise.

Regards,
=46lorian

>>>>      };
>>>>
>>>>      ledb@1 {
>>>>          label =3D "ncp:power:blue";
>>>>          reg =3D <1>;
>>>>          led-max-microamp =3D <5000>;
>>>>      };
>>>>
>>>>      ledg@2 {
>>>>          label =3D "ncp:power:green";
>>>>          reg =3D <2>;
>>>>          led-max-microamp =3D <5000>;
>>>>      };
>>>> };
>>>>
>>>> The led-max-microamp property of the root node is used to infer Ir=
ef, and the
>>>> led-max-microamp property inside each LED node is used to compute =
the maximum
>>>> allowed PWM ratio (thus max_brightness).
>>>>
>>>> Would it be fine like this?
>>>>
>>>>> You can compare drivers/leds/leds-aat1290.c and its bindings, as =
it
>>>>> uses similar approach.
>>>>>
>>>>
>>>> Thanks for the pointer, interesting reading. In this case the
>>>> flash-max-microamp
>>>> property is implicitly used to get the value of Rset, and led-max-=
microamp is
>>>> used to compute the flash/movie-mode ratio. Indeed similar but not=
 exactly the
>>>> same, as the NCP5623 allows a finer control on the current using o=
ne
>>>> register to
>>>> configure the current source and one register for the PWM.
>>>
>>> Right, but it shows how led-max-microamp can be used to infer
>>> max_brightness level. This is quite new DT property with not too ma=
ny
>>> users, because previously LED class drivers had been defining
>>> max_brightness directly in a Device Tree. Nonetheless brightness le=
vel
>>> was eventually considered not suitable unit for describing hardware
>>> property.
>>>
>>
>>
>=20
>=20

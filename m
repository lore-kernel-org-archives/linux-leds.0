From: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/2] leds: ncp5623: Add device tree binding documentation
Date: Thu, 23 Jun 2016 09:23:09 +0200
Message-ID: <576B8E5D.90000@samsung.com>
References: <1466494154-3786-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1466494154-3786-2-git-send-email-florian.vaussard@heig-vd.ch>
 <57695D02.2000109@samsung.com>
 <59143a9b-ab51-bd3b-e9db-93680415d205@heig-vd.ch>
 <576A5191.4070402@samsung.com>
 <c97adf5a-7c5b-8602-83c1-f85854bd64d6@heig-vd.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <c97adf5a-7c5b-8602-83c1-f85854bd64d6-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
Cc: Florian Vaussard <florian.vaussard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On 06/22/2016 04:25 PM, Florian Vaussard wrote:
> Hi Jacek,
>
> Le 22. 06. 16 =E0 10:51, Jacek Anaszewski a =E9crit :
>> Hi Florian,
>>
>> On 06/22/2016 08:08 AM, Florian Vaussard wrote:
>>> Hi Jacek,
>>>
>>> Le 21. 06. 16 =E0 17:28, Jacek Anaszewski a =E9crit :
>>>> Hi Florian,
>>>>
>>>> Thanks for the patch. I have two remarks below.
>>>>
>>>> On 06/21/2016 09:29 AM, Florian Vaussard wrote:
>>>>> Add device tree binding documentation for On Semiconductor NCP562=
3 I2C
>>>>> LED driver. The driver can independently control the PWM of the 3
>>>>> channels with 32 levels of intensity.
>>>>>
>>>>> The current delivered by the current source can be controlled usi=
ng the
>>>>> led-max-microamp property. In order to control this value, it is =
also
>>>>> necessary to know the current on the Iref pin, hence the
>>>>> onnn,led-iref-microamp property. It is usually set using an exter=
nal
>>>>> bias resistor, following Iref =3D Vref/Rbias with Vref=3D0.6V.
>>>>>
>>>>> Signed-off-by: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
>>>>> ---
>>>>>     .../devicetree/bindings/leds/leds-ncp5623.txt      | 44
>>>>> ++++++++++++++++++++++
>>>>>     1 file changed, 44 insertions(+)
>>>>>     create mode 100644 Documentation/devicetree/bindings/leds/led=
s-ncp5623.txt
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/leds/leds-ncp5623.=
txt
>>>>> b/Documentation/devicetree/bindings/leds/leds-ncp5623.txt
>>>>> new file mode 100644
>>>>> index 0000000..0dc8345
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/leds/leds-ncp5623.txt
>>>>> @@ -0,0 +1,44 @@
>>>>> +* ON Semiconductor - NCP5623 3-Channel LED Driver
>>>>> +
>>>>> +The NCP5623 is a 3-channel I2C LED driver. The brightness of eac=
h
>>>>> +channel can be independently set using 32 levels. Each LED is re=
presented
>>>>> +as a sub-node of the device.
>>>>> +
>>>>> +Required properties:
>>>>> +  - compatible: Should be "onnn,ncp5623"
>>>>> +  - reg: I2C slave address (fixed to 0x38)
>>>>> +  - #address-cells: must be 1
>>>>> +  - #size-cells: must be 0
>>>>> +  - onnn,led-iref-microamp: Current on the Iref pin in microampe=
re
>>>>
>>>> I think that you don't need this property. Just provide the formul=
a for
>>>> calculating led-max-microamp value, similarly as you're doing that=
 in
>>>> the commit message.
>>>>
>>>
>>> I am not completely sure to understand your suggestion. So at the e=
nd, I have to
>>> compute the value of the register (let call it 'ILED') that I need =
to send to
>>> chip to configure the current source. The formula is:
>>>
>>> ILED =3D 31 - 2400*Iref/led-max-microamp
>>
>> led-max-microamp is the maximum current value for given LED.
>> According to the documentation it can be calculated as follows:
>>
>> ILEDmax =3D Iref * 2400 / (31 - n)
>>
>> Since this is global setting for all LEDs, then I'd always set n to =
30,
>> and calculate max_brightness value for each LED separately, basing o=
n
>> led-max-microamp property value. Effectively, I'm revoking my previo=
us
>> statement about setting max_brightness to fixed level.
>>
>
> Ok your proposal simplifies a bit the handling. Thus ILEDmax of the c=
urrent
> source would be always equal to Iref * 2400 and we use the PWM to lim=
it the
> current inside the LED. The only downside of this approach is a reduc=
ed number
> of possible PWM steps, thus a limited number of RGB colors.

Yes, but by max_brightness being always 31, lowering led-max-microamp
results in decreasing the amount of current per brightness level.
Effectively, a human ability to notice perceived brightness level
change also decreases then.

In the approach I proposed this limitation is reflected in reduced
amount of available brightness levels.

> Regarding the DT binding, this would mean something like this:
>
> ncp5623@38 {
> 	#address-cells =3D <1>;
> 	#size-cells =3D <0>;
> 	compatible =3D "onnn,ncp5623";
> 	reg =3D <0x38>;
> 	led-max-microamp =3D <30000>;

Please drop it from here. It doesn't need to be configurable.
You can hard code this in the driver.

>
> 	ledr@0 {
> 		label =3D "ncp:power:red";
> 		reg =3D <0>;
> 		linux,default-trigger =3D "default-on";
> 		led-max-microamp =3D <5000>;

Is 5mA the maximum allowed current value for the LEDs on the board
you're using? Is brightness level change easily noticeable by max
current set to 5mA and max_brightness set to 31? It would be good
to empirically check this configuration.

> 	};
>
> 	ledb@1 {
> 		label =3D "ncp:power:blue";
> 		reg =3D <1>;
> 		led-max-microamp =3D <5000>;
> 	};
>
> 	ledg@2 {
> 		label =3D "ncp:power:green";
> 		reg =3D <2>;
> 		led-max-microamp =3D <5000>;
> 	};
> };
>
> The led-max-microamp property of the root node is used to infer Iref,=
 and the
> led-max-microamp property inside each LED node is used to compute the=
 maximum
> allowed PWM ratio (thus max_brightness).
>
> Would it be fine like this?
>
>> You can compare drivers/leds/leds-aat1290.c and its bindings, as it
>> uses similar approach.
>>
>
> Thanks for the pointer, interesting reading. In this case the flash-m=
ax-microamp
> property is implicitly used to get the value of Rset, and led-max-mic=
roamp is
> used to compute the flash/movie-mode ratio. Indeed similar but not ex=
actly the
> same, as the NCP5623 allows a finer control on the current using one =
register to
> configure the current source and one register for the PWM.

Right, but it shows how led-max-microamp can be used to infer
max_brightness level. This is quite new DT property with not too many
users, because previously LED class drivers had been defining
max_brightness directly in a Device Tree. Nonetheless brightness level
was eventually considered not suitable unit for describing hardware
property.

--=20
Best regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

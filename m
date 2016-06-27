From: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
Subject: Re: [PATCH v2 1/2] leds: ncp5623: Add device tree binding
 documentation
Date: Mon, 27 Jun 2016 10:59:22 +0200
Message-ID: <a209d1e5-7996-c603-f18d-c0005d254d92@heig-vd.ch>
References: <1467010990-28070-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1467010990-28070-2-git-send-email-florian.vaussard@heig-vd.ch>
 <5770DF98.7010900@samsung.com>
 <4125a334-2e15-285d-2721-c007b30ed65d@heig-vd.ch>
 <5770E4EB.4040609@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5770E4EB.4040609-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Florian Vaussard <florian.vaussard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vaussard Florian <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org



Le 27. 06. 16 =E0 10:33, Jacek Anaszewski a =E9crit :
> On 06/27/2016 10:30 AM, Florian Vaussard wrote:
>> Hi Jacek,
>>
>> Le 27. 06. 16 =E0 10:11, Jacek Anaszewski a =E9crit :
>>> Hi Florian,
>>>
>>> On 06/27/2016 09:03 AM, Florian Vaussard wrote:
>>>> Add device tree binding documentation for On Semiconductor NCP5623=
 I2C
>>>> LED driver. The driver can independently control the PWM of the 3
>>>> channels with 32 levels of intensity.
>>>>
>>>> The current delivered by the current source can also be controlled=
=2E To
>>>> do so, the led-max-microamp property is used by each LED sub-node.=
 The
>>>> maximum value is then found and used as a limit to compute the fin=
al
>>>> intensity of the current source. If a LED happens to have a lower =
limit,
>>>> the PWM is then used to limit the current to the requested value.
>>>>
>>>> In order to control the current source, it is also necessary to kn=
ow
>>>> the current on the Iref pin, hence the onnn,led-iref-microamp prop=
erty.
>>>> It is usually set using an external bias resistor, following
>>>> Iref =3D Vref/Rbias with Vref=3D0.6V.
>>>>
>>>> Signed-off-by: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
>>>> ---
>>>>    .../devicetree/bindings/leds/leds-ncp5623.txt      | 60
>>>> ++++++++++++++++++++++
>>>>    1 file changed, 60 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/leds/leds-=
ncp5623.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/leds/leds-ncp5623.t=
xt
>>>> b/Documentation/devicetree/bindings/leds/leds-ncp5623.txt
>>>> new file mode 100644
>>>> index 0000000..77dd7ad
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/leds/leds-ncp5623.txt
>>>> @@ -0,0 +1,60 @@
>>>> +* ON Semiconductor - NCP5623 3-Channel LED Driver
>>>> +
>>>> +The NCP5623 is a 3-channel I2C LED driver. The brightness of each
>>>> +channel can be independently set using 32 levels. Each LED is rep=
resented
>>>> +as a sub-node of the device.
>>>> +
>>>> +Required properties:
>>>> +  - compatible: Should be "onnn,ncp5623"
>>>> +  - reg: I2C slave address (fixed to 0x38)
>>>> +  - #address-cells: must be 1
>>>> +  - #size-cells: must be 0
>>>> +  - onnn,led-iref-microamp: Current on the Iref pin in microamper=
e. It depends
>>>> +    on the value of the external bias resistor Rbias, following
>>>> +    Iref =3D Vref / Rbias with Vref =3D 0.6V. This is used to set=
 the intensity of
>>>> +    the current that can be provided by the internal current sour=
ce, based on
>>>> +    the maximum current permitted by LED sub-nodes (see below), b=
ut no more
>>>> than
>>>> +    Imax =3D 2400 * Iref.
>>>> +
>>>> +LED sub-nodes
>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> +
>>>> +Required properties:
>>>> +  - reg : LED channel number (0..2)
>>>> +  - led-max-microamp: Maximum allowable current inside the LED in=
 microampere.
>>>> +    This property is used to limit the PWM ratio, based on the in=
tensity of
>>>> the
>>>> +    internal current source (see above).
>>>> +
>>>> +Optional properties:
>>>> +  - label: Used for naming LEDs
>>>
>>> Instead of the above description use same reference to common led
>>> bindings as below.
>>>
>>
>> Ok.
>>
>> BTW I saw the thread about the "default-state" property on the DT li=
st and
>> realized that it was not implemented in my driver. I wonder if stand=
ard LED
>> properties (with label and default-trigger) should not be parsed by =
LED core
>> (i.e. using a helper function) to avoid such mistake. This could als=
o remove
>> some boilerplate code in other LED drivers.
>=20
> Yes, generic DT parser is a nice-to-have feature for the LED subsyste=
m.
> Would you like to implement it?
>=20

Sure, if it can be useful. I will have a look in the coming days.

Best,
=46lorian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

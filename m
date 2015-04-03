From: Jonas Gorski <jogo@openwrt.org>
Subject: Re: [PATCH 1/2] leds: add DT binding for BCM6328 LED controller
Date: Fri, 03 Apr 2015 16:46:46 +0200
Message-ID: <551EA7D6.8000303@openwrt.org>
References: <1427975661-29964-1-git-send-email-noltari@gmail.com> <1427975661-29964-2-git-send-email-noltari@gmail.com> <551DF5A6.1080100@gmail.com> <BD608F74-CA1D-4871-91E3-758216919834@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from arrakis.dune.hu ([78.24.191.176]:34472 "EHLO arrakis.dune.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753026AbbDCOqp (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 3 Apr 2015 10:46:45 -0400
In-Reply-To: <BD608F74-CA1D-4871-91E3-758216919834@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "cooloney@gmail.com" <cooloney@gmail.com>, "cernekee@gmail.com" <cernekee@gmail.com>

On 03.04.2015 14:19, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
>=20
>> El 3/4/2015, a las 4:06, Florian Fainelli <f.fainelli@gmail.com> esc=
ribi=C3=B3:
>>
>>> On 02/04/15 04:54, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
>>> This adds device tree binding documentation for the Broadcom BCM632=
8 LED
>>> controller.
>>
>> Looks pretty good to me, few comments below:
>>
>>>
>>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>>> Signed-off-by: Jonas Gorski <jogo@openwrt.org>
>>> ---
>>> .../devicetree/bindings/leds/leds-bcm6328.txt      | 173 ++++++++++=
+++++++++++
>>> 1 file changed, 173 insertions(+)
>>> create mode 100644 Documentation/devicetree/bindings/leds/leds-bcm6=
328.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/leds-bcm6328.tx=
t b/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
>>> new file mode 100644
>>> index 0000000..e63d27f
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
>>> @@ -0,0 +1,173 @@
>>> +LEDs connected to Broadcom BCM6328 controller
>>> +
>>> +Required properties:
>>> +- compatible : should be : "brcm,bcm6328-leds".
>>
>> Something like "brcm,bcm6328-leds-ctrl" might be a bit more descript=
ive.
>=20
> Yeah you're right, bcm6328-leds-ctrl is better.
>=20
>>
>>> +- #address-cells: must be 1
>>> +- #size-cells: must be 0
>>> +- reg: BCM6328 LED controller address and size.
>>> +
>>> +Optional properties:
>>> +- brcm,serial-leds: enable Serial LEDs.
>>> +
>>> +Each led is represented as a sub-node of the brcm,bcm6328-leds dev=
ice.
>>> +
>>> +LED sub-node properties:
>>> +- reg : LED pin number (could be from 0 to 23).

I think this should be a bit more strict: "Only leds 0 to 23 are valid"=
=2E

>>> +- compatible : should be : "brcm,bcm6328-led".
>>
>> Do we really need to strongly type the LED child nodes here with a
>> compatible string? It is somewhat implicit that if your parent is
>> "brcm,bcm6328-leds", the child nodes are of the same "type"?
>=20
> This is just a sanity check inherited from other LED controllers, but=
 I can remove it. In fact I prefer it, because adding compatible string=
s on each subnode can be a bit annoying, specially if there are a lot o=
f LEDs.

Well, you might have/want other subnodes like pinctrl configurations.
But since we have a reg-property, the existence of it is probably enoug=
h
to tell it apart from non-led-configuration nodes.

>=20
>>
>>> +
>>> +Normal LED:
>>> +- label (optional) : see Documentation/devicetree/bindings/leds/co=
mmon.txt
>>> +- active-low (optional) : LED is active low.
>>
>> If it is an optional property, you would want to clarify that active
>> high is the default.
>=20
> Ok, I will.
>=20
>>
>>> +- default-state (optional): see
>>> +  Documentation/devicetree/bindings/leds/leds-gpio.txt
>>> +- linux,default-trigger (optional): see
>>> +  Documentation/devicetree/bindings/leds/common.txt
>>> +
>>> +Hardware controlled LED:
>>> +- brcm,hardware-controlled (optional) : LED is hardware controlled=
=2E
>>
>> The type of this property is not strictly defined, but it would appe=
ar
>> to be a boolean. Reading through the driver though, it looks like th=
e
>> number of LEDs "hardware" controlled should be something customizabl=
e at
>> some point.
>=20
> Actually the number of hardware controlled LEDs depends on each SoC, =
but it can also depend on the specific board. There's a 32 bit register=
 (HWDIS) which controls which LEDs are hardware controlled.

Actually this bit toggles whether the led should be controlled by the
appropriate hardware signal, or may be controlled by software through
the appropriate registers. You can enable it for all leds, but only a
subset is actually wired to an actual function.

The hardware signals aren't consecutive. E.g. on BCM6362 0 is the USB
led, 1 is the "internet" led, and 4 to 7 are the ephy leds. 2 or 3 do
not have a defined function, at least in the public sources. BCM6328 ha=
s
its ephy activity leds at 17~20, etc.

So it's technically a configuration value, but allowing this to be
changed seems quite a challenge from the current linux led apis. AFAICT
triggers have no way of only working on certain led controllers, and le=
d
controllers have no way of knowing that a led is controlled by a certai=
n
trigger.

Which functions maps to which led is probably something better describe=
d
in header files or default led-nodes in the dtsi files.

>>> +- brcm,link-selection (optional) : LED link selection values.
>>
>> Here you should specify exactly which values are accepted, if this i=
s a
>> value that is directly mapping to a hardware register value, we migh=
t
>> want to create a header file for that.
>=20
> The problem of this is that it depends on each SoC but also on each b=
oard, since this controls which LED from LEDs 0-7 is controlled by each=
 ethernet activity and speed "event". For example, Jonas managed to set=
 a specific LED to be controlled by every ethernet port on the board, s=
o there may be boards in which Ethernet ports may not be directly assig=
ned to the Ethernet LEDs, but swapped (it's not the most likely situtat=
ion, but since there isn't much documentation from Broadcom available i=
t seems sensible to me to offer that configuration posibility).

A potential use case for using more than one source for a led is if you
have only one "lan" led and want to mux all four phy activity/link
signals onto it.

A better name and description might be

- brcm,link-signal-sources (optional): An array of hardware link
  signal sources. Up to four link hardware signals can get muxed into
  this leds. Only valid for leds 0 to 7, where led signals 0 to 3 may
  be muxed to leds 0 to 3, and signals 4 to 7 may be muxed to leds
  4 to 7. A signal can be muxed to more than one led, and one led can
  have more than one source signal.

>=20
>>
>>> +- brcm,activity-selection (optional) : LED activity selection valu=
es.
>>
>> Ditto.

And this one called "brcm,activity-signal-sources".


Regards
Jonas

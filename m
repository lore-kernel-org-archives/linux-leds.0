From: =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
Subject: Re: [PATCH 1/2] leds: add DT binding for BCM6328 LED controller
Date: Fri, 3 Apr 2015 14:19:36 +0200
Message-ID: <BD608F74-CA1D-4871-91E3-758216919834@gmail.com>
References: <1427975661-29964-1-git-send-email-noltari@gmail.com> <1427975661-29964-2-git-send-email-noltari@gmail.com> <551DF5A6.1080100@gmail.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:37685 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752723AbbDCMUV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 3 Apr 2015 08:20:21 -0400
Received: by wiaa2 with SMTP id a2so138080908wia.0
        for <linux-leds@vger.kernel.org>; Fri, 03 Apr 2015 05:20:19 -0700 (PDT)
In-Reply-To: <551DF5A6.1080100@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "cooloney@gmail.com" <cooloney@gmail.com>, "jogo@openwrt.org" <jogo@openwrt.org>, "cernekee@gmail.com" <cernekee@gmail.com>


> El 3/4/2015, a las 4:06, Florian Fainelli <f.fainelli@gmail.com> escr=
ibi=C3=B3:
>=20
>> On 02/04/15 04:54, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
>> This adds device tree binding documentation for the Broadcom BCM6328=
 LED
>> controller.
>=20
> Looks pretty good to me, few comments below:
>=20
>>=20
>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>> Signed-off-by: Jonas Gorski <jogo@openwrt.org>
>> ---
>> .../devicetree/bindings/leds/leds-bcm6328.txt      | 173 +++++++++++=
++++++++++
>> 1 file changed, 173 insertions(+)
>> create mode 100644 Documentation/devicetree/bindings/leds/leds-bcm63=
28.txt
>>=20
>> diff --git a/Documentation/devicetree/bindings/leds/leds-bcm6328.txt=
 b/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
>> new file mode 100644
>> index 0000000..e63d27f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
>> @@ -0,0 +1,173 @@
>> +LEDs connected to Broadcom BCM6328 controller
>> +
>> +Required properties:
>> +- compatible : should be : "brcm,bcm6328-leds".
>=20
> Something like "brcm,bcm6328-leds-ctrl" might be a bit more descripti=
ve.

Yeah you're right, bcm6328-leds-ctrl is better.

>=20
>> +- #address-cells: must be 1
>> +- #size-cells: must be 0
>> +- reg: BCM6328 LED controller address and size.
>> +
>> +Optional properties:
>> +- brcm,serial-leds: enable Serial LEDs.
>> +
>> +Each led is represented as a sub-node of the brcm,bcm6328-leds devi=
ce.
>> +
>> +LED sub-node properties:
>> +- reg : LED pin number (could be from 0 to 23).
>> +- compatible : should be : "brcm,bcm6328-led".
>=20
> Do we really need to strongly type the LED child nodes here with a
> compatible string? It is somewhat implicit that if your parent is
> "brcm,bcm6328-leds", the child nodes are of the same "type"?

This is just a sanity check inherited from other LED controllers, but I=
 can remove it. In fact I prefer it, because adding compatible strings =
on each subnode can be a bit annoying, specially if there are a lot of =
LEDs.

>=20
>> +
>> +Normal LED:
>> +- label (optional) : see Documentation/devicetree/bindings/leds/com=
mon.txt
>> +- active-low (optional) : LED is active low.
>=20
> If it is an optional property, you would want to clarify that active
> high is the default.

Ok, I will.

>=20
>> +- default-state (optional): see
>> +  Documentation/devicetree/bindings/leds/leds-gpio.txt
>> +- linux,default-trigger (optional): see
>> +  Documentation/devicetree/bindings/leds/common.txt
>> +
>> +Hardware controlled LED:
>> +- brcm,hardware-controlled (optional) : LED is hardware controlled.
>=20
> The type of this property is not strictly defined, but it would appea=
r
> to be a boolean. Reading through the driver though, it looks like the
> number of LEDs "hardware" controlled should be something customizable=
 at
> some point.

Actually the number of hardware controlled LEDs depends on each SoC, bu=
t it can also depend on the specific board. There's a 32 bit register (=
HWDIS) which controls which LEDs are hardware controlled.

>=20
>> +- brcm,link-selection (optional) : LED link selection values.
>=20
> Here you should specify exactly which values are accepted, if this is=
 a
> value that is directly mapping to a hardware register value, we might
> want to create a header file for that.

The problem of this is that it depends on each SoC but also on each boa=
rd, since this controls which LED from LEDs 0-7 is controlled by each e=
thernet activity and speed "event". For example, Jonas managed to set a=
 specific LED to be controlled by every ethernet port on the board, so =
there may be boards in which Ethernet ports may not be directly assigne=
d to the Ethernet LEDs, but swapped (it's not the most likely situtatio=
n, but since there isn't much documentation from Broadcom available it =
seems sensible to me to offer that configuration posibility).

>=20
>> +- brcm,activity-selection (optional) : LED activity selection value=
s.
>=20
> Ditto.
> --=20
> Florian

I will wait some time before sending the v2 with the changes suggested =
by Florian, so everyone can share their opinion (just in case there are=
 other things to modify).

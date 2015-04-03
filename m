From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 1/2] leds: add DT binding for BCM6328 LED controller
Date: Thu, 02 Apr 2015 19:06:30 -0700
Message-ID: <551DF5A6.1080100@gmail.com>
References: <1427975661-29964-1-git-send-email-noltari@gmail.com> <1427975661-29964-2-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:36702 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752929AbbDCCHV (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 2 Apr 2015 22:07:21 -0400
Received: by pabsx10 with SMTP id sx10so10053126pab.3
        for <linux-leds@vger.kernel.org>; Thu, 02 Apr 2015 19:07:20 -0700 (PDT)
In-Reply-To: <1427975661-29964-2-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, linux-leds@vger.kernel.org, cooloney@gmail.com, jogo@openwrt.org, cernekee@gmail.com

On 02/04/15 04:54, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
> This adds device tree binding documentation for the Broadcom BCM6328 =
LED
> controller.

Looks pretty good to me, few comments below:

>=20
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>
> ---
>  .../devicetree/bindings/leds/leds-bcm6328.txt      | 173 +++++++++++=
++++++++++
>  1 file changed, 173 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-bcm63=
28.txt
>=20
> diff --git a/Documentation/devicetree/bindings/leds/leds-bcm6328.txt =
b/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
> new file mode 100644
> index 0000000..e63d27f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
> @@ -0,0 +1,173 @@
> +LEDs connected to Broadcom BCM6328 controller
> +
> +Required properties:
> +- compatible : should be : "brcm,bcm6328-leds".

Something like "brcm,bcm6328-leds-ctrl" might be a bit more descriptive=
=2E

> +- #address-cells: must be 1
> +- #size-cells: must be 0
> +- reg: BCM6328 LED controller address and size.
> +
> +Optional properties:
> +- brcm,serial-leds: enable Serial LEDs.
> +
> +Each led is represented as a sub-node of the brcm,bcm6328-leds devic=
e.
> +
> +LED sub-node properties:
> +- reg : LED pin number (could be from 0 to 23).
> +- compatible : should be : "brcm,bcm6328-led".

Do we really need to strongly type the LED child nodes here with a
compatible string? It is somewhat implicit that if your parent is
"brcm,bcm6328-leds", the child nodes are of the same "type"?

> +
> +Normal LED:
> +- label (optional) : see Documentation/devicetree/bindings/leds/comm=
on.txt
> +- active-low (optional) : LED is active low.

If it is an optional property, you would want to clarify that active
high is the default.

> +- default-state (optional): see
> +  Documentation/devicetree/bindings/leds/leds-gpio.txt
> +- linux,default-trigger (optional): see
> +  Documentation/devicetree/bindings/leds/common.txt
> +
> +Hardware controlled LED:
> +- brcm,hardware-controlled (optional) : LED is hardware controlled.

The type of this property is not strictly defined, but it would appear
to be a boolean. Reading through the driver though, it looks like the
number of LEDs "hardware" controlled should be something customizable a=
t
some point.

> +- brcm,link-selection (optional) : LED link selection values.

Here you should specify exactly which values are accepted, if this is a
value that is directly mapping to a hardware register value, we might
want to create a header file for that.

> +- brcm,activity-selection (optional) : LED activity selection values=
=2E

Ditto.
--=20
=46lorian

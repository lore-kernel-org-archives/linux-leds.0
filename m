From: Jacek Anaszewski <j.anaszewski81@gmail.com>
Subject: Re: [PATCH v3 1/2] leds: add DT binding for BCM6328 LED controller
Date: Sun, 26 Apr 2015 13:09:47 +0200
Message-ID: <20150426130947.2bd5ea2e@ja.home>
References: <1428246485-32305-1-git-send-email-noltari@gmail.com>
	<1429895176-21818-1-git-send-email-noltari@gmail.com>
	<1429895176-21818-2-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:37619 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751623AbbDZLKD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 26 Apr 2015 07:10:03 -0400
In-Reply-To: <1429895176-21818-2-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>, linux-leds@vger.kernel.org, cooloney@gmail.com, jogo@openwrt.org, f.fainelli@gmail.com, cernekee@gmail.com, j.anaszewski@samsung.com, devicetree@vger.kernel.org

Hi Alvaro,

Thanks for the update. Since this patch will require also DT ack,
please add devicetree@vger.kernel.org on cc as you'll be posting
next version

On Fri, 24 Apr 2015 19:06:15 +0200
=C3=81lvaro Fern=C3=A1ndez Rojas  <noltari@gmail.com> wrote:

> This adds device tree binding documentation for the Broadcom BCM6328 =
LED controller.
>=20
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>
> ---
>  v3: introduce changes suggested by Jacek
>  - Revert compatible string to "brcm,bcm6328-leds".
>  - Improved description.
>  - Renamed normal LEDs to hardware controlled.
>  - Explain that LEDs are active high by default on active-low optiona=
l property.
>  - Properties are now grouped depending on the type of LED and option=
al requirement.
>  - Added more examples to explain hardware controlled LEDs and activi=
ty/link selection.
>  v2: Introduce changes suggested by Florian and Jonas.
>  - Change compatible string to "brcm,bcm6328-leds-ctrl".
>  - Make valid LEDs statement more strict.
>  - Remove compatible strings from LED subnodes.
>  - Clarify that LEDs are active high by default.
>  - Add a better description for brcm,link-signal-sources and brcm,act=
ivity-signal-sources.
>=20
>  .../devicetree/bindings/leds/leds-bcm6328.txt      | 311 +++++++++++=
++++++++++
>  1 file changed, 311 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-bcm63=
28.txt
>=20
> diff --git a/Documentation/devicetree/bindings/leds/leds-bcm6328.txt =
b/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
> new file mode 100644
> index 0000000..6d838f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
> @@ -0,0 +1,311 @@
> +LEDs connected to Broadcom BCM6328 controller
> +
> +This controller is present on BCM6318, BCM6328, BCM6362 and BCM63268=
=2E
> +In these SoCs it's possible to control LEDs both as GPIOs or by hard=
ware.
> +However, on some devices there are Serial LEDs (LEDs connected to a =
74x164
> +controller), which can either be controlled by software (exporting t=
he 74x164
> +as spi-gpio. See Documentation/devicetree/bindings/gpio/gpio-74x164.=
txt), or
> +by hardware using this driver.
> +Some of these Serial LEDs are hardware controlled (e.g. ethernet LED=
s) and
> +exporting the 74x164 as spi-gpio prevents those LEDs to be hardware
> +controlled, so the only chance to keep them working is by using this=
 driver.
> +
> +BCM6328 LED controller has a HWDIS register, which controls whether =
a LED
> +should be controlled by a hardware signal instead of the MODE regist=
er value,
> +with 0 meaning hardware control enabled and 1 hardware control disab=
led. This
> +is usually 1:1 for hardware to LED signals, but through the activity=
/link
> +registers you have some limited control over rerouting the LEDs (as
> +explained later in brcm,link-signal-sources). Even if a LED is hardw=
are
> +controlled you are still able to make it blink or light it up if it =
isn't,
> +but you can't turn it off if the hardware decides to light it up. Fo=
r this
> +reason, hardware controlled LEDs aren't registered as LED class devi=
ces.
> +
> +Required properties:
> +- compatible: should be : "brcm,bcm6328-leds".

Please drop the colon after "should be".
Also it is more common to insert a space before the colon character.
e.g.:

compatible : should be ...

Please apply this rule to each property.

> +- #address-cells: must be 1
> +- #size-cells: must be 0
> +- reg: BCM6328 LED controller address and size.
>
> +
> +Optional properties:
> +- brcm,serial-leds: boolean which enables Serial LEDs.

How about:

brcm,serial-leds: Boolean, enables Serial LEDs.

Boolean should begin with capital letter. Please refer to the other
bindings in Documentation/devicetree/bindings to keep the style of
DT documentation consistent.
Also default value should be mentioned.

> +Each LED is represented as a sub-node of the brcm,bcm6328-leds devic=
e.
> +
> +LED sub-node required properties:

How about:

Required properties for sub-nodes:

> +- reg: LED pin number (only LEDs 0 to 23 are valid).
> +
> +Software controlled LED optional properties:

How about:

Optional properties for sub-nodes related to software controlled LEDs:

> +- label (optional): see Documentation/devicetree/bindings/leds/commo=
n.txt
> +- active-low (optional): boolean that makes LED active low.
> +  Default: false
> +- default-state (optional): see
> +  Documentation/devicetree/bindings/leds/leds-gpio.txt
> +- linux,default-trigger (optional): see
> +  Documentation/devicetree/bindings/leds/common.txt

Please drop "(optional)" as you are already mentioned this in the
section header.

> +Hardware controlled LED optional properties:

How about:

Optional properties for sub-nodes related to hardware controlled LEDs:

> +- brcm,hardware-controlled: boolean that makes this LED hardware
> +  controlled.
> +- brcm,link-signal-sources: An array of hardware link
> +  signal sources. Up to four link hardware signals can get muxed int=
o
> +  these LEDs. Only valid for LEDs 0 to 7, where LED signals 0 to 3 m=
ay
> +  be muxed to LEDs 0 to 3, and signals 4 to 7 may be muxed to LEDs
> +  4 to 7. A signal can be muxed to more than one LED, and one LED ca=
n
> +  have more than one source signal.
> +- brcm,activity-signal-sources: An array of hardware activity
> +  signal sources. Up to four activity hardware signals can get muxed=
 into
> +  these LEDs. Only valid for LEDs 0 to 7, where LED signals 0 to 3 m=
ay
> +  be muxed to LEDs 0 to 3, and signals 4 to 7 may be muxed to LEDs
> +  4 to 7. A signal can be muxed to more than one LED, and one LED ca=
n
> +  have more than one source signal.
> +
> +example 1) BCM6328 with 4 EPHY LEDs
> +
> +leds0: led-controller@10000800 {
> +	compatible =3D "brcm,bcm6328-leds";
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	reg =3D <0x10000800 0x24>;
> +
> +	alarm_red@2 {
> +		reg =3D <2>;
> +		active-low;
> +		label =3D "red:alarm";
> +	};
> +	inet_green@3 {
> +		reg =3D <3>;
> +		active-low;
> +		label =3D "green:inet";
> +	};
> +	power_green@4 {
> +		reg =3D <4>;
> +		active-low;
> +		label =3D "green:power";
> +		default-state =3D "on";
> +	};
> +	ephy0_spd@17 {
> +		reg =3D <17>;
> +		brcm,hardware-controlled;
> +	};
> +	ephy1_spd@18 {
> +		reg =3D <18>;
> +		brcm,hardware-controlled;
> +	};
> +	ephy2_spd@19 {
> +		reg =3D <19>;
> +		brcm,hardware-controlled;
> +	};
> +	ephy3_spd@20 {
> +		reg =3D <20>;
> +		brcm,hardware-controlled;
> +	};
> +};
> +
> +example 2) BCM63268 with Serial/GPHY0 LEDs
> +
> +leds0: led-controller@10001900 {
> +	compatible =3D "brcm,bcm6328-leds";
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	reg =3D <0x10001900 0x24>;
> +	brcm,serial-leds;
> +
> +	gphy0_spd0@0 {
> +		reg =3D <0>;
> +		brcm,hardware-controlled;
> +		brcm,link-signal-sources =3D <0>;
> +	};
> +	gphy0_spd1@1 {
> +		reg =3D <1>;
> +		brcm,hardware-controlled;
> +		brcm,link-signal-sources =3D <1>;
> +	};
> +	inet_red@2 {
> +		reg =3D <2>;
> +		active-low;
> +		label =3D "red:inet";
> +	};
> +	dsl_green@3 {
> +		reg =3D <3>;
> +		active-low;
> +		label =3D "green:dsl";
> +	};
> +	usb_green@4 {
> +		reg =3D <4>;
> +		active-low;
> +		label =3D "green:usb";
> +	};
> +	wps_green@7 {
> +		reg =3D <7>;
> +		active-low;
> +		label =3D "green:wps";
> +	};
> +	inet_green@8 {
> +		reg =3D <8>;
> +		active-low;
> +		label =3D "green:inet";
> +	};
> +	ephy0_act@9 {
> +		reg =3D <9>;
> +		brcm,hardware-controlled;
> +	};
> +	ephy1_act@10 {
> +		reg =3D <10>;
> +		brcm,hardware-controlled;
> +	};
> +	ephy2_act@11 {
> +		reg =3D <11>;
> +		brcm,hardware-controlled;
> +	};
> +	gphy0_act@12 {
> +		reg =3D <12>;
> +		brcm,hardware-controlled;
> +	};
> +	ephy0_spd@13 {
> +		reg =3D <13>;
> +		brcm,hardware-controlled;
> +	};
> +	ephy1_spd@14 {
> +		reg =3D <14>;
> +		brcm,hardware-controlled;
> +	};
> +	ephy2_spd@15 {
> +		reg =3D <15>;
> +		brcm,hardware-controlled;
> +	};
> +	power_green@20 {
> +		reg =3D <20>;
> +		active-low;
> +		label =3D "green:power";
> +		default-state =3D "on";
> +	};
> +};
> +
> +example 3) BCM6362 with 1 LED for each EPHY
> +
> +leds0: led-controller@10001900 {
> +	compatible =3D "brcm,bcm6328-leds";
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	reg =3D <0x10001900 0x24>;
> +
> +	usb@0 {
> +		reg =3D <0>;
> +		brcm,hardware-controlled;
> +		brcm,link-signal-sources =3D <0>;
> +		brcm,activity-signal-sources =3D <0>;
> +		/* USB link/activity routed to USB LED */
> +	};
> +	inet@1 {
> +		reg =3D <1>;
> +		brcm,hardware-controlled;
> +		brcm,activity-signal-sources =3D <1>;
> +		/* INET activity routed to INET LED */
> +	};
> +	ephy0@4 {
> +		reg =3D <4>;
> +		brcm,hardware-controlled;
> +		brcm,link-signal-sources =3D <4>;
> +		/* EPHY0 link routed to EPHY0 LED */
> +	};
> +	ephy1@5 {
> +		reg =3D <5>;
> +		brcm,hardware-controlled;
> +		brcm,link-signal-sources =3D <5>;
> +		/* EPHY1 link routed to EPHY1 LED */
> +	};
> +	ephy2@6 {
> +		reg =3D <6>;
> +		brcm,hardware-controlled;
> +		brcm,link-signal-sources =3D <6>;
> +		/* EPHY2 link routed to EPHY2 LED */
> +	};
> +	ephy3@7 {
> +		reg =3D <7>;
> +		brcm,hardware-controlled;
> +		brcm,link-signal-sources =3D <7>;
> +		/* EPHY3 link routed to EPHY3 LED */
> +	};
> +	power_green@20 {
> +		reg =3D <20>;
> +		active-low;
> +		label =3D "green:power";
> +		default-state =3D "on";
> +	};
> +};
> +
> +example 4) BCM6362 with 1 LED for all EPHYs
> +
> +leds0: led-controller@10001900 {
> +	compatible =3D "brcm,bcm6328-leds";
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	reg =3D <0x10001900 0x24>;
> +
> +	usb@0 {
> +		reg =3D <0>;
> +		brcm,hardware-controlled;
> +		brcm,link-signal-sources =3D <0 1>;
> +		brcm,activity-signal-sources =3D <0 1>;
> +		/* USB/INET link/activity routed to USB LED */
> +	};
> +	ephy@4 {
> +		reg =3D <4>;
> +		brcm,hardware-controlled;
> +		brcm,link-signal-sources =3D <4 5 6 7>;
> +		/* EPHY0/1/2/3 link routed to EPHY0 LED */
> +	};
> +	power_green@20 {
> +		reg =3D <20>;
> +		active-low;
> +		label =3D "green:power";
> +		default-state =3D "on";
> +	};
> +};
> +
> +example 5) BCM6362 with EPHY LEDs swapped
> +
> +leds0: led-controller@10001900 {
> +	compatible =3D "brcm,bcm6328-leds";
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	reg =3D <0x10001900 0x24>;
> +
> +	usb@0 {
> +		reg =3D <0>;
> +		brcm,hardware-controlled;
> +		brcm,link-signal-sources =3D <0>;
> +		brcm,activity-signal-sources =3D <0 1>;
> +		/* USB link/activity & INET activity routed to USB LED */
> +	};
> +	ephy0@4 {
> +		reg =3D <4>;
> +		brcm,hardware-controlled;
> +		brcm,link-signal-sources =3D <7>;
> +		/* EPHY3 link routed to EPHY0 LED */
> +	};
> +	ephy1@5 {
> +		reg =3D <5>;
> +		brcm,hardware-controlled;
> +		brcm,link-signal-sources =3D <6>;
> +		/* EPHY2 link routed to EPHY1 LED */
> +	};
> +	ephy2@6 {
> +		reg =3D <6>;
> +		brcm,hardware-controlled;
> +		brcm,link-signal-sources =3D <5>;
> +		/* EPHY1 link routed to EPHY2 LED */
> +	};
> +	ephy3@7 {
> +		reg =3D <7>;
> +		brcm,hardware-controlled;
> +		brcm,link-signal-sources =3D <4>;
> +		/* EPHY0 link routed to EPHY3 LED */
> +	};
> +	power_green@20 {
> +		reg =3D <20>;
> +		active-low;
> +		label =3D "green:power";
> +		default-state =3D "on";
> +	};
> +};


--=20
Best Regards,
Jacek Anaszewski

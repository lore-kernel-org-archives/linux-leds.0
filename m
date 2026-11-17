Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794892847;
	b=hW82zZr10Rgzbxc/r1aBQeKFvlfZyqydAz0KUKvZ//jH3QDI2f29F0KIwHmuDHqzh9rR
	 8rXcrVnDY4JvsahuWqguEYqMlSwvaQy34hGCrQpbuYamLVB3a4nT3lxgosD3p+eM23fL4
	 8LySmX02lmJIxiYCsmFcQ+W5gy99QVlRWZlmIqXUtIwlnbE0t2wrtNqGkKM5/espU50mz
	 B9emO9kfFsQNiWcGtJ9tnr8MYE/NGg7gnfbCaksje0dBg2f+OXz0SH1P8SqD0wKBPUeWr
	 Td9Y7sX2DfDNl2jxAOHkyMBMsAk0Ax+7oInSuM6nuRNI8r1W1hzk8Ol+Tl6y8+mtqzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892847;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6XP1P1MaUHqmBLx1P7JlXwdoH9Xb14V9Uo/hAccbf/E=;
	b=qQrXogOldKtj7LmGhMs4HDDXgUVnrntbvzXVNP09EaB+V5nQZe2DmoE5frdNd994fsPD
	 Byzl9GsBVxbax4OY0r9EOG0WVsOcBOJdeW2u7Bw0ODpUG3/s7zNbIUGNDsbNb2An8fnRo
	 A/tH6ZdDUB3OT9WYih3HUnoOq7VasLODkxKygcUDYemfGy/TCZUikpGHdFuS0wEHDB0Nt
	 lMq5dmeJQqD+OUZyL3xYkJDP1UzadHIRSfVgcv041NaM/CJXpzcgvbY7+aFXJxzgY0NDm
	 fbCHDDIYysyZaBpAHWn253ODZf3TWMfdhK5iSQOeblaXYRzQIray8eIoK5/uvqfdmjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n5PpOO67;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB26E606A31C;
	Tue, 17 Nov 2026 05:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n5PpOO67
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E65331F000C4;
	Tue, 17 Nov 2026 05:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794892847;
	bh=6XP1P1MaUHqmBLx1P7JlXwdoH9Xb14V9Uo/hAccbf/E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n5PpOO67vAII8Vmjmnfi00D1cDngDkuHMFrN5cf8c0AruftqI7sZsQUqHdMMYKBh0
	 jhO+gzgCpeymbyGl6m8xnlyjTYwxR+6cWhY1doKlBzhSg31ME9kvk0+hNDSzgumJpo
	 ALg+S+ZLAhhHYLZdKfpfGs+xrpyqiAorSfzTh8K8zBNYoK2lSqbRMwyxUZBWGnKygh
	 u0pYu494DmsTtxwFZLYG/oKL5ar/5zlxuY4Rl2zzWVcBP91oTsbicq76TZLuzzDV7V
	 93KQkx6xaOPJEoZtEyiL2/6r7m3g6sWQ2sG5rv8KbnAWEszTIVn/t6t9yfcD8l/Dbe
	 +rZeZxhDH1OKg==
Message-ID: <sashiko-outbox-218197@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC] leds: DT: migrating existing labels to
 function/color
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Filipescu" <filipescu.cristian@gmail.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <179489221679.1.1429296960451969532.led-label-policy-rfc@gmail.com>
References: <179489221679.1.1429296960451969532.led-label-policy-rfc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 05:20:46 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] arm64: dts: allwinner: missing Signed-off-by trailer and RFC
  commit format
- [Medium] arm64: dts: allwinner: removing LED label changes sysfs and
  GPIO names
- [Low] arm64: dts: allwinner: inaccurate DTB count and Orange Pi 3 LTS
  claim in log
--

commit 9235c19cbef601645f52663823784ba072327e48
Author: Cristian Filipescu <filipescu.cristian@gmail.com>

> leds: DT: migrating existing labels to function/color
>
> Hi,
>
> The common LED binding deprecates label in favour of function and color.
> Is removing existing labels desirable when it changes established LED cla=
ss
> names, or should existing board descriptions retain them for compatibilit=
y?
>
> For example, the Orange Pi H6 descriptions could replace their labels with
> LED_FUNCTION_POWER/STATUS and LED_COLOR_ID_RED/GREEN. With gpio-leds, this
> would change the names under /sys/class/leds:
>
>   orangepi:red:power    -> red:power
>   orangepi:green:status -> green:status
>
> The example below changes two files and affects Orange Pi 3, 3 LTS, Lite2
> and One Plus. GPIOs, polarity, pinctrl, defaults and triggers are unchang=
ed.
> All four DTBs compile before and after; comparison found only the intended
> label/function/color changes. The renamed LEDs have not been tested on
> hardware.

[Severity: Low]
Is the list of four affected DTBs accurate?

arch/arm64/boot/dts/allwinner/Makefile only builds three H6 Orange Pi DTBs:
sun50i-h6-orangepi-3.dtb (from sun50i-h6-orangepi-3.dts) and
sun50i-h6-orangepi-lite2.dtb and sun50i-h6-orangepi-one-plus.dtb (which
include sun50i-h6-orangepi.dtsi).  There is no Orange Pi 3 LTS device tree
in the kernel tree.

> I was thinking of converting all the deprecated LED labels, but I wanted
> to see if this was something maintainers wanted, since it would touch a l=
ot
> of files. Would you prefer retaining existing labels (potentially adding
> function and color alongside them), or reviewing migrations with the name
> changes explicitly documented?
>
> This is a discussion example, not a patch for inclusion. Preparation and
> static checks were assisted by OpenAI Codex.
>
> Thanks,
> Cristian

[Severity: High]
This commit has no Signed-off-by: trailer, uses an RFC email body instead
of a declarative changelog, and uses "leds: DT: ..." rather than the
"arm64: dts: allwinner: h6: ..." subject prefix.

> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arc=
h/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> index ce82aa265cfd1..8e411705769b1 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> @@ -8,6 +8,7 @@
>  #include "sun50i-h6-gpu-opp.dtsi"
> =20
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> =20
>  / {
>  	model =3D "OrangePi 3";
> @@ -45,13 +46,15 @@ leds {
>  		compatible =3D "gpio-leds";
> =20
>  		led-0 {
> -			label =3D "orangepi:red:power";
> +			function =3D LED_FUNCTION_POWER;
> +			color =3D <LED_COLOR_ID_RED>;
>  			gpios =3D <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
>  			default-state =3D "on";
>  		};
> =20
>  		led-1 {
> -			label =3D "orangepi:green:status";
> +			function =3D LED_FUNCTION_STATUS;
> +			color =3D <LED_COLOR_ID_GREEN>;
>  			gpios =3D <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 */
>  		};
>  	};

[Severity: Medium]
Does removing label here and in sun50i-h6-orangepi.dtsi cause a userspace
regression by renaming the sysfs entries and GPIO consumer names?

When gpio_leds_create() registers these nodes without label,
led_compose_name() formats the LED names as "red:power" and "green:status"
instead of "orangepi:red:power" and "orangepi:green:status", and passes the
new kobject name to gpiod_set_consumer_name().  That breaks userspace
scripts and board configurations that rely on the existing /sys/class/leds/
paths and GPIO consumer labels on Orange Pi 3, Lite2, and One Plus.

Documentation/devicetree/bindings/leds/common.yaml leaves "deprecated: true"
off the label property so existing device trees can keep their established
names without dtbs_check warnings.  Note also that adding function alongside
an existing label has no effect, because led_parse_fwnode_props() returns
immediately after reading label:

drivers/leds/led-core.c:led_parse_fwnode_props() {
	...
	if (fwnode_property_present(fwnode, "label")) {
		ret =3D fwnode_property_read_string(fwnode, "label", &props->label);
		if (ret)
			dev_err(dev, "Error parsing 'label' property (%d)\n", ret);
		return;
	}
	...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179489221679.1.1429=
296960451969532.led-label-policy-rfc@gmail.com?part=3D1

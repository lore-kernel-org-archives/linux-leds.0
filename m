Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770091;
	b=FMSYqAUR7uP0sWEzMFiTMLrimMh4/Qj/tSUMS9zUlb3bU7E4H6kjT2apQhcBaPxnFA2j
	 DsuPn7W63kFNRneEACx3cbBypCZ4SGknRbuLbLYTkbDnU6shnKaucmC80HZUzCfELu5Bu
	 jUbBTQPpYR7P7E9laglENdF0UFiBP+SbR4ESkeE6xHV4HQ8J25zVXGicgmeX2MxF4ta8z
	 wcyheJfnIjDO0tGAA+/jFIJC+tWiwIim1WmdAzQPoc1Lvq7hBJSJ0fbqUWWOoAu/Jv6d/
	 GwlnzCue+YTQ+c/Mzm4hoYzrRG40bPYmhmWveqPghT6d06R5NEAgESi8q6C8BLguQJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770091;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Pgegmg7NRbEVz4W8ht0sKg5urO7PNtzfI1XlRcABkvY=;
	b=0otmzx+AHd34RgFVLMLIOE6qYuw2XlFDz4kxO7eKcuiptjJhm81/3b4sPDypKcFIFYE+
	 Sn7g7ZHVDa1AjLFpPehifGPd3dD82Mr6Cr7EabbGKAN8N5Y4tb5U1sOTbBJetALq6W8nC
	 Blpm0dNHyHq5xaEO1eicMLS99jb/T071fCSHt9+BNCqtbMxQtVGe/iCMtNTupCJIzB3Yi
	 J/MSxw6Z+C2PNQI2mCj5Cqb+NqgL1rra8YoJ8dJHIU1hs6XTx5Le9fMAhf5vQX8hZnzM6
	 7ryZDIjXmFoqFdtpdQxBEwzguVI17qhMob6Vuq2rKeiJkGrwLZrxBcaDpKaB7KcYBIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="EYX0/FOl";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F9B606A68D;
	Fri, 27 Nov 2026 09:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EYX0/FOl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7111A1F00897;
	Fri, 27 Nov 2026 09:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795770090;
	bh=Pgegmg7NRbEVz4W8ht0sKg5urO7PNtzfI1XlRcABkvY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EYX0/FOlwfsooP0zJ63Su2e6XMGgTmIdS4E+GdOT6bUb9ROKX9i9uM8Y4rr6hxBgl
	 8XWWBc9ozJSeBqUHZ4Pbjrj0i7jO/M+CwkW7PeTWDnIJ18VSy8tEr4kq4Z8QtGTrLh
	 1JVOkbC5FvR2DGbE9sCRb7OPMZiWZVF4p3z+jj+xQ30jMy1qlp9kpOHAPk7Y6fUPF1
	 nwSeKs40hVLOiBK25rWqecZdBjwaT1b7XQVOHsI6/etOZYvLldvxQZI3tF++YYaOOG
	 TLkB5iuEvq2HX/k4TcKrtUeTJo3QUc5WI9XQrgN50fODkVNbNo42gWTDRkeDBl8A6M
	 BS5JN6rc/D2lw==
Message-ID: <sashiko-outbox-236937@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: qcom: eliza-evk: Add DLC0697 DSI0
 overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Saini" <vishnu.saini@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261127-eliza_disp_all-v1-2-a18be7f65fd4@oss.qualcomm.com>
References: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
 <20261127-eliza_disp_all-v1-2-a18be7f65fd4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 09:01:30 +0000
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
- [Medium] arm64: dts: qcom: missing eliza-cqs-evk-ufs composite target
  for dlc0697
- [Low] arm64: dts: qcom: eliza-evk-dlc0697-dsi0: non-generic
  backlight-dlc node name
- [Low] arm64: dts: qcom: eliza-evk-dlc0697-dsi0: missing TE pin in
  panel sleep pinctrl
--

commit a242dd77c0d8f9a483c88eacc1ef24d22e9ef51f
Author: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

arm64: dts: qcom: eliza-evk: Add DLC0697 DSI0 overlay

This commit adds a devicetree overlay for the Qualcomm Eliza EVK to enable
the DLC0697 panel on the DSI0 B2B connector and disables the default HDMI
bridge path.

> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 19310879349d0..64c61aa9cd8c1 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -14,7 +14,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D apq8094-sony-xperia-kitak=
ami-karin_windy.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D apq8096-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D apq8096sg-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D apq8096-ifc6640.dtb
> +eliza-cqs-evk-emmc-dlc0697-dsi0-dtbs :=3D eliza-cqs-evk-emmc.dtb eliza-e=
vk-dlc0697-dsi0.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D eliza-cqs-evk-emmc.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D eliza-cqs-evk-emmc-dlc0697-dsi0.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D eliza-evk-dlc0697-dsi0.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D eliza-cqs-evk-ufs.dtb

[Severity: Medium]
Should there also be an eliza-cqs-evk-ufs-dlc0697-dsi0-dtbs composite
target for eliza-cqs-evk-ufs.dtb?

eliza-cqs-evk-ufs.dts includes the same eliza-evk.dtsi carrier board
description targeted by eliza-evk-dlc0697-dsi0.dtso.  Because
scripts/Makefile.dtbs only passes -@ to base DTBs referenced in a *-dtbs
composite rule, omitting the UFS composite target also leaves
eliza-cqs-evk-ufs.dtb compiled without __symbols__, preventing the overlay
from being applied to the UFS EVK variant at build or boot time.

Also, eliza-evk-dlc0697-dsi0.dtbo is placed before eliza-cqs-evk-ufs.dtb,
out of alphabetical order.

> diff --git a/arch/arm64/boot/dts/qcom/eliza-evk-dlc0697-dsi0.dtso b/arch/=
arm64/boot/dts/qcom/eliza-evk-dlc0697-dsi0.dtso
> new file mode 100644
> index 0000000000000..a0a68d3976637
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/eliza-evk-dlc0697-dsi0.dtso
> @@ -0,0 +1,75 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +	backlight_dlc: backlight-dlc {
> +		compatible =3D "gpio-backlight";
> +		gpios =3D <&pm7550_gpios 2 GPIO_ACTIVE_HIGH>;
> +	};
> +};

[Severity: Low]
Should this node use the generic name "backlight" instead of
"backlight-dlc" (i.e. backlight_dlc: backlight)?  The base board files do
not define a root backlight node, so there is no naming collision.

[ ... ]

> +&mdss_dsi0 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	panel@0 {
> +		compatible =3D "dlc,dlc0697", "ilitek,ili7807s";
> +		reg =3D <0>;
> +		backlight =3D <&backlight_dlc>;
> +		reset-gpios =3D <&tlmm 12 GPIO_ACTIVE_LOW>;
> +		avdd-supply =3D <&vreg_disp_3p3>;
> +		avee-supply =3D <&vreg_disp_3p3>;
> +		vddi-supply =3D <&vreg_l8b>;
> +		pinctrl-0 =3D <&dlc_panel_rst_n>, <&dlc_panel_te_pin>;
> +		pinctrl-1 =3D <&dlc_panel_rst_n_suspend>;
> +		pinctrl-names =3D "default", "sleep";

[Severity: Low]
Should pinctrl-1 also include <&dlc_panel_te_pin>, as done in
eliza-mtp.dts?  Omitting it causes pinctrl_commit_state() to release pinmux
ownership of gpio17 (mdp_vsync) when transitioning to the sleep state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-eliza_disp=
_all-v1-0-a18be7f65fd4@oss.qualcomm.com?part=3D2

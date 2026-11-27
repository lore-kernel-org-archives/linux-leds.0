Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770070;
	b=OUQTGeuTWwFPbOQwUcPbXHYW6oj1i9DOmp0jKsZ8F3Gk5vu7aM5fs6JIOdTwNNgfol9g
	 /WmcLbOboN9ILxL4gaK+diQV0e4ATOiZmvLET1FOcHT6mwlOTh4a7bCrn/r6BGSLikrD6
	 QR9PXa6GiOzPATQocfR1OK5mEgNS1yMu3jq1ZHZdBCo3o3qgSGvfpAfhqMy9rqLg4P5Tw
	 wNl1Us045M1UFi4zQnjeE+QneY44pqADekEUrluHKAee06uMPDdm3cROf2uALwzAUtjsH
	 VpSrZh4B0JWo84UdSGQ3LVqhdmD853dTXs4MdsqwEby/Ip6paINwHJdIJ6x+SQTknzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770070;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BCi9ZuxPdT/0PenoSIsI92+rSXJZFemgkiipEiKaD44=;
	b=WXxppkdLchBtHLR022bGG9mA55g3X/EvsyW3uohf0TNyhLhtUZvTtbQodFvuMWdz3+Es
	 COl7Ogm2ZmUo5JFIzJghvmpY7UjXLAZlKGil2LfSF0kDbG2yTpm/6TdL7h3fHrxbcGST+
	 GuWN1A5/QN2r2KOf5Z8C3J/0IhedMz+dWJ7cd0mL1L3129eBEyQnLU2y0BJMhBEBa+ByG
	 2Cs4VbjtAjAoH54zdJ5hDFTq3fk570nz20BrwvRbClbKS0QwIwo5VAfcwsc0spNy1FtRO
	 h2YTRNc5qTCKcp7YQk7f4VM9w7RVEEEAnoXQonzWewTaYO/fQDa+aSAFm5qbHUKa8ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jqFiIb83;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E1A606A32D;
	Fri, 27 Nov 2026 09:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jqFiIb83
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C9591F00897;
	Fri, 27 Nov 2026 09:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795770069;
	bh=BCi9ZuxPdT/0PenoSIsI92+rSXJZFemgkiipEiKaD44=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jqFiIb83FQrfyDFqGEV2SAa63I1Jxry+V5EwTnq7b04WU2IozpHOa1UnT8NObChik
	 kE6KU9nzlMmI/FvRncZLm5QcJ8tWLz3jziMUnvjS2mYPXnjmXMoYzHO+1t2jgacApZ
	 LTH8dyTiPQAOcKFYCzlpENnX7q2qWJQHldWnJG13ayUTDtKBuIakTz/VKi2jNZkpqr
	 drrEqKwx+svnwuMk8JYmL1XFO8u/XQipu6vagzHNgFldxulQgMl8lfZqlGO4addbl3
	 39dw1bgxZaH7GteoaTPQtmndj58uZiuYlRwM06l5mNGb2SVFHUqagAvLmCpqMsqe8a
	 RgtwlaMi7nFhQ==
Message-ID: <sashiko-outbox-236935@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/7] arm64: dts: qcom: eliza-evk: Add RPi 7-inch DSI0
 overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Saini" <vishnu.saini@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261127-eliza_disp_all-v1-6-a18be7f65fd4@oss.qualcomm.com>
References: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
 <20261127-eliza_disp_all-v1-6-a18be7f65fd4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 09:01:08 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] arm64: dts: qcom: eliza-evk: non-generic touchscreen0@5d node
  name in RPi overlay
- [Low] arm64: dts: qcom: eliza-evk: missing UFS EVK composite DTB rule
  for RPi overlay
--

commit 4aa8871e738ef8bfb7debb6b4c346abb384962ee
Author: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

arm64: dts: qcom: eliza-evk: Add RPi 7-inch DSI0 overlay

This commit adds a Devicetree overlay for the Qualcomm Eliza EVK to
enable the Raspberry Pi 7-inch DSI panel on the DSI0 connector.

> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index d8cac5322a198..9183f7c608c29 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -16,11 +16,14 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D apq8096sg-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D apq8096-ifc6640.dtb
>  eliza-cqs-evk-emmc-dlc0697-dsi0-dtbs :=3D eliza-cqs-evk-emmc.dtb eliza-e=
vk-dlc0697-dsi0.dtbo
>  eliza-cqs-evk-emmc-lvds-auo,g133han01-dsi0-dtbs :=3D eliza-cqs-evk-emmc.=
dtb eliza-evk-lvds-auo,g133han01-dsi0.dtbo
> +eliza-cqs-evk-emmc-raspberrypi-dsi0-7inch-dtbs :=3D eliza-cqs-evk-emmc.d=
tb eliza-evk-raspberrypi-dsi0-7inch.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D eliza-cqs-evk-emmc.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D eliza-cqs-evk-emmc-dlc0697-dsi0.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D eliza-cqs-evk-emmc-lvds-auo,g133han01-dsi0.=
dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D eliza-cqs-evk-emmc-raspberrypi-dsi0-7inch.d=
tb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D eliza-evk-dlc0697-dsi0.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D eliza-evk-lvds-auo,g133han01-dsi0.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D eliza-evk-raspberrypi-dsi0-7inch.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D eliza-cqs-evk-ufs.dtb

[Severity: Low]
Should this also define a composite *-dtbs target applying
eliza-evk-raspberrypi-dsi0-7inch.dtbo to eliza-cqs-evk-ufs.dtb?

eliza-cqs-evk-ufs.dts includes the same eliza-evk.dtsi carrier board,
and scripts/Makefile.dtbs only passes -@ to dtc for base DTBs referenced
in a *-dtbs rule, so without a composite rule eliza-cqs-evk-ufs.dtb is
built without __symbols__ and cannot have this overlay applied at
runtime either.

> diff --git a/arch/arm64/boot/dts/qcom/eliza-evk-raspberrypi-dsi0-7inch.dt=
so b/arch/arm64/boot/dts/qcom/eliza-evk-raspberrypi-dsi0-7inch.dtso
> new file mode 100644
> index 0000000000000..33cb9947f463b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/eliza-evk-raspberrypi-dsi0-7inch.dtso
[ ... ]
> +&i2c8 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	rpi_mcu_dsi0: gpio@45 {
> +		compatible =3D "raspberrypi,touchscreen-panel-regulator-v2";
> +		reg =3D <0x45>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		#pwm-cells =3D <3>;
> +	};
> +
> +	touchscreen0@5d {
> +		compatible =3D "goodix,gt911";
> +		reg =3D <0x5d>;

[Severity: Low]
Should touchscreen0@5d be named touchscreen@5d instead to match the
generic Devicetree node naming convention and
Documentation/devicetree/bindings/input/touchscreen/goodix.yaml?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-eliza_disp=
_all-v1-0-a18be7f65fd4@oss.qualcomm.com?part=3D6

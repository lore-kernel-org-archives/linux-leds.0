Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770467;
	b=IXYTh+QYO6Ke5mGhulZNhhW41K+26xuqgrR5hl2KJ/bnqBXGdrGRflCzyEoYzCijDvTM
	 0TfHl21Tm4QWTRqxzwbo3ZPCUaJh5QhJpJPoHUr6+GRoHMf12aeu0H5X0VQIiOL5v6a7m
	 esKPuwj8wHU7Xf5jJQiZ964MoDzQExGWuFE6y7XyEUZubJ1C/N/eEdeM3UX4tgq8MBD23
	 sDI/NfwlJgOb9jxuAcVlFKpiZm7XnSawziLIorFQgzyiaN82W63/iO+abMxNmSJ2qNB5/
	 qJYdsQioAN4BbwcYLdFqEnFrz/l1lZp7U+veJQxVcwbWMg+1eQ97rPTr7vKxehRunBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770467;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZKVSKFjaezbOIdL/2USNjW0iZ5vdMp3yOXZwqHqhN44=;
	b=lxKKPl8Tr58BnDy0KmItDjmTTxBlNZJW7C0joN0srfOK2e5pQboESdhLpzxXjcQMT275
	 z8KqGM2/8I9b5TMkij4aDUd5sKPxnAWCqrwt0WCPX5neuHOQ/GTL4QaaEvV6CsbDbDQz9
	 v3zbf8Ssgtd0Gq4mpP5JQ3SFyt+QszfSNiP8v+YHMocx4tMTLKuNKzu6+udmCvAuZ3SOP
	 8JCHcz/Mk3oP5l73chk5lCMFAnkine1B4Jz029t9GqZLiN7X0Yj2GNrPOODoFmUDeG/xG
	 PDq2K7IU47nkEWzdK+ps8glRx0wrhwz1V2Cox5kMjpnbxpaWTwztCL19E0G40TNw+qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QN+O6rjj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05331606A31E;
	Fri, 27 Nov 2026 09:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QN+O6rjj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137AF1F000C1;
	Fri, 27 Nov 2026 09:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795770466;
	bh=ZKVSKFjaezbOIdL/2USNjW0iZ5vdMp3yOXZwqHqhN44=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QN+O6rjjQN0YBcOidPLbUw48rx1hdH2Sz3q4pPyYJM/WmjPw6yXl0DKr/fwr+C8+h
	 Ww2pnl1Na1F607efvD1ijZw5xlFnK5pL/FVvB3a1Z8nt1j++lATaXdb/VXHImKYOtF
	 kj2wyptHd5Jct9HHmPP8bQMyyinxNMhJno7morjZPHNilyvoE5VNaBPRphT7gL7jbs
	 EUgcQ+fgtJmd/KdO2whiWdmmT6uCOJM4a31qMpq38B79KcvgJ14T0Zs2VEHOhrIqfF
	 0Tj8vj+h+qfsaHE4rIj9hBeLTzZhIGr6VoABFzbkDGpLOGHVoQx0xVm9eAsxxzEq0X
	 THWv6xXvxxHrQ==
Message-ID: <sashiko-outbox-236944@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: eliza-evk: Add Waveshare 8-inch
 DSI0 overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Saini" <vishnu.saini@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261127-eliza_disp_all-v1-7-a18be7f65fd4@oss.qualcomm.com>
References: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
 <20261127-eliza_disp_all-v1-7-a18be7f65fd4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 09:07:45 +0000
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
  name on i2c8
- [Low] arm64: dts: qcom: missing eliza-cqs-evk-ufs target for waveshare
  DSI0 overlay
--

commit e31c7f4157c73ec6f7004e0d8c1e4ef8e1b09b0e
Author: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

arm64: dts: qcom: eliza-evk: Add Waveshare 8-inch DSI0 overlay

This commit adds a Devicetree overlay for the Qualcomm Eliza EVK to
enable the Waveshare 8-inch DSI touch panel on the DSI0 connector.

> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 9183f7c608c29..1d84dc4d81da3 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -17,13 +17,16 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D apq8096-ifc6640.dtb
>  eliza-cqs-evk-emmc-dlc0697-dsi0-dtbs :=3D eliza-cqs-evk-emmc.dtb eliza-e=
vk-dlc0697-dsi0.dtbo
>  eliza-cqs-evk-emmc-lvds-auo,g133han01-dsi0-dtbs :=3D eliza-cqs-evk-emmc.=
dtb eliza-evk-lvds-auo,g133han01-dsi0.dtbo
>  eliza-cqs-evk-emmc-raspberrypi-dsi0-7inch-dtbs :=3D eliza-cqs-evk-emmc.d=
tb eliza-evk-raspberrypi-dsi0-7inch.dtbo
> +eliza-cqs-evk-emmc-waveshare-dsi0-8inch-dtbs :=3D eliza-cqs-evk-emmc.dtb=
 eliza-evk-waveshare-dsi0-8inch.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D eliza-cqs-evk-emmc.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D eliza-cqs-evk-emmc-dlc0697-dsi0.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D eliza-cqs-evk-emmc-lvds-auo,g133han01-dsi0.=
dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D eliza-cqs-evk-emmc-raspberrypi-dsi0-7inch.d=
tb
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D eliza-cqs-evk-emmc-waveshare-dsi0-8inch.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D eliza-evk-dlc0697-dsi0.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D eliza-evk-lvds-auo,g133han01-dsi0.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D eliza-evk-raspberrypi-dsi0-7inch.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D eliza-evk-waveshare-dsi0-8inch.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D eliza-cqs-evk-ufs.dtb

[Severity: Low]
Should eliza-evk-waveshare-dsi0-8inch.dtbo also have a composite DTB
target with eliza-cqs-evk-ufs.dtb?

Both eliza-cqs-evk-emmc.dts and eliza-cqs-evk-ufs.dts share the
eliza-evk.dtsi carrier description.  Because scripts/Makefile.dtbs only
passes -@ to DTC_FLAGS for base DTBs listed in a *-dtbs composite rule,
eliza-cqs-evk-ufs.dtb is built without a __symbols__ node and cannot use
this overlay at build time or runtime.

> diff --git a/arch/arm64/boot/dts/qcom/eliza-evk-waveshare-dsi0-8inch.dtso=
 b/arch/arm64/boot/dts/qcom/eliza-evk-waveshare-dsi0-8inch.dtso
> new file mode 100644
> index 0000000000000..1a61d28187fe5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/eliza-evk-waveshare-dsi0-8inch.dtso
[ ... ]
> +&i2c8 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	wsgpio_dsi0: gpio@45 {
> +		compatible =3D "waveshare,dsi-touch-gpio";
> +		reg =3D <0x45>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +	};
> +
> +	touchscreen0@5d {
> +		compatible =3D "goodix,gt9271";
> +		reg =3D <0x5d>;
> +		reset-gpios =3D <&wsgpio_dsi0 9 GPIO_ACTIVE_HIGH>;
> +	};
> +};

[Severity: Low]
This isn't a bug, but should touchscreen0@5d be named touchscreen@5d to
follow generic Devicetree node naming conventions and the
Documentation/devicetree/bindings/input/touchscreen/goodix.yaml binding?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-eliza_disp=
_all-v1-0-a18be7f65fd4@oss.qualcomm.com?part=3D7

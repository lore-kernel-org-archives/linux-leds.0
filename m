Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D438331EB4;
	Fri, 10 Jul 2026 14:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783692886; cv=none; b=V2uAUESogWNB4BhEgmmYxNTI1gQ2ouJSV5bWvz9gqYVE1wXi+TUFUNJu9VMHN/la/5Bk9E6TumiCPuak/GWe5LEpNXGnqrCpHyxCL/8Om3DSSWK6cSXOGJ0wXqae0UNZc942O5R8SA+sOt57J+MT5suNMmeJ1P8KlOE1SCLp1Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783692886; c=relaxed/simple;
	bh=HfxjPrFrePhRPl8UuJtqcIm4bTqgybFRL0fC/5jFzMU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H9kxD9JT2CrBZaHzgUmm8g2WOzuQcRj57KgSweWxfnhuJHCZC9FahmuLfsTYVcKndftH1QB2K+OnU0t0D7Ze8ugleJhPAR9tfO9lQhXV/WU8EjUvTN96u89u401ujGIoKJjK/NWmV4a5yqv8Hr1tQwXD4skP9+Omyukz5e4zrtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e7c8cxfl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e7c8cxfl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C255C1F000E9;
	Fri, 10 Jul 2026 14:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783692885;
	bh=Q8qiPm+8o6SajmeKEADen5tVLeT/4iDWXVPDSLzE4CI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e7c8cxflHt3jjt4PYxvQWm7AkZ8HfxIQaWl2PIENeYoPhFVClkPuW0StPgkuBBXy2
	 ccFCzsZPYWh2FKYDxVnlFcfahNo50lpiaF82MOPzeL4otbNMc5qq0Sii7AKGFetntH
	 0oDZ0KbT9W5slzOPpbPFlVjpcMy1kPlMNanQr12B8PPqiGzPbDuowOJw5D/NTbzLPI
	 aPKgSBTD/hcxFK3KT2IgGEXXoEQ4CZRaiXlm5Advd29LOodzClTd44A3M7xkKdU+BI
	 xMGeHFxlp5NxbSLyLWvOCmK94IUXyAEbhEY4jLLcfCr/VpKQhJkqkU7p364Mpo+VEq
	 APPf40SqzNu2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] arm64: dts: monaco-arduino-monza:
 microcontroller LEDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260710-monza-leds-v5-4-a8972d28c28f@oss.qualcomm.com>
References: <20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com>
 <20260710-monza-leds-v5-4-a8972d28c28f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 14:14:44 +0000
Message-Id: <20260710141444.C255C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Use of deprecated `label` property in new LED device tree nodes
--

--- Patch [4]: [PATCH v5 4/4] arm64: dts: monaco-arduino-monza: microcontro=
ller LEDs ---
commit 2e709948eba4cbeeb0ee03878eb97fe42c4fdd87
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

arm64: dts: monaco-arduino-monza: microcontroller LEDs

This commit adds onboard MCU/STM32 microcontroller LED definitions to the
monaco-arduino-monza device tree. It configures a PCA9635-compatible LED
controller with four RGB LEDs.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm=
64/boot/dts/qcom/monaco-arduino-monza.dts
> index 379b796f261f4..83ccc4eec3423 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
[ ... ]
> @@ -156,6 +157,115 @@ vreg_nvme: regulator-3p3-m2 {
[ ... ]
> +&cci1_i2c1 {
> +	led-controller@22 {
> +		compatible =3D "nxp,pca9635";
[ ... ]
> +		multi-led@0 {
> +			reg =3D <0>;
> +			label =3D "stm-led-1";

[Severity: Medium]
Are these label properties necessary?

Since color and function are already defined just below this line, adding t=
he
deprecated label property overrides the standard naming conventions. This
creates sysfs directories like /sys/class/leds/stm-led-1 instead of the
standard color:function format expected by modern user-space LED managers.

Would it be better to omit the label property here and in the multi-led@1,
multi-led@2, and multi-led@3 nodes?

> +			color =3D <LED_COLOR_ID_RGB>;
> +			function =3D LED_FUNCTION_STATUS;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-monza-leds=
-v5-0-a8972d28c28f@oss.qualcomm.com?part=3D4

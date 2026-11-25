Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636886;
	b=ZgmzzSQae1UAIDJ9CvD3AsG2dnQa/BUZ9ryVexGm+4tXXBFaYYct0n+YyTmcTC8QXDE5
	 wakrV7WCwEw/KlLEoO0Kz6bGivXH7XHbWG164Sgry5AKIHUtxaej7m+/jHLyTIZCfIFcj
	 SxHRyv97z4f7j1DSK39bo9ZOGheJWBU/lrRaT0MHBD4qsUXXR25CK+P7c8WbpESqHXUSi
	 BG1dBll/SL03F2z0/Lgq+KqTOfgiN1dRcJrzEXti/YxyTPNy8JO/Cmhnm68080rXJa6V9
	 7JTRZHJZ3uCcgu6YHKWs1K07yEnxGMrOMYnaoUzxq+cBnG2hgZ7CYpPxruVTPCs1iWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636886;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BAp2L7tRs0SSA5T2jALH2iDeflXOPo4PIU2ZmHayKvE=;
	b=cBeat+ENGJ0SkeaDo2+3q4x4ZlU7LcU5LYP2PGOQgp4BGym33ashuk/fdqpKZ2L0m14r
	 GmBs1erOp77wZKYiLt402oJ7otcYxuAktNQ/gplBQhdjzIvFA+O5DBPiBEqh1eF8sDBdj
	 IOr9D/nPcfLbP5AhIUXGo43QjmCT2BjTTHYt5EA+oCTwkZOkfqwm9cGe2asR4SSn8XdAh
	 X6P8WW/t9dwgx0uvQG2wAI72IL6eOHP9zu48DbovG5QBmfLgw3OD1Q8TYa/9tSg8UDHZ3
	 8xa/eraSaZtQ5DJ2EkdH09Z4nSRQ+/zIPw7cy1hbV4Kk1kDKSCBRdnFmlEZDKd8EzfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J95GYJl1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61929606A323;
	Wed, 25 Nov 2026 20:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J95GYJl1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F17B91F000C4;
	Wed, 25 Nov 2026 20:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795636886;
	bh=BAp2L7tRs0SSA5T2jALH2iDeflXOPo4PIU2ZmHayKvE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J95GYJl1TY3UYr+1YcmKN05/9kvTDkJN0eA4yERypr211sHduMZ9xvxZqH1nKhjPx
	 B5D/8qgraNchJZZc0oEPep4gVYF8yCnHfALaoPw210KIWTei+PpYo4K8aUYlv+SEnf
	 j8VG2oBx4jHlYmY91AceOl+e09045ci6VNTxpx6yza4jSA1LQXiV0USDLfJZ8hZ8eG
	 /J7qyrLDMyBIyk5tp4Dp6FntNY6c29+p+QYNVmrwrP2CjaOIUfs0sH4pZLE7b5wyw9
	 ocLtDCOuY5CSRKRynxywOk8bC9e7DpLd3H/ZyWBqJlvHoccwdHqwhqgRYsSL1+TxXM
	 jcTFPHhyocDKQ==
Message-ID: <sashiko-outbox-234111@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: mahua-t14s: wire backlight
 through pmk8850 pwm
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261125195226.1563577-4-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125195226.1563577-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261125195226.1563577-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 20:01:25 +0000
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
- [Medium] arm64: dts: qcom: vreg_edp_bl keeps regulator-always-on with
  pwm-backlight
- [Low] arm64: dts: qcom: misplaced pmk8850.dtsi fixup in mahua-t14s
  board patch
- [Low] arm64: dts: qcom: mahua-t14s: non-alphabetical placement of
  backlight node
--

commit 73071c600625bb596d61b96f98ccdc4b23428750
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

arm64: dts: qcom: mahua-t14s: wire backlight through pmk8850 pwm

This commit moves the eDP backlight enable GPIO from the panel node into a
dedicated pwm-backlight node wired to the pmk8850 PWM output on the Lenovo
ThinkPad T14s Gen 7.

> diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd=
.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> index 2d6578edcc823..bad49ba5443f3 100644
> --- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> +++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> @@ -156,6 +156,16 @@ vreg_edp_bl: regulator-edp-bl {
>  		regulator-always-on;
>  	};
> =20
> +	backlight: backlight {
> +		compatible =3D "pwm-backlight";
> +		pwms =3D <&pmk8850_pwm 0 4266537>;
> +		enable-gpios =3D <&tlmm 18 GPIO_ACTIVE_HIGH>;
> +		power-supply =3D <&vreg_edp_bl>;

[Severity: Medium]
Should regulator-always-on be removed from vreg_edp_bl now that the
backlight node manages it via power-supply?  With regulator-always-on still
set, regulator_disable() in pwm_backlight_power_off() will not turn off the
backlight supply rail when the display is blanked or suspended.

> +
> +		pinctrl-0 =3D <&edp_bl_en>, <&edp_bl_pwm>;
> +		pinctrl-names =3D "default";
> +	};
> +
>  	vreg_misc_3p3: regulator-misc-3p3 {

[Severity: Low]
This isn't a bug, but the other top-level child nodes under the root node
are ordered alphabetically by node name, whereas backlight is inserted in
the middle of the regulator-* nodes rather than before chosen.

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/pmk8850.dtsi b/arch/arm64/boot/dts/=
qcom/pmk8850.dtsi
> index 053ae42ef0fb7..dfa99cbd21d71 100644
> --- a/arch/arm64/boot/dts/qcom/pmk8850.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmk8850.dtsi
> @@ -69,9 +69,6 @@ reboot_reason: reboot-reason@48 {
> =20
>  		pmk8850_pwm: pwm {
>  			compatible =3D "qcom,pmk8850-pwm", "qcom,pmk8550-pwm";
> -
> -			#address-cells =3D <1>;
> -			#size-cells =3D <0>;
>  			#pwm-cells =3D <2>;
> =20
>  			status =3D "disabled";

[Severity: Low]
Should this removal of #address-cells and #size-cells from pmk8850.dtsi be
squashed into the preceding commit "arm64: dts: qcom: pmk8850: add PWM
node" that introduced pmk8850_pwm, rather than being included in this
board-specific patch?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125195226.1563=
577-1-srinivas.kandagatla@oss.qualcomm.com?part=3D3

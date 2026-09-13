Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43748376BE4;
	Sun, 13 Sep 2026 02:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789267089; cv=none; b=FM2KGHab8biu3T/S1KNmpi+gc2Is/GqIDzcrK+wr1ASXzlxOudJznpWSDa7YrcJZVBXQEO5MKXpofFlbl5C0N52zIN9k7738fRSngS1fXy7lqg7kbG8WPn63QBCSpJShXU4r9/MIROfpaBSPhXUYkp19KKNxdiZ4YkuKxAlGRsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789267089; c=relaxed/simple;
	bh=zmjDkalhHp+DZoMH9Wa+lSORBlcR37Dk9d3rt5R2DF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DUyMRxMzjwxupAIMDkPtiR0fU4BrMY9h/t64IaLNCupgcZLgWg1OplbhaLjpdi+gMnJS5CK2G0Rbyp+OVpVYVmUvyavJibMIi1GTKOCdZlq0Njd7rW0HvG6LsTPPiMg/suwQhZXivVuy9l4y12brRiAgQFm1N9yaxnu0Q3r1Usg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2d/nqPl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2d/nqPl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4658C2BCF4;
	Sun, 13 Sep 2026 02:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789267088;
	bh=zmjDkalhHp+DZoMH9Wa+lSORBlcR37Dk9d3rt5R2DF8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s2d/nqPlXk4vrfKpNgo70rae+uayyXcnBloNApk7n/YcmJe3G6F6FPN3Bq8R90dju
	 ym8+AlI2JR0zN997O7vF5mh1DCG+iqn1sAa89wFLt7YwcVry3MECYPq0CLd6tPA1Nm
	 yRklCZGkeHH6HABPJQZPTzgsZJuv3xivncNbHjKkx4KSFKp9fcYnhX+sPnWuJytw6g
	 tmYa48JlQkmfxT7YMnc8mwU13cqiGZjPPjNlX2XDHgeXT1lO6YlG0LcAVGv9iJrdXG
	 3XL2pQzlmXvr0cInrW2muqtLzycjwZMtpMpQpAgXpMSlA5TtQZzFVLPE35hSf1a2w7
	 DF1UrxVeJrnmg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87793C88E65;
	Sun, 13 Sep 2026 02:38:08 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Sat, 12 Sep 2026 19:38:10 -0700
Subject: [PATCH v7 3/3] ARM: dts: qcom: msm8960: expressatt: Add camera
 flash
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-expressatt_camera_flash-v7-3-e1fd2edc8d84@gmail.com>
References: <20260912-expressatt_camera_flash-v7-0-e1fd2edc8d84@gmail.com>
In-Reply-To: <20260912-expressatt_camera_flash-v7-0-e1fd2edc8d84@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 David Heidelberg <david@ixit.cz>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789267087; l=2821;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=+XXskm3P7Bxm9qp2AXPxEkCdFfEV4HAGzaJ1hbiZwr0=;
 b=106LwAaIjdtn/azCBcKQZ93VhbbPAjBtNjvMY43Ki+Pg4aYO6uveCYGx2cnojBLTQk8Ju5gC/
 /4uWaSA1WDfCpCIntO0JIya2cuyFpw+ze6rEA/RRfFBnDQkhgZXpHXQ
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

From: Rudraksha Gupta <guptarud@gmail.com>

Add camera flash support for the Samsung Galaxy Express (expressatt).

Downstream references:
Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/leds/Makefile#L51
Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/arch/arm/mach-msm/board-apexq-camera.c#L591

Assisted-by: Claude:claude-opus-4.6
Reviewed-by: David Heidelberg <david@ixit.cz>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index 5a3d88e31cf5..b7218ee1349f 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -1,11 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/reset/qcom,gcc-msm8960.h>
 
 #include "qcom-msm8960.dtsi"
 #include "pm8921.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-mpp.h>
 #include <dt-bindings/input/gpio-keys.h>
 
 / {
@@ -61,6 +63,32 @@ touchkey_enable: touchkey-enable {
 		regulator-boot-on;
 	};
 
+	vreg_flash: regulator-flash {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_FLASH_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pm8921_mpps 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&flash_led_unlock>;
+		pinctrl-names = "default";
+	};
+
+	led-controller {
+		compatible = "richtek,rt8515";
+		enf-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vreg_flash>;
+		richtek,rfs-ohms = <16000>;
+		pinctrl-0 = <&cam_flash_en>;
+		pinctrl-names = "default";
+
+		led {
+			function = LED_FUNCTION_FLASH;
+			color = <LED_COLOR_ID_WHITE>;
+			flash-max-timeout-us = <250000>;
+		};
+	};
+
 	i2c-gpio-touchkey {
 		compatible = "i2c-gpio";
 		#address-cells = <1>;
@@ -171,6 +199,13 @@ touchscreen@4a {
 };
 
 &tlmm {
+	cam_flash_en: cam-flash-en-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-down;
+	};
+
 	spi1_default: spi1-default-state {
 		mosi-pins {
 			pins = "gpio6";
@@ -571,3 +606,12 @@ magnetometer@2e {
 		/* TODO: Figure out Mount Matrix */
 	};
 };
+
+&pm8921_mpps {
+	flash_led_unlock: flash-led-unlock-state {
+		pins = "mpp4";
+		function = "digital";
+		output-low;
+		power-source = <PM8921_MPP_S4>;
+	};
+};

-- 
2.55.0



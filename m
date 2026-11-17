Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794892223;
	b=qBxJnTu/I6X+vE3O5y/rJC7OKgsu0eKXE8t3TgxyCgSjZxGC2VknY09d+Lyjc0AeVJ+f
	 TVT2hqYqejC86a5bLxKPN9fx4u15ZQUTCXzaW0I/Ycm1UyQhX7persAAp19WtJ4QdbNN6
	 RuAIS2JUmygSPX4SgIQIsHBQ9ktUIyBZXBdjrmXEPipG3tyR7RDfYZCjIkcXd9PXG6G8/
	 6dxYC/iXQctBJu/hHme3IBY6mFaGNgHsW8Xhkg1G5h9gg2xgKk2p5ONtKDj7pdl7iIqy0
	 Xv35EXX11BdtkBy3rQlifDdcMpxO3cULk99YwZjXQlxbjL1ZJihGjvDPxWIhzGelg3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892223;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=RRjbzyTimWQxTJrhIgcvAax5Lb9Qz/LwWuZkxpcO20g=;
	b=eIzEc7/yE+bAE/aJygoXY+hcIdNqPdLHBkbHqXBImYX+SSUiSTMwbmIMK4cmCIyaZp20
	 KRmUDm+oS+lp4xxZqgevct+RzIQKb8lqJT7VAz93RXTZw2w28evCR4vjpf8HL3hf3Dqio
	 ZHdBGpgzQWxyenItBlueevh6rrAp6zn9SrAS/NIvL8Pb6aSNkmJIjxV9ZxLQ6jJo5aqX+
	 PBQUR+SApX/rlfcMq/Ff6xLWIXVqnDhjJ43oD9MpF2D0zExzM0W+UJTCYV+fJ2zea67eo
	 OY0C9we9dCPa2dJo8PytW8X0frLyJLXyJXIVXX0mAPQ9zKwQWZPptDlqLDgDCVpz/Rg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l1KSRpg4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F790606A32C;
	Tue, 17 Nov 2026 05:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l1KSRpg4
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794892223;
	b=U/XNVTAkdEXEHEb4UWz4PaQJRG6zGvvH98G0+FbBAYAyB2iju/PrCxXknK4bOvvL9f/q
	 KIxaDg9EDM+qfJhzWbxCs6cc7bcTHPTqy9GtWhwtjR1w/XC3r0ZzQK527mi9Ef5+qrrjB
	 Cjtsx2PBGlqf+umdBpECpu5xsq/pcZj6zJ8aNs/g+lfHfcl4Cn9DjwKy7NavTbA7ngjnv
	 HaOf3BCYgUbCnrBVWbKJM5+vgnvdTdVEsGTiGfM0p/+hGfIbSm5U5TvGM2Q0z/9iEJUIn
	 ezAwhE1CaTtgmCF2e3Hl6Pq8tsbZnfuw9AJpD/fEpyTv5UzxNmnpT4u+SLYjSIzunvw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794892223;
	h=DKIM-Signature:Received:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Date:Message-ID:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=RRjbzyTimWQxTJrhIgcvAax5Lb9Qz/LwWuZkxpcO20g=;
	b=il0O7rS5kg76sY187SmH+g6BS1humd6mzRw8LmKfT9dKZd7npUhu6wgbxdCVuTSf8Q5y
	 lQFClg8IB05ak6sRLX98HwhlVkTREv2MuUYmfUOm7GUoEXhS+DYGGrPxCG06PCI7aWsii
	 4EPpXlJLIsPgbgTdtfe1qb/DDGeP++EMtJb0dwH5OBR0cRJqdY+c/krrcn7R0h1/HOPXN
	 nWMkAL9WRWPXculOuH2021pSB6Jd2cAjYmVGstVPYgWF3QmAvYwifVh55CQSKqS+aHGaT
	 Jaod7xoRPuOo6rsqyzvpDmdemVaNFIDDlXhfGKvMQOSAbTOIfjhT4oXgGX597LWRRiA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 910D91F000C4;
	Tue, 17 Nov 2026 05:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794892223;
	bh=RRjbzyTimWQxTJrhIgcvAax5Lb9Qz/LwWuZkxpcO20g=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=l1KSRpg4E7h0I/Yd1aP+MxC0M4E30OKqSsF3BOu/l8WAS2tz+PUpWcJQKA1qTOpGk
	 jEqgxEtF2cNn6pGYIbRq4f2vICK0JyxtI7AryEpRkkPaLHoljl6X8tRTiIA41kPCkz
	 RKW9yhYM/JuV00r2+8JtiGh33p89xkjTRUpIVjSLnlNmcH+jjgD0D5nd+djN3WvM94
	 HkGjVycJjIkQBW8kmr2QBootNjcXoqO97ACFggKIsdI49PRo6j5hwsABDej0sN/JyM
	 XOGsyB+l8gc3BlvvbniNHX4BCHIrVxZERFZP271rkdjZVFeZU0z+bYJOko5EQehg1k
	 5QDTtNkheDxGQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E46014A6C5;
	Tue, 17 Nov 2026 05:10:21 +0000 (UTC)
From: Cristian Filipescu via B4 Relay <devnull+filipescu.cristian.gmail.com@kernel.org>
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Griffin Kroah-Hartman <griffin@kroah.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev
Subject: [PATCH RFC] leds: DT: migrating existing labels to function/color
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Date: Tue, 17 Nov 2026 05:10:16 +0000
Message-ID: <179489221679.1.1429296960451969532.led-label-policy-rfc@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794892216; l=3129;
 i=filipescu.cristian@gmail.com; s=uboot-20261021;
 h=from:subject:message-id;
 bh=yDEyHZ0vBr1PYekgAZguFVDD5Tfxmd/H6LQWci3XaNg=;
 b=32idoKYdXJ1Ued9e/Rgjim6ANtMlStXIm10OgKqlPw2EMFMZ/SznqoucCcuTAOxOsu0hQZisi
 jDVVG9zh0wMAOikJzP57ueY4ADZfIgpij6bsK1fqzx34t2eJlqUtHpO
X-Developer-Key: i=filipescu.cristian@gmail.com; a=ed25519;
 pk=o7Ui0tU3x+X/6Pq6PZHmd2KFtOdPWttoPuNFOvdD8t0=
X-Endpoint-Received: by B4 Relay for
 filipescu.cristian@gmail.com/uboot-20261021 with auth_id=1255
X-Original-From: Cristian Filipescu <filipescu.cristian@gmail.com>
Reply-To: filipescu.cristian@gmail.com
Content-Transfer-Encoding: 7bit

From: Cristian Filipescu <filipescu.cristian@gmail.com>

Hi,

The common LED binding deprecates label in favour of function and color.
Is removing existing labels desirable when it changes established LED class
names, or should existing board descriptions retain them for compatibility?

For example, the Orange Pi H6 descriptions could replace their labels with
LED_FUNCTION_POWER/STATUS and LED_COLOR_ID_RED/GREEN. With gpio-leds, this
would change the names under /sys/class/leds:

  orangepi:red:power    -> red:power
  orangepi:green:status -> green:status

The example below changes two files and affects Orange Pi 3, 3 LTS, Lite2
and One Plus. GPIOs, polarity, pinctrl, defaults and triggers are unchanged.
All four DTBs compile before and after; comparison found only the intended
label/function/color changes. The renamed LEDs have not been tested on
hardware.

I was thinking of converting all the deprecated LED labels, but I wanted
to see if this was something maintainers wanted, since it would touch a lot
of files. Would you prefer retaining existing labels (potentially adding
function and color alongside them), or reviewing migrations with the name
changes explicitly documented?

This is a discussion example, not a patch for inclusion. Preparation and
static checks were assisted by OpenAI Codex.

Thanks,
Cristian

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
index ce82aa265..8e4117057 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
@@ -8,6 +8,7 @@
 #include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "OrangePi 3";
@@ -45,13 +46,15 @@ leds {
 		compatible = "gpio-leds";
 
 		led-0 {
-			label = "orangepi:red:power";
+			function = LED_FUNCTION_POWER;
+			color = <LED_COLOR_ID_RED>;
 			gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
 			default-state = "on";
 		};
 
 		led-1 {
-			label = "orangepi:green:status";
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_GREEN>;
 			gpios = <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 */
 		};
 	};
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index 57b137755..49f3d2fc8 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -9,6 +9,7 @@
 #include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "OrangePi One Plus";
@@ -45,13 +46,15 @@ leds {
 		compatible = "gpio-leds";
 
 		led-0 {
-			label = "orangepi:red:power";
+			function = LED_FUNCTION_POWER;
+			color = <LED_COLOR_ID_RED>;
 			gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
 			default-state = "on";
 		};
 
 		led-1 {
-			label = "orangepi:green:status";
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_GREEN>;
 			gpios = <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 */
 		};
 	};



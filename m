Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9D43E5592;
	Mon,  2 Mar 2026 15:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772465258; cv=none; b=M5ndpXwcxOtCAyEHtsWDgN+xmyrg9y9XOokkYaN3y96//AJAtc04fdnLmt/8oEJVmP0y5Vueyi7cPUE5ZxqrUXCg9eUGVdQCiIdHAFC+d6eYB0ICUJSEIehbYsvF9o3JyB1Ybgd+SCIYBWOQH1HOOvPReq8Ngg1GL7kRpQqrveM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772465258; c=relaxed/simple;
	bh=OMfRQgfsQDyQJeWugDAblKSTBtsVMa/6YkVPJx2p8lE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QXYJF/Uuwpeo7Nq9dcleAXcc2W5eXV4QTLmukoVoy3kdVOkr20nRgwDAfTSkZqnioLyh69K++SrzP2pAKlsSTYdtLuXEIBKo1Uw/FAz/M0IUg8f01SXSuG7B/yydydML50hfzsIVqytv0p6KzeWWonQ8U0FzzkKAC+5nOWgvfXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OqxOI7Bx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OqxOI7Bx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2EF6C2BC86;
	Mon,  2 Mar 2026 15:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772465258;
	bh=OMfRQgfsQDyQJeWugDAblKSTBtsVMa/6YkVPJx2p8lE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OqxOI7BxzZ0qz7vSqumO/C6C0Zem/L8wwUk+SHT/N5E9PQyVzC7O9QFQ+SgBqDbat
	 QlysAXQYr6FdoDrDlAfmLKw/QCKc0CwiQMhbN4lyuX36kjxN3vaMpi2vi6nOR237BZ
	 +VvWZiqpK5MhJmzj73ZuftN5VCQYfv3nG6M3k9NPXHpx4V89zDErrPUY9DaoQSslGM
	 kNsoXiaz06i19IQ1gSnntIE/91QPenxrh6rRTnjnufLIMqMElvaD/TKALvEU23Hu37
	 i0Pdlk55ha2tOAqBSyHP7BTlzKecmx17yxK6nxpZIlCDt/vjET42y4P5Uc92Jp+Sd5
	 Jw60Le+WzOEbw==
Received: by wens.tw (Postfix, from userid 1000)
	id 55D7060003; Mon, 02 Mar 2026 23:27:35 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 2/3] arm64: dts: allwinner: sun55i-a523: Add LED controller
Date: Mon,  2 Mar 2026 23:27:21 +0800
Message-ID: <20260302152724.3197587-3-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302152724.3197587-1-wens@kernel.org>
References: <20260302152724.3197587-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 SoC family features an LED controller that is identical to the
one found on previous SoCs.

Add a device node for it, and one of the possible pinmux settings. This
setting is used on the Avaota A1.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 9335977751e2..92aecb90d4e1 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -153,6 +153,13 @@ i2s2_pi_pins: i2s2-pi-pins {
 				bias-disable;
 			};
 
+			/omit-if-no-ref/
+			ledc_ph_pin: ledc-ph-pin {
+				pins = "PH19";
+				function = "ledc";
+				allwinner,pinmux = <5>;
+			};
+
 			mmc0_pins: mmc0-pins {
 				pins = "PF0" ,"PF1", "PF2", "PF3", "PF4", "PF5";
 				allwinner,pinmux = <2>;
@@ -283,6 +290,21 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		ledc: led-controller@2008000 {
+			compatible = "allwinner,sun55i-a523-ledc",
+				     "allwinner,sun50i-a100-ledc";
+			reg = <0x02008000 0x400>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_LEDC>, <&ccu CLK_LEDC>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_LEDC>;
+			dmas = <&dma 42>;
+			dma-names = "tx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		wdt: watchdog@2050000 {
 			compatible = "allwinner,sun55i-a523-wdt";
 			reg = <0x2050000 0x20>;
-- 
2.47.3


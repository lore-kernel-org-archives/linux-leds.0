Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196D2237180;
	Sun,  2 Aug 2026 19:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785697805; cv=none; b=XWDbU9vDBbSBNwwK9AqmnoWRI9VoQ3phkUD6ZGAglT3F/kUT5Y/DTH49hqnr/5q1peIYOxHA9/xgkQU457HX00RMZj9mQCIAXgBMLiMKnm19dP7s8SAVR9wZ7WTo66pPN+rz/yJffe5nynUZ2Qb7vHkm9kSk9ylev02iLZAI7p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785697805; c=relaxed/simple;
	bh=6q+QsjZ0RaW/gIqI5zYC5uVlr0KDtACrslk8wPXvTgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i+GpS2M5J78FPXWa838E2KYMyGjuQW5lkoeWWah4Ok9HlfmvZg7FdzqeTyKBgiADK1Ii4AcqT4C1w7PP9lQTlQzNEIo9K3yGxs1bScR1tGu94ZEkIVTWLTsMkqvpDVGwhkGJUra33Tx8S0ODrmjNVQ383oCafHjyzlXm5bpAN30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=WKzqgHgV; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="WKzqgHgV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=6ufUQjn+PxTv6w3gV6MnAQZ9oTh+dMozsmrwmo9yaIs=; b=WKzqgHgVPQFmDWhC56etYt4NJw
	ubR0xHH4U1L9st+OwTYSc4mX6wmZZXLg7vFG52yGPnoDH46SoVGMZxDvTro4+Yhi5HlRHfYIMUSAU
	kkKO7ZxI+jeHnTUqIHmIWKmMXOIBQue8rwk6pfHcWbuPDZ6M/1JfO+HgNXA+Jtw73/tP7XSyoyL8a
	gdcuRyShnnfnxV9BX6MtrI0WmUKMk+kKidV80AAPP7ZrL8ksxE9ENHI+oyMGSOBN4fG8tc5bj/3H7
	A5dmuMwDRipJdCVScygacgr9D1KWVYC96Ulo/DzHSu4hw14rtleAHYz1kLWuxaI/ncxsh5yKdkiL3
	P5LuShVg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 0/4] Add devicetree for LincPlus LincStation E1
Date: Sun,  2 Aug 2026 21:09:57 +0200
Message-ID: <178569771627.1410444.7870860670350024666.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260711192842.845048-1-samuel@sholland.org>
References: <20260711192842.845048-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 11 Jul 2026 14:28:24 -0500, Samuel Holland wrote:
> This series adds a binding and devicetree for the LincStation E1 NAS.
> As described in the message for patch 3, it is not entirely clear what
> the DTS file name and board compatible string should be, so for now I
> went with the marketing name for the file and the OEM model number for
> the compatible string. This mostly matches the vendor firmware.
> 
> The vendor software provides quite limited access, so the unit must be
> disassembled and the board removed to access the UART test points
> (opposite from the power button; Ctrl+C to interrupt the vendor U-Boot)
> or the eMMC traces to force the SoC into maskrom mode. The vendor
> firmware uses rk3568_ddr_1056MHz_v1.25.bin from rkbin for DRAM init.
> Mainline U-Boot 2026.07 works with no code changes when configured with
> this devicetree. It is recommended to enable the fan as early as
> possible (e.g. `CONFIG_PREBOOT="pwm enable 0 0"`).
> 
> [...]

Applied, thanks!

[3/4] dt-bindings: arm: rockchip: Add LincStation E1
      commit: 2b009df2afd0874080a1e2a893df5e4db39cc1c5
[4/4] arm64: dts: rockchip: Add LincStation E1
      commit: 0f4c49bb3e538d01bdec403052ba6c35858aa0cf

Dropped the regulator-suspend-microvolt properties. They are deprecated [0]
and also were the same value as the main voltages the regulators used.


[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/regulator/regulator.yaml#n272

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

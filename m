Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302693FFAA5;
	Mon,  2 Mar 2026 15:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772465258; cv=none; b=OQIoZuts2ufuWRLOwopsBbVQfOpDRRfF0uU74PyJ7cRIdSmulLh/jSePeh25ve9qhMINPc3a7kErooYhT8TL3vkClsp+2AIlmpwCa053ojIW8zveXpZ7NAol64HIn9HiWqGM0K6KAWBkq8kK/bfVR1P4/+nVUnPvKlwdFF04WjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772465258; c=relaxed/simple;
	bh=Nu//A3zrzFksC/EsXtTpm79XAbNP4DoF4asm4g2YQsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RrG4w+TMnCbQpzetVuv6V8wqTyS3Fth2xTydPKPea/7TJ475SDBvoQSVuVkjsMCLBNtJpm6O6ZDk/aNf7VWqptXECcvkTOeuaidgZ9fQrw2XoRuoHDT3lLQuXG4FV+4eFGU4KO3p/f3hgMl/ERU3wnE7tEGqpkYcX7+j9hjNJaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGY6ISHq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGY6ISHq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC92FC2BCB2;
	Mon,  2 Mar 2026 15:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772465258;
	bh=Nu//A3zrzFksC/EsXtTpm79XAbNP4DoF4asm4g2YQsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nGY6ISHqP6autGvIwrh7lC5dnJWsyvVOBrkvvf0trB234KIUoQkc+WUp1EfNuWSMg
	 IJHuinmmrVPGXvZzZSRb/pGFAFYuX2UqCQW7PTRxhLcBpgcHmG4QCgnhutdmXqk2Kd
	 WCmfwP0BoNYeyevSx6qdiMP0BVrnUS2sTUUqM9/vJqCTrx6zgdX6up5WDAyBD4kM4N
	 Pi7E82dWhWMP31xBvBPfpZjiR8RLkNBHCtoll1FSpmdLxW0PSweEzPXytRMrVO9J2z
	 Zlku90JotkkwB/euR4ntsuRioDwBQ7wnYgfqYGFRftgyacB8gI4PCemMaBFhTT6kR4
	 NI0ObqHXS39xA==
Received: by wens.tw (Postfix, from userid 1000)
	id 432445F95F; Mon, 02 Mar 2026 23:27:35 +0800 (CST)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: leds: sun50i-a100: Add compatible for Allwinner A523 SoC
Date: Mon,  2 Mar 2026 23:27:20 +0800
Message-ID: <20260302152724.3197587-2-wens@kernel.org>
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

The Allwinner A523 SoC family features an identical LED controller as
found on the A100.

Add a SoC-specific compatible for it, with fallback to the A100 one.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml b/Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml
index 760cb336dccb..0b73fe5b662f 100644
--- a/Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml
+++ b/Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml
@@ -21,6 +21,7 @@ properties:
           - enum:
               - allwinner,sun20i-d1-ledc
               - allwinner,sun50i-r329-ledc
+              - allwinner,sun55i-a523-ledc
           - const: allwinner,sun50i-a100-ledc
 
   reg:
-- 
2.47.3


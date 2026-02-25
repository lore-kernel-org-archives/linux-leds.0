Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ECF363C76;
	Wed, 25 Feb 2026 16:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772035718; cv=none; b=ucFwAzb5WzVpNroVnCBuBc+2LO5X8c3A3/yndDOnYoWBMK6KiYzq/rTVVc1mtHqw6PQn2MDdAGt9Uz7bNC+/YHDxYjC7dnTLRz1T1d4BtHv5x5N/eYw+nErkbq5/c4nSxsk1b9tpIUI5zeJcTW3ZyWgxql6KMua+28hufAqnnHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772035718; c=relaxed/simple;
	bh=/B2QfrFALKWSloUZN8RZMJ44JhHxgk0zEngrHRn7UaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VOwAqYCsz6iDby58fnG2G5t00wc+4Qwoeel6OV6TaLK1PLE7AmD3saJaaiqfuPWUKrgmt4fPtJ1Zg6gwiSdGa4LKrTU574URXAILNU3JiQUxSxz1NKk9N/rB39NQ5EmMHH0jL4ZD6kg7zZaCo0LQzXNZEPzkLvwjQYy7D6WXPaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQsusfUt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQsusfUt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F5B2C19421;
	Wed, 25 Feb 2026 16:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772035718;
	bh=/B2QfrFALKWSloUZN8RZMJ44JhHxgk0zEngrHRn7UaM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aQsusfUtp/W0y6R3mZUwfIRgnm0Py09Oc41jSqlIBiRdOFaivWvTWaZwA3bBLRwTX
	 zLLlHZ/tDHdGXtibR/a8LQKN6TBM1zNYkrWP938DRhAoU/R0/8AyqLS5LBDOhNrT2m
	 lR57E5htV8oJXTx4mo3sDu1us49zf6uKRmfE10bIelSOBcuBub7vpjoeQKp7a0vewO
	 ja21Wcnep40GXsNJlvUXQykzIlKLASpyLHOzDc78JVYE9XMwL919xSwnmDYpeeEKm/
	 mmSfDFSkqQ8131ghAI34gGG8kVlwlVe3ZA6Mj250PHFg+2DFsr6AtJtbf+XVrnCqQG
	 X37uKCpOkqa1w==
Received: by wens.tw (Postfix, from userid 1000)
	id A095A5FD2A; Thu, 26 Feb 2026 00:08:35 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: leds: sun50i-a100: Add compatible for Allwinner A523 SoC
Date: Thu, 26 Feb 2026 00:08:24 +0800
Message-ID: <20260225160828.1687643-2-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225160828.1687643-1-wens@kernel.org>
References: <20260225160828.1687643-1-wens@kernel.org>
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


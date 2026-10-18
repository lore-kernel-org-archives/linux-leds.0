Received: from out-2uec-a118.jellyfish.systems (out-2uec-a118.jellyfish.systems [63.250.43.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD66411F80
	for <linux-leds@vger.kernel.org>; Sun, 18 Oct 2026 19:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792353396; cv=none; b=rDD27e04DA3fO+bYy9tmN8tFthFtV9pN5UpHHwD75f2nRelAmfLzAs/eLE14yT0MSFDIL11xz4T5qK68fKLQIXDdiWPPiVh1F2NqacKBJ87lpq40pFLyFIxXpWKJlxEuqsmxFmCI1vKqdt9iTEERyIZZuve02MNiZifKSOjivBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792353396; c=relaxed/simple;
	bh=4oRVV0Sq19UY5y51DFj9OghAxvL7UUqG4sywn84IEkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OWFDaWZ3/V3Vj9mf5yzlhSME3OXKm0K1Lv010N8xdX6iG+Ag4v5hZYiNmg18QsGWgGfZohp/X4kQ8hKeEXK+GlpLAsIKFIFXvuY2Tr89GKp1t9mtIbLas4Poyyp3RjXfasQEtkoc/ToJuiFPCagT0V8g0X2XGE73aNsRE0taORs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=r-sc.ca; spf=pass smtp.mailfrom=r-sc.ca; dkim=pass (2048-bit key) header.d=r-sc.ca header.i=@r-sc.ca header.b=G8zl6yHr; arc=none smtp.client-ip=63.250.43.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=r-sc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=r-sc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=r-sc.ca header.i=@r-sc.ca header.b="G8zl6yHr"
Received: from DESKTOP-290OH2S (d207-6-150-133.bchsia.telus.net [207.6.150.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4j78Hp3MXdz8sWP;
	Sun, 18 Oct 2026 19:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=r-sc.ca;
	s=spacemail; t=1792352632;
	bh=KwnYgGkKVJxn1/6IzIyhwZUksddwH2puKpniqIhWWKk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G8zl6yHrLWUlUW82i904lMXjQKXh+LFpIJIpUVNWDnobdn1b6UGRQBKZ7HEfFQhki
	 vi11ka71HVDRt7Hoe7jLLAH/LR9GVA6ZNPKg71LpxYI4HvlcV3bO7zgFcp7RC18/Sj
	 yd7tInP/zKQb2vnlj2WSOkZu8c8zEipzpL3Iaa26FYYWTsC+c0+AMhmgKR9Y88csxt
	 8ZvE0Q/xROcjrLeb/tIuGGpbE2H39+TaGOTu0RiXgk5/PStod3L1ZK3P39rdFlS8HX
	 0hlptLZFIouhIE2KD3ahea12nx7MXG3oNRIMIZt9OMPHXwYD+CF1xMqUygMzW1EWMg
	 m7fiRaSvr96Jg==
From: Ross Cawston <ross@r-sc.ca>
To: lee@kernel.org,
	pavel@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chris.packham@alliedtelesis.co.nz,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ross Cawston <ross@r-sc.ca>
Subject: [PATCH 2/3] dt-bindings: net: realtek,rtl9301-switch: add port LED controller
Date: Sun, 18 Oct 2026 12:43:37 -0700
Message-ID: <20261018194339.132-3-ross@r-sc.ca>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261018194339.132-1-ross@r-sc.ca>
References: <20261018194339.132-1-ross@r-sc.ca>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: ross@r-sc.ca

The switch drives the port LEDs, and some boards wire LEDs to it that
have no hardware function and are switched in software, such as PoE
status LEDs. Allow the software LED control block, described by
realtek,rtl9301-port-leds, as a child of the switch like its I2C and
MDIO controllers.

Signed-off-by: Ross Cawston <ross@r-sc.ca>
---
 .../devicetree/bindings/net/realtek,rtl9301-switch.yaml        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/realtek,rtl9301-switch.yaml b/Documentation/devicetree/bindings/net/realtek,rtl9301-switch.yaml
index 80eabc17066..9529327ee0c 100644
--- a/Documentation/devicetree/bindings/net/realtek,rtl9301-switch.yaml
+++ b/Documentation/devicetree/bindings/net/realtek,rtl9301-switch.yaml
@@ -57,6 +57,9 @@ patternProperties:
   'mdio-controller@[0-9a-f]+$':
     $ref: realtek,rtl9301-mdio.yaml#
 
+  'led-controller@[0-9a-f]+$':
+    $ref: /schemas/leds/realtek,rtl9301-port-leds.yaml#
+
 required:
   - compatible
   - reg
-- 
2.55.0.windows.5


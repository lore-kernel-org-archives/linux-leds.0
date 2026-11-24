Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513764;
	b=aBfX+Nai+bc5Xjfq3tnC30+uYVWJtM+r9OtHcpXrKv0ukfgUtK+RyOTDbhl2Nxn+WXfq
	 5uz9oWQqw0aNurAE94jd4wdZuYC3X6n9GE4DIMoyVFZnDwFu3xnsq+KZaX5ZbQ5OOR3Ub
	 nTELgtOtnybhKpbDSdrNFnO7M69LvFgh0MXbD0KaB3afNlU7M0EKm2PCX07Y/PZJ8CB+o
	 uRpeFVF6crRi1aJ4lHYqFEuUVMx6mNC+o7EXcFFy6UFlHiJJAZjAxN6NUaiSpvu7kbRgn
	 YOiEtOljGqZoJg39llM31oFBvjJUBuLZFmglzvyur5RNw/65ytuey7uA1x7kMzwPHUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
	b=rlobNX/G3t3SPISl+9z6zd+5rorysWUd4BD0FNjMsmCPF+Afrj/5f6UOy8wKPmkbW0xw
	 WyNaFt1fjp3F76eHq2eQZzhSZFCdzBp3Vr0hRTboVHkBJue2ZVC9paS7r4PUpmw4iy8rx
	 7onG7H0V+eiuXBQLxuW4adDSP25/U00QH7PeO2aAPhpWn5k/YskIY6qdHJrJj5FhLrAQN
	 qLOOxzciMYi65er2c9ev4xiln6icRueb3pHCjvH4vSBABpcYGKkyuVeOH0qBAUvyu0wrk
	 g260m2Ai5PvJA1LfpCSNbtknD0Yp0tTr/ip8EfbtgD4FltB83ECsjWtObnA0rlBejyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tARb6/Kb";
	arc=none smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC14606B731
	for <linux-leds@vger.kernel.org>; Tue, 24 Nov 2026 09:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDC14606B731
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tARb6/Kb
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ae6f2b193fso21621141fa.0
        for <linux-leds@vger.kernel.org>; Tue, 24 Nov 2026 01:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795513762; x=1796118562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
        b=tARb6/KbEc1oHqh665ucYNIdzhbedQsMYGAiZ2+yhTVzC1oarcfoj9mv17AoGmvK19
         gGHAXYikpEgSpq9sfxjOFLqgj0HbYSoYC+rc1+idN/tj7kj335oTRcuV1y6dngZ+xPia
         drT2iFui9YbiJNuZnJh/DFzi6OiLh6saRKBaqQlL5djLRgZuLI+vEziKXebZZkfVk4hz
         g/5w+iMiJt9aDWN5usdy5sGd2/iBXLMk7YswiorB1L05epFtEYq7YT0NwungI7tepLaV
         1cThsk230jxtEt0a6ikCSiDuasLrUN2tFRQiz4K8F+sjVG0MUoaeaobDv/D1UEOtUn4y
         8KEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513762; x=1796118562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
        b=KRizXl+NH+rK+pJLaMGz500gC47fXR0AVREzO3OYv3zOZXgnhLIEapqnS+2joTWaBG
         LZvrK/xoeBmPFJ/a76QuNTPo9MpzG06PGtr6etXRBPOUbhsoxg5Ax1wSfmHepK6TVBMc
         Syh6NwA4XO+kDZYeePXnJejB3B+VCJZrvfQXmZjkE430fg2LSrDF5CumpF36wieWniKD
         ZYxAKM33CnKsQ0DXx7gjq7MUAUbNpu7e1vBfyhz/YyHbZIcqyb0uYQKQCnb9NuF/oQlu
         Ab4YPxaCiDJqAFae2m6T8tsl204osUGnUgMtWI5AIdDgUYz6p1voLV9Tea6gIDDl4bJr
         CLag==
X-Forwarded-Encrypted: i=1; AL+hErEBC2kqax4JQzSVcMAY6AGgrjjhXORDjSFD9KqHCtTrZDblitkXzvqZe9rl0ha/gw5IiLa6VKgrq8nf@vger.kernel.org
X-Gm-Message-State: APuU4Z+SJr5Kprz2vENkMiDEyZOidj/onD+AbTYbHiFgT4DyjdmOhKHU
	9wlLew8b+29yJNxrLMZn0laxVgVcyUelissCQLKmkzNF+AedyC5TeujS
X-Gm-Gg: AZFdTZe+3z9+hhgxqu9eH+NJbI4qvjcJ5mP4EV0UJOPCgEytI3/YXtTVoku3khFxjoO
	2ibTnoGcjC1Jb97dAO8dMpSxGh5tncW3uX/2k4RXMgMEE4VoLh/16TBQQ94PoWKZtvNsN1jdnIe
	rCoP/xv8Sf31tfm79uqWprNQuKEvHpSyUY12L6UWMyC1tWwBf6JeAyDD0TPanliHLmvKoOkCLni
	qzSLEKfY5Q8wJRAleulLCrbBOXUMZxbG3e5lZtvgm/e57IvY0TN4s8rwqtdiDtsUCR92pa+RuiE
	djKaN2zv6TAGhchCdecw0uLId6p6mb/KR+E9EeH97KUYkyFhSocce9pc5ziZF6xU4vaMtgYGzV2
	WiXQ/C3Lphha5wV76HiQJYy1oYT9BRHQ/0Posw60wYd+IA2te/PWBdesVTjbSiwaL3JL/xgFJKG
	tyGTE6dlPvQdLbcqhTzDXS74lJbEIOsgTSj3krTLbsDh6QZW95VWloKwUyN7QxywSN3WMhhFRki
	b1WULQhOXmHydpt3nDj9VLMT2wV/QChMcf2bthyia5/SSFs2+kkqa82Ml2ag43k+J6p+9Bq4Qr5
	MXb8J/JedZv1yIJCyznevek4cu4jlBnS81ulkGoAm5zB8WU=
X-Received: by 2002:a2e:be26:0:b0:3ae:25c9:f5d1 with SMTP id 38308e7fff4ca-3ae7f9d255cmr38992341fa.11.1795513761797;
        Tue, 24 Nov 2026 01:49:21 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8051bfbfsm38756431fa.20.2026.11.24.01.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:49:21 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org,
	andrew+netdev@lunn.ch
Subject: [PATCH net-next v5 2/3] dt-bindings: net: dptel,dap8211r: add LED nodes
Date: Tue, 24 Nov 2026 12:49:11 +0300
Message-ID: <20261124094914.2993988-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
References: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the optional "leds" node supported by the DAP8211R PHY.

The PHY exposes three configurable LED outputs, each of which can be
assigned a color, a function and a default trigger.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 .../bindings/net/dptel,dap8211r.yaml          | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
index 4cd0f9730d95..84efee27400e 100644
--- a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
+++ b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
@@ -20,6 +20,7 @@ description: |
     - IEEE 802.3az-2010 Energy Efficient Ethernet
     - IEEE 1588 SyncE support
     - Internal packet generator and checker for link diagnostics
+    - Three configurable LEDs (link, speed, duplex, TX/RX activity)
 
 allOf:
   - $ref: ethernet-phy.yaml#
@@ -45,10 +46,31 @@ properties:
     maximum: 2250
     default: 1950
 
+  leds:
+    type: object
+
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^led@[0-2]$':
+        type: object
+        properties:
+          reg:
+            items:
+              maximum: 2
+
+    additionalProperties: false
+
 unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/leds/common.h>
+
     mdio {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -58,5 +80,24 @@ examples:
             reg = <1>;
             rx-internal-delay-ps = <1950>;
             tx-internal-delay-ps = <1950>;
+
+            leds {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                led@0 {
+                    reg = <0>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    function = LED_FUNCTION_LAN;
+                    linux,default-trigger = "netdev";
+                };
+
+                led@1 {
+                    reg = <1>;
+                    color = <LED_COLOR_ID_AMBER>;
+                    function = LED_FUNCTION_LAN;
+                    linux,default-trigger = "netdev";
+                };
+            };
         };
     };
-- 
2.43.0


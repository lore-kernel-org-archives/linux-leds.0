Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761445;
	b=LWaJZd0BX499CsGDAsHzTzfV6+EtTbEmZb4iPrE/X7oSHAnWTuxVaGPeBOnWUqqp8Fx6
	 9CEiQcnmyrZYjK38l2/oGJi4tlRll0xcR56DmBRFqpO3u74FXq/VVwInLNfQ0iHi4Qnrd
	 oQCMKAVBXdq6mgbzz7zFbSvmHRAMQ030HYOAlEJelnzIptOVrUlywFQYYZSyPWktmMIEP
	 La8LDNr6aWkRpemoMh46FfGh/rD7Jf5DRd5o6pAAB8Hh+PPDfSBTCHR2p5w30VsbnL2wJ
	 z1RRGdHXbM6rbjbWskLnzhzgJWRlKC7MXipYv7FpKwxyqQvoi1HieL++YuPEjJumkzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
	b=PmcMDFln+VlHmdIF5wtYXyf+JKJT6u3JVyqUV++oEEDJ+55E4mbJWsbniOCCX9aaD1RS
	 OZmdIvapAjv3x0qbhQj1YbTwdqofiUug4TvJP6rmwT6IJmM878y6AyP8KTA+Cpz4uSfDs
	 M6yZ4ddUBYvBoG4GXLCF4afsgOHZtNjUSF6MLgnvqGwbQRR1WKKjGBixHp8i7GlvfUBd+
	 /VzJur3xLElYa4s/nWc2bimOhMmuCcv5GuTmtoOfsuIoKIA/NAbmealeaxsBHmu3akxib
	 Q5m/OVZgj69wLOWNViJ587ab3C1cczC254lJH1CYX9WkPKtVnjeVEdez79Sb7b+yBHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JbstO9eA;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1408606A327
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 06:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1408606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JbstO9eA
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c10dc41270so8131987e87.2
        for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 22:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795761443; x=1796366243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
        b=JbstO9eA44E3bBWgMfke9c3iAS4NCqV8AdRs6I+r8195W90yk4G+cM0lHvrsM2RGLY
         fVLIjmdyKg8cJPUyg9F6r7Z2zSOE0Pcg4/4D4OyOl/TAGDAYBU0nptGlvgko9e9PUYdD
         PDG6qsaQul3sXhXdMxWkkIYNv+QqEU/32ylJ0uhoioJEWq03jUJqFbmG5weCg3toEe74
         JuaslaHwfnCi3IMEUh9Sh87FOEyiwSsLXJxj5svnEy/nXwzP20/k3NmD+C4JzTZbESwg
         BOf6+yVq7my7WLW8h3q519c0PbtFIramMTL7gF52B3R47qcoVGe32TI1fiO8fMONgSqf
         cYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795761443; x=1796366243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
        b=V3O3luI1iVgd+z2io1/ubd9sYUOTLlF5yugohWNcWgONoJpuqN58XgSfibjbcIRUgM
         mSpvPSe6BrJ45ebi7toD/BkM9z75gawERQLUfBeTObF0D1lSNAplfVTLwZsvWSFOYKLI
         pFQKX7+7iDA1XSG9BCc+tLNzcMRWEWKi9fC81wqPu0EDEbYyMs6qOyHdjDKksxL83Isi
         UBBW40x2i1pfMDPoWk+f27vXqZkukVQq+MkFZU3IIzeZIO/7vt2CBY1uEOV7SWu3zaPk
         gdyjUvcF2xWbOT7t+tA6T4CUxJt9zHO7F7IIvZDua3dELRYePgk3u6ayVDMD31UL1Irg
         e0MQ==
X-Forwarded-Encrypted: i=1; AL+hErHef78ZmeOsJE1rGwKa8BDt/pKeFo3jCkh+N624A60e8N3aRILmvOCYhcb52kfMleZMUT7zl1YIgH1z@vger.kernel.org
X-Gm-Message-State: APuU4Z9IwgwJyVj7VUkIkRJZVmk+uyOXSFuOOR8MNbWJKn2rn9T3EtT/
	9/zbsqLmjMOfBiQbn3yS8P1V4G0ia69VIYNwM4v6E1Y3t+kjDxo8Bv7K
X-Gm-Gg: AZFdTZdHUu4eFw/gEYRuun2y2y6oxIJpLtI0iex7fdxr7gtYWCWWbq7G0PrpwVXBrVt
	CS1FayGJ0oXvyfIKkzofqKTeT2ALQEMsORsp+KfDbm5e0L9fzpNgja30DP8XoQPO9ry6pj5P+AQ
	D1IL2+gf7HoLqkgbEpnnvCuKWntaSbejHQYIqXOKHoqxMkFZeIIG+At2/zcWre/bJWxSlDkgy/a
	PLfWCif5CQLsgZXWceYqMNMTTScgPL5LP5cZpNsr9QDoPXeugW9TA+P/LdFDrk/XkdXIh5YQh73
	8pJOTBfK2kJQuvGC3ERzz2xfKJn26LKNfo+CC8PS5/GRHIfe7A6VR0zSwmuKlzznzG166anoiSr
	7N7QiurY41bs9Qerb4SGNaaM6z+6qBYdwKZ/S+Is7o96ethZcBMCMA1zmelFQoDgmK8DPspzgLt
	ivqAwT0mnQmUeqLV4sY3yDQEHWgYIc43VDurdhGU1nUcVYT23LHzPtkmI914ru8xYPDmcy69il+
	/1bTxvdbClP0A2JSmkRc2sB/1uCYbKSEr++jx+lw/55i6p8i/69kJRQinECNcL2W9+ddXWEovw5
	8KemQczBqReS7yDjLA4xQzqPdVOXiA==
X-Received: by 2002:a05:6512:3c8e:b0:5c0:ea4c:faf1 with SMTP id 2adb3069b0e04-5c1bc6907e7mr6613134e87.7.1795761443064;
        Thu, 26 Nov 2026 22:37:23 -0800 (PST)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01772esm5618994e87.39.2026.11.26.22.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:37:22 -0800 (PST)
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
Subject: [PATCH net-next v7 2/3] dt-bindings: net: dptel,dap8211r: add LED nodes
Date: Fri, 27 Nov 2026 09:37:04 +0300
Message-ID: <20261127063708.3074433-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127063708.3074433-1-a.shimko.dev@gmail.com>
References: <20261127063708.3074433-1-a.shimko.dev@gmail.com>
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


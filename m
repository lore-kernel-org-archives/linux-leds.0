Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353549;
	b=iOFnodCz2WxmqKUJsxm+vzzrZYdiyVHavb2tZAAIEFx6I1uKQ/7+l/0cB95lZE2ZNYe3
	 dSNAIDkh5jninKwxgqDSp3ASkZDeAXAjerbWhkrUTCLvXPEVykVzY+GVKRW8r/9D6EhoX
	 tPi1sSEqMI4EjUwyqYfL3LzWwifMsp7gb6P6Z7O0kq7x0H+V+uD1ibI89EOZGgZmMs+dD
	 fnDvGdfNAOnLQo/IVT7kpoZadkiSOTfVWjeUMNNAWezCTthw+tyGX2ZsyCxQCxL0lq8Bz
	 zfGKWl6Vkel6UPJef677nk5RUTj4Kkg/oiPiyFIqnDdTfgZijHTyz3sLSFZdKB8n8Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
	b=HNkxM/XggRkoogyym6285prQyWj7ClGjhB9SAV7vjJoTPo6mi3+ytywP0x55HMMhm0yw
	 njRWs2BWXuqKK9G36eaaiJjyhOAuJGQnc2Tkp2pw2oTWJii2iGVumqtVsx4zcM/sbtP3C
	 fcpsOkX4BX7tk7j9Bl5WBK5hmZ6JeAteXvpnvnKDSGZKXr93Hx/KdNBJ7g3+IfPFoduBR
	 JZUIwslAmRRI3jzDnM53VX5s3tTilHpwMTBQK7E8Xi8OERQ1hL/z0/7R+wNtfpEyNrPsX
	 1Jkk2pqGXPozwpuMSU/NbxQmWb5h8GMhVl57TNmCn5HSnacHzTqjfqLR0aNtCE2GziA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHbcg6i5;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76488606A680
	for <linux-leds@vger.kernel.org>; Sun, 22 Nov 2026 13:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76488606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHbcg6i5
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so3333065e87.1
        for <linux-leds@vger.kernel.org>; Sun, 22 Nov 2026 05:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795353547; x=1795958347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
        b=xHbcg6i5DphML4jkCzhbweDh0VvOde0E98etF4ObufaDQjVTr5VMlRA/A3p7fH1jbW
         gw8KgP+5ZIXvPqFxNivlV46WUQmVfM451XW+6KncGJzHE2bK2CleBZxAgKiTb14NKgnj
         tiHH/UdgXZ9vBwACxSLj+P/kbYlcpTdsyBj4l0Xbn7PxletaQUiHbemw/k5lxltJqwLw
         DMWYwr7FCNyjsUc4edtceV5XRjyGzswlwy/X8QK5sgotFJQlQI6zdJxMCJ/4oCNz/LJt
         pWsNo+UXcx1x9VOOvV3oGc5HdnrGTP2fXhn4dGDZcx/aPg6W9F8Bshp2Zlp5qNHael2W
         Rk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795353547; x=1795958347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
        b=JFNq6O0QFECj9TdBouThhE84B6py7CeFfIZUnX+PFXBjXjjIw5qAWxj2vwIuA+C6vH
         Fpj6qy4zXu1w/r5l6QQL/UwWTqH63L/ijFPDCPXtcjhOFVJ/5mNHtQ1iOc4IN+qxXdNk
         l1TtwzR39BRoWj/NJeI61NHMfK5nQg7qIuxRNN7tGjzUV6558rOZkNw9MAesFa9DBg6r
         tJD38AgQyyGPsvoGzlJAAWoniq7Kw0cCkJ81hLClHkSaX0YnWzkXVC3RuyZUEzKpDVD8
         cTHTgHS9bekUcWOvZ7muKM1cs9GrwUnuMPbCggxZFozpvL9VMEyv3Mv9DgznVMJ7JuCl
         vJ+w==
X-Forwarded-Encrypted: i=1; AL+hErH24fGHkXSZ7/IqSUmHioQZvA+dIdolGnn8La8MDBhygy/NGJtHk689xGpEhJuOl5SudKmJrEArQGZB@vger.kernel.org
X-Gm-Message-State: APuU4Z9bvKcIzEyo/xtWc856A+sXkuq7n5263/9Y6TrSFA6yTQQ8bA+c
	UID7CoTj1pnXmiguOFULxrYn1nHsvbEu6UVQaa4WX46rgr3nZaFJ8EZw
X-Gm-Gg: AZFdTZda4GLkpekJmvdryu1f87NvJIyxV8Cft5lUTShZEhfNplTEL/Br8LmnqyGZ8Xw
	mkGFHAU6FqIAlfxppa6s4wRDknlkhinciUgCPbTgGECCFyBbfitro/aSR9edyHE7PtsT/m1i4Vs
	1DfablitsEYELVzIsRZxAQ5tgwOrIUD3SyQz6/4HMsFVixAzGpCj3XPclGHoiLxUWVbauIvjVR3
	+JLYUHJPYvR28IGi2LMbmMb1xwUI6+OiOuurCB8ndhfllPmg74QvlpvXHNE4aGVzh/Ucutw6jPG
	SS14wQYaiALPAq84e/QXHrPXq3mWvM62rSPZiHJAVIGd64cRaHZjCuLVmGncx8qtRWxJZ65VkH8
	YjeUp8yNIIxOId0QdvWcGry4ElBFwFtfPaDvwvDPTQAwhSkFaG9+xLv2UTAooUT/Ih99zI8F79h
	Xc98tCNoe9uuvoceMjtjMAe2TWz/qN/Ad0sHIwhbp0e82ttU+U+Yua1OsfUle/km/fCTcyQzVV2
	VVq9IdKaSaKxi35JVHF9BaIlq3e6pD4qsbjSNUTUpowCGAyQtLLyl5E7vjY2kGnTQpxFdClzsbY
	ZQ+dxYkWchqL0bQ2TSZAE7Yx2+8Jaw==
X-Received: by 2002:a05:6512:1042:b0:5c1:606b:ae8f with SMTP id 2adb3069b0e04-5c1bc660882mr2748867e87.7.1795353547092;
        Sun, 22 Nov 2026 05:19:07 -0800 (PST)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae804ef17dsm26038141fa.12.2026.11.22.05.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:19:06 -0800 (PST)
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
Subject: [PATCH net-next v4 2/3] dt-bindings: net: dptel,dap8211r: add LED nodes
Date: Sun, 22 Nov 2026 16:18:55 +0300
Message-ID: <20261122131900.2951586-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122131900.2951586-1-a.shimko.dev@gmail.com>
References: <20261122131900.2951586-1-a.shimko.dev@gmail.com>
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
 .../bindings/net/dptel,dap8211r.yaml          | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
index 4cd0f9730d95..772329feda05 100644
--- a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
+++ b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
@@ -20,6 +20,7 @@ description: |
     - IEEE 802.3az-2010 Energy Efficient Ethernet
     - IEEE 1588 SyncE support
     - Internal packet generator and checker for link diagnostics
+    - Three configurable LEDs (link, speed, duplex, TX/RX activity)
 
 allOf:
   - $ref: ethernet-phy.yaml#
@@ -45,10 +46,40 @@ properties:
     maximum: 2250
     default: 1950
 
+  leds:
+    type: object
+
+    description:
+      Optional node describing the three configurable LEDs of the PHY.
+      Each LED can be assigned a color, function and default trigger
+      (e.g. "netdev" for link/activity indication).
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
+
+        $ref: /schemas/leds/common.yaml#
+        unevaluatedProperties: false
+
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
@@ -58,5 +89,24 @@ examples:
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


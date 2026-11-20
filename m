Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162275;
	b=e7vOnJ8Vug4kPfIZS9UcHOdlJaFErals1aam3btNd8PuCE0fibP6hqtTuqyhCubq24QI
	 tDvyGS6woui9JSUTMPeK5kJPh8F2hM2ncXVju1qZjZQp046WIYjmWN/1gVpEgfx/+4H36
	 cjEh4uyPc38V/rAWB9a9Cd8AiaN4KBLbdOn9uY3TINFVo8Cw0HTL10/kTnPVf4HkeSTjo
	 JDMOXrsYv/zEWbbEMxvCaiuYCvyxBKtskIo5GBTAuRbCXQCR5p7FFRKTt3jKXaNMpEKyc
	 /tV89u1myctHd+Nr6qSGHQxR5qPivN1Bpeme0p0JFJQiOCP0L5OjF6tZo3T8/eTubXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
	b=NJ3K4MmzJ3g+5rhnOKdBkO4A7H/IDL1VA8yyXSvFm/6S2r/fC5mRz4RfhOPRWoD+0jrg
	 aIb8AC9+PhIFfQdDbGvs+Dr0YJR55WUWhJtzvpt3eWC7NrK6yDxhenHrc8YKSSMBijFpx
	 hjN+2MgG06xNXVJ6aZILqODqWBCxs0hpPZztEkcFH0o23G6KLPUlkOUFidGIxffQ0/vjs
	 B9PJPnTJjAZUAzmmi3i1xBn4cu/WZnAUB/4qqkI8+zh1sP8YeZbKRZcBri6sd9702Oepk
	 YCvWKbyY/m8b4WNvUeBpJ57mfcuGoVcgnvuCl3Vj/okfaRY1YfSFp/LGFsiB1j8YdLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BARaHMNl;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729A760A260F
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 08:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 729A760A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BARaHMNl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c1479be604so409372e87.1
        for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 00:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162273; x=1795767073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
        b=BARaHMNlq26sSqV12YSvYOroX4P503BDVW70Vmn3F1ccJ5GXLuDKEGGjw5AZKmf2RF
         XMYXZC9bBgtwJLSOznWjcwaon3KsmYVlfjePgY0jBYQd4WjLYV5eYO4fbDclRsuZP4cA
         BTXlPQ8Q5eIuu5asX9LoAHPTO0dbbnal47mMPjMe6NrOPek1lnUUTD8FUNo9FYy4/mlj
         w/iwd7SZRtYpW1P+TDobhJnkD3x9mvdjtk4e/ecZ1QyBz/xVvwBkDU6h3baFktKOAI2D
         0NVwM4+i66hYaas5BnQEl1l9AMr1Qa4PemDiEqJSzdfliWwgsljhmLBuhkFU5w7EokPp
         6nXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162273; x=1795767073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
        b=TqhZB4uHe5OtQiChiEBPGngA9+iVjioZkBbHpBthIw+a8UZ4mKXZam+8c9Eavexw64
         aLfv6USCQ+WIT+sAzxsXdDEr73hnd1bEr9qcw0EQTo0tIjuNZptzFXOw/ok7SN/HlGhM
         n7wcYPR6MUP7oLrlS0Ye/cln5rRmEOPw7q0Ryp0eY1s/Qyali+pvMHRr79f9jRdAhz4J
         DGtMlgvbLMqwonUefbe/OVCI9dWtQ3gImTw6L8xuc9+eMfJOXYU1xJ/nh/sW0+4P37uU
         NsNHfKP3uf23wGMX/0E1qVmgFaTZpfV/SzZhAXiqv55M15nc+CHQcuKMJPbflFYPa5YX
         0jcw==
X-Forwarded-Encrypted: i=1; AL+hErHMhHyzTKxQm9GETBnXcUNixhR9DfI2Y7gE8fSTLvhAuEkzD1yIMz52zHUddBdOZp1DmB+Nef8MToq2@vger.kernel.org
X-Gm-Message-State: APuU4Z8aYOoTVvKgrbh1mkesF4AGUuH0k1avzrRuROFOA8PUZJQWXAxf
	uq10OqapgwNGa5GuBHIK2h6/BS4CsHaCtNRuM8juJhHCNrBt4NwBMR5K
X-Gm-Gg: AZFdTZcBV6SvZzcnir01uIocHNOpsL5WA8rFVNXvGGZXZyRBoEdtCVh6s/0ipeorXjn
	48UbmBGcS89bpd7BOFN9NQD3li+QkRmoKPEHG+eErV72oJK4RZxVOjxN3MUyivDwQqfMm2SGaAu
	crr+ZoXhBH9oHtPwvF57FoJcSwfX51QxtUt8BFVJAz8wj4ssU9OWaSjUoeDX8jyUWSlfZOGZKOD
	gsQw0BvVj9649dxcJeCPtdeCyoyd8J61HqXacUhgZtGAVtTMLrCd/fKFJ1r+dizi8JyY7ODoHx5
	PTDieRNcIU+0h+qzqZRJ71FrsvoooYmPAPsD3Z6hnNNY64ACuGKXV8JzAsxxiJaaP+7Zea9rI6M
	z9IQWcS+2HZ3jXiuQVLEOsLRo+fc0RnQz3rEBZWIg66sSB/oU/bLP8bl5Kw9xiK3Efusqyy/LfC
	KVL7l/zT4eyQQeAl+/O7/s1gpP8pL+f/ritL7WETCpql9NxNxY9fzhnHSF5hTQBCpMI3gx/0m6f
	JT9MmBs7Nvuh27jtY4MZYZf+dh9kDLE6NZAON8nEl6/KJntgaTOdVnQAYu2k5q7nLjlb0WXV/HI
	EZOopWrZeVTuW4yzMgZ/tiWil0UfBmA1bJ1775KPtoOui9k=
X-Received: by 2002:a05:6512:b9a:b0:5c1:acda:6dc3 with SMTP id 2adb3069b0e04-5c1bc6f6c92mr643326e87.3.1795162273362;
        Fri, 20 Nov 2026 00:11:13 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd018b3asm395463e87.32.2026.11.20.00.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:11:13 -0800 (PST)
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
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 2/4] dt-bindings: net: dptel,dap8211r: add LED nodes
Date: Fri, 20 Nov 2026 11:11:00 +0300
Message-ID: <20261120081106.2919010-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120081106.2919010-1-a.shimko.dev@gmail.com>
References: <y>
 <20261120081106.2919010-1-a.shimko.dev@gmail.com>
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


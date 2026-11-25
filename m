Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631874;
	b=UlOGAHbwDbCMKwfPZBxcnSvQLV3MNzkIz2tfUWijFz502kAO/KkXCKTEw+Jt+hH8hQiZ
	 78r381scD6CR2B3W26OdtsPqqPZoTQrAnPabSavhd3MFDHvmmLIhqAVuBCGm8oJ6fQS+Q
	 N46F8+qrdGgEAtySQH+smAEcWmeAWZfsNDodSklUMKt6mZOjd8Z4Nhb2WOL3dMj0WuW7W
	 YTtVRSeDDiTm8c+kc3ugP0SqSSgJg2YIh8X5Uw90Jkun7Qv6KgdJTDV7v91nqKlKtpqCe
	 /t4kLOe8MHsniXdmpc+l9KqVSYRPxt5ugwcSLO++HNoMcPxPeHlj+YF9pbF5+BbIjrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
	b=VTnubNRhupA2rYRY2PZMwdnyuSNp7zSbL4JM6fmplc+h4jfOKC7kS2icj1oMLmcpbX/w
	 BFYOWljL83y8E7aHTP05kk7Bt2E/YjBEUFfCIq883cPCmWZ23c7C9/Y22pF8NuYUrQMAR
	 bkOHi7bmms721ZKZW8GtgmW6ub8VAzMwuTBy6Vsa5xVJeo9saMY41fighyDT/qaIZUmEE
	 A6BtUbD8/WRZlCwGRAlQheT1sYiDJ9cEcbFYjyzh05u5uJbTJbTZGWLWj9RhrpXzj8Qgk
	 hT7IsZSIrfcfwnSzUPEt78mpM/re565oKKwFSrCpR/CHnwyBhvIHX+lHiyuIQQofGKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4wfCvfS;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C1A606A68E
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 18:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06C1A606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4wfCvfS
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d4so49549431fa.1
        for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 10:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795631871; x=1796236671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
        b=B4wfCvfSF4jdXEA6kj/yuB2UxAv4pDDqE3JiwSoT/R0UrRzx8nIBRNFumcOkLeNfcc
         7ODJ9+MXj6Zn3KDW8YTaFITvTt0REXoNcKYEOpXZR+jGv+yLHsF8rdlJ4uqLr3zMBdXi
         qNZBQNGJ1LRQ0Gx/Nltz+w0nBvGTnNHCfLKlda723KPJvwW9uJe4O5yjUZ8OdxjIAB+0
         +FFL7sk3+IuXJBagc0IBqo+q1tT/ZJjv5+Yt09fxgl0fH0ov/wY9EoFzldAkqypbq5ms
         ONLrZwLX142EZcRWCcwY+B8KX7AZeRiBzWRQ1+ShyU4jotJhoU6x4ZKYYwJXxGbv7kAW
         ZYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631871; x=1796236671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=knC024n2z1HHgEDh5UtAMH0ytfWSe/W5ghZpBaB64ZY=;
        b=iPAAnvSIfQCL/x92xItUEKw3ClJnFml/4oZxmwmEok1FeOogE2Nu3LrwXA/WASMncl
         kISI1OoLYmBYqZtfgcH8sXLzXEcGJXeZFFdviGi/WYKrlmmH5T+aOEg1AZ8uFWPpAGov
         ezj54eRYGjvsZS1FQHJL8Ze31eh6yRHAKzfL0zYnpbmsk/Pap99xXl/Vf4q4Sk7VNu2G
         Du6JvtCla/SB/ss2KRqHTnvb6a/D+o0vVOo8YrfcT6uBofluJRF+YmKctVnedVSZcirB
         Fxg63mBXusORgOBRCBhiAa5k3dqF16kPVU+oCw3naYm1qaH7dtRJ6ZnIL4dC+MSyhyNO
         bhIw==
X-Forwarded-Encrypted: i=1; AL+hErGNdvzD+TUttPjzQuOaCCUiqtsKBuIULffTFDFdlXwWACAJBrJl1y/Xep+WCSeyBKhYOFFJgubwvqyB@vger.kernel.org
X-Gm-Message-State: APuU4Z8d+F2bUY94fKK7YruYMgOqP8JeyEopywLn9BK90kMEPDBhDgpr
	MpbBT/9QSDzInrhfRDsXNtI3me7Hts8XWh9tRDXhRoSxERFo54yUbmMV
X-Gm-Gg: AZFdTZfkMuqDobDqOV0MOmWxKbRPGaPj1gkfKOWgbOqnjGIrvtPIiT0d/v8tzcm5421
	1oWPvn9PEss4pHvCbuNjE40gcB515A4D+v+0nD24IC55Uv4nCWdLjwXuX/tiEABoGd+tZf4PgcT
	U8yHkJswseJiMyUzedDreYxf1UrObm4lmiYgvmhLLjKxij9aqGPkszGn3m7xsQWNY5/Cqj77LHJ
	lG5NVOx91oU2/BKE2cOrhHZG4OSrUIbyT/jjzuA0XTqjHJvUEvQV5wwMO0uO9Ymz4//o/gRXQEN
	4nQtyZMTuj6He4fJnkljGsjgMZTOnylA2e7VLa0b2wbVrn4V2CsRqqfh4JPe0wxicRclrEc5pXi
	7nAUZ2FrfCOM0qRqL4B6e04GcbpllG8ywLSjqIRIVEZyCObtjAwStni/vh7Apl4F7/oZQNW50zR
	Xi001EuZKk68jHM9cBbOUpyOPqQ9FKhsk3r2PW3MRF/0ck9cEn05bxg/puKRlgXDKSoJFtv9JH7
	UFHMHIXwyYV4eTGGwBzSr4w6fsYRXLKhtRBPNtM1bgFtui25QZYpanH8aL0A9DBsw/+DbjuMoh3
	w1IfSFvXox/xH2KuV8zhpWS7q7719eOQChDjO2SsbpNS3yG3/s12zbSan5jZKmVFbgi0
X-Received: by 2002:a05:6512:3a92:b0:5c1:4c4a:f018 with SMTP id 2adb3069b0e04-5c1bc6d25dfmr5683691e87.4.1795631871079;
        Wed, 25 Nov 2026 10:37:51 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd05051bsm4650755e87.62.2026.11.25.10.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:37:50 -0800 (PST)
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
Subject: [PATCH net-next v6 2/3] dt-bindings: net: dptel,dap8211r: add LED nodes
Date: Wed, 25 Nov 2026 21:37:37 +0300
Message-ID: <20261125183742.3039752-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125183742.3039752-1-a.shimko.dev@gmail.com>
References: <20261125183742.3039752-1-a.shimko.dev@gmail.com>
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


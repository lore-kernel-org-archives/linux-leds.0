Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567955;
	b=W2Wc7v+JPc6Q36V2dg6SezgmHKM0FSiEzxn3mSsUXx5KLkkKgmYCOin0OZaWO1XI1pGo
	 6udFHUI25MHoPXB3zlf8KKdnKQ7CdZL/H2JBuzU8QPvEH55TtRAafTkcc1cLWJhfGnu0F
	 OrXro0mY0tNVVrWkzFaV/wL5J10n5IPrAizeUKRNva8A6l2Fu4qnAvhpo3nvvMsFjyLDL
	 GVRgK8zMR8pqcFG512k+za4Tmx+OjMHT8YcmYw88NUF6xReNPuLkjE2CK9to6BfjdzfFo
	 UyA2GY8qjyM9OgmD1gL9XeL6qX5W+yMix+eYTVxugEPAnIQMTwextmwvAcqorMOmdzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=adqH4gL4dB0+FWqAngd5GrykPAAcVtJ2pDUv7Soqjb8=;
	b=4P4oSc0ioAbmmoUL85AjTA0b1GU12THa6pIsDjkTYBw0yoEKi2TQBOxGA7JUmULqTrFa
	 ajj7Ki4t42g9nTVcKiRjkQQ7WQJLKB5UzeNbHqTsv6k4rSLExmI1nhb90BxwFqj2IRjsn
	 lPAnXTJzxsJhuuj5RMEhZahQ6dF3uSqSAlTZ17wQoq3x2Bj3/Wg8V47bci+cMZ2Hr40vT
	 y1djgw1EyqQCEUrxRlrC6MsfImY5fPacjHp1DnhXkDBZG+rfnChsoCti2CP949SfFZkQb
	 PQBkB08Cd47/OHZcb5ETduHMtPRnZEcfv5i2RB/Iy5+eFAQriWtkS8V4iHex7gM8kBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BvggJcHF;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862DF606A899
	for <linux-leds@vger.kernel.org>; Fri, 13 Nov 2026 11:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 862DF606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BvggJcHF
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be4fea434bso1965147e87.1
        for <linux-leds@vger.kernel.org>; Fri, 13 Nov 2026 03:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794567953; x=1795172753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=adqH4gL4dB0+FWqAngd5GrykPAAcVtJ2pDUv7Soqjb8=;
        b=BvggJcHFAroFul6B/s8V05DSEmo3NTfrJpxWfO+JxblHI8WNlizqIMLtiemMX2fH0v
         7tiNn7t3OUH8KBcRvGsku4+AQMCHOI+ZMBiovaswKSQoTqKumgQYkWHk+Inze5S+Xzd9
         Pm82LolSRrWxcFEsIkwfU2m+kpThTQr+VRWFs2OG1xn7qcQriUV+hqJC5/t3xyMMvkTr
         6kOMWDYyAozsAUZ9tnZR6dhhFK/SHb0BcO01dQGc+cgYdet0l8zoKVKEDGlTGUafIsf3
         MCfEqpkvBbO+URvD/Fca5/dzu0kJvu+4wq5M+bji1hcH/Tvvi3rfXT2jcdoFbyrwGXY6
         0dgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567953; x=1795172753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=adqH4gL4dB0+FWqAngd5GrykPAAcVtJ2pDUv7Soqjb8=;
        b=mwioPZqpIWOo+cs+CRh0VjUMrH5p8zWWgUmQ4qR3peH+QWMyhk6LkmExIN2Xb/8cEg
         KXzNDKZOK+n+vmU10esG5JcWJa1M731psUm6sbT0ViUBUcYszTwszxphrB/2x9ink5vO
         Ozk5r5kdl/GTGpwaqdEZCv/9mp/Ij496+FjISmqUOU1sqPhZRAmUjlaCO19ve7xeL6Xm
         zyl9TGAp4drbf5dZc/40fCTwdJRKxxuSmaUjjV3SJeyWy6BWyJ/IryNpICo5ipcPE5u0
         M734DMsLUPA7bYeYWZvJMaCgcPo6e1mgtE6ERhAVcwQ9nXAzgQT7GwfeDt2DbFr9MCai
         3/bQ==
X-Forwarded-Encrypted: i=1; AL+hErHBpWh7Aw3PsHtwFmo+i59QnWzU+0a47uMEtuxD+IT+uqAqCaJye8Kgrvj4GTm6Oe83w61j9IaaxrgU@vger.kernel.org
X-Gm-Message-State: APuU4Z/hJaWNlS4wuZmQfK4T6Ps1Vbq5EbPcP48jl69oSTYnWduijNDd
	s0pzjiR9r0U7Q/3OGcgKgbsozUrog2GsYBd4YSDI4wnoSjJjAdndvhK4
X-Gm-Gg: AYBFou2q+O4slnhMNDBLS1rVYQLKqBazo2LZNVDvt/Du1DzzY18K4WBJjYXJtFnOkc4
	qM5ef5EYKGESG4FlYI9heN2Lrse+k3FIiNicb2wFpyFj943+1zwuWgR3NnKTRuSyDNvVc3BQeRe
	PzGE3C05KDah6/Xlt5skuduYlBQItQoZ6HzwgAl4UOs5cGW6mYHVDIyM+kxNQgkwTt5qmf9U4fg
	gJSa+4zoCMJ4DQQkOt4g7T9w0sazxmU0MkCWtQffP7xV0DJUXf63nAl7GmME7mL+VkoLZi9cscR
	GUZ6OXFDveej4oiMR+zTe4nOJtgNZb1FZme5ArR5bC+GGBrH7BJGjlnokBs9yAufviZuHuNoQ3r
	FOIs67WlVrNdk3ZmssGVLebP22BpLScEE8GdBqzOXY4WDAyx51ngDl4+5F36nzeclxKFneGDODB
	9u9ZO/dK+gR6TlSp6pKH0T7z6SY4p5tZmiVa3Ryl26WFKn8BActG9kKhoTWbwm6Akz/gLqA/bjY
	3ZhE3/3hdHJfNJ+m8nAd+j1k8CHXnzYNEsGuicJ/gUYfFnz9TKrSDIeEN7q1oZsOKPOUa2LPQGb
	jKkz90gR4TwMWx0XJa1dVxrsqWuOEAbW+j+drP+1dGUbPNQ7H20PB7pZoo8ipTTeMt/H
X-Received: by 2002:a05:6512:3c9f:b0:5c1:56f6:2e78 with SMTP id 2adb3069b0e04-5c170b36c01mr760155e87.24.1794567952545;
        Fri, 13 Nov 2026 03:05:52 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133371asm610997e87.21.2026.11.13.03.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:05:52 -0800 (PST)
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
	pavel@ucw.cz,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH net-next 1/3] dt-bindings: net: dptel,dap8211r: add led nodes
Date: Fri, 13 Nov 2026 14:05:43 +0300
Message-ID: <20261113110546.173624-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113110546.173624-1-a.shimko.dev@gmail.com>
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
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

Document the optional "leds" node supported by the dap8211r phy.

The phy exposes three configurable led outputs, each of which can be
assigned a color, a function and a default trigger.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 .../bindings/net/dptel,dap8211r.yaml          | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
index 4cd0f9730d95..43425fc8e96e 100644
--- a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
+++ b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
@@ -20,6 +20,7 @@ description: |
     - IEEE 802.3az-2010 Energy Efficient Ethernet
     - IEEE 1588 SyncE support
     - Internal packet generator and checker for link diagnostics
+    - Three configurable LEDs (link, speed, duplex, TX/RX activity)
 
 allOf:
   - $ref: ethernet-phy.yaml#
@@ -28,6 +29,22 @@ properties:
   compatible:
     const: ethernet-phy-id0008.011b
 
+  leds:
+    type: object
+    description:
+      Optional node describing the three configurable LEDs of the PHY.
+      Each LED can be assigned a color, function and default trigger
+      (e.g. "netdev" for link/activity indication).
+    patternProperties:
+      '^led@[0-2]$':
+        type: object
+        properties:
+          reg:
+            maxItems: 1
+        required:
+          - reg
+        additionalProperties: true
+
   reg:
     maxItems: 1
 
@@ -49,6 +66,8 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/leds/common.h>
+
     mdio {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -58,5 +77,24 @@ examples:
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


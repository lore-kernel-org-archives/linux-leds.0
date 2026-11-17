Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915884;
	b=M9ERoM9fvDGObk8BzwagLrMwDJ1G4QWVsazgC8MEO1qLe0DJ6JW2amJSHszRYd2VKbb7
	 KE1Lzb5IzHhzYC5diuTPkLY79COnlXLVVK3I34y1zFGU2uvAsfjD8g87B7DN5wvNUU16h
	 i8+rJ1b1x7ipCO214pnrrican3+83H5sUfgD4uS/vUhvJs1E0Rc+oLtcNBS2zGv/Vtdcg
	 o8M0D+owHiXr0g3NJgj3gxpZdt+bw7+FRRh/XmwHnFs8EsgDZ5pQLD6V9Q+9V/hI08CDJ
	 +O4I+S1v8P1zGW5KnZR0hJMq95XzsDZ1TLjWm++xek92HZVBx4VNg046EGutViGc7pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
	b=k++yXr8apQnsEcSm4m7exnd7tgfKXUeQKgd4vHoahvH7RWY3eZwN04SkAkMIlUXekuMj
	 mn0DkTnHOxIxnlbuLGVvdRB6e0FWKsTJd2YVehrFswib+bTv305Kql++vl8ShhJ4CbsFP
	 VZF1TtjCGJ85o0oBnQAS0fq6UVcYHV+yGAkm3RMyxRSXZ+x2FAwxuPpmZ4VKMxF91C5ph
	 Jy1ncubBolVN1a54zWWouXr2VIJafy0bkHhiXVVHe+vW+qGyJrCAJh5hF21aMsALphDT7
	 fWvNHSgTCu/Mzy8fZn/CO/oBVEYgtbEw13mruij+GEf8JKAweyPGV5HsHUlB5QdBJJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=teAlEZjB;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DF5606A88D
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 11:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46DF5606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=teAlEZjB
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c1479be604so528781e87.1
        for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 03:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794915882; x=1795520682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
        b=teAlEZjBHBOFG30c6jnESNVtx0dR+W7j/m6jBabIrj9T8QM78LmH+y7T2ZjbwACBR/
         WUxAffwVO+DBtGlcW9ZJ/66HIB5qLhaz/QUhllkd9YwUFFfbthoSp1PFjOph/4GyPzJ3
         GL+/yXmsuQ06TfLgAfx9pQDO4Z6bGTSmHIVWKpsLb9yj23esozVAB4Xul8AjWSkoAPJd
         HF7Pa8dlJrlKuzEdopGxYz5h+rd2MGyULvgM176kJ9fEHnPW2yVopR6q/472n72vsgYb
         UPkf+rH5dLC5jYST74IqM67p3DuZXARFVl0ztSL75fOOKOPSj+vNrBbo8pCOnxNpQP1S
         ywZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915882; x=1795520682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
        b=dlywwBbENriaqh+oZ7IoyMZ8xE92W0LFP2UTYDP/nkrj1AncApRz5HI3rcwW9xPB7Q
         0iSczSdEDEHKevhVKpVz2bC7AosV9TALp/n6ujf/fJHN+IB8fdsMDaN1AdulDDRcGjf3
         MfrJLxlvqtKsKB0ep4HkYOZE/EUamg67w0KdLYZNAOI3+fjJ6uoZmitcdcATKkNfNdh+
         QKv33mm4edn72hsOe9GbMnDOfpOOAjJvuw4yO/UtSgNlDIIeSKxRhXGRAm13S5LMvvog
         YydDQVwuZGKOdZ9q0pl2N1wyw4/fNIxluYf+BnDw0NBuyMsiPzsn6FzJ9u0HfhnGKvM6
         /JYg==
X-Forwarded-Encrypted: i=1; AL+hErF7OOzK2nFKVUJem6VriUN91wszyW4q2Q1wRvdjOqJu6+6+ChbDl9Fuvpx3IK/6vEaciLPnk5yn6KrW@vger.kernel.org
X-Gm-Message-State: APuU4Z+s8qkqGPe9mU/N2PDg6DMgBhjiBEB5xJkAyeZtXrPLizvAAcdm
	Od84goFcO3oIFfR2QFqaNPSL+3NCCox0+UejZDkisPiL/VLVX4Qdjb8+
X-Gm-Gg: AYBFou0tjyORNRf+kBwBWWBqeufGVrwdMVq+aKv7p0cVCtsIqGrl5lNFVWdlQhRPvkb
	DpuprqfA4xzELwstuqAqYF+sF4URdPH50eY/jRJGnxesa0lldtSQUajuSq9awmr9YozibcS4xsE
	Jo6NkgtqslcuITI/MD/cPbArXo9zMQCwMyyXY67fivXObK3vM35cFUasHZFyhaXoY0cRXphya/8
	paiYJDLx0ijQVQuiRwRXTg9+l69IvHmk3N/YsmR8GjGsGpwu24GCn4tbRbBB0h01qNHA1DGuMYB
	02dF2/5emiro6tOz6xL4wn+wsdQ82FyaX1XyvJnLyTEnTUw3seOymOZ8pMRWcclD4R6x7Xdaz6A
	K7LvBFx+vsQxqq8e5hT0NXhTrOMMmKN2UqDUbOyh0Wi2E/SQMcJw1DtE7MgsJSv9vUz1y084m/2
	TwwgzsB93KRgLf+pjSgLxLQJCYXBj5mysRYYFEmOZlIzIQiHRXQkF1eop+3i+FvCN0eAc/RE8KG
	C7q3ERS5jLsetGZlUoenAp6Tsbo8vVcIwqwRhD3nslgMfMyYbv93H06MKOXVPeMsrvLJ3JWCOXe
	ySN+ttCH6Td/nSeqqH7Vu7p5+ePHXEfBVMSRlk9yJMsi7Xo=
X-Received: by 2002:a05:6512:1103:b0:5bf:f7e7:85eb with SMTP id 2adb3069b0e04-5c17077ff45mr4913190e87.21.1794915882295;
        Tue, 17 Nov 2026 03:44:42 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c19f9bff4asm695635e87.56.2026.11.17.03.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:44:42 -0800 (PST)
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
Subject: [PATCH net-next v2 2/4] dt-bindings: net: dptel,dap8211r: add LED nodes
Date: Tue, 17 Nov 2026 14:44:28 +0300
Message-ID: <20261117114432.2794961-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
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


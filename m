Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4E0340411
	for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 13:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284047; cv=none; b=O/p2KjOJElPFQ4UqsJmnGNX+gO5u3poQZHB6oFaBV7QyI2DwfD9oxOIEnjP43vs+tWnZ0Xeb3P19Cfl6m8vkeSjvCOqQg0VxXzRuppOvFoDIIvhKEDwjQJcb+IuEtbTZXJ/fUnaXZyh2v3FT5k3clOAEKFvrTsuXRl3ZxM4GgOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284047; c=relaxed/simple;
	bh=tqRyoaZBs1tvjQrY9z9TFd/uxGf92frpQLPL1VyfqU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZDjEm0Ue4gSXnrRAY5uCdj/fD7/MIOgHVnXnI5DhPdpuNEwvmqnQp6MUL7VAx7A7SGjLD4tFMB/nv26t8cHKQYzAb/bjW8ZrJXZ3mbnRhWqjgLGBPE36LsGwtgT0yBvfxmX+klQt506ZNyqsDUtrlADMt8ighbeWukKGFnUeYQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPo4tzNs; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPo4tzNs"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-47c7b282e21so1929025b6e.1
        for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 06:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779284045; x=1779888845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qC2QIpvU6HmG8jsTK89YMedFfyyJiHf9gc9ctAYYQYk=;
        b=PPo4tzNsDul5DO7pRhIw1LxQf5+92zFVX//XoPor7PVXP2doiPEZUNUQwxM8hQrueP
         K8RQiV5XJ+skTuwndn1Qw302UjxGDCwI56HoIVAntgAGpzK1P3mpoI44qo7EAH4IBkMI
         sGw/u3M7j+luDuO0fGC2Ls6YwUUl7e2pSiQ0tcTJIWXUhFBsZxKIYRrg9th4CwKAk2DT
         +Vzk7pgGBigZ9rxmYQP4ge45SgbRKSErRZQAgcOI8PxcWPWTzbeI4Fd8LRVHtBc3ZFJ+
         ACx2hi018O+xnbgbeCn3Ts21yPUWYYs6jTx2y9kRrT3bUX47ofZa5PYV3tzch7x2TYmB
         pfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284045; x=1779888845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qC2QIpvU6HmG8jsTK89YMedFfyyJiHf9gc9ctAYYQYk=;
        b=LeYesPBCXuEsm7+o4x/nNCvGm3YM0mtEeK50uNF1cS8ppHDBcN1wMAsL859Yla4b9s
         s5OVPdy2yBlIYaqooEWaOHjT6dMPSRTU/N5ImkE2MKPVFT4icro8PU9NOSudLLU/IXl+
         2Kuq2FY3wiZthRU8JOt9SJaBt9UyQJb1lNUjAkXaWACJjD6kTf5pnBS9TJu5fePV3FrR
         50UZPWjXpB5CcJPczqO9f4OlZdsFqxTHcaD3inas17ZtfoC7DeiVOSo5I6+iUV0EuhSt
         4XyzGN+id13HY1swctW4YIAok9+OifzGkM1ie7tViTDqWR839VRJzN/yIvf3E1Vh8xNc
         XvDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+sZr/Z0qYamUJdR/fLwUk10ZkvLcBT4XTz/UFHFbK6iBP/10noHxhQCJxWrJ+i7I6YHbgq/Rsxc/w2@vger.kernel.org
X-Gm-Message-State: AOJu0YwOYqvWoGeiZhk9uzjkHfPQMK8uAwgv8OpZDpzxoXgr7PFKYfCX
	dMy5x/QlDndHPUORivywJYdzDkeKnN7axrm81N9KmY8EZ9SMj250py91
X-Gm-Gg: Acq92OF6OZ9l7ZJs0jlpTSTlzIEwZYyqLuG0IfxDY9B9SOGodaa+OF9fm4/+53uUeOl
	rgilk2jsjc8m5WS6ewgYkk05ZcRfzK12q0f+vcmvW1mmlOPu+UV27GyeIoN87A3BmsylRM+NrSX
	ealAQAjgnHDKTNc65labwnHRfka85wD0ypIdjJgSVy0uYI0mqyVbvueOv/IAiGhxH0Z6slcVWtX
	lcKjXP+Ojx19a8WdO5ic7XR9VazTygVcOtCUiPV2zyuHECfl3MbcIFgFcliLOnrnXUHkk0zCn8e
	aokjnSQD5UGJOHwiqcNd9EnaAmViyGpqGTLRxWDQui8TGwIG9M0IQ6JCwseYHVwNET18JhWH/1G
	Ffa4zyViiOWrmSfgGdoZOdNiagpgErK9El6x+Q8xgi+KBDnhOlDl1X1Wu8UkbWNsqX/GTBZuL6p
	mI87vtv13tYejjUBlW+V7DQthodwcfuoHFMk5S35NDxcv2kMsL0g==
X-Received: by 2002:a05:6820:20e:b0:67c:1e60:3e90 with SMTP id 006d021491bc7-69c94331f33mr15734192eaf.6.1779284045276;
        Wed, 20 May 2026 06:34:05 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:5b11:a58f:5208:2fa7:bba5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a956fa075sm10253951fac.10.2026.05.20.06.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:34:05 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v6 2/6] dt-bindings: leds: issi,is31fl32xx: add support for is31fl3236a
Date: Wed, 20 May 2026 21:33:39 +0800
Message-ID: <20260520133343.1423946-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520133343.1423946-1-jerrysteve1101@gmail.com>
References: <20260520133343.1423946-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an additional and optional control property for setting
the output PWM frequency to 22kHz that exists on is31fl3236a.
The default is 3kHz and this option puts the operational frequency
outside of the audible range.

Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/leds/issi,is31fl32xx.yaml        | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
index 81f1e30e493d..5f22d8b77edd 100644
--- a/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
@@ -21,6 +21,7 @@ description: |
     https://www.lumissil.com/assets/pdf/core/IS31FL3218_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3235_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3236_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3236A_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3293_DS.pdf
 
 properties:
@@ -30,6 +31,7 @@ properties:
       - issi,is31fl3218
       - issi,is31fl3235
       - issi,is31fl3236
+      - issi,is31fl3236a
       - issi,is31fl3293
       - si-en,sn3216
       - si-en,sn3218
@@ -37,6 +39,12 @@ properties:
   reg:
     maxItems: 1
 
+  issi,22khz-pwm:
+    type: boolean
+    description:
+      When present, the chip's PWM will operate at ~22kHz as opposed
+      to ~3kHz to move the operating frequency out of the audible range.
+
   "#address-cells":
     const: 1
 
@@ -60,6 +68,22 @@ patternProperties:
       - reg
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - issi,is31fl3216
+              - issi,is31fl3218
+              - issi,is31fl3235
+              - issi,is31fl3236
+              - issi,is31fl3293
+              - si-en,sn3216
+              - si-en,sn3218
+    then:
+      properties:
+        issi,22khz-pwm: false
+
   - if:
       properties:
         compatible:
-- 
2.54.0


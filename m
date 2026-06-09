Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC37481ABB
	for <linux-leds@vger.kernel.org>; Tue,  9 Jun 2026 18:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781029397; cv=none; b=J0mP7Q/vOQHX/e4m3TKguKUjZjhxz8n347/jIe6y6EisHMt7BN2Xir14GDX40yLdD/VlbHnnD7xYQo89/a0elnYn7KABDnGhgdjG/pdCouJhP8wbjbGYUJ5USuwKxntQQpN/OjjVguE76zcyHbTRl+gusLX40gtWQ4ICcZUsIQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781029397; c=relaxed/simple;
	bh=jS73l8ZPEadDtpuBKIkNYTrDKaEL2P2VVxQ/333SYxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cvBZcVDpcbphOMXLM+AS2ua9b8OrhWyWpEwWiMNCDjVzTFw9zPIUY6Dr4WquWnWiNGJ+QoITjx0wx+80VMCEHQStAyrZ9fW7Ql5egKouhS7rq+MAfPFD6+OCTL3dEnolfIHgaWDcnwIXCXi3e6fGLdWzXtzRb1cXBDGqs3p9974=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0fWavgy; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0fWavgy"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36bcf3d2565so4211301a91.3
        for <linux-leds@vger.kernel.org>; Tue, 09 Jun 2026 11:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781029395; x=1781634195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5yOK2OmpxELpIU8FfMiRQLGMlc8197Q+PjU02X23WEs=;
        b=c0fWavgyuyoStlbWSOZhGG6sbZ+XTuqYLD1UoIoMsX7unC7udaPmZmQZedy7iDL1MM
         QVKqwRE2AG2Gq0Nvj7r5dpwHc1IT07c/qNdehWlrb2jZ5AjSCoBkIwhinC2v8EPQ9S4Q
         pYn55vyx1l75a974AUnnazsG1InYQoQmfbC9Ele6v5bji9E50wLs00fQwZuGLjgfF8sR
         8GObpM2NZlvrr5qc3/9aZV3+PjIg5Bs8QM9ca6LCjxbnash0ayysp8L+eUVoO1LdQ4wX
         rxxqXorytF15C15ZaZb9yY0alFBnGzFeU1D9SJQ6fZdJne9xFyNLhwlupc4hbW41xM61
         JGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781029395; x=1781634195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5yOK2OmpxELpIU8FfMiRQLGMlc8197Q+PjU02X23WEs=;
        b=l01jhGS97kl3qh5hLzBB0Su/Pikr/l3WM+miGjFAnaT+tdQFhVWok9JQ07O/ycKIl7
         MZvBQh2LALB73faTMWdKGkSnL5rYuuGCMGrhyttQCV4kboTmttLwZqeIAtumx3CqxPjl
         xHgdOkuZCn2LNt8gaOTtEng+7hYszp4bL+W4QzPlece57VR0utAxSVKKxAzvJLdIz5Gl
         DNAQlsD+cnT7btzyh4q+wmlwnGyoHUew4vv8Ore111Rfoi0488w7XvI5GaanXV5tDb4D
         GQKk+szXSQmZTANZiz1qqFPfpcXSaF+vFtha/I+8kJQYFQTYSVIGK6aOEoxEfEguwhNC
         hSDA==
X-Gm-Message-State: AOJu0YyQPzmHNqrwXU4u+fuiOPE31CGuLPIYX8rd6VXhhNJquwEEacrr
	XCdLlE8kG1rl6TANyje6iZfVNLPSScICVx18mRpayKKVJV/35ip6A3Mb
X-Gm-Gg: Acq92OG9LnRf5sVFEAsVMahXWYY810IMkoeRAv9hIiQiP7nuZIiARFnhyq7YfalldCN
	N6k2KV8f3kGV9K5r7moH3sgaqTP6Vi26MoZkqdKRCfF3aMz70f8g1NNEQwiTEW5EDFQBpkk0rmD
	zHxpG3XjbD3mV0TRMiHfFDtNchh19aHN+2IdWGrRJox6tVoODkvYUO+cwh25+VoIsaBgQ0WZGJ4
	BmrfeCB024B9Mo4igMaSx7kcbziCvo9z0X5QtAMuKLEsO7kCjkXoJmiZ91oYfDBpO+kyBsxdYfn
	Gp58ueSpP1w5+MuH4juPkxNunUo5G6lYMHNmcAwWA8hRYWIhGOJmSBlBu4d/vfFgx2gFSEy0mEQ
	UoQKv5d0drC2lhR2lmer9BxUWfUdk4+6GMZPX2u1q5CvxmAwT+iNPRIRWa6wEKRlQ8PN5d81QJu
	a+spwIfGsre8enQfgdFNmezjjNmcNeMdM2fOR8mYTzJiPlf1XjbfcLlrYiGYyoPCR3f83RHAlhz
	WxuCiQXcgIE5mM6IAQ=
X-Received: by 2002:a17:90b:1a86:b0:36b:91a3:6af3 with SMTP id 98e67ed59e1d1-370eeb174e9mr21556483a91.7.1781029395432;
        Tue, 09 Jun 2026 11:23:15 -0700 (PDT)
Received: from fedora ([103.181.54.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d69csm218805815ad.2.2026.06.09.11.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:23:15 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jonas.gorski@gmail.com,
	noltari@gmail.com
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH v2] dt-bindings: leds: bcm6358: Convert to DT schema
Date: Tue,  9 Jun 2026 23:47:01 +0530
Message-ID: <20260609181731.1379846-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert the brcm,bcm6358 to DT schema.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
Changes in v2:
- Modify the maintainers list.
- Add maxItems: 1 and removed minimum and maximum in reg property.
- Explicitly list the properties: label, default-state, linux,default-trigger
  and active-low
- Change unevaluatedProperties: false to additionalProperties: false

 .../bindings/leds/brcm,bcm6358-leds.yaml      | 105 +++++++++++++
 .../devicetree/bindings/leds/leds-bcm6358.txt | 143 ------------------
 2 files changed, 105 insertions(+), 143 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-bcm6358.txt

diff --git a/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml b/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
new file mode 100644
index 000000000000..1b586a0c27b7
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/brcm,bcm6358-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LEDs connected to Broadcom BCM6358 controller
+
+description: |
+  This controller is present on BCM6358 and BCM6368.
+  In these SoCs there are Serial LEDs (LEDs connected to a 74x164 controller),
+  which can either be controlled by software (exporting the 74x164 as spi-gpio.
+  See Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml), or
+  by hardware using this driver.
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+
+properties:
+  compatible:
+    const: brcm,bcm6358-leds
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  brcm,clk-div:
+    description: SCK signal divider.
+    default: 1
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 4, 8]
+
+  brcm,clk-dat-low:
+    description: Makes clock and data signals active low.
+    type: boolean
+
+patternProperties:
+  "^led@(0|1?[0-9a-f])$":
+    type: object
+    $ref: common.yaml#
+    description: Each LED is represented as a sub-node of
+      this device.
+
+    properties:
+      reg:
+        description: LED pin number (0 to 31).
+        maxItems: 1
+
+      label: true
+
+      default-state: true
+
+      linux,default-trigger: true
+
+      active-low: true
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+    led-controller@fffe00d0 {
+        compatible = "brcm,bcm6358-leds";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0xfffe00d0 0x8>;
+
+        led@0 {
+            reg = <0>;
+            active-low;
+            label = "white:alarm";
+        };
+        led@2 {
+            reg = <2>;
+            active-low;
+            label = "white:tv";
+        };
+        led@3 {
+            reg = <3>;
+            active-low;
+            label = "white:tel";
+        };
+        led@4 {
+            reg = <4>;
+            active-low;
+            label = "white:adsl";
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/leds/leds-bcm6358.txt b/Documentation/devicetree/bindings/leds/leds-bcm6358.txt
deleted file mode 100644
index 211ffc3c4a20..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-bcm6358.txt
+++ /dev/null
@@ -1,143 +0,0 @@
-LEDs connected to Broadcom BCM6358 controller
-
-This controller is present on BCM6358 and BCM6368.
-In these SoCs there are Serial LEDs (LEDs connected to a 74x164 controller),
-which can either be controlled by software (exporting the 74x164 as spi-gpio.
-See Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml), or
-by hardware using this driver.
-
-Required properties:
-  - compatible : should be "brcm,bcm6358-leds".
-  - #address-cells : must be 1.
-  - #size-cells : must be 0.
-  - reg : BCM6358 LED controller address and size.
-
-Optional properties:
-  - brcm,clk-div : SCK signal divider. Possible values are 1, 2, 4 and 8.
-    Default : 1
-  - brcm,clk-dat-low : Boolean, makes clock and data signals active low.
-    Default : false
-
-Each LED is represented as a sub-node of the brcm,bcm6358-leds device.
-
-LED sub-node required properties:
-  - reg : LED pin number (only LEDs 0 to 31 are valid).
-
-LED sub-node optional properties:
-  - label : see Documentation/devicetree/bindings/leds/common.txt
-  - default-state : see
-    Documentation/devicetree/bindings/leds/common.txt
-  - linux,default-trigger : see
-    Documentation/devicetree/bindings/leds/common.txt
-
-Examples:
-Scenario 1 : BCM6358
-	leds0: led-controller@fffe00d0 {
-		compatible = "brcm,bcm6358-leds";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0xfffe00d0 0x8>;
-
-		alarm_white {
-			reg = <0>;
-			active-low;
-			label = "white:alarm";
-		};
-		tv_white {
-			reg = <2>;
-			active-low;
-			label = "white:tv";
-		};
-		tel_white {
-			reg = <3>;
-			active-low;
-			label = "white:tel";
-		};
-		adsl_white {
-			reg = <4>;
-			active-low;
-			label = "white:adsl";
-		};
-	};
-
-Scenario 2 : BCM6368
-	leds0: led-controller@100000d0 {
-		compatible = "brcm,bcm6358-leds";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x100000d0 0x8>;
-		brcm,pol-low;
-		brcm,clk-div = <4>;
-
-		power_red {
-			reg = <0>;
-			active-low;
-			label = "red:power";
-		};
-		power_green {
-			reg = <1>;
-			active-low;
-			label = "green:power";
-			default-state = "on";
-		};
-		power_blue {
-			reg = <2>;
-			label = "blue:power";
-		};
-		broadband_red {
-			reg = <3>;
-			active-low;
-			label = "red:broadband";
-		};
-		broadband_green {
-			reg = <4>;
-			label = "green:broadband";
-		};
-		broadband_blue {
-			reg = <5>;
-			active-low;
-			label = "blue:broadband";
-		};
-		wireless_red {
-			reg = <6>;
-			active-low;
-			label = "red:wireless";
-		};
-		wireless_green {
-			reg = <7>;
-			active-low;
-			label = "green:wireless";
-		};
-		wireless_blue {
-			reg = <8>;
-			label = "blue:wireless";
-		};
-		phone_red {
-			reg = <9>;
-			active-low;
-			label = "red:phone";
-		};
-		phone_green {
-			reg = <10>;
-			active-low;
-			label = "green:phone";
-		};
-		phone_blue {
-			reg = <11>;
-			label = "blue:phone";
-		};
-		upgrading_red {
-			reg = <12>;
-			active-low;
-			label = "red:upgrading";
-		};
-		upgrading_green {
-			reg = <13>;
-			active-low;
-			label = "green:upgrading";
-		};
-		upgrading_blue {
-			reg = <14>;
-			label = "blue:upgrading";
-		};
-	};
-- 
2.54.0


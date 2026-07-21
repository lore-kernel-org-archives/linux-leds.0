Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E85470102
	for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2026 19:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784662172; cv=none; b=RUFn2uhivFSFXHhtfdR2EzOH2R+dxo/AfCBL/TzP/pMmvlgylEip3JSl9gpBfXVApHb8tpK+dOTFVwBT8rYlp2k/ZOChhP5fpHK7ZiS1C5mGtigeFPqDqWV2WWjipfAdZj1S6KyX3/w7kLjluNCjfS5RXsIFD6c+kyN95f2X0io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784662172; c=relaxed/simple;
	bh=5uHrJY3HeWlIs8TynVILl3KyFkLfOhYuUo74OAadzzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MsO6a9iQ9kiAW9f52sOeueDH0S3nTuVZb4BHbuJGjnPgK+RrvcgTWDcVWpQjyEr17PrR9dafyODCkQDc61EGszEPZhMGvHMfiZLasKR3AhyOJr0vyq5ILK9IA4vz13oEgTuko0Rc4ZuK6ibWDVenBvCFM2JUKaSUXRKtmmANha0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZBen4NA; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZBen4NA"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cf27856f9cso64663285ad.2
        for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2026 12:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784662170; x=1785266970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=748lzqKN3J88b3BEuBiWg6WchFFUdy2hlfv06NfZifk=;
        b=ZZBen4NAc6oARBow/vHmuiQ1kEhttkgQfiS+3/GBzFzXV7ihRdaWwDefeefXgQi6mY
         w4Wc0E5vzTXRa6GXb0XhUUyVi5Mh6viHSt0Pg8CgOJWKVqM/pVynHKg2r+r55+728ob5
         LgGs8acZNmpFu3f2+AMen/glx8gGtwkTTQy3q9RzPexjyyND+vTI8oZNfae8dvMnpWPG
         O4t8QMSCKePsUKn82t+RZu3jxSr7Ki/A/hYR0gEmK8+CUvzlUtbl3aiPaIm79umPmyOE
         C592ZQNn/6C+T9pQND/NVGH6C/kPX3UqDBamjTzoCVUEn7JlQ0Z/zzq69KTSNlHeNxAG
         Ku+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784662170; x=1785266970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=748lzqKN3J88b3BEuBiWg6WchFFUdy2hlfv06NfZifk=;
        b=eUb/TRAX/aCwkd/HwEkKkuC+TDf1P6tJ3cEDbhAERIGKIsglfFRlRIvDkVFE/MsfHi
         QcyVk2akBbQaeCqU3ka4uVd2p8RyYcqQvnw16L3xxlztSCg4l1WYkdXGUfor7hmQDUCh
         OKQgoK+U5TvtcI8kJcAxNWP/d36c9CMaUUogDYqSrDQxp2J24fAJLyVMdguUAMGnzPD5
         0yomqGuYtEim37x4dzagJXRTMjGSm4ziq+DTAhZAvtocouW9yTWBFCIXlmO0tR+QQN+d
         58HxXpnBnOg1v0SBOBB9UEpMF40WT3F4lRShdx5wBRzjXrEHtcgOgUImrMi28SqfvhKG
         kH6A==
X-Gm-Message-State: AOJu0Yyn577SwTInA7zrAoeRFr9ir4UJlj+gQXfVRJn8C/NR+clABXYA
	O0f2LYmMTELnp3ApNt036AU8tu7F9TJFdokB7UwNkweD4rP8UmKeC1Q6
X-Gm-Gg: AR+sD10bEGI9ChqHzg5kA0rwO4pDVfEIrklpS8QGQMdmkeg7Fo3CxOveoYDzxHmxXAv
	vUKg+6Dwzq3hYeimkyaqlhrCLhr6/FAWVrQM7QpqPQ26H+vuHbJbtKnBxZqXb9Tb/LULEuB3heg
	4Bw1PZQkB8tmcO+5Sm/hMVaHINZwrSLOUTjaw1X84e3hXMQUrDADxhMuxnpvt8Tu2CxPE4YDecm
	Ii74J968A7TKBvel7OMJpzSdSsl79x1CyqBBuSNgkgZXMmwb3tvfxra5Dl8b7SvB486uRL2EEGE
	ftxOk2+xgCbHycNW++R9ecwIf8gktieIPrjgF2cutwf0XOWRManFD/04QiIGfBJglTA8Fzni84B
	Teqp+tOdunWSrjpLfNEAtHiDQgQDsaSp5miUMZLZqFEl7d81KCL/omFLUSjqgosQN3GnNO/9o2i
	Q/VzJUzxtwYszFw1sfypXodcAKwu3hLJLLpAdQ2oqlcbDd21FUuxF+mnSQ4msXfGoNN/Bw3Metz
	ZKAekMUS9E92eLntghzUaG2/Ktdc3W3mllH/1iB4q8xjpuXG5en
X-Received: by 2002:a17:902:d4cc:b0:2c9:e9db:8167 with SMTP id d9443c01a7336-2cf348193f5mr215886905ad.7.1784662169923;
        Tue, 21 Jul 2026 12:29:29 -0700 (PDT)
Received: from localhost.localdomain ([202.179.95.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e07000fsm3063164eec.21.2026.07.21.12.29.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Jul 2026 12:29:29 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	simon.guinot@sequanux.org
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH v2] dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
Date: Wed, 22 Jul 2026 00:57:54 +0530
Message-ID: <20260721192754.46344-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert lacie,ns2-leds to DT schema.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
Changes in v2: 
- Change maintainers from the subsystem maintainers to Simon Guinot. 
- Drop "|" from the description field and update the description. 
- Remove patternProperties field and instead use additionalProperties.

 .../bindings/leds/lacie,ns2-leds.yaml         | 80 +++++++++++++++++++
 .../devicetree/bindings/leds/leds-ns2.txt     | 35 --------
 2 files changed, 80 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-ns2.txt

diff --git a/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
new file mode 100644
index 000000000000..1976669d2218
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/lacie,ns2-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dual-GPIO LEDs found on Network Space v2 (and parents)
+
+maintainers:
+  - Simon Guinot <simon.guinot@sequanux.org>
+
+description:
+  The Network Space v2 dual-GPIO LED is wired to a CPLD. Three different LED
+  modes are available, off, on and SATA activity blinking. The LED modes are
+  controlled through two GPIOs (command and slow), each combination of values
+  for the command/slow GPIOs corresponds to a LED mode.
+
+properties:
+  compatible:
+    const: lacie,ns2-leds
+
+additionalProperties:
+  type: object
+  $ref: common.yaml#
+  unevaluatedProperties: false
+
+  description: Each child node represents a single LED
+
+  properties:
+    cmd-gpio:
+      maxItems: 1
+      description: GPIO connected to the command LED output
+
+    slow-gpio:
+      maxItems: 1
+      description: GPIO connected to the slow LED output
+
+    modes-map:
+      $ref: /schemas/types.yaml#/definitions/uint32-matrix
+      description:
+        A mapping between LED modes (off, on or SATA activity blinking) and
+        the corresponding cmd-gpio/slow-gpio values. All the GPIO values
+        combinations should be given in order to avoid having an unknown
+        mode at driver probe time.
+
+      items:
+        items:
+          - description: LED mode
+            enum: [0, 1, 2]
+          - description: Command GPIO level
+            enum: [0, 1]
+          - description: Slow GPIO level
+            enum: [0, 1]
+
+  required:
+    - cmd-gpio
+    - slow-gpio
+    - modes-map
+
+required:
+  - compatible
+
+examples:
+  - |
+    #include <dt-bindings/leds/leds-ns2.h>
+
+    led-controller {
+        compatible = "lacie,ns2-leds";
+
+        led-0 {
+            label = "ns2:blue:sata";
+            slow-gpio = <&gpio0 29 0>;
+            cmd-gpio = <&gpio0 30 0>;
+            modes-map = <NS_V2_LED_OFF  0 1
+                         NS_V2_LED_ON   1 0
+                         NS_V2_LED_ON   0 0
+                         NS_V2_LED_SATA 1 1>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/leds/leds-ns2.txt b/Documentation/devicetree/bindings/leds/leds-ns2.txt
deleted file mode 100644
index 9f81258a5b6e..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-ns2.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Binding for dual-GPIO LED found on Network Space v2 (and parents).
-
-Required properties:
-- compatible: "lacie,ns2-leds".
-
-Each LED is represented as a sub-node of the ns2-leds device.
-
-Required sub-node properties:
-- cmd-gpio: Command LED GPIO. See OF device-tree GPIO specification.
-- slow-gpio: Slow LED GPIO. See OF device-tree GPIO specification.
-- modes-map: A mapping between LED modes (off, on or SATA activity blinking) and
-  the corresponding cmd-gpio/slow-gpio values. All the GPIO values combinations
-  should be given in order to avoid having an unknown mode at driver probe time.
-
-Optional sub-node properties:
-- label: Name for this LED. If omitted, the label is taken from the node name.
-- linux,default-trigger: Trigger assigned to the LED.
-
-Example:
-
-#include <dt-bindings/leds/leds-ns2.h>
-
-ns2-leds {
-	compatible = "lacie,ns2-leds";
-
-	blue-sata {
-		label = "ns2:blue:sata";
-		slow-gpio = <&gpio0 29 0>;
-		cmd-gpio = <&gpio0 30 0>;
-		modes-map = <NS_V2_LED_OFF  0 1
-			     NS_V2_LED_ON   1 0
-			     NS_V2_LED_ON   0 0
-			     NS_V2_LED_SATA 1 1>;
-	};
-};
-- 
2.55.0


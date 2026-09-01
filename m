Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BC7472085
	for <linux-leds@vger.kernel.org>; Tue,  1 Sep 2026 17:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282282; cv=none; b=PtHDOIheTbiMfscMy8E/L3Md5sVXxKerPQRECCnDpYqj/U6cewWpnLtnuOq69qdRWu0dsN7zrHbXy4r3Kdon5JDH1YhHcqGmRYbWtW5XqsX5TZQ22vdMZ4ccwEeqiE7ERUHnU2mnn5oPbHdVyu/i5ckqGXp4bKpLQGAPUpwCCtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282282; c=relaxed/simple;
	bh=1X/qnV8vzg9tJPFlS6BMkOFMp3DyOY/TrtNCEvo4TAE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n/+QavepJVKMAK+e3FCVIXO0wunYI8GCaWBwA/F+477/Mf4QLnQ5IY9nmTywTZxi6QBXkpepkaih9UWYfpMX0g7xgsuyyb021wenIdAnttwL1ZQpNWFUb/fo0qeRxDrfpqQAxFVNMKnG6FwEFMw6yO2lXKsigLnphmY8rvVfrWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o7oUPXAF; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o7oUPXAF"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d944747d41so227265ad.0
        for <linux-leds@vger.kernel.org>; Tue, 01 Sep 2026 10:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788282280; x=1788887080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWnlK88LsKs7/tUdroGlxm7SknJObd+rEmQrujEmjq0=;
        b=o7oUPXAFV8WedSg5bR9Tp4xVp4I+77ykHBqL+q8Kw0oL8/S7QEC+J29Hi8fEsMN7GY
         EmSJTQ0qFiY9kTcV+Ju4JE6IYjPj393C4AiDfgOtHFZOdRPhi2t2nh0a+3vZNSsfT5bz
         0LBThDSydiITC0Ltkk73MlYO5QzOpQraSYrDlWTBDDx3zvcf6bDbIEmNM6dhXlHnXXIb
         ZLhXtvCKuk/ykCQCgx3tDN9DsJ1fmA9KWtFGXPSmxy0EHvhIXvHaAJMwgXcLfn9WSoxF
         HCMHOMznTt/TUB0qTQK+pAWV5bUW4kUmnQRnEuXLimUe2BKxwY+YqzDjo/99Zz04e2xf
         pLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788282280; x=1788887080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWnlK88LsKs7/tUdroGlxm7SknJObd+rEmQrujEmjq0=;
        b=il2nOYUm+g05Lkr7J4+sXTEkZZGbKGHWFhrSHalEeOaXmH9KRGzRwy7WZtm4jg9jv2
         NSe7IfI52eEGViEdSu0IBiAVjf1hpP+zutlkDV/iPDL2zuC996kmh6ypzPAbfMF/qDkL
         AiXLU+ijxVp+6JA/L7F3CD7c1Gy4I3h0CnZM8jlOT9fsAceu258Suf2l0lA+taU1W6aV
         ABbIST9d4OPNS46GbIP8BsvC0afmpUMYbLQP6n5ed90JJbRQ1+3fASGUbI2ykvsLiiPN
         Z2Lnd/7ZJa8ms7qyyBiedNl/aEBKQVEntcyFh6JGbjQFB8h09b5l0N9v9efIeAoY4xlF
         d6pg==
X-Forwarded-Encrypted: i=1; AKwUvBx0QNeC6e0fq+rEnr9jalQJ/+XK64EUkk2q6S1h0CJMC+JcCImgZ/6VlHnZfpV2xkMBAaOzB7cBb1XJ@vger.kernel.org
X-Gm-Message-State: AFuF++mwsqetVRgcq2s6YECiU4o0Uz/GkAPA/mDK3xFCbG2XRyJrEQJP
	bwZZDlyc0QHxlB5RKE1F2cPirUrAqoQyGJToittBFX8YXli144VnWqHH
X-Gm-Gg: AYBFou3tvUzdbdT4Anaq3kd01Xenaoke5nNnQIpNh1/uRFHNn0BrgBFiDZZR7hJDsiz
	IV30iZ7koTCGdCKJnPH3K0d9Dar21TuncSmvN7kkIG0nKsRy4KDEjNlN0FaxewqRF8zuNQTAOQV
	2856mJUkWAKW3iTVLAKNpbBaZi4lZNU21/TQ5pbdlOB4gXWWy6RSxIfWoRmgetO55NKL1zsKhUn
	H+kn5/IVHQqkzXHyKZnY2t4FHiZeu8r5Zm5ZQESuHLYfxJB29yePg7vMgmHxVHsumfZ9UNzPvI3
	0z3tOPTWgPt2Vr9PnGTMKenOVIM849KxIHjST6jeiRbuZV9H8TdRBMSSnEizSE3Sjyg0XhhnAL5
	wS3rZdvUu83+SOXP0Iz4w5QUeU/TCdnJba2EVqeGAPN8nGqhOmYa9yUQ6wx+AFOidPYrl8qpogh
	BpQuCusqMOb5jdFXoHsTfdKBopX3ZoW2098SEpJORntaWsfI6heTcTZlPjDaeEXOc1eHcG2nzE8
	GepduA=
X-Received: by 2002:a17:902:e54e:b0:2d9:2ff6:2497 with SMTP id d9443c01a7336-2d92ff6258fmr185049165ad.13.1788282279845;
        Tue, 01 Sep 2026 10:04:39 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([2406:b400:53:5146:59ac:3f4b:833e:8027])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b26fd7edbsm29492199eec.5.2026.09.01.10.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:04:38 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH v3] dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema
Date: Tue,  1 Sep 2026 22:33:58 +0530
Message-Id: <20260901170358.176103-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert lacie,netxbig-leds devicetree binding from legacy
text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:
Changes since v2:
- Add reference to led common.yaml
- Drop type for all common properties

Link to v2:https://lore.kernel.org/all/20260821123723.198286-1-challauday369@gmail.com/

Changes since v1:
- Use pattenProperties for LED child nodes instead of additionalProperties
- Explicitly list the two optional properties supported by the binding
- Place the top-level required block after child-node definition

Link to v1:https://lore.kernel.org/all/20260820150223.108374-1-challauday369@gmail.com/
---
 .../bindings/leds/lacie,netxbig-leds.yaml     | 139 ++++++++++++++++++
 .../devicetree/bindings/leds/leds-netxbig.txt |  92 ------------
 2 files changed, 139 insertions(+), 92 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-netxbig.txt

diff --git a/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml b/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
new file mode 100644
index 000000000000..5cb2eaf74d1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
@@ -0,0 +1,139 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/lacie,netxbig-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LaCie/Seagate netxbig CPLD LEDs
+
+maintainers:
+  - Simon Guinot <simon.guinot@sequanux.org>
+
+description: |
+  Binding for the CPLD LEDs (GPIO extension bus) found on some LaCie/Seagate
+  boards (Example: 2Big/5Big Network v2, 2Big NAS).
+
+properties:
+  compatible:
+    const: lacie,netxbig-leds
+
+  gpio-ext:
+    description: Phandle for the gpio-ext bus.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  timers:
+    description: |
+      Timer array. Each timer entry is represented by three integers:
+      Mode (gpio-ext bus), delay_on and delay_off.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+patternProperties:
+  "^(?!gpio-ext$|pinctrl-[0-9]+$)[a-z][a-z0-9]*(-[a-z0-9]+)+$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      label: true
+      linux,default-trigger: true
+
+      mode-addr:
+        description: Mode register address on gpio-ext bus.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      mode-val:
+        description: |
+          Mode to value mapping. Each entry is represented by two integers:
+          a mode and the corresponding value on the gpio-ext bus.
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+
+      bright-addr:
+        description: Brightness register address on gpio-ext bus.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      max-brightness:
+        description: Maximum brightness value.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+    required:
+      - mode-addr
+      - mode-val
+      - bright-addr
+      - max-brightness
+
+required:
+  - compatible
+  - gpio-ext
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/leds-netxbig.h>
+
+    netxbig-leds {
+        compatible = "lacie,netxbig-leds";
+
+        gpio-ext = <&netxbig_gpio_ext>;
+
+        timers = <NETXBIG_LED_TIMER1 500 500
+                  NETXBIG_LED_TIMER2 500 1000>;
+
+        blue-power {
+            label = "netxbig:blue:power";
+            mode-addr = <0>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 1
+                        NETXBIG_LED_TIMER1 3
+                        NETXBIG_LED_TIMER2 7>;
+            bright-addr = <1>;
+            max-brightness = <7>;
+        };
+        red-power {
+            label = "netxbig:red:power";
+            mode-addr = <0>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 2
+                        NETXBIG_LED_TIMER1 4>;
+            bright-addr = <1>;
+            max-brightness = <7>;
+        };
+        blue-sata0 {
+            label = "netxbig:blue:sata0";
+            mode-addr = <3>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 7
+                        NETXBIG_LED_SATA 1
+                        NETXBIG_LED_TIMER1 3>;
+            bright-addr = <2>;
+            max-brightness = <7>;
+        };
+        red-sata0 {
+            label = "netxbig:red:sata0";
+            mode-addr = <3>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 2
+                        NETXBIG_LED_TIMER1 4>;
+            bright-addr = <2>;
+            max-brightness = <7>;
+        };
+        blue-sata1 {
+            label = "netxbig:blue:sata1";
+            mode-addr = <4>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 7
+                        NETXBIG_LED_SATA 1
+                        NETXBIG_LED_TIMER1 3>;
+            bright-addr = <2>;
+            max-brightness = <7>;
+        };
+        red-sata1 {
+            label = "netxbig:red:sata1";
+            mode-addr = <4>;
+            mode-val = <NETXBIG_LED_OFF 0
+                        NETXBIG_LED_ON 2
+                        NETXBIG_LED_TIMER1 4>;
+            bright-addr = <2>;
+            max-brightness = <7>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/leds/leds-netxbig.txt b/Documentation/devicetree/bindings/leds/leds-netxbig.txt
deleted file mode 100644
index 5ef92a26d768..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-netxbig.txt
+++ /dev/null
@@ -1,92 +0,0 @@
-Binding for the CPLD LEDs (GPIO extension bus) found on some LaCie/Seagate
-boards (Example: 2Big/5Big Network v2, 2Big NAS).
-
-Required properties:
-- compatible: "lacie,netxbig-leds".
-- gpio-ext: Phandle for the gpio-ext bus.
-
-Optional properties:
-- timers: Timer array. Each timer entry is represented by three integers:
-  Mode (gpio-ext bus), delay_on and delay_off.
-
-Each LED is represented as a sub-node of the netxbig-leds device.
-
-Required sub-node properties:
-- mode-addr: Mode register address on gpio-ext bus.
-- mode-val: Mode to value mapping. Each entry is represented by two integers:
-  A mode and the corresponding value on the gpio-ext bus.
-- bright-addr: Brightness register address on gpio-ext bus.
-- max-brightness: Maximum brightness value.
-
-Optional sub-node properties:
-- label: Name for this LED. If omitted, the label is taken from the node name.
-- linux,default-trigger: Trigger assigned to the LED.
-
-Example:
-
-netxbig-leds {
-	compatible = "lacie,netxbig-leds";
-
-	gpio-ext = &gpio_ext;
-
-	timers = <NETXBIG_LED_TIMER1 500 500
-		  NETXBIG_LED_TIMER2 500 1000>;
-
-	blue-power {
-		label = "netxbig:blue:power";
-		mode-addr = <0>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 1
-			    NETXBIG_LED_TIMER1 3
-			    NETXBIG_LED_TIMER2 7>;
-		bright-addr = <1>;
-		max-brightness = <7>;
-	};
-	red-power {
-		label = "netxbig:red:power";
-		mode-addr = <0>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 2
-			    NETXBIG_LED_TIMER1 4>;
-		bright-addr = <1>;
-		max-brightness = <7>;
-	};
-	blue-sata0 {
-		label = "netxbig:blue:sata0";
-		mode-addr = <3>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 7
-			    NETXBIG_LED_SATA 1
-			    NETXBIG_LED_TIMER1 3>;
-		bright-addr = <2>;
-		max-brightness = <7>;
-	};
-	red-sata0 {
-		label = "netxbig:red:sata0";
-		mode-addr = <3>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 2
-			    NETXBIG_LED_TIMER1 4>;
-		bright-addr = <2>;
-		max-brightness = <7>;
-	};
-	blue-sata1 {
-		label = "netxbig:blue:sata1";
-		mode-addr = <4>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 7
-			    NETXBIG_LED_SATA 1
-			    NETXBIG_LED_TIMER1 3>;
-		bright-addr = <2>;
-		max-brightness = <7>;
-	};
-	red-sata1 {
-		label = "netxbig:red:sata1";
-		mode-addr = <4>;
-		mode-val = <NETXBIG_LED_OFF 0
-			    NETXBIG_LED_ON 2
-			    NETXBIG_LED_TIMER1 4>;
-		bright-addr = <2>;
-		max-brightness = <7>;
-	};
-};
-- 
2.34.1


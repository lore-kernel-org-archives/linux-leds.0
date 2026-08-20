Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B3637C90E
	for <linux-leds@vger.kernel.org>; Thu, 20 Aug 2026 15:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787238167; cv=none; b=ONAG+7QSzLff8HRFOzZuXd05Eaek1OY0pPxASiOZihvghvixmLHIvOugh9cEhCy3nFK66kYx7qRgj/t4RvHK0IGCopsvOnt2csYXxYVRo56qylFi7bLJN6xL52p2tluyWs+cIiHv6FA0bxZnC00kh7ZGHxyqw10Oxx/c5Ai2iYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787238167; c=relaxed/simple;
	bh=AE25EeEjaWGU1m2oqDoDFrdsS+1c279+IqqNRhxagKI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Giex7dVa7uTaDuCJjZrSzXdCyRTy58sNOG8GC2BmlSt2JtaTV6tLM3OLEQEtcdfRqFbmiDjyWba99GMAghUiG0canmf3SHhReH7Zf7QBVZAdPc/dhyUXwWeWEuFqLbWA0lLGWv+rn1bB+veYd9wuNVx8mrTRRr3hfwA2IetOFEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rjfLgEyr; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rjfLgEyr"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7f18c0e03e3so1325656a34.2
        for <linux-leds@vger.kernel.org>; Thu, 20 Aug 2026 08:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787238164; x=1787842964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zUq0HK7LDm2Wlhb8fJRsqKOxAYntKmHEI3XG8JYK3rc=;
        b=rjfLgEyrid5nnFIeHjikmt85ZV2weWUtlDd3OaoZTrM2ZPRA+dWt6E/SEyB81Ol8S4
         RKhWpNympE+yaeNdl8RDYAP4artAA79zgl3eeX0Bb4snTXmhHVtP9hVBU/k/c8CQnXMP
         VyKzFXvmgnwvr5pz4Tms6XCuvBJL97hflIGAdgOFmVkVwpHF1MrSOuCCpEK7gqN0RCkg
         5bwI5LFvSVEpzFFl+yFvBDUvmqHjFwWm6OGTJ9LgIbEa/tnNwEBY1CDEoRIbCTtTaCMA
         Azpr3bdvLuOtmJBBzs/QKpr+EOPxY38LwaEPmqxgCYlXPHf5ZDCbtBcVWRJD0U5jxarN
         xy+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787238164; x=1787842964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zUq0HK7LDm2Wlhb8fJRsqKOxAYntKmHEI3XG8JYK3rc=;
        b=ah86294/n5Kr8SGN82hKLD565dqnHxUs/Omx6Ld5vZwpiqOth1JX1Dk8icQjiDAGkO
         2h2vZ6LGCJUkFuyciO6LQ/M12t7N5sxTLSEF90vGffARqEj/vmz15ZJ4i/DglMyTq6uD
         /QEZcQWC63fup/NFs3JN9EMKc0dO3JwYqHxt8u9dAP30IrKdZTKDDf+P8qxEjP0BH5XF
         itcupV+UAPtzAFJNU0Py+D5rkHzifrDuAzwKtXHKQGzdYb6afc6C27+6zeZxBLhtvwOi
         oPXLKr48lBdz7UeaO2CV34b8OzkkRKEDZPU111SfKYWMJjbcv8ZOuXh6UwtYNEQTHXiM
         euGg==
X-Forwarded-Encrypted: i=1; AHgh+RoALVfNuknE6IpHbBYqALf0VB0B1DpzTlri+SAydhld2IP1LRznc/HgTQT62xsBHeNpmy+05370Y1cR@vger.kernel.org
X-Gm-Message-State: AOJu0YzHabKCl5Zjnmnr8afhaVXpQslDvYrl4YyCpg0jigZxo3RRLfki
	BtgZSCzUxTAMYyJUExOZtm0zuwLda5s88m524AvHObqY4ekLkoX/LHT1
X-Gm-Gg: AR+sD11PkWmhLFyDvE2Tnq06MxseZmcBFSjsoJwm8CnQ5slF/K+8znr3ENr5uHGfVFQ
	Fro9kKHLAvUiaHSsYo0hadrvHeRlQnNXwZiHJ2SK19waP2Fhu+gT6/KWRz66zEDW1enDYR+ZKoY
	cDqzW6CFUiIzc7PydxLtORRF2WemHCDE0ljFdBVwLugNnv7YWP5XgrGN38/Tfxr0PsIuC+zSG6r
	1NcXuZ00aYI/IoX7DmNnuV40eo+X9NXKR9Fiz91ImO5rohJe3qgtt4aTxYJ7VTFlDHJ4MfOwHM7
	aEJbS4i0KXI+Z1uMrAEC30rosvMxqDQ7Y6/0KCl0vMw7HqwKxeIQHaGP59056TtsLUz9H6ZaI7S
	5biPOcaazIllJYoHX+x5tbXOzQ5oToVm1SJ07VNy6Hbgzzacwtewbhb8AiJDOusbhvz9xayD1d4
	Gi7504PAudFY557361jyZdFXdc+n2lFbVs1cJcr4d6YUqZ6/CJD/IlJg+wHojzdPPjrT26pd2z8
	LRvBYSJhyY=
X-Received: by 2002:a05:6830:43a1:b0:7eb:9464:ac2e with SMTP id 46e09a7af769-7f43fa11176mr11894586a34.11.1787238164556;
        Thu, 20 Aug 2026 08:02:44 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([2401:4900:c11a:be2a:e6d4:534b:5f9d:7945])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f43fea8a04sm5489816a34.12.2026.08.20.08.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 08:02:44 -0700 (PDT)
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
Subject: [PATCH] dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema
Date: Thu, 20 Aug 2026 20:32:23 +0530
Message-Id: <20260820150223.108374-1-challauday369@gmail.com>
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
 .../bindings/leds/lacie,netxbig-leds.yaml     | 134 ++++++++++++++++++
 .../devicetree/bindings/leds/leds-netxbig.txt |  92 ------------
 2 files changed, 134 insertions(+), 92 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-netxbig.txt

diff --git a/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml b/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
new file mode 100644
index 000000000000..ffdd47458d24
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
@@ -0,0 +1,134 @@
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
+required:
+  - compatible
+  - gpio-ext
+
+additionalProperties:
+  description: Each child node represents a single LED
+  type: object
+  $ref: common.yaml#
+  unevaluatedProperties: false
+
+  properties:
+    mode-addr:
+      description: Mode register address on gpio-ext bus.
+      $ref: /schemas/types.yaml#/definitions/uint32
+
+    mode-val:
+      description: |
+        Mode to value mapping. Each entry is represented by two integers: a mode and
+        the corresponding value on the gpio-ext bus.
+      $ref: /schemas/types.yaml#/definitions/uint32-array
+
+    bright-addr:
+      description: Brightness register address on gpio-ext bus.
+      $ref: /schemas/types.yaml#/definitions/uint32
+
+    max-brightness:
+      description: Maximum brightness value.
+      $ref: /schemas/types.yaml#/definitions/uint32
+
+  required:
+    - mode-addr
+    - mode-val
+    - bright-addr
+    - max-brightness
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


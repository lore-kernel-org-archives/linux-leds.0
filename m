Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793044288;
	b=coh5XuKV01Bnjrl4J6zorRzdpH7WYby5XNucaGUc40DxbbhxTj6cXYcdr8b7abp8uaVR
	 XT2J2sdEXU7S8OZgDv9kAXe30ovnUKZhNGnc0dyU4hhESXgaKYG6p6YDzQOOWyZmBPiKY
	 nq37J+7D8hXEWFpK8Kt610bLotIG6wg8W6/K8+TWhRyaeXgjhI4RL7Y8vrRgwRN54Wqe8
	 JdaHdTuWYaCa+74rRvGDrYMc1f5NBquZ86YtJQaWK6HAb3PfaB9f5cwPG13eDEav9nlgW
	 zhAZyeX9a9BQVBX3wf1HSMiSxN1qXHFHg1ZL/4S2pIkhpjNtcHFhnyHqtA2IIC7fyFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RZowu2CZSoWrtBGCqSS1fXlX08mpdG8XiB36UcwU8S8=;
	b=WDzYEJnH+/zj4wMPsXWZwSQ5xuOUgZ/diQXUcPYjy8PfaBgH8D+kaLPzs79+Wc+3uReT
	 o4A6phhDphf6YfWzTVZt69F9vMG4JaTi9NKv4/fI2hpijctIx1fgyrioQJHHf9+lAp5gb
	 ZwlTGrVrCaPogxvZ6KOHhL5iu9SqPJJ7KxskfkNXjmdh9ve90Y8DL2k+6MfRNwUCGVyCf
	 wz9PDEyWGlAN7Sre3QfmYyUHrGeBjYJeTLHcKWDEkU9+40ynojjT72RGlOeFgiBQw38gC
	 QejR+QXGiWgmqx/nuMuLbexgyyE6ic3trTfYhwAzy4pXEF30T2KLQCZP43/GPr/fR6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GJj+EOMe;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C53606A32E
	for <linux-leds@vger.kernel.org>; Mon, 26 Oct 2026 19:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28C53606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GJj+EOMe
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so23184295e9.2
        for <linux-leds@vger.kernel.org>; Mon, 26 Oct 2026 12:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793044286; x=1793649086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RZowu2CZSoWrtBGCqSS1fXlX08mpdG8XiB36UcwU8S8=;
        b=GJj+EOMeAgyR3cQmT8Uu/sQpyLca+gU+lWlclg67e8kbtkVYTrhnSge8YR+D7poqvw
         PET7XQV5Jy6gG3Zsi2sFqpILlqZF8xsLwYLurJD+mZwCbOXZXqjWljZ24wXN53AVe2Ps
         o2ztpckza7lfbzt2YCmDcj5+SU3M0bimYQVPPI6VOuF96Zl8vgxq/fpI9oc+TRai0Jtl
         gmXd17KKHCRC/gqEltyxYIbDnY6Nz6ziGBxnakjhu04L+4xxbridpQysQOsq/y2tbduX
         nfZsYZ70S2LI2pRPydbILyQe/EfVtULkWsj9iD4J2eupTHLiLAmiCHmwu80rWmT7dW8E
         wVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793044286; x=1793649086;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RZowu2CZSoWrtBGCqSS1fXlX08mpdG8XiB36UcwU8S8=;
        b=GFAGztabLoLHtPt3xHQjkZ3L7YLAuIf6UBnL70r1NFGXShXmo8+PoXuTg41d3YK8rn
         0VbYWnwOVW7XKQUyoJgs+NprH2iWeWlflOKLpE0E+VOAVCzqFYL33k33qzO/3iKJ4GI/
         UMZMt0o5Y2vTXNzqdA+l/Fy2vRtKO8aF3DjxJe7uOzRLOBhWFtdgci74IseBVNz/2UWC
         1DRNs9pH6ILvmEHbCYZxQRrcSeB2vzzEU2uSr93iBNnAeAqM9FanmFkXo0Wkx5YP12rN
         JhG+rj2oIUae5QEszkPV6Gk/Tqq+sB0kv7lqutwMNdDNXCx4h3Q9HrqjHku2pQxc3ueO
         wiXA==
X-Forwarded-Encrypted: i=1; AKwUvBzBpZyLdlpbioct0tko+DKt6l5LoQjI3q0KIgAlnhS+pfJFCOvgl/BS7CQCRXvxpE354lgzpiQ/qc9e@vger.kernel.org
X-Gm-Message-State: AFq9FYJbeIQVBHCdy0/vTt766Hf6f2jq3moHT45ek7bsUyZwA6gv3HkQ
	2kIdukdypzIzkZUwURribL5YmKYjk9cqbGxrQZqaB21+pyHXh1azOOrB
X-Gm-Gg: AYBFou0q8mN2ZO0A0MIVXNlbHHlwm7ywlozIA/k1bo0YhYCODoByZicUiarMcnp9wn0
	sctN/DI4vSEDc4+OZ0jAsQa7tlG85Q8QsC08Dvu4MuEAgtS92ZNx+u6BbXxqIoDC0TfvHb71vyd
	BqSWiihRGVyLRlUUfbZF2+7aopMn58RLJXNIKzUkCwKFop9PHNj/WVgHP8TjyvYq9cQu/Eb4FiL
	kIF7bFduEWR9jlIJY1H4VeeLk4q1B7iPbW0gP2W/MKR4j94p8i7Q9mNMp8Pwd0+NlGTH4vOX3Ls
	iR3VmQnQIqXawzgAkPW2lxReRECZDpZzD83CeeSNf0edwRkkQxCJmFCMq9/pCg1pUW4F3yFWH7h
	PjUhSiBADhOdrpXEprM6SY0bQRaDUXRE2pJ3QkRS9kCqgJ26FK8Hp3UcYSnmElyF8Z7BDijahoR
	oahV1QARH7EBUUGHuMHmDrgbCRNkz0/lA06cF++popPlEuc/7+OTfHsAM4CEv4Ybb8I+HeJEH/9
	YIAsJb94mRv1iMTX545dV1xa/A2gjk1u023OmOAtPmurZGBdKkq4fjERBwm7+BwJMzbR4QU9jB1
	iSdZv3MpBd4x04zR92YsMliQ6fnKQCXXw/C+5mUkgWjUzBx7mifxS5KnYdjv3Dqz76u+FeshiYP
	K2rl8/qCso3ZflhQ9CPgfVKmE43rWSpw/Aa/ivknDJLeABysEGfW3JN0Vi21XIBSieUApISRa2i
	ehj2PS
X-Received: by 2002:a05:600c:1c03:b0:4a6:42cc:bf65 with SMTP id 5b1f17b1804b1-4a642ccc7b2mr89258385e9.17.1793044286305;
        Mon, 26 Oct 2026 12:51:26 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-8ce1-bbf6-5949-b0f3.ipv6.o2.cz. [2a00:1028:8388:a84e:8ce1:bbf6:5949:b0f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3c5bsm18877654f8f.9.2026.10.26.12.51.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 12:51:25 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Rong Zhang <i@rong.moe>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: leds: Add CZ.NIC Turris 1.x LED controller
Date: Mon, 26 Oct 2026 20:51:19 +0100
Message-ID: <20261026195120.12759-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261026195120.12759-1-pepe.schlehofer@gmail.com>
References: <20261026195120.12759-1-pepe.schlehofer@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pali Rohár <pali@kernel.org>

Add a binding for the LED controller on the front panel of the CZ.NIC
Turris 1.x routers. The LEDs are controlled by the firmware of the
CZ.NIC CPLD, which is memory mapped on the local bus.

The turris1x.dts device tree, which is part of the mainline kernel since
v6.0, already references this compatible string.

Signed-off-by: Pali Rohár <pali@kernel.org>
Co-developed-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---

Notes:
    Changes in v4, by Josef Schlehofer:
    - add Rob's Reviewed-by
    - move the Cc: line out of the commit message (Andy)
    
    v3: https://lore.kernel.org/r/20260928111907.72592-2-pepe.schlehofer@gmail.com/
    
    Changes in v3, by Josef Schlehofer:
    - drop the file name and "binding" from the subject
    - describe the hardware rather than the driver
    - fix example indentation and use the merged turris1x.dts node
    - set Josef Schlehofer as the binding maintainer
    - constrain color to LED_COLOR_ID_RGB
    - list the required controller and LED properties
    - describe the register range and the LED order in the reg properties,
      and put the SPDX expression in parentheses
    - pass dt_binding_check with dtschema 2026.9
    
    checkpatch asks whether MAINTAINERS needs updating for the new file.
    The MAINTAINERS entry that covers it is added in 2/2, together with
    the driver.

 .../bindings/leds/cznic,turris1x-leds.yaml    | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml

diff --git a/Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml b/Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml
new file mode 100644
index 000000000000..ad7ef7015f0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/cznic,turris1x-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CZ.NIC Turris 1.x LED controller
+
+maintainers:
+  - Josef Schlehofer <pepe.schlehofer@gmail.com>
+
+description:
+  The front panel of the CZ.NIC Turris 1.x routers carries eight RGB LEDs
+  driven by the CPLD firmware running on a Lattice FPGA. The five LAN LEDs
+  share one set of colour registers, so they cannot be given different
+  colours or brightness from each other. The CPLD firmware is open source
+  and available at
+  https://gitlab.nic.cz/turris/hw/turris_cpld/-/blob/master/CZ_NIC_Router_CPLD.v
+
+properties:
+  compatible:
+    const: cznic,turris1x-leds
+
+  reg:
+    description:
+      CPLD address range of the LED registers. It starts at the first colour
+      register, offset 0x13 in the CPLD, and ends at 0x2f; the offsets of
+      the registers inside the range are fixed by the CPLD firmware.
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^multi-led@[0-7]$":
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      color:
+        const: 9  # LED_COLOR_ID_RGB
+
+      reg:
+        description:
+          Index of the LED, which is also its bit in the CPLD LED control
+          registers. 0 is WAN, 1 to 5 are LAN 5 to LAN 1, 6 is WiFi and 7 is
+          power. The CPLD source calls LEDs 1 to 5 lan1 to lan5 and the WiFi
+          LED status.
+        minimum: 0
+        maximum: 7
+
+    required:
+      - reg
+      - color
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
+
+    led-controller@13 {
+        compatible = "cznic,turris1x-leds";
+        reg = <0x13 0x1d>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        multi-led@0 {
+            reg = <0x0>;
+            color = <LED_COLOR_ID_RGB>;
+            function = LED_FUNCTION_WAN;
+        };
+
+        multi-led@1 {
+            reg = <0x1>;
+            color = <LED_COLOR_ID_RGB>;
+            function = LED_FUNCTION_LAN;
+            function-enumerator = <5>;
+        };
+
+        multi-led@2 {
+            reg = <0x2>;
+            color = <LED_COLOR_ID_RGB>;
+            function = LED_FUNCTION_LAN;
+            function-enumerator = <4>;
+        };
+
+        multi-led@3 {
+            reg = <0x3>;
+            color = <LED_COLOR_ID_RGB>;
+            function = LED_FUNCTION_LAN;
+            function-enumerator = <3>;
+        };
+
+        multi-led@4 {
+            reg = <0x4>;
+            color = <LED_COLOR_ID_RGB>;
+            function = LED_FUNCTION_LAN;
+            function-enumerator = <2>;
+        };
+
+        multi-led@5 {
+            reg = <0x5>;
+            color = <LED_COLOR_ID_RGB>;
+            function = LED_FUNCTION_LAN;
+            function-enumerator = <1>;
+        };
+
+        multi-led@6 {
+            reg = <0x6>;
+            color = <LED_COLOR_ID_RGB>;
+            function = LED_FUNCTION_WLAN;
+        };
+
+        multi-led@7 {
+            reg = <0x7>;
+            color = <LED_COLOR_ID_RGB>;
+            function = LED_FUNCTION_POWER;
+        };
+    };
+
+...
-- 
2.54.0 (Apple Git-157)


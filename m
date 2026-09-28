Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC014A1DE6
	for <linux-leds@vger.kernel.org>; Mon, 28 Sep 2026 11:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594359; cv=none; b=CVJYbLn9//mcQeLUyPeQgFFM05Zx4HncPoiVMzJq0vZTLFYJmQ0gJ5MV6FhlQas+/CnBVNqBOQXTVJQW99Y2rB2XBDo7QJJDnlGaHQiY8EzqgrIi1K6qbTQpHORGcHe5vwfAB+f1wkoj+0bqb8BhQsm7p3LFt51LKDcylZPH7eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594359; c=relaxed/simple;
	bh=FAC2S2BY98BVv7gueQcHZnYUQ/AZfH3LCfnoGMI1YY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=smJO97cUQshoKIN32YMXI4aFhW6rHn/HQ2AgP1/ZQenFaO7ruc1i8dYMWYuZDjiLLE85KDVcwpOLpk2ymEqbYixVGrDAcJ0uG/8eRadbIxDM6+PODYSal6umIRlN5jgUXeciAHoMLWqDjaF1BWixFyFry6x6WWlVroC/PJDAanw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDOmDtd6; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDOmDtd6"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso20924905e9.2
        for <linux-leds@vger.kernel.org>; Mon, 28 Sep 2026 04:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790594355; x=1791199155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g+Oi9Zm5MO73aOHmV62OPpimFIugGeyR1K/lg/prrUs=;
        b=NDOmDtd6UNdWj81OAx0NJuN/cl58zPJcT4EU9N86Y3uFyGbh5GaDG2aBp+FRv1LiHB
         ZHFx7Iaw0dNU6AGJumRw42fFQ3dj5Y50ax7cQ/Mt2lwQEAmtamR8TERa3COJ+3KFkxBN
         vcEYFjy/oXa1jLRVEMtJn9WARArpW5B6aieSidYCKzO9IumBiaeLxVgrgQns2AOgJIWJ
         vZrC4Z33FtZRlCXazfm4aZivsY2SMGrNz6cKcftUL9+0wmQtcE4etZzYBs81rkG9yfwL
         V7Gy4ASiTQoYfavuBzmRXAM/Wy7ceP5naQ5Cnu86NcTCWonVFu7tAszGV3NMDRbLipR8
         vBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790594355; x=1791199155;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+Oi9Zm5MO73aOHmV62OPpimFIugGeyR1K/lg/prrUs=;
        b=vkn3bMWpI1iglM+g0pK+NxlJLymnm0Qs0cFiM9FQaT0xqqETgDvKso3HEh6uoAiUCU
         pbx9pFlf3QGlHS1zAW505vsQppDpw4JADI3KhykareRndeMAi/k+0r2dxKy6cCxCQhzk
         GxsOxvIdCPAXVKxaDxHAEWk+UB477wVkzBvOS0yaOrdalQM1wGxqEFWVztLCVUXsOH3P
         nczyPz3Bdn8MZExkAfNkl5PABuFUlU6KczKbPD0IYIm5lY18NDpDOyq9Kh1+DhsnnwG0
         9xKhYCqbn9dyXZw8/UrFTKG+81jH5/XDQjeG4Cmc1V/pxZCfaCpusNzSvucat6YNrM/M
         qP9A==
X-Forwarded-Encrypted: i=1; AKwUvBwrhA348To+LV2xX7P0NKw0UR/5k32DnyIJO11itFGZejzp9vhBD6YDSjiRcAfqtRMbpCMrUUe55/Xz@vger.kernel.org
X-Gm-Message-State: AFuF++kl/3WTbXRiEeu5K94OAKkGXsjNXDjvVgxf29/KPPA2k7Iuh8T4
	zWvFR4HIChDGsYSumq57pvZDlIp3ZbXwQonEDSLi3OK0BJT0mS/57eisVsTvWCzpm0q0/A==
X-Gm-Gg: AYBFou1R0LRxfPj2ZuBjnIRowxrbMV4B+LWcpUMzCOUHk9Jul3xW4UEx+CAnykepq8Y
	I1UIRLXX/6BRZ4Bc5uJoTjNDeo21x7vLMS/N4XEIyUWrJEMZ2wylIAdb5hHYqKsvYsqyT2DiW3s
	xGMo9cqT6qZx9e40MiX6AtHhcQNYBzScf7sR545yJc5y7n3mHl6EIErbcvoRs2rJqe4Yi8AQHRW
	bFq6uBJlwSgAZsC5XtOR98VP1/OHlseF0q3MavID2OHQqE2ZuF63zvFnRl2HobdxnWx9IOzWqJc
	IkpRPNSMS5NAsjg+pkWJmVG71pLrbZgk0mcv3Y3NW/gNil0QsxgGCIGOT4NGvRHo7/GKMN7lXt2
	jGDGxlyDwbQIGVsQ7bG1kyEtZjkhJKH/kcCVAvk6YezJfyAAG3dSh40zwiSwWnBDfnAK1KUI7Tr
	yLBGhlrwcTqXYbsNhVDoAAFMTGlrulUbvYgna1EBgM9w88dHwsr2guTq4zv6QKLOVXnsA1HnXfd
	lBxeb7DsrkKimNHFJUiwg8a4f8dWOSg35St0UfeqwN6MU+mFWcJ7ZNy+4f6wFNNkKLvRlHcWhjo
	dW7/6n8HkptcJ2rBH9b07mrlYeXaFT92YivrSUBG
X-Received: by 2002:a05:600c:3111:b0:49f:fdca:c34d with SMTP id 5b1f17b1804b1-49ffdcac53bmr98263335e9.8.1790594354962;
        Mon, 28 Sep 2026 04:19:14 -0700 (PDT)
Received: from localhost.localdomain (37-188-186-98.red.o2.cz. [37.188.186.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm26164969f8f.9.2026.09.28.04.19.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 04:19:14 -0700 (PDT)
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
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: leds: Add CZ.NIC Turris 1.x LED controller
Date: Mon, 28 Sep 2026 13:19:06 +0200
Message-ID: <20260928111907.72592-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928111907.72592-1-pepe.schlehofer@gmail.com>
References: <20260928111907.72592-1-pepe.schlehofer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
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
Cc: Marek Behún <kabel@kernel.org>
Co-developed-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---

Notes:
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


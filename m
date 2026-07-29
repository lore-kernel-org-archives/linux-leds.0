Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C436D1EE7C6;
	Wed, 29 Jul 2026 23:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785366873; cv=none; b=ntw0x+MW3TJdHthCsvJxA6el1+rZBmVnsbFHPKx1AjzOjNZsj5ValGJ0n+NlxRu+CcY2yO5jG7o4i6rLl/ElTZn/K9DWrou+J8mtcacOzasWcWoreWIhzaJmssbwA2HolyOF2Z8qWIJZAoz76mel+guIERtfjx7OXq5JFXXDcSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785366873; c=relaxed/simple;
	bh=1oBz68DUvRsjYs3daNl/Jes+K25MOfBC7R612e9EOVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=T7UOzbWPc6zJvBo5iXfiAqtAdhg3GPx4KSonW4kuvybBD7Y+4neQdrPobe23E/Z9+xYEEfAkllPXw93R0Cn65hu0EdjlhIngxiS/cC5eoTvepmH4vysuXrJ8f7SX6XtQu5VAnID6dspJ9S04uqWi1C4RT4cVzF03mzUBNE67Exg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=rpqYFBbq; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="rpqYFBbq"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TL957C3267816;
	Wed, 29 Jul 2026 19:14:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=EiY6h
	naAjmKpzOom7yK3Aa8JU5WmFEaaptweI1RuRi0=; b=rpqYFBbqs2KbVj16Thc0w
	KkgyYWCo4Ai/XtBLGyfQqMLIDtYBMFamU3j2tfgNSmufYgDc9MhAnNa4z5NotJS9
	3PETLc10tCsTE1aXSEpZSgVk2wEQNhbAvrpw0Q844zdJ/Unbjug9n82FuBKcm3Jj
	K7Lb5Lnj4rz6QRx6CkXQYbT8IFumpFAbyc+H8YyMhD0dvzNHhRgJTCHPyCHdhH6z
	kO/8KJfnKjK+bJToVxz759e6V7OETg69L1q0AbrzyriI/jni3MxlPbVIHX4p9DZN
	gAB8d9BFPcKsxx0BIw927YgZMzikm7Z+uJp6Wl7PTd1GUg0Y5OavVVgpJk7SVL4a
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fq83jmukq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 19:14:28 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66TNEQEg020126
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 29 Jul 2026 19:14:27 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Wed, 29 Jul 2026 19:14:26 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Wed, 29 Jul 2026 19:14:26 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Wed, 29 Jul 2026 19:14:26 -0400
Received: from HYB-VFz9h4bIQxi.ad.analog.com (HYB-VFz9h4bIQxi.ad.analog.com [10.118.4.29])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66TNEAlV016385;
	Wed, 29 Jul 2026 19:14:21 -0400
From: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Date: Thu, 30 Jul 2026 07:14:01 +0800
Subject: [PATCH v8 1/2] dt-bindings: leds: Document LTC3208 Multidisplay
 LED Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260730-upstream-ltc3208-v8-1-6bdcc35e65d7@analog.com>
References: <20260730-upstream-ltc3208-v8-0-6bdcc35e65d7@analog.com>
In-Reply-To: <20260730-upstream-ltc3208-v8-0-6bdcc35e65d7@analog.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jan Carlo Roleda
	<jancarlo.roleda@analog.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785366851; l=6393;
 i=jancarlo.roleda@analog.com; s=20260317; h=from:subject:message-id;
 bh=1oBz68DUvRsjYs3daNl/Jes+K25MOfBC7R612e9EOVE=;
 b=PPI+TEsFatf2EnHGIKaGCqTPHChICoA90ojoiwlm2qtHBVAuoDcKEQsyXPDteus5yr8rm4BiS
 oH8wBDAElABDvltpz+bHQgeovAbc7wEi0tIcVLRNY5G2EYqy+bHy06d
X-Developer-Key: i=jancarlo.roleda@analog.com; a=ed25519;
 pk=zPMh+eO6/Mj6tqaie75BLiTLQvE3f9pck0UejKLmLMc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: Am6jnTGu8T46Jha5MtQPhEFqMiTl4XW1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE3MyBTYWx0ZWRfX03VIZO3hZYnz
 b4jQFpCU33AAI+Kgel8SdFq8lp4IFt4b9Msc7nvPuBx1BcNUQhk2PDPX5N6/P13AImFMp2OsHPC
 t7KmTRcvZAGM10BqEquoRT0uULg3PZaYiJj6g2vWCiX7h4lyaiax
X-Proofpoint-GUID: Am6jnTGu8T46Jha5MtQPhEFqMiTl4XW1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE3MyBTYWx0ZWRfX9URnYOkNoQmS
 JStMI7+13nFSSlDrfxihC6QdeYLDWIWWk0AEdqnSCsY05HnNVE+pSEnSFe7RLBrNhVvrj5O8PRb
 Kw0qV0FrzTnRS4uIFgzReWvAEOc7LOmC3vGEZSYP6C54yEK6NTRex25qfVVXe9DbgIPhdgQX0Mj
 KCZvlfJtCY1tpG1QuvHXmzXHX/VtE2t+jEDvpsHg/jayO7Q+N0wQvFX0gFcMoPmzPaCUDox/Z7A
 8Xq03aq6Lm/Ox30FLc+3pzPZSKbLn30v1gv5OyLHbE18i8qwhfgINm9FEp4xdiSYR1BBS0A0wgk
 AfYHoMs8tJLBC2L/RG4niGbFvg2u5iN77/YOFkBudJn8uHlKBq8uALbDWPKVUfpevr3pzc+Unwv
 cuUFOgKjf/yRv9gSDn1xsJtC6ZPiN2POjFrkA7glcmFlju3lmme9fy6/oLUMJGD5iasK0wG8HkE
 yq+6xfaX7FDov23Rlcg==
X-Authority-Analysis: v=2.4 cv=QOFYgALL c=1 sm=1 tr=0 ts=6a6a8954 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=gEfo2CItAAAA:8
 a=gAnH3GRIAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=v2smZY1xhbZLdnYpqY8A:9
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_08,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290173

Add Devicetree Documentation for LTC3208 Multidisplay LED Driver.

Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/leds/adi,ltc3208.yaml      | 181 +++++++++++++++++++++
 MAINTAINERS                                        |   7 +
 2 files changed, 188 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/adi,ltc3208.yaml b/Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
new file mode 100644
index 000000000000..0a01e07e0ab7
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
@@ -0,0 +1,181 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2026 Analog Devices, Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/adi,ltc3208.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LTC3208 Multidisplay LED Controller from Linear Technologies (Now Analog Devices)
+
+maintainers:
+  - Jan Carlo Roleda <jancarlo.roleda@analog.com>
+
+description:
+  The LTC3208 is a multidisplay LED controller that can support up to 1A to all
+  connected LEDs.
+
+  The datasheet for this device can be found in
+  https://www.analog.com/en/products/ltc3208.html
+
+properties:
+  compatible:
+    const: adi,ltc3208
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
+  adi,disable-camhl-pin:
+    type: boolean
+    description:
+      Configures whether the external CAMHL pin is disabled.
+      If disabled then the output pins associated with CAM will always select
+      the CAM register's high half-byte brightness.
+
+  adi,cfg-enrgbs-pin:
+    type: boolean
+    description:
+      Configures which channel the ENRGBS pin toggles when it receives a signal.
+      ENRGBS pin controls the SUB channel's output pins if this is set,
+      or RGB channel's output pins if this is unset.
+
+  adi,disable-rgb-aux4-dropout:
+    type: boolean
+    description:
+      Configures the RGB and AUX4 dropout signals to be disabled.
+
+  adi,aux1-channel:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      LED Channel that the AUX1 output pin mirrors its brightness level from.
+    enum: [aux, main, sub, cam]
+    default: aux
+
+  adi,aux2-channel:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      LED Channel that the AUX2 output pin mirrors its brightness level from.
+    enum: [aux, main, sub, cam]
+    default: aux
+
+  adi,aux3-channel:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      LED Channel that the AUX3 output pin mirrors its brightness level from.
+    enum: [aux, main, sub, cam]
+    default: aux
+
+  adi,aux4-channel:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      LED Channel that the AUX4 output pin mirrors its brightness level from.
+    enum: [aux, main, sub, cam]
+    default: aux
+
+patternProperties:
+  "^led@[0-7]$":
+    type: object
+    $ref: /schemas/leds/common.yaml#
+    unevaluatedProperties: false
+    properties:
+      reg:
+        description:
+          LED Channel Number. each channel maps to a specific channel group used
+          to configure the brightness level of the output pins corresponding to
+          the channel.
+        enum:
+          - 0 # Main Channel (8-bit brightness)
+          - 1 # Sub Channel (8-bit brightness)
+          - 2 # AUX Channel (4-bit brightness)
+          - 3 # Camera Channel, Low-side byte (4-bit brightness)
+          - 4 # Camera Channel, High-side byte (4-bit brightness)
+          - 5 # Red Channel (4-bit brightness)
+          - 6 # Blue Channel (4-bit brightness)
+          - 7 # Green Channel (4-bit brightness)
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      led-controller@1b {
+        compatible = "adi,ltc3208";
+        reg = <0x1b>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        adi,disable-camhl-pin;
+        adi,cfg-enrgbs-pin;
+        adi,disable-rgb-aux4-dropout;
+
+        /* MAIN */
+        led@0 {
+          reg = <0>;
+          function = LED_FUNCTION_ACTIVITY;
+          color = <LED_COLOR_ID_WHITE>;
+        };
+
+        /* SUB */
+        led@1 {
+          reg = <1>;
+          function = LED_FUNCTION_ACTIVITY;
+          color = <LED_COLOR_ID_WHITE>;
+        };
+
+        /* AUX */
+        led@2 {
+          reg = <2>;
+          function = LED_FUNCTION_ACTIVITY;
+          color = <LED_COLOR_ID_WHITE>;
+        };
+
+        /* CAMLO */
+        led@3 {
+          reg = <3>;
+          function = LED_FUNCTION_FLASH;
+          color = <LED_COLOR_ID_WHITE>;
+        };
+
+        /* CAMHI */
+        led@4 {
+          reg = <4>;
+          function = LED_FUNCTION_FLASH;
+          color = <LED_COLOR_ID_WHITE>;
+        };
+
+        /* RED */
+        led@5 {
+          reg = <5>;
+          function = LED_FUNCTION_INDICATOR;
+          color = <LED_COLOR_ID_RED>;
+        };
+
+        /* BLUE */
+        led@6 {
+          reg = <6>;
+          function = LED_FUNCTION_INDICATOR;
+          color = <LED_COLOR_ID_BLUE>;
+        };
+
+        /* GREEN */
+        led@7 {
+          reg = <7>;
+          function = LED_FUNCTION_INDICATOR;
+          color = <LED_COLOR_ID_GREEN>;
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..2fd6ffdaaf04 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15223,6 +15223,13 @@ W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
 F:	drivers/iio/temperature/ltc2983.c
 
+LTC3208 LED DRIVER
+M:	Jan Carlo Roleda <jancarlo.roleda@analog.com>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+W:	https://ez.analog.com/linux-software-drivers
+F:	Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
+
 LTC4282 HARDWARE MONITOR DRIVER
 M:	Nuno Sa <nuno.sa@analog.com>
 L:	linux-hwmon@vger.kernel.org

-- 
2.43.0


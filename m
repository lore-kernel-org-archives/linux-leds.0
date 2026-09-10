Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D7F3A8388;
	Thu, 10 Sep 2026 23:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789084159; cv=none; b=XUrYijitG4wVsa27n8aa2p4ISYXjynrRx9Czn6wmUFnIBO8LMwP7HK2UsK6VUtcdGrv1qf7s1z4ujZk9obocULIzGxkkOhcLfAB6wMOf5h02WSyA8eYpF+Fd+lHLIUVvb24uEQ/TssCKlCJcvSVHJ6o0sf6Yj+uX07Im6B/j6BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789084159; c=relaxed/simple;
	bh=h04DoW7nr0AfDhGOaU6/GjAITlJeYL0uyU9La+w7cP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HOiLYskRdVKWNcP4OboGRunOkMWPVYn38fPNi87pI8tAu1mpL22ayxVCUZAdlgw1pd8AXS30eGxlVzBQPPS+FMfQaWaoifdTdPd7NuJOOslh6LejlqCAn+SrZbUnbOsPryjpnPiEFYVN509ffGTVDPB7Wsi3caLbxQPBFXeH56I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=AnzZoGLb; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="AnzZoGLb"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALWQYS1090440;
	Thu, 10 Sep 2026 19:49:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=PXDk6
	ezdWdombpyymdgE9ta8gzYZHMXzQG7Yx3a5I/s=; b=AnzZoGLbKASDheC9HMv1z
	KO8tcZESnwl3rKRsieuR6UThXFGe1XyNXdxICMxF539UN5viSd6T0VMaaaEMCFbP
	2Z4wDO9wgyKcGQfqBjNSOwRbnRa3VwSXkalYQsrbAALcr0wi4gV08HNckwmbTsum
	MWca7EQSALFRa3gVZvZRvOkq27KW3/Zm7sebwMdTwPqZdkWXeURv6h/9JkjOvJM6
	Yd9y/St6K3iyw6httNBB1VFi/hYYaaTm+JiIHwEByLvWdEWr9l8+xbiGoqdWWreA
	ue9QayIb3WRKwgNu1+kKrR12q8emUwjtOSoryv44VEGKJxku++a4SZmfUFsAAgim
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gkcx96cae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 19:49:13 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 68ANnBEb022541
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Sep 2026 19:49:11 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Thu, 10 Sep
 2026 19:49:11 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 10 Sep 2026 19:49:11 -0400
Received: from HYB-VFz9h4bIQxi.ad.analog.com (HYB-VFz9h4bIQxi.ad.analog.com [10.118.4.26])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 68ANmte2030659;
	Thu, 10 Sep 2026 19:49:06 -0400
From: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Date: Fri, 11 Sep 2026 07:48:32 +0800
Subject: [PATCH v12 1/2] dt-bindings: leds: Document LTC3208 Multidisplay
 LED Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260911-upstream-ltc3208-v12-1-9107f5f0a7b0@analog.com>
References: <20260911-upstream-ltc3208-v12-0-9107f5f0a7b0@analog.com>
In-Reply-To: <20260911-upstream-ltc3208-v12-0-9107f5f0a7b0@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789084135; l=6436;
 i=jancarlo.roleda@analog.com; s=20260317; h=from:subject:message-id;
 bh=h04DoW7nr0AfDhGOaU6/GjAITlJeYL0uyU9La+w7cP8=;
 b=sT9mWZkIyjQQouNDu2uc+Nyz7yl2l8SQ/M2W58/j86+ne2HebVKIxOhrBmrsBxFYYKGC+Q1xC
 sPeLmkKTVEuA8BZSxFeuxq2mVgARe94b+1xXQTezhbTbRSsIgn+KZy5
X-Developer-Key: i=jancarlo.roleda@analog.com; a=ed25519;
 pk=zPMh+eO6/Mj6tqaie75BLiTLQvE3f9pck0UejKLmLMc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDMwMCBTYWx0ZWRfX40wkm9mxvsNB
 7GV7geiBymg7zM61z336rR7XApIPXnVGy5iflHtcK9Ht+16nHiQ0NOXXVu1Qertf092Du8IgQ4c
 +8XP1ba7s8H2/Rk/J4EaQ3Qt2W2vV2iVS3++4ULyUuWBBr2aDmgt
X-Proofpoint-GUID: 9ZsERh3no6m8N_QonQtWnC7iO8qPMOYy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDMwMCBTYWx0ZWRfX+lhn8063q+RW
 rtVrx6iJo/vJzBFsnPloAmt5q2Exo13iczT5VFYVeQD8hWe0QSa1HQ2kS0K2T5jDigW+r2lluOP
 yWbskImlVJxqA9YenIKVd1M/YQE5xAvAR4Vn1mzve0Nur1CZZlKhRnpHriu3nS9m0ZsqxljjqwT
 oRnQ/ALHTAj/4Q3cFPQq4T4emg6iZiMccE0rLAFnxuth1TSr7fxYFIk0IpB2zomD58/AKFPykkt
 7/QXJiQtkul8kUb2RC//r+ul1bkDwIsqW+Hhl0OzPWH7T43Ei/HgOjXp+A2uaCBfVAmcqHUuuNm
 o+M+C1rGcsQleUXzuTZfSPbLgGgtGcqNwyoZFS9Jo8JsJpZSxjOOavhpj0L76vz+s8U0EHv0p9Q
 gidkN2V85wzu9CIbCnTDNCyxRl+iprGkZf3KO/f9GRgoD0ld8UIueBl5lQ8RsXNEex6y6BuGzyz
 b5veomWnHI7z4YMLesQ==
X-Authority-Analysis: v=2.4 cv=G8CJgNk5 c=1 sm=1 tr=0 ts=6aa341f9 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=gEfo2CItAAAA:8
 a=gAnH3GRIAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=v2smZY1xhbZLdnYpqY8A:9
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 9ZsERh3no6m8N_QonQtWnC7iO8qPMOYy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100300

Add Devicetree Documentation for LTC3208 Multidisplay LED Driver.

Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/leds/adi,ltc3208.yaml      | 183 +++++++++++++++++++++
 MAINTAINERS                                        |   7 +
 2 files changed, 190 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/adi,ltc3208.yaml b/Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
new file mode 100644
index 000000000000..c6697816b7d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
@@ -0,0 +1,183 @@
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
+  - "#address-cells"
+  - "#size-cells"
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


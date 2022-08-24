Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF522C38159
	for <linux-leds@archiver.kernel.org>; Wed, 24 Aug 2022 10:31:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235556AbiHXKbJ (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 24 Aug 2022 06:31:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234058AbiHXKbH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Aug 2022 06:31:07 -0400
Received: from smtpout1.mo3004.mail-out.ovh.net (smtpout1.mo3004.mail-out.ovh.net [79.137.123.219])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B801079A77;
        Wed, 24 Aug 2022 03:31:04 -0700 (PDT)
Received: from pro2.mail.ovh.net (unknown [10.109.138.144])
        by mo3004.mail-out.ovh.net (Postfix) with ESMTPS id F395023D029;
        Wed, 24 Aug 2022 10:31:02 +0000 (UTC)
Received: from localhost.localdomain (88.161.25.233) by DAG1EX1.emp2.local
 (172.16.2.1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Wed, 24 Aug
 2022 12:31:02 +0200
From:   Jean-Jacques Hiblot <jjhiblot@traphandler.com>
To:     <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <sven.schwermer@disruptive-technologies.com>,
        <krzysztof.kozlowski+dt@linaro.org>
CC:     <johan+linaro@kernel.org>, <marijn.suijten@somainline.org>,
        <bjorn.andersson@linaro.org>, <andy.shevchenko@gmail.com>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 3/4] dt-bindings: leds: Add binding for a multicolor group of LEDs
Date:   Wed, 24 Aug 2022 12:30:31 +0200
Message-ID: <20220824103032.163451-4-jjhiblot@traphandler.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220824103032.163451-1-jjhiblot@traphandler.com>
References: <20220824103032.163451-1-jjhiblot@traphandler.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [88.161.25.233]
X-ClientProxiedBy: DAG4EX1.emp2.local (172.16.2.31) To DAG1EX1.emp2.local
 (172.16.2.1)
X-Ovh-Tracer-Id: 18295592011283249617
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejuddgvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfgtihesthekredtredttdenucfhrhhomheplfgvrghnqdflrggtqhhuvghsucfjihgslhhothcuoehjjhhhihgslhhothesthhrrghphhgrnhgulhgvrhdrtghomheqnecuggftrfgrthhtvghrnheptddtffevleejteelieejhfffvedtffeljeehjeeigfejledufedvveejuddtjefhnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucfkpheptddrtddrtddrtddpkeekrdduiedurddvhedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhrohdvrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepjhhjhhhisghlohhtsehtrhgrphhhrghnughlvghrrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhofedttdeg
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This allows to group multiple monochromatic LEDs into a multicolor
LED, e.g. RGB LEDs.

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/leds/leds-group-multicolor.yaml  | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
new file mode 100644
index 000000000000..79e5882a08e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Multi-color LED built with monochromatic LEDs
+
+maintainers:
+  - Jean-Jacques Hiblot <jjhiblot@traphandler.com>
+
+description: |
+  This driver combines several monochromatic LEDs into one multi-color
+  LED using the multicolor LED class.
+
+properties:
+  compatible:
+    const: leds-group-multicolor
+
+  leds:
+    description:
+      An aray of monochromatic leds
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+required:
+  - leds
+
+allOf:
+  - $ref: leds-class-multicolor.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    monochromatic-leds {
+        compatible = "gpio-leds";
+
+        led0: led-0 {
+            gpios = <&mcu_pio 0 GPIO_ACTIVE_LOW>;
+        };
+
+        led1: led-1 {
+            gpios = <&mcu_pio 1 GPIO_ACTIVE_HIGH>;
+        };
+
+        led2: led-2 {
+            gpios = <&mcu_pio 1 GPIO_ACTIVE_HIGH>;
+        };
+    };
+
+    multi-led {
+        compatible = "leds-group-multicolor";
+        color = <LED_COLOR_ID_RGB>;
+        function = LED_FUNCTION_INDICATOR;
+        leds = <&led0>, <&led1>, <&led2>;
+    };
+
+...
-- 
2.25.1


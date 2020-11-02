Return-Path: <SRS0=fREs=EI=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C81F1C55179
	for <linux-leds@archiver.kernel.org>; Mon,  2 Nov 2020 02:42:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70B7B2225B
	for <linux-leds@archiver.kernel.org>; Mon,  2 Nov 2020 02:42:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGSYLv+M"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727667AbgKBCmk (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sun, 1 Nov 2020 21:42:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727450AbgKBCmj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 1 Nov 2020 21:42:39 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9644FC0617A6;
        Sun,  1 Nov 2020 18:42:39 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id w11so6111854pll.8;
        Sun, 01 Nov 2020 18:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rlHDiXFKXTDu61RFncAeeeQ9lFHjn8bk2MFpYXI9J08=;
        b=cGSYLv+MKnIqQPcW40SBcSMkYDzWsaQUtGtHSybVXjOIRsIehT453I05W1xPCpxOkr
         PaTuMZsOVHvmJRRUZvbW6O8huAFqz9GVLBnJJPSUC3/7bKg+gFIy/SJLF8sQuefydPYr
         nkOvZqKMtOE/3anWa39G8UWTdHxsBER/Nu8rw+6tVV1oobuV0zAujduaXBZrOIWZjACJ
         jTbdpTWU48FDJlstYtF66V69K4GTIZ2lyamo2IRLzzEnE043vfYlJ1tXHds0snR9lZ75
         0L9kiBQWNy7tXVsJC0zpbd25xzYg1qCoGuq2KY+kp2hcR0RMpnAxd3Lt/sHQOjFrK1gZ
         Lr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rlHDiXFKXTDu61RFncAeeeQ9lFHjn8bk2MFpYXI9J08=;
        b=WEy5dPTMX6EUMtKARB41LTJF/3xb+Iddnn5XoOijsqb3i5TbDzak2PLEIn4H+stuvV
         rzPpea/dDVcCQUOcYhYFcMso8i83dTUqKrvEeMIHKsOjFiyxSe51BrJuqlC5ZZvE2Idv
         cHlyK0a638cCGyUk6SRdkXJ+SjMdDgb702CctJBz3eXdAgPF86OozD9SFddhxGi8gN3P
         gJMiVBqjU2XWFX6tUAwX7MgaqkNLzgROD/K0jkbxQXfdrTyRH2Qs5Y3qry5In1POlydp
         RhsHlfhbDHh15nFjRYLIaR7y6ZjmlpDzVK2yhqPJucj3KrttDS5KKZueO6ro+f8c7YGV
         MyZg==
X-Gm-Message-State: AOAM5320yITUUoIpT85ge9iZF1qaYnSaM9pK5WxbuITetMXETGpyRspk
        DLmOwffRNpHH3EEGosxK+h4xpub+lfE=
X-Google-Smtp-Source: ABdhPJws7utPSZoC+zWgReVdh8m5J2hnXJoOhBadOFXn9zwYMqselCxWWTuqnA6jSM1EnnTTcgUKoQ==
X-Received: by 2002:a17:902:b283:b029:d6:b2a7:3913 with SMTP id u3-20020a170902b283b02900d6b2a73913mr9964200plr.54.1604284959006;
        Sun, 01 Nov 2020 18:42:39 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:57c:483e:4828:fb14:ce19:d9d0])
        by smtp.gmail.com with ESMTPSA id kr14sm10123441pjb.26.2020.11.01.18.42.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Nov 2020 18:42:38 -0800 (PST)
From:   cy_huang <u0084500@gmail.com>
To:     pavel@ucw.cz, dmurphy@ti.com, robh+dt@kernel.org
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        cy_huang@richtek.com, devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] leds: rt4505: Add DT binding document for Richtek RT4505
Date:   Mon,  2 Nov 2020 10:42:26 +0800
Message-Id: <1604284946-16254-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604284946-16254-1-git-send-email-u0084500@gmail.com>
References: <1604284946-16254-1-git-send-email-u0084500@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: ChiYuan Huang <cy_huang@richtek.com>

Add DT binding document for Richtek RT4505 flash LED controller.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since v1 to v2

- Change the descriptions for 'led' text to uppercase 'LED'.

---
 .../devicetree/bindings/leds/leds-rt4505.yaml      | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-rt4505.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-rt4505.yaml b/Documentation/devicetree/bindings/leds/leds-rt4505.yaml
new file mode 100644
index 00000000..5b0c74a
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-rt4505.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-rt4505.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Richtek RT4505 Single Channel LED Driver
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  The RT4505 is a flash LED driver that can support up to 375mA and 1.5A for
+  torch and flash mode, respectively.
+
+  The data sheet can be found at:
+    https://www.richtek.com/assets/product_file/RT4505/DS4505-02.pdf
+
+properties:
+  compatible:
+    const: richtek,rt4505
+
+  reg:
+    description: I2C slave address of the controller.
+    maxItems: 1
+
+  led:
+    type: object
+    $ref: common.yaml#
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
+
+    i2c0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      led-controller@63 {
+        compatible = "richtek,rt4505";
+        reg = <0x63>;
+
+        rt4505_flash: led {
+          function = LED_FUNCTION_FLASH;
+          color = <LED_COLOR_ID_WHITE>;
+          led-max-microamp = <375000>;
+          flash-max-microamp = <1500000>;
+          flash-max-timeout-us = <800000>;
+        };
+      };
+    };
-- 
2.7.4


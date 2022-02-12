Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB1BC433FE
	for <linux-leds@archiver.kernel.org>; Sat, 12 Feb 2022 19:49:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbiBLTtg (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 12 Feb 2022 14:49:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231243AbiBLTtg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 12 Feb 2022 14:49:36 -0500
Received: from smtprelay02.ispgateway.de (smtprelay02.ispgateway.de [80.67.18.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38DD3C5A;
        Sat, 12 Feb 2022 11:49:29 -0800 (PST)
Received: from [92.206.166.137] (helo=note-book.lan)
        by smtprelay02.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <git@apitzsch.eu>)
        id 1nIwqo-0000Mn-JI; Sat, 12 Feb 2022 19:10:26 +0100
From:   =?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
Subject: [PATCH v3 2/3] dt-bindings: leds: sgm3140: Document ocp8110 compatible
Date:   Sat, 12 Feb 2022 19:09:41 +0100
Message-Id: <20220212180942.8241-2-git@apitzsch.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20211117091405.7412-1-git@apitzsch.eu>
References: <20211117091405.7412-1-git@apitzsch.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Df-Sender: YW5kcmVAYXBpdHpzY2guZXU=
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add devicetree binding for Orient Chip OCP8110 charge pump used for
camera flash LEDs.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
V2 -> V3: Add commit message, h/w info

 Documentation/devicetree/bindings/leds/leds-sgm3140.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml b/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
index f68259619488..1c345cf16d08 100644
--- a/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
@@ -18,7 +18,9 @@ description: |
 
 properties:
   compatible:
-    const: sgmicro,sgm3140
+    enum:
+      - ocs,ocp8110
+      - sgmicro,sgm3140
 
   enable-gpios:
     maxItems: 1
-- 
2.35.1


Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A687C00140
	for <linux-leds@archiver.kernel.org>; Thu, 18 Aug 2022 17:26:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344420AbiHRR0C (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 18 Aug 2022 13:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345594AbiHRRZz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 18 Aug 2022 13:25:55 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3182F1106;
        Thu, 18 Aug 2022 10:25:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DE226B822AF;
        Thu, 18 Aug 2022 17:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C743C433D6;
        Thu, 18 Aug 2022 17:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660843551;
        bh=/kX8/xJvzlk63YHJxHvCeay4OTEnd/qOB0+uZ1qvLv8=;
        h=From:To:Cc:Subject:Date:From;
        b=XD5Z1Fg71/LjOfAkq/NK8YE9J0Xxh0K7IFwLdmt2ge+IAsJK2a2hoa0pBVjFMhqpg
         +WkeGmhKGGP7AEtUk5YHD3vpNFN+Kxns7JRkmfUB2DhAqhejIh1PY34E5JWzsMFGJ6
         6BoCqzHyVYytUqR1rGdAshnTgzvNn5ZSWFtUGhL4y0y+KrO6cRZtBVJaso8ZAK4aaj
         9ByH7bLb9NlaEl5bS9Vm3wWHzZ2FifXTrEidIaJ44d58r4YK34Mv4RDXtEHBQv+1sJ
         XqvOqAIinwCMs020ppzBPQlEZHESoWoWCeaCIJKyoVEBzLS7sFMsHD9T3Aij2wOPdb
         boQqQMgkLIBOA==
Received: by pali.im (Postfix)
        id B2933622; Thu, 18 Aug 2022 19:25:48 +0200 (CEST)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: leds: register-bit-led: Add active-low property
Date:   Thu, 18 Aug 2022 19:25:27 +0200
Message-Id: <20220818172528.23062-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Allow to define inverted logic (0 - enable LED, 1 - disable LED) via
active-low property.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 Documentation/devicetree/bindings/leds/register-bit-led.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/register-bit-led.yaml b/Documentation/devicetree/bindings/leds/register-bit-led.yaml
index 79b8fc0f9d23..5c6ef26f1a94 100644
--- a/Documentation/devicetree/bindings/leds/register-bit-led.yaml
+++ b/Documentation/devicetree/bindings/leds/register-bit-led.yaml
@@ -43,6 +43,11 @@ properties:
         0x100000, 0x200000, 0x400000, 0x800000, 0x1000000, 0x2000000, 0x4000000,
         0x8000000, 0x10000000, 0x20000000, 0x40000000, 0x80000000 ]
 
+  active-low:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      LED is ON when bit in register is not set
+
   offset:
     description:
       register offset to the register controlling this LED
-- 
2.20.1


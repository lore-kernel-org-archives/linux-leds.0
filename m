Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D725C61DA4
	for <linux-leds@archiver.kernel.org>; Sat, 11 Mar 2023 11:20:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjCKLUj (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 11 Mar 2023 06:20:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbjCKLUE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 11 Mar 2023 06:20:04 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A389413E50D
        for <linux-leds@vger.kernel.org>; Sat, 11 Mar 2023 03:17:19 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id da10so30822299edb.3
        for <linux-leds@vger.kernel.org>; Sat, 11 Mar 2023 03:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XnXXbrZ1m/d5DpPQBCbe1TZx6euaIHskwO/PhFzeRw8=;
        b=itFcxN1RXJw+Vgo3FOat6P2tXXHSzteZYZdmj4Xq9x+ypr2kubPFeBORB1illSdPq1
         xQGjHRfDUH35+YGoBftfsr+Ax/1FB5jVZreMKyff0xTBuurE1CrmXvlz4nUs38cE1QEB
         3yjZePgNxpV+lnoicO6GSTKvPd5l6XLm/AwFMY93a7ctu1mjFwwjUU8me2Y1HCgSbT9q
         Y0BGhLkByvHa8I+9rABiyfqJVo+fVMh2VVMItTUIJnKY09EHC9CSvym3BRnKWqC5Dx9h
         zLOrsHhj4GLgIB1KoobqtQO7slistAKr0Y7MHXYOVfR0/sElpZpaBlKHrLQTnAQALPSD
         G6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XnXXbrZ1m/d5DpPQBCbe1TZx6euaIHskwO/PhFzeRw8=;
        b=XIGmxxPeKI1dswKCZvp0TuDUaq5eTo4EDv3raUEtK2NMOECIwFWqpBjAnksqcnTRwu
         mRJNqusXCqdHwtoYeT1oiCqfHD9kxTE3qN9mGgagCsP3RnxQq7J6TWscb9oYAAmUnBnE
         Kx92XRh6WOej1tE+A+zWu2YvnSY4K7pZMYx/UPqko+SW3cStlPnItGMfJ1OXSTeVSimA
         glHGXL/BbkFj+twgAEMHQ3GjjJNsxW3iWLpqPKTFWEb+OeSDNqY48g2rcm/aWUD7V3R6
         v3+9vGDQiGZgbjm8IwAHkuAZR5GbioLBcT2A8qOtozHKG5o0ZkrEnzQT02qDntIjgbr+
         31Rg==
X-Gm-Message-State: AO0yUKVuosVJTDydYjTMh3l9YBWBIrtA07YHc9Jd5/pY3DSYXuSVPTBr
        vDZFILVbWylev+74UJtUCSkmig==
X-Google-Smtp-Source: AK7set8SMkJrLHOHbw1lDrz0YJwGpsOhByZ/nyN8OcI2csWF+13ra8n0Xdeit2JttJq5jhbB6lAfiA==
X-Received: by 2002:a17:907:a406:b0:909:385:da4a with SMTP id sg6-20020a170907a40600b009090385da4amr33312507ejc.54.1678533439217;
        Sat, 11 Mar 2023 03:17:19 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id y25-20020a170906519900b008eb5b085075sm987937ejk.122.2023.03.11.03.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:17:18 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] leds: tlc591xx: Mark OF related data as maybe unused
Date:   Sat, 11 Mar 2023 12:17:17 +0100
Message-Id: <20230311111717.252019-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  drivers/leds/leds-tlc591xx.c:138:34: error: ‘of_tlc591xx_leds_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/leds/leds-tlc591xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index ec25e0c16bea..7e31db50036f 100644
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -135,7 +135,7 @@ static const struct regmap_config tlc591xx_regmap = {
 	.max_register = 0x1e,
 };
 
-static const struct of_device_id of_tlc591xx_leds_match[] = {
+static const struct of_device_id of_tlc591xx_leds_match[] __maybe_unused = {
 	{ .compatible = "ti,tlc59116",
 	  .data = &tlc59116 },
 	{ .compatible = "ti,tlc59108",
-- 
2.34.1


Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8217C63777
	for <linux-leds@archiver.kernel.org>; Thu, 26 Nov 2020 11:53:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BEAB20678
	for <linux-leds@archiver.kernel.org>; Thu, 26 Nov 2020 11:53:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pDVDNLUE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387613AbgKZLxK (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 26 Nov 2020 06:53:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387600AbgKZLxK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Nov 2020 06:53:10 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB734C0613D4;
        Thu, 26 Nov 2020 03:53:08 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id w6so1460172pfu.1;
        Thu, 26 Nov 2020 03:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=oEeUSW72/UraPj3Y97BxSpWwyxMnnt499YGisi4BDys=;
        b=pDVDNLUEvsldJ9njbjYI6V9CjC3KkCVdi7Ufrrr7R/rUs33hIAE4bk6Mc4ciixfagQ
         8DPRCX6vVW4/3iBfPh9GXD8CbGtYAk0m0Rbo5og0ecGhYDQ8UPiqNgubaJ25+q+N/j4c
         kN7k4y9lTOjTDtxZ5khDodGsZ/gsQs6Ia5oB+pe74kywYYdaKwJmi3qmHVS/xk6lgzpb
         RbuCdOcWCsypeyRPlHn8kFccgP8GoVrk36QPAm8hSh2oYRvtz73yDUPyAEovDffdCzXX
         7o2WWIl5Gnrnf/FVGdq4KY2gjajN/XHTIPZ8WCb51UVOez2Flylc0AYLQCBiIeu59BtO
         x6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=oEeUSW72/UraPj3Y97BxSpWwyxMnnt499YGisi4BDys=;
        b=EafoSki3WH4ohlUTYvBDDJp4n2qAUJB7TyXGnEP/PN/Mk0Z+jRLXcRtXSZf5Bqr32y
         JDHQBxzLGBXb0nACfr7Q0z8PiEvoh+vIHqhyQMar+A8ndN790X6L3p1Z8GcKMxNyal6t
         pph6jL1GKs4XAW5WOJx+uBiyJdVMmLvCZHinJR5rQm96UDFCEgV5FjkB7btVBIwz9V+z
         y03Dj3a8ZteLoajmWQ+CtU5uxJ/TUJp8g6fus/5W4ews6l5QdMkH88F83ogl94X5mIfP
         SO3NZHGBYbkRSGmrTdYb4RH22dZeTOOv5u5aeyReKs+tGDiH1bilvmAOiiqbsuC5BfIH
         W6Dw==
X-Gm-Message-State: AOAM5326eDj+zk36kBj/+E/i96wDzhhCgGuRMLUhN4acBCGpiNc2DV6B
        h/9ylkvQ+HI0zJsEDfpJ/nc=
X-Google-Smtp-Source: ABdhPJxblqZsNJ9Xe5ePQ8D0+uIMbnCdhZlBnqF99L+HdvMAEuCFbcMgozJpakEMCcp5oRYUcjmFaQ==
X-Received: by 2002:a65:6896:: with SMTP id e22mr2293865pgt.318.1606391588608;
        Thu, 26 Nov 2020 03:53:08 -0800 (PST)
Received: from localhost.localdomain ([101.10.31.14])
        by smtp.gmail.com with ESMTPSA id r4sm4721617pgs.54.2020.11.26.03.53.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2020 03:53:08 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v9 1/6] leds: flash: Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH
Date:   Thu, 26 Nov 2020 19:37:29 +0800
Message-Id: <1606390654-6075-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606390654-6075-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606390654-6075-1-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Gene Chen <gene_chen@richtek.com>

Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 include/linux/led-class-flash.h | 42 ++++++++++++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-flash.h
index 21a3358..612b4ca 100644
--- a/include/linux/led-class-flash.h
+++ b/include/linux/led-class-flash.h
@@ -85,6 +85,7 @@ static inline struct led_classdev_flash *lcdev_to_flcdev(
 	return container_of(lcdev, struct led_classdev_flash, led_cdev);
 }
 
+#if IS_ENABLED(CONFIG_LEDS_CLASS_FLASH)
 /**
  * led_classdev_flash_register_ext - register a new object of LED class with
  *				     init data and with support for flash LEDs
@@ -98,12 +99,6 @@ int led_classdev_flash_register_ext(struct device *parent,
 				    struct led_classdev_flash *fled_cdev,
 				    struct led_init_data *init_data);
 
-static inline int led_classdev_flash_register(struct device *parent,
-					   struct led_classdev_flash *fled_cdev)
-{
-	return led_classdev_flash_register_ext(parent, fled_cdev, NULL);
-}
-
 /**
  * led_classdev_flash_unregister - unregisters an object of led_classdev class
  *				   with support for flash LEDs
@@ -118,15 +113,44 @@ int devm_led_classdev_flash_register_ext(struct device *parent,
 				     struct led_init_data *init_data);
 
 
+void devm_led_classdev_flash_unregister(struct device *parent,
+					struct led_classdev_flash *fled_cdev);
+
+#else
+
+static inline int led_classdev_flash_register_ext(struct device *parent,
+				    struct led_classdev_flash *fled_cdev,
+				    struct led_init_data *init_data)
+{
+	return 0;
+}
+
+static inline void led_classdev_flash_unregister(struct led_classdev_flash *fled_cdev) {};
+static inline int devm_led_classdev_flash_register_ext(struct device *parent,
+				     struct led_classdev_flash *fled_cdev,
+				     struct led_init_data *init_data)
+{
+	return 0;
+}
+
+static inline void devm_led_classdev_flash_unregister(struct device *parent,
+					struct led_classdev_flash *fled_cdev)
+{};
+
+#endif  /* IS_ENABLED(CONFIG_LEDS_CLASS_FLASH) */
+
+static inline int led_classdev_flash_register(struct device *parent,
+					   struct led_classdev_flash *fled_cdev)
+{
+	return led_classdev_flash_register_ext(parent, fled_cdev, NULL);
+}
+
 static inline int devm_led_classdev_flash_register(struct device *parent,
 				     struct led_classdev_flash *fled_cdev)
 {
 	return devm_led_classdev_flash_register_ext(parent, fled_cdev, NULL);
 }
 
-void devm_led_classdev_flash_unregister(struct device *parent,
-					struct led_classdev_flash *fled_cdev);
-
 /**
  * led_set_flash_strobe - setup flash strobe
  * @fled_cdev: the flash LED to set strobe on
-- 
2.7.4


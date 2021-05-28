Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65819C47087
	for <linux-leds@archiver.kernel.org>; Fri, 28 May 2021 09:07:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DC2161222
	for <linux-leds@archiver.kernel.org>; Fri, 28 May 2021 09:07:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236596AbhE1JId (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 28 May 2021 05:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236077AbhE1JIW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 05:08:22 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B01F3C06134C
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 02:06:41 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id x7so2495308wrt.12
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 02:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=izuQMEMMW+VSc9OVASrpIkHNe2Xs+yvcMC2k0L7tAoU=;
        b=M0LyaurPykpg2ovwwTbfc2RvbZXclfce3ouSgUunjMtdmY6lMkrnQHDT1fyJ4xJSU2
         C3wBCtjJtH93o0ehG5LBY8PrKiC0xLRd/rKWZYzsjBQciV08nkcnOG8xp/F1ehDUZARJ
         bkpIk1wi9jNWMjVl9obYu50odRkOOzNlMipAYrAb50riV9X5/YGGg7X8xjG0rIW3FZ/E
         gRz+e5qCeMx0FmfWHIIC6IEIkTMws8LvRPzREdzOhGKZPpg4B8MlNXRzDM/MVs0S8qKj
         PV16uxKyLhhILpR61k+HBrbEw8PVuu8YZubemVbzKwsLYc8lhMdiHz8ijoBl+0C98WIf
         cotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=izuQMEMMW+VSc9OVASrpIkHNe2Xs+yvcMC2k0L7tAoU=;
        b=aITVcsCapUN0F3ogDIul5tyNlR+yaJem/7F43N7VpzNjsxlPQYolIiP3LNobnT0jvk
         eTzjkCpWqZ7BsxUr+NYcajVwm/0sOB5F30o6hwEnlgUj+h2upKJrzlIe7wPkPWnZTNsK
         2YV+7wJZkwfU0wzzzltFWyF/nhSKkN3nNLwzZjQnmNlss+BvhOid8PTWWYyUYKCkBSJB
         gvMPWLktr9dMYFEz529HJF/FP5x/Ea8XuUzazaYDGhAABmgqHiJnP2PiHU4fsPhxsvVP
         bx/AfSR7qJN2rsW7mMdzmpdz7FiUFbyiVucyqFbkG1khK+rbdBpq11vsm8vIA8A/KdN1
         /kbQ==
X-Gm-Message-State: AOAM531eNbPtYUajWjFDfMi89kwc5xwimu/RPMYjIy+q/Bbe9H0KORdB
        qJdyozDxcdRrx/O2acNhgarzkA==
X-Google-Smtp-Source: ABdhPJzx686ek/XTiI/s5s6jNQQgqIhdUXwaml/i9+W3jcaDzfMobxdjoq8vnj92R7cVgPwbN3k92g==
X-Received: by 2002:a5d:6b91:: with SMTP id n17mr7444051wrx.67.1622192800290;
        Fri, 28 May 2021 02:06:40 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id m132sm6105911wmf.11.2021.05.28.02.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 02:06:39 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Antonio Ospite <ospite@studenti.unina.it>,
        linux-leds@vger.kernel.org
Subject: [PATCH 08/15] leds: leds-lp3944: Provide missing function names in documentation headers
Date:   Fri, 28 May 2021 10:06:22 +0100
Message-Id: <20210528090629.1800173-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210528090629.1800173-1-lee.jones@linaro.org>
References: <20210528090629.1800173-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/leds/leds-lp3944.c:95: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/leds/leds-lp3944.c:126: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/leds/leds-lp3944.c:158: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Pavel Machek <pavel@ucw.cz>
Cc: Antonio Ospite <ospite@studenti.unina.it>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/leds/leds-lp3944.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-lp3944.c b/drivers/leds/leds-lp3944.c
index 838e6f19d37e5..437c711b2a27e 100644
--- a/drivers/leds/leds-lp3944.c
+++ b/drivers/leds/leds-lp3944.c
@@ -92,7 +92,7 @@ static int lp3944_reg_write(struct i2c_client *client, u8 reg, u8 value)
 }
 
 /**
- * Set the period for DIM status
+ * lp3944_dim_set_period() - Set the period for DIM status
  *
  * @client: the i2c client
  * @dim: either LP3944_DIM0 or LP3944_DIM1
@@ -123,7 +123,7 @@ static int lp3944_dim_set_period(struct i2c_client *client, u8 dim, u16 period)
 }
 
 /**
- * Set the duty cycle for DIM status
+ * lp3944_dim_set_dutycycle - Set the duty cycle for DIM status
  *
  * @client: the i2c client
  * @dim: either LP3944_DIM0 or LP3944_DIM1
@@ -155,7 +155,7 @@ static int lp3944_dim_set_dutycycle(struct i2c_client *client, u8 dim,
 }
 
 /**
- * Set the led status
+ * lp3944_led_set() - Set the led status
  *
  * @led: a lp3944_led_data structure
  * @status: one of LP3944_LED_STATUS_OFF
-- 
2.31.1


Return-Path: <SRS0=3VIc=57=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66627C2BB55
	for <linux-leds@archiver.kernel.org>; Wed, 15 Apr 2020 15:10:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3250120857
	for <linux-leds@archiver.kernel.org>; Wed, 15 Apr 2020 15:10:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ClSkVYPH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393123AbgDOPKo (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 15 Apr 2020 11:10:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726083AbgDOPKn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Wed, 15 Apr 2020 11:10:43 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C467C061A0C
        for <linux-leds@vger.kernel.org>; Wed, 15 Apr 2020 08:10:43 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id u15so4090029ljd.3
        for <linux-leds@vger.kernel.org>; Wed, 15 Apr 2020 08:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yj+l6wFoURoG/5T12vWXbIe5t30o3THVRnPkkvWK26s=;
        b=ClSkVYPHOsRNflEtETWu6aea/25plmC+CJK0fDeEnIPC3KpTBUKVWYCVcMPzjPaJJX
         WSl8Q5q+9ql7bNMeHIdVyXjBAtIOddzHstE4ZhIhMqbOFcokfw7taUFkXI845o0c9abt
         O/CgnMetg2sxXX0LYzHUtD7lBJ8J6lOlx6EHgKEJXy8wI7ToFZElMcmrL8GQsHDH7tdb
         YKXCQ50zHigLNxQjhFgYpWfePlALToU2WLnH4+KlAyBmmsqrEEGjpSO2aOUGHpWMmU2H
         inNN8HbvSkI851tVZNgahP9CwF/g7PjivvpNtUePIRvzIGceh2uXpxz8D26Sg747VG6V
         HnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yj+l6wFoURoG/5T12vWXbIe5t30o3THVRnPkkvWK26s=;
        b=C0fO2Mp6usytJdKue/GW6QgH/o4q1OfgzNNnyKmiXinJSi2W2VR2/y3kpbmFl6HtJJ
         SQPiatNThCNoXfZ2eiyFmG/CWeCwWch/YfmGyRZrqWWdPeldNVN3h3iE6LwhPrI5FXh2
         Tm7KRluVCk7aIfCsDW9GMMfaAF9wHO4UCeyVkzZiW4rM7sOVKIsIv3wStauZ3lBXsEl7
         Qj2ZzqQ/TP+6rJm0+cD413ZCcYXsD8LcHsuD0fHULNe76abQu5rhQI8giMNGk5RPaucd
         g7NC/QrgA9ipqOGRoBS9SImCPynSClTQAujefZi6wNcwHP4ZfGxspzo5we5fY+iipsE9
         6dqA==
X-Gm-Message-State: AGi0PuY/kJF0xTYrGZEHxwzEN2LJ5rT1/kEjI8D8d4ea3EwudNnWqSpq
        9219HbS4CUUpN3F2u1udOL97yw==
X-Google-Smtp-Source: APiQypIIw/6QZbjGQGatsDl3Dz6nNsRlqxJxE3A1V8gYqG+YeDhfCbSZ6vNJLK9UkcmF/vedUALmpA==
X-Received: by 2002:a05:651c:452:: with SMTP id g18mr3627242ljg.224.1586963441040;
        Wed, 15 Apr 2020 08:10:41 -0700 (PDT)
Received: from localhost.localdomain (c-f3d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.243])
        by smtp.gmail.com with ESMTPSA id j13sm13024258lfb.19.2020.04.15.08.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 08:10:40 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        NeilBrown <neilb@suse.com>
Subject: [PATCH] leds: tca6507: Include the right header
Date:   Wed, 15 Apr 2020 17:08:37 +0200
Message-Id: <20200415150837.188659-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The TCA6507 optionally presents a GPIO controller, so include
<linux/gpio/driver.h> instead of the legacy <linux/gpio.h>.

Cc: NeilBrown <neilb@suse.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-tca6507.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index 58be20cae183..1128ac75443c 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -93,7 +93,7 @@
 #include <linux/leds.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/workqueue.h>
 #include <linux/leds-tca6507.h>
 #include <linux/of.h>
-- 
2.25.2


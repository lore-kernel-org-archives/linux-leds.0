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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE97C433B4
	for <linux-leds@archiver.kernel.org>; Thu, 29 Apr 2021 12:59:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7016F6142A
	for <linux-leds@archiver.kernel.org>; Thu, 29 Apr 2021 12:59:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237370AbhD2NAD (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 29 Apr 2021 09:00:03 -0400
Received: from m12-12.163.com ([220.181.12.12]:36035 "EHLO m12-12.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237260AbhD2NAD (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 29 Apr 2021 09:00:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=CW2WZdQO7oOFo6AnWX
        otU18lVscqNJYRIy2lAGldCKI=; b=f0999LoPkXSMgN4dJaThIpd4adi+/Y6j8y
        f50nbNP7MFhWCPGglDS2Sb4eTO0hpfi1ZorqFDk14dVo+n55LUH0RLbmXq2hAk5K
        NFgWqpnoFgt6rwswrJa3qoyaz3ZQtQS6nBydoR+Foq5dYXzu5Ylc+Ez78hEH5Itk
        ASu8HjgkI=
Received: from LiQingHua-01.ccdomain.com (unknown [218.17.89.92])
        by smtp8 (Coremail) with SMTP id DMCowABnhFmVrYpgFntLBQ--.24667S2;
        Thu, 29 Apr 2021 20:59:05 +0800 (CST)
From:   lqhua06@163.com
To:     pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        "quanah.li_cp" <liqinghua@yulong.com>
Subject: [PATCH] leds: led-core: The value of delay_on and delay_off remains when led off
Date:   Thu, 29 Apr 2021 20:59:08 +0800
Message-Id: <20210429125908.8308-1-lqhua06@163.com>
X-Mailer: git-send-email 2.15.0.windows.1
X-CM-TRANSID: DMCowABnhFmVrYpgFntLBQ--.24667S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw1DJw1DZFW7XrWUWF4kJFb_yoWktwb_WF
        1q9r9rKF9Yvan0yasFkr45ZFWY9r45XF17WF4vvrW7CryYvFWftr45tFyfCrWUW3WqkFyr
        JrW3Wr1F9rn7GjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5r3ktUUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5otk3tiqw6il2tof0z/1tbiJhmDAVv2hmbDbgAAsd
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: "quanah.li_cp" <liqinghua@yulong.com>

The LED connect to pmic gpio, and the LED can blinking during
AP goto sleep.

When the LED is turned off and the hardware blinking will be disabled,
but the value of delay_on and delay_off still remains.

Signed-off-by: quanah.li_cp <liqinghua@yulong.com>
---
 drivers/leds/led-core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 8eb8054..5db251d 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -262,6 +262,19 @@ void led_set_brightness(struct led_classdev *led_cdev, unsigned int brightness)
 	}
 
 	led_set_brightness_nosleep(led_cdev, brightness);
+
+	/* When the LED is off and the hardware blinking will be disabled,
+	 * but the value of delay_on and delay_off still remains.
+	 */
+	if ((led_cdev->blink_delay_off > 0) &&
+		(led_cdev->blink_delay_on > 0) &&
+		(brightness == LED_OFF)) {
+		if (!test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
+			led_cdev->blink_set) {
+			led_cdev->blink_delay_on = 0;
+			led_cdev->blink_delay_off = 0;
+		}
+	}
 }
 EXPORT_SYMBOL_GPL(led_set_brightness);
 
-- 
1.9.1



Return-Path: <SRS0=3FHj=WG=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B034C41514
	for <linux-leds@archiver.kernel.org>; Sat, 10 Aug 2019 00:59:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 199FD20B7C
	for <linux-leds@archiver.kernel.org>; Sat, 10 Aug 2019 00:59:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729533AbfHJA7G (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 9 Aug 2019 20:59:06 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:11090 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726759AbfHJA7D (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 9 Aug 2019 20:59:03 -0400
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 09 Aug 2019 17:53:00 -0700
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg05-sd.qualcomm.com with ESMTP; 09 Aug 2019 17:52:59 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id E61C6435F; Fri,  9 Aug 2019 17:52:59 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglinw@codeaurora.org>,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [PATCH 2/2] leds: triggers: Don't remove trigger if LED_KEEP_TRIGGER flag is set
Date:   Fri,  9 Aug 2019 17:52:47 -0700
Message-Id: <1565398367-11811-2-git-send-email-gurus@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565398367-11811-1-git-send-email-gurus@codeaurora.org>
References: <1565398367-11811-1-git-send-email-gurus@codeaurora.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Fenglin Wu <fenglinw@codeaurora.org>

The LED_KEEP_TRIGGER flag prevents the trigger being removed while
turning off the LEDs. Extend the flag usage to prevent the trigger being
removed even while "none" trigger is set.

Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>
Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
---
 drivers/leds/led-triggers.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 8d11a5e..a0e4531 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -40,7 +40,8 @@ ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
 		goto unlock;
 	}
 
-	if (sysfs_streq(buf, "none")) {
+	if (sysfs_streq(buf, "none") &&
+			!(led_cdev->flags & LED_KEEP_TRIGGER)) {
 		led_trigger_remove(led_cdev);
 		goto unlock;
 	}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


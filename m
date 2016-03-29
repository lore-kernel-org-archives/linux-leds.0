From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH 2/3] ARM: configs: Enable panic LED trigger on s3c2410
Date: Tue, 29 Mar 2016 17:35:48 -0300
Message-ID: <1459283749-22451-3-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1459283749-22451-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qk0-f172.google.com ([209.85.220.172]:33942 "EHLO
	mail-qk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753793AbcC2UgM (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 29 Mar 2016 16:36:12 -0400
Received: by mail-qk0-f172.google.com with SMTP id x64so11420143qkd.1
        for <linux-leds@vger.kernel.org>; Tue, 29 Mar 2016 13:36:11 -0700 (PDT)
In-Reply-To: <1459283749-22451-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Richard Purdie <rpurdie@rpsys.net>, kgene@kernel.org, k.kozlowski@samsung.com, Jacek Anaszewski <j.anaszewski@samsung.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Let's add the panic LED trigger, which will be used by
the GTA02 board.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 arch/arm/configs/s3c2410_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/s3c2410_defconfig b/arch/arm/configs/s3c2410_defconfig
index b3ade552a2a5..81812bd5bcc7 100644
--- a/arch/arm/configs/s3c2410_defconfig
+++ b/arch/arm/configs/s3c2410_defconfig
@@ -385,6 +385,7 @@ CONFIG_LEDS_TRIGGER_TIMER=m
 CONFIG_LEDS_TRIGGER_HEARTBEAT=m
 CONFIG_LEDS_TRIGGER_GPIO=m
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=m
+CONFIG_LEDS_TRIGGER_PANIC=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_S3C=y
 CONFIG_EXT2_FS=y
-- 
2.7.0

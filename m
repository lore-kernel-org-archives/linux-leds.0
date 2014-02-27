From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/3] ARM: plat-versatile: update defconfigs for Versatile LEDs
Date: Thu, 27 Feb 2014 14:58:20 +0100
Message-ID: <1393509500-26002-3-git-send-email-linus.walleij@linaro.org>
References: <1393509500-26002-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:43885 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753103AbaB0N6n (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 27 Feb 2014 08:58:43 -0500
Received: by mail-wi0-f173.google.com with SMTP id bs8so7266921wib.0
        for <linux-leds@vger.kernel.org>; Thu, 27 Feb 2014 05:58:42 -0800 (PST)
In-Reply-To: <1393509500-26002-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>

As we moved the Versatile LEDs to the LEDs subsystem and made
it a module, the config options are no more default-selected.
Make sure all users still experience LEDs properly by updating
all RealView and Versatile defconfigs.

Cc: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Russell King <linux@arm.linux.org.uk>
Cc: Pawel Moll <pawel.moll@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/configs/realview-smp_defconfig | 2 ++
 arch/arm/configs/realview_defconfig     | 2 ++
 arch/arm/configs/versatile_defconfig    | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/arch/arm/configs/realview-smp_defconfig b/arch/arm/configs/realview-smp_defconfig
index abe61bf379d2..1da5d9e48224 100644
--- a/arch/arm/configs/realview-smp_defconfig
+++ b/arch/arm/configs/realview-smp_defconfig
@@ -76,8 +76,10 @@ CONFIG_MMC=y
 CONFIG_MMC_ARMMMCI=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_VERSATILE=y
 CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_DS1307=y
 CONFIG_RTC_DRV_PL031=y
diff --git a/arch/arm/configs/realview_defconfig b/arch/arm/configs/realview_defconfig
index 7079cbe898a8..d02e9d911bb7 100644
--- a/arch/arm/configs/realview_defconfig
+++ b/arch/arm/configs/realview_defconfig
@@ -75,8 +75,10 @@ CONFIG_MMC=y
 CONFIG_MMC_ARMMMCI=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_VERSATILE=y
 CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_DS1307=y
 CONFIG_RTC_DRV_PL031=y
diff --git a/arch/arm/configs/versatile_defconfig b/arch/arm/configs/versatile_defconfig
index 073541a50e23..d52b4ffe2012 100644
--- a/arch/arm/configs/versatile_defconfig
+++ b/arch/arm/configs/versatile_defconfig
@@ -61,6 +61,9 @@ CONFIG_SND_ARMAACI=m
 CONFIG_MMC=y
 CONFIG_MMC_ARMMMCI=m
 CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_VERSATILE=y
+CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_EXT2_FS=y
-- 
1.8.5.3

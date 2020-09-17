Return-Path: <SRS0=SVrG=C2=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B23C43463
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 22:37:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34911208DB
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 22:37:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="HgUI2zRu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726040AbgIQWdz (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 17 Sep 2020 18:33:55 -0400
Received: from lists.nic.cz ([217.31.204.67]:35296 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725858AbgIQWdz (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:33:55 -0400
X-Greylist: delayed 25787 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 18:33:54 EDT
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id DC359140A4F;
        Fri, 18 Sep 2020 00:33:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382033; bh=79YEnALFxfE9ebU2M2e/J2Lo4oN/NscfLB82bk7fYXM=;
        h=From:To:Date;
        b=HgUI2zRulwaZDlvuc/mhRodL3TpS4vijWu6ZWSyt9ZyTSF4UnABBqNEm5kRTcaJrl
         764SLBWEAM0W75Ks1JfEa8PUdAlcYrsu1FBIIPO8MSeJ2hfWWeiZ39iGjWknshKqeH
         mIJi1LJilgaJJuQ5aZStxcj6riSU6MApypCFLI4c=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds v2 01/50] leds: various: compile if COMPILE_TEST=y
Date:   Fri, 18 Sep 2020 00:32:49 +0200
Message-Id: <20200917223338.14164-2-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917223338.14164-1-marek.behun@nic.cz>
References: <20200917223338.14164-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

These drivers can be compiled without modification when COMPILE_TEST=y:
  cobalt-qube, cobalt-raq, netxbig, ns2 and s3c24xx

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 4f6464a169d57..96d54e36e3b55 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -274,7 +274,7 @@ config LEDS_MT6323
 config LEDS_S3C24XX
 	tristate "LED Support for Samsung S3C24XX GPIO LEDs"
 	depends on LEDS_CLASS
-	depends on ARCH_S3C24XX
+	depends on ARCH_S3C24XX || COMPILE_TEST
 	help
 	  This option enables support for LEDs connected to GPIO lines
 	  on Samsung S3C24XX series CPUs, such as the S3C2410 and S3C2440.
@@ -304,13 +304,13 @@ config LEDS_WRAP
 config LEDS_COBALT_QUBE
 	tristate "LED Support for the Cobalt Qube series front LED"
 	depends on LEDS_CLASS
-	depends on MIPS_COBALT
+	depends on MIPS_COBALT || COMPILE_TEST
 	help
 	  This option enables support for the front LED on Cobalt Qube series
 
 config LEDS_COBALT_RAQ
 	bool "LED Support for the Cobalt Raq series"
-	depends on LEDS_CLASS=y && MIPS_COBALT
+	depends on LEDS_CLASS=y && (MIPS_COBALT || COMPILE_TEST)
 	select LEDS_TRIGGERS
 	help
 	  This option enables support for the Cobalt Raq series LEDs.
@@ -644,7 +644,7 @@ config LEDS_MC13783
 config LEDS_NS2
 	tristate "LED support for Network Space v2 GPIO LEDs"
 	depends on LEDS_CLASS
-	depends on MACH_KIRKWOOD || MACH_ARMADA_370
+	depends on MACH_KIRKWOOD || MACH_ARMADA_370 || COMPILE_TEST
 	default y
 	help
 	  This option enables support for the dual-GPIO LEDs found on the
@@ -658,7 +658,7 @@ config LEDS_NS2
 config LEDS_NETXBIG
 	tristate "LED support for Big Network series LEDs"
 	depends on LEDS_CLASS
-	depends on MACH_KIRKWOOD
+	depends on MACH_KIRKWOOD || COMPILE_TEST
 	depends on OF_GPIO
 	default y
 	help
-- 
2.26.2


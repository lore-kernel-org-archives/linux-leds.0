From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCH 0/6] leds: Remove duplicated OOM message for individual driver
Date: Wed, 30 Apr 2014 16:07:19 +0800
Message-ID: <1398845245-26344-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-bl2lp0204.outbound.protection.outlook.com ([207.46.163.204]:9569
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1757533AbaD3IwW (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 30 Apr 2014 04:52:22 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, michael.hennerich@analog.com
Cc: Xiubo Li <Li.Xiubo@freescale.com>


Xiubo Li (6):
  leds: bd2802: Remove duplicated OOM message for individual driver
  leds: da903x: Remove duplicated OOM message for individual driver
  leds: da9052: Remove duplicated OOM message for individual driver
  leds: s3c24xx: Remove duplicated OOM message for individual driver
  leds: sunfire: Remove duplicated OOM message for individual driver
  leds: adp5520: Remove duplicated OOM message for individual driver

 drivers/leds/leds-adp5520.c | 5 +----
 drivers/leds/leds-bd2802.c  | 4 +---
 drivers/leds/leds-da903x.c  | 4 +---
 drivers/leds/leds-da9052.c  | 3 +--
 drivers/leds/leds-s3c24xx.c | 4 +---
 drivers/leds/leds-sunfire.c | 4 +---
 6 files changed, 6 insertions(+), 18 deletions(-)

-- 
1.8.4

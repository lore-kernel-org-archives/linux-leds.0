From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCH 0/3] leds: gpio: fix bugs and cleanup the code.
Date: Sun, 28 Sep 2014 16:57:13 +0800
Message-ID: <1411894636-12360-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-bn1on0134.outbound.protection.outlook.com ([157.56.110.134]:3824
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751049AbaI1JNf (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Sun, 28 Sep 2014 05:13:35 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net
Cc: linux-leds@vger.kernel.org, Xiubo Li <Li.Xiubo@freescale.com>


Xiubo Li (3):
  led: gpio: Sort include headers alphabetically
  led: gpio: Fix possible ZERO_SIZE_PTR pointer dereferencing error.
  leds: gpio: cleanup the leds-gpio driver

 drivers/leds/leds-gpio-register.c |  5 ++++-
 drivers/leds/leds-gpio.c          | 14 ++++++--------
 2 files changed, 10 insertions(+), 9 deletions(-)

-- 
2.1.0.27.g96db324

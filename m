From: Alan Mizrahi <alan@mizrahi.com.ve>
Subject: [PATCH v2 0/1] leds: Add driver for PC Engines APU/APU2 LEDs
Date: Sun, 24 Sep 2017 09:36:46 +0900
Message-ID: <20170924003646.GA6847@olympus.mizrahi.com.ve>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail02.asahi-net.or.jp ([202.224.55.14]:32991 "EHLO
        mail02.asahi-net.or.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751754AbdIXAgr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 23 Sep 2017 20:36:47 -0400
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org

Hello,

This patch adds support for the PC Engines APU/APU2 fron panel LEDs.

Changes from v1 to v2:
- Include color in LEDs names
- Improve Kconfig description
- Rename identifiers that are reserved for LED core namespace
- Remove unimplemented code placeholders
- Fix problems reported by checkpatch.pl

Alan Mizrahi (1):
  leds: Add driver for PC Engines APU/APU2 LEDs

 drivers/leds/Kconfig    |  11 ++
 drivers/leds/Makefile   |   1 +
 drivers/leds/leds-apu.c | 272 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 284 insertions(+)
 create mode 100644 drivers/leds/leds-apu.c

-- 
2.9.0

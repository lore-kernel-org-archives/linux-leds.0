From: Alan Mizrahi <alan@mizrahi.com.ve>
Subject: [PATCH v4 0/1] leds: Add driver for PC Engines APU/APU2 LEDs
Date: Fri, 3 Nov 2017 10:36:40 +0900
Message-ID: <20171103013640.GA13206@poseidon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail03.asahi-net.or.jp ([202.224.55.15]:37770 "EHLO
        mail03.asahi-net.or.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934561AbdKCBgp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 2 Nov 2017 21:36:45 -0400
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org

Hello,

This patch implements the driver to support the front panel LEDs
for PC Engines APU and APU2 boards.

Changes from v3 to v4:
- use const qualifiers where applicable

Alan Mizrahi (1):
  leds: Add driver for PC Engines APU/APU2 LEDs

 drivers/leds/Kconfig    |  10 ++
 drivers/leds/Makefile   |   1 +
 drivers/leds/leds-apu.c | 278 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 289 insertions(+)
 create mode 100644 drivers/leds/leds-apu.c

-- 
2.9.0

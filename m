From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH 0/2]  LED trigger on MTD activity
Date: Tue, 12 Apr 2016 13:26:33 -0300
Message-ID: <1460478395-25925-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qk0-f179.google.com ([209.85.220.179]:33678 "EHLO
	mail-qk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757110AbcDLQ37 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 Apr 2016 12:29:59 -0400
Received: by mail-qk0-f179.google.com with SMTP id k135so8452101qke.0
        for <linux-leds@vger.kernel.org>; Tue, 12 Apr 2016 09:29:58 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-mtd@lists.infradead.org, linux-leds@vger.kernel.org
Cc: Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

After our recent discussion [1], here's a proper patchset.

The first patch is a minor cleanup which moves mtd_write_oob
out of mtd.h header.

The second patch implements the LED trigger. Unfortunately,
it depends on the first patch, so it might make sense to take
this two through the MTD tree with Jacked acknowledgement.

Feedback is welcome!

[1] http://www.spinics.net/lists/linux-leds/msg05906.html

Ezequiel Garcia (2):
  mtd: Uninline mtd_write_oob and move it to mtdcore.c
  leds: trigger: Introduce a MTD (NAND/NOR) trigger

 drivers/leds/trigger/Kconfig       |  8 +++++++
 drivers/leds/trigger/Makefile      |  1 +
 drivers/leds/trigger/ledtrig-mtd.c | 49 ++++++++++++++++++++++++++++++++++++++
 drivers/mtd/mtdcore.c              | 19 +++++++++++++++
 drivers/mtd/nand/nand_base.c       | 29 +---------------------
 include/linux/leds.h               |  6 +++++
 include/linux/mtd/mtd.h            | 12 +---------
 7 files changed, 85 insertions(+), 39 deletions(-)
 create mode 100644 drivers/leds/trigger/ledtrig-mtd.c

-- 
2.7.0

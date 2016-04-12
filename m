From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH v2 0/4] LED trigger on MTD activity
Date: Tue, 12 Apr 2016 17:46:38 -0300
Message-ID: <1460494002-8578-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qg0-f41.google.com ([209.85.192.41]:35119 "EHLO
	mail-qg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965411AbcDLUq7 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 Apr 2016 16:46:59 -0400
Received: by mail-qg0-f41.google.com with SMTP id f105so26920693qge.2
        for <linux-leds@vger.kernel.org>; Tue, 12 Apr 2016 13:46:58 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-mtd@lists.infradead.org, linux-leds@vger.kernel.org
Cc: Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

After our recent discussion [1], here's a proper patchset.

The first patch is a minor cleanup which moves mtd_write_oob
out of mtd.h header.

The second patch introduces the LED MTD trigger.

The third patch removes the "nand-disk" LED trigger
from the NAND core.

The fourth patch completes the series by calling ledtrig_mtd_activity
on all MTD I/O activity paths.

Changes from v1:

  * Split the patches, suggested by Boris.

Feedback is welcome!

[1] http://www.spinics.net/lists/linux-leds/msg05906.html

Ezequiel Garcia (4):
  mtd: Uninline mtd_write_oob and move it to mtdcore.c
  leds: trigger: Introduce a MTD (NAND/NOR) trigger
  mtd: nand: Remove the "nand-disk" LED trigger
  mtd: Hook I/O activity to the MTD LED trigger

 drivers/leds/trigger/Kconfig       |  8 +++++++
 drivers/leds/trigger/Makefile      |  1 +
 drivers/leds/trigger/ledtrig-mtd.c | 45 ++++++++++++++++++++++++++++++++++++++
 drivers/mtd/mtdcore.c              | 19 ++++++++++++++++
 drivers/mtd/nand/nand_base.c       | 29 +-----------------------
 include/linux/leds.h               |  6 +++++
 include/linux/mtd/mtd.h            | 12 +---------
 7 files changed, 81 insertions(+), 39 deletions(-)
 create mode 100644 drivers/leds/trigger/ledtrig-mtd.c

-- 
2.7.0

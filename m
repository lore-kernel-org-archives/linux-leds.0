From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH 0/3] Add a new LED trigger for kernel panics (and use it)
Date: Tue, 29 Mar 2016 17:35:46 -0300
Message-ID: <1459283749-22451-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qg0-f51.google.com ([209.85.192.51]:32812 "EHLO
	mail-qg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753793AbcC2UgG (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 29 Mar 2016 16:36:06 -0400
Received: by mail-qg0-f51.google.com with SMTP id j35so22717350qge.0
        for <linux-leds@vger.kernel.org>; Tue, 29 Mar 2016 13:36:06 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Richard Purdie <rpurdie@rpsys.net>, kgene@kernel.org, k.kozlowski@samsung.com, Jacek Anaszewski <j.anaszewski@samsung.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

This patchset adds a very simple kernel panic LED trigger,
by hooking into panic_blink. I've tested this trigger on
ARM Armada XP OpenBlocks AX3-4 machine.

The trigger is then used to replace the open-coded panic_blink
usage in GTA02 board.

Note that I don't have a GTA02 board, so the last patch is only
built tested.

Ezequiel Garcia (3):
  leds: trigger: Introduce a kernel panic LED trigger
  ARM: configs: Enable panic LED trigger on s3c2410
  ARM: s3c24xx: Use the panic LED trigger for GTA02

 arch/arm/configs/s3c2410_defconfig   |  1 +
 arch/arm/mach-s3c24xx/mach-gta02.c   | 35 ++++++++++++++++-------------------
 drivers/leds/trigger/Kconfig         |  7 +++++++
 drivers/leds/trigger/Makefile        |  1 +
 drivers/leds/trigger/ledtrig-panic.c | 30 ++++++++++++++++++++++++++++++
 5 files changed, 55 insertions(+), 19 deletions(-)
 create mode 100644 drivers/leds/trigger/ledtrig-panic.c

-- 
2.7.0

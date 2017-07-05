From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [GIT PULL] LED updates for 4.13
Date: Wed,  5 Jul 2017 22:05:20 +0200
Message-ID: <1499285120-3909-1-git-send-email-jacek.anaszewski@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:36138 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753658AbdGEUGN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 5 Jul 2017 16:06:13 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, colin.king@canonical.com, paul.burton@imgtec.com, jan.kiszka@siemens.com, linus.walleij@linaro.org, anders@chargestorm.se

Hi Linus,

Please pull LED updates for 4.13.

This time we're removing more than adding:

Remove drivers:

leds-versatile:
  - all users of the Versatile LED driver are deleted and replaced
    with the very generic leds-syscon

leds-sead3:
  - SEAD3 is using the generic leds-syscon & regmap based register-bit-led
    driver

LED class drivers improvements:

ledtrig-gpio:
  - use threaded IRQ, which both simplifies the code because we can drop
    the workqueue indirection, and it enables using the trigger for GPIOs
    that work with threaded IRQs themselves
  - refresh LED state after GPIO change since the new GPIO may have a different
    state than the old one

leds-lp55xx:
  - make various arrays static const

leds-pca963x:
  - add bindings to invert polarity

Best regards,
Jacek Anaszewski

The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/leds_for_4.13

for you to fetch changes up to 4d1707c1c6901906707b9419cac8d9c84bc17d88:

  leds: lp55xx: make various arrays static const (2017-06-30 23:15:44 +0200)

----------------------------------------------------------------
LED updates for 4.13

----------------------------------------------------------------
Anders Darander (1):
      leds: pca963x: Add bindings to invert polarity

Colin Ian King (1):
      leds: lp55xx: make various arrays static const

Jan Kiszka (2):
      leds: trigger: gpio: Refresh LED state after GPIO change
      leds: trigger: gpio: Use threaded IRQ

Linus Walleij (1):
      leds: Delete obsolete Versatile driver

Paul Burton (1):
      leds: Remove SEAD-3 driver

 Documentation/devicetree/bindings/leds/pca963x.txt |   1 +
 drivers/leds/Kconfig                               |  18 ----
 drivers/leds/Makefile                              |   2 -
 drivers/leds/leds-lp5523.c                         |  10 +-
 drivers/leds/leds-pca963x.c                        |  17 +++-
 drivers/leds/leds-sead3.c                          |  78 ---------------
 drivers/leds/leds-versatile.c                      | 110 ---------------------
 drivers/leds/trigger/ledtrig-gpio.c                |  29 ++----
 include/linux/platform_data/leds-pca963x.h         |   6 ++
 9 files changed, 34 insertions(+), 237 deletions(-)
 delete mode 100644 drivers/leds/leds-sead3.c
 delete mode 100644 drivers/leds/leds-versatile.c

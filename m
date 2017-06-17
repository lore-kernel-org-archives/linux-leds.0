From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [GIT PULL] LED fixes 4.12-rc6
Date: Sat, 17 Jun 2017 13:36:22 +0200
Message-ID: <1497699382-3160-1-git-send-email-jacek.anaszewski@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:34857 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752787AbdFQLhP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 17 Jun 2017 07:37:15 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, bo.zhang@nxp.com, jonas.gorski@gmail.com

Hi Linus,

Please pull two LED fixes:
- fix signal source assignment for leds-bcm6328
- revert patch that intended to fix LED behavior on suspend but it
  had a side effect preventing suspend at all due to uevent being
  sent on trigger removal; the original problem will need to get more
  investigation

The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/led_fixes_for_4.12-rc6

for you to fetch changes up to 436c4c45b5b9562b59cedbb51b7343ab4a6dd8cc:

  Revert "leds: handle suspend/resume in heartbeat trigger" (2017-06-13 20:37:01 +0200)

Best regards,
Jacek Anaszewski

----------------------------------------------------------------
LED fixes for 4.12-rc6

----------------------------------------------------------------
Jonas Gorski (1):
      leds: bcm6328: fix signal source assignment for leds 4 to 7

Zhang Bo (1):
      Revert "leds: handle suspend/resume in heartbeat trigger"

 drivers/leds/leds-bcm6328.c              |  4 ++--
 drivers/leds/trigger/ledtrig-heartbeat.c | 31 -------------------------------
 2 files changed, 2 insertions(+), 33 deletions(-)

From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [GIT PULL] LED fix for 4.15-rc6
Date: Thu, 28 Dec 2017 22:25:50 +0100
Message-ID: <1514496350-3229-1-git-send-email-jacek.anaszewski@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:46384 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751220AbdL1V1A (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 28 Dec 2017 16:27:00 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, matthieu.castet@parrot.com

Hi Linus,

Please pull a single LED fix for brightness setting when delay_off is 0.

The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:

  Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/led_fixes_for_4.15-rc6

for you to fetch changes up to 2b83ff96f51d0b039c4561b9f95c824d7bddb85c:

  led: core: Fix brightness setting when setting delay_off=0 (2017-12-27 20:45:07 +0100)

Thanks,
Jacek Anaszewski

----------------------------------------------------------------
LED fix for 4.15-rc6
----------------------------------------------------------------
Matthieu CASTET (1):
      led: core: Fix brightness setting when setting delay_off=0

 drivers/leds/led-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [GIT PULL] LED fix for 4.15-rc7
Date: Sun,  7 Jan 2018 14:13:58 +0100
Message-ID: <1515330838-4044-1-git-send-email-jacek.anaszewski@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:38719 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753283AbeAGNPF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 7 Jan 2018 08:15:05 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com

Hi Linus,

Please pull LED regression fix for 4.15-rc7.

The commit 2b83ff96f51d for 4.15-rc6, which was fixing LED brightness
setting after clearing delay_off broke the behavior on any alteration
of delay_on{off} properties, due to use of a LED core helper that does
too much for this particular case.

The following changes since commit 30a7acd573899fd8b8ac39236eff6468b195ac7d:

  Linux 4.15-rc6 (2017-12-31 14:47:43 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/led_fixes_for_4.15-rc7

for you to fetch changes up to 7b6af2c53192f1766892ef40c8f48a413509ed72:

  leds: core: Fix regression caused by commit 2b83ff96f51d (2018-01-07 13:27:07 +0100)

Thanks,
Jacek Anaszewski

----------------------------------------------------------------
LED fix for 4.15-rc7
----------------------------------------------------------------
Jacek Anaszewski (1):
      leds: core: Fix regression caused by commit 2b83ff96f51d

 drivers/leds/led-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

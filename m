From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [GIT PULL] LED fixes for 4.7-rc4
Date: Fri, 17 Jun 2016 11:21:04 +0200
Message-ID: <1466155264-30850-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Linus,

Please pull LED fixes for 4.7-rc4.

The following changes since commit af8c34ce6ae32addda3788d54a7e340cad22516b:

  Linux 4.7-rc2 (2016-06-05 14:31:26 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/for-4.7-rc4

for you to fetch changes up to 5ab92a7cb82c66bf30685583a38a18538e3807db:

  leds: handle suspend/resume in heartbeat trigger (2016-06-08 11:47:06 +0200)

----------------------------------------------------------------
- Fix brightness setting upon hardware blinking enabled

- Handle suspend/resume in heartbeat trigger
----------------------------------------------------------------

Thanks,
Jacek Anaszewski

Linus Walleij (1):
      leds: handle suspend/resume in heartbeat trigger

Tony Makkiel (1):
      leds: core: Fix brightness setting upon hardware blinking enabled

 Documentation/leds/leds-class.txt        |    4 ++--
 drivers/leds/led-core.c                  |    9 ++++++---
 drivers/leds/trigger/ledtrig-heartbeat.c |   31 ++++++++++++++++++++++++++++++
 include/linux/leds.h                     |   23 +++++++++++-----------
 4 files changed, 51 insertions(+), 16 deletions(-)

From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [GIT PULL] LED updates for 4.15-rc1
Date: Tue, 14 Nov 2017 22:01:07 +0100
Message-ID: <1510693267-4983-1-git-send-email-jacek.anaszewski@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:51733 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756615AbdKNVCW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 14 Nov 2017 16:02:22 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, alan@mizrahi.com.ve, andrew@aj.id.au, arvind.yadav.cs@gmail.com, chris.gekas@gmail.com, dtwlin@google.com, jacek.anaszewski@gmail.com, keescook@chromium.org, w@1wt.eu

Hi Linus,

Please pull LED updates for 4.15-rc1.

New LED class driver:
    - add a driver for PC Engines APU/APU2 LEDs

New LED trigger:
    - add a system activity LED trigger

LED core improvements:
    - replace flags bit shift with BIT() macros

Convert timers to use timer_setup() in:
    - led-core
    - ledtrig-activity
    - ledtrig-heartbeat
    - ledtrig-transient

LED class drivers fixes:
    - lp55xx: fix spelling mistake: 'cound' -> 'could'
    - tca6507: Remove unnecessary reg check
    - pca955x: Don't invert requested value in pca955x_gpio_set_value()

LED documentation improvements:
    - update 00-INDEX file

The following changes since commit 9e66317d3c92ddaab330c125dfe9d06eee268aff:

  Linux 4.14-rc3 (2017-10-01 14:54:54 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/leds_for_4.15rc1

for you to fetch changes up to 3faee9423ce07186fc9dcec2981d4eb8af8872bb:

  leds: Add driver for PC Engines APU/APU2 LEDs (2017-11-06 22:05:00 +0100)

Thanks,
Jacek Anaszewski

----------------------------------------------------------------
LED updates for 4.15rc1
----------------------------------------------------------------

Alan Mizrahi (1):
      leds: Add driver for PC Engines APU/APU2 LEDs

Andrew Jeffery (1):
      leds: pca955x: Don't invert requested value in pca955x_gpio_set_value()

Arvind Yadav (1):
      leds: lp55xx: fix spelling mistake: 'cound' -> 'could'

Christos Gkekas (1):
      leds: tca6507: Remove unnecessary reg check

David Lin (1):
      leds: Replace flags bit shift with BIT() macros

Jacek Anaszewski (1):
      Documentation: leds: Update 00-INDEX file

Kees Cook (2):
      leds: ledtrig-heartbeat: Convert timers to use timer_setup()
      leds: Convert timers to use timer_setup()

Willy Tarreau (1):
      leds: ledtrig-activity: Add a system activity LED trigger

 Documentation/leds/00-INDEX              |  10 ++
 drivers/leds/Kconfig                     |  10 ++
 drivers/leds/Makefile                    |   1 +
 drivers/leds/led-core.c                  |   7 +-
 drivers/leds/leds-apu.c                  | 278 +++++++++++++++++++++++++++++++
 drivers/leds/leds-lp5523.c               |   2 +-
 drivers/leds/leds-pca955x.c              |  17 +-
 drivers/leds/leds-tca6507.c              |   2 +-
 drivers/leds/trigger/Kconfig             |   9 +
 drivers/leds/trigger/Makefile            |   1 +
 drivers/leds/trigger/ledtrig-activity.c  | 275 ++++++++++++++++++++++++++++++
 drivers/leds/trigger/ledtrig-heartbeat.c |  16 +-
 drivers/leds/trigger/ledtrig-transient.c |  12 +-
 include/linux/leds.h                     |  18 +-
 14 files changed, 627 insertions(+), 31 deletions(-)
 create mode 100644 drivers/leds/leds-apu.c
 create mode 100644 drivers/leds/trigger/ledtrig-activity.c

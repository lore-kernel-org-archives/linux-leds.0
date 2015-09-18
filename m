From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [GIT PULL] LED subsystem fixes for v4.3-rc2
Date: Fri, 18 Sep 2015 13:16:47 +0200
Message-ID: <1442575007-18191-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Linus,

Please consider pulling LED subsystem fixes for v4.3-rc2.

The following changes since commit 6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f:

  Linux 4.3-rc1 (2015-09-12 16:35:56 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/led-fixes-for-v4.3-rc2

for you to fetch changes up to 2338f73d407d5abe2036d92716ba25ef5279c3d2:

  leds:lp55xx: Correct Kconfig dependency for f/w user helper (2015-09-17 10:02:20 +0200)

----------------------------------------------------------------
- fix module autoload for six OF platform drivers
  (aat1290, bcm6328, bcm6358, ktd2692, max77693, ns2)
- aat1290: add missing static modifier
- ipaq-micro: add missing LEDS_CLASS dependency
- lp55xx: correct Kconfig dependecy for f/w user helper

----------------------------------------------------------------
Jacek Anaszewski (2):
      leds: aat1290: add 'static' modifier to init_mm_current_scale
      leds: leds-ipaq-micro: Add LEDS_CLASS dependency

Luis de Bethencourt (6):
      leds: aat1290: Fix module autoload for OF platform driver
      leds: bcm6328: Fix module autoload for OF platform driver
      leds: bcm6358: Fix module autoload for OF platform driver
      leds: ktd2692: Fix module autoload for OF platform driver
      leds: max77693: Fix module autoload for OF platform driver
      leds: leds-ns2: Fix module autoload for OF platform driver

Takashi Iwai (1):
      leds:lp55xx: Correct Kconfig dependency for f/w user helper

 drivers/leds/Kconfig         |    3 ++-
 drivers/leds/leds-aat1290.c  |    3 ++-
 drivers/leds/leds-bcm6328.c  |    1 +
 drivers/leds/leds-bcm6358.c  |    1 +
 drivers/leds/leds-ktd2692.c  |    1 +
 drivers/leds/leds-max77693.c |    1 +
 drivers/leds/leds-ns2.c      |    1 +
 7 files changed, 9 insertions(+), 2 deletions(-)

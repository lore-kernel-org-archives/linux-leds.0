From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [GIT PULL] LED fixes for 4.20-rc2
Date: Thu,  8 Nov 2018 20:29:08 +0100
Message-ID: <1541705348-4615-1-git-send-email-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, baolin.wang@linaro.org, geert+renesas@glider.be, pavel@ucw.cz
List-Id: linux-leds@vger.kernel.org

Hi Linus,

Please pull LED fixes for 4.20-rc2.

All three fixes are related to the newly added pattern trigger:

- remove mutex_lock() from timer callback, which would trigger problems
  related to sleeping in atomic context, the removal is harmless since
  mutex protection turned out to be redundant in this case
- fix pattern parsing to properly handle intervals with brightness == 0
- fix typos in the ABI documentation

The following changes since commit 8dbac65f5c181e4723586ab738b703bb23bc3f2a:

  leds: sc27xx: Add pattern_set/clear interfaces for LED controller (2018-10-11 21:59:11 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/led-fixes-for-4.20-rc2

for you to fetch changes up to 406e7f986b2e4499295351bcfff5c93b0d34022a:

  Documentation: ABI: led-trigger-pattern: Fix typos (2018-11-07 21:43:46 +0100)

Thanks,
Jacek Anaszewski

----------------------------------------------------------------
LED fixes for 4.20-rc2
----------------------------------------------------------------
Baolin Wang (1):
      leds: trigger: Fix sleeping function called from invalid context

Geert Uytterhoeven (1):
      Documentation: ABI: led-trigger-pattern: Fix typos

Pavel Machek (1):
      Fix pattern handling optimalization

 .../ABI/testing/sysfs-class-led-trigger-pattern    |  4 ++--
 drivers/leds/trigger/ledtrig-pattern.c             | 27 +++++++---------------
 2 files changed, 10 insertions(+), 21 deletions(-)

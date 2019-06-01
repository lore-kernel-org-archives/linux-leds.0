From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [GIT PULL] LED fix for 5.2-rc3
Date: Sat,  1 Jun 2019 19:59:44 +0200
Message-ID: <20190601175944.21297-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz
List-Id: linux-leds@vger.kernel.org

Hi Linus,

Please pull LED fix for recent change in LED core,
that didn't take into account the possibility of calling
led_blink_setup() from atomic context.

The following changes since commit cd6c84d8f0cdc911df435bb075ba22ce3c605b07:

  Linux 5.2-rc2 (2019-05-26 16:49:19 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/led-fixes-for-5.2-rc3

for you to fetch changes up to 8c0f693c6effbc3f42f77a9e81209af9af20910c:

  leds: avoid flush_work in atomic context (2019-05-31 22:29:14 +0200)

Thanks,
Jacek Anaszewski

----------------------------------------------------------------
LED fix for 5.2-rc3
----------------------------------------------------------------
Pavel Machek (1):
      leds: avoid flush_work in atomic context

 drivers/leds/led-core.c              | 5 -----
 drivers/leds/trigger/ledtrig-timer.c | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

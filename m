From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [GIT PULL] LED fix for 5.0-rc3.
Date: Thu, 17 Jan 2019 22:43:52 +0100
Message-ID: <20190117214352.23045-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, kjlu@umn.edu
List-Id: linux-leds@vger.kernel.org

Hi Linus,

Please pull single LED fix.

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/led-fix-for-5.0-rc3

for you to fetch changes up to 248b57015f35c94d4eae2fdd8c6febf5cd703900:

  leds: lp5523: fix a missing check of return value of lp55xx_read (2019-01-17 22:27:39 +0100)

Thanks,
Jacek Anaszewski

----------------------------------------------------------------
LED fix for 5.0-rc3
----------------------------------------------------------------
Kangjie Lu (1):
      leds: lp5523: fix a missing check of return value of lp55xx_read

 drivers/leds/leds-lp5523.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

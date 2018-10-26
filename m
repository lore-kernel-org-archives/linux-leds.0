From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [GIT PULL] LED fix for 4.20-rc1
Date: Fri, 26 Oct 2018 21:33:28 +0200
Message-ID: <1540582408-6422-1-git-send-email-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, liviu@dudau.co.uk
List-Id: linux-leds@vger.kernel.org

Hi Linus,

Please pull one LED fix for 4.20-rc1.

The patch fixes regression introduced by the commit
45d4c6de4e49 ("leds: gpio: Try to lookup gpiod from device").

The following changes since commit 8dbac65f5c181e4723586ab738b703bb23bc3f2a:

  leds: sc27xx: Add pattern_set/clear interfaces for LED controller (2018-10-11 21:59:11 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/led-fix-for-4.20-rc1

for you to fetch changes up to 72b8ad40e14302f869382656a914bb803796b4ed:

  leds: gpio: set led_dat->gpiod pointer for OF defined GPIO leds (2018-10-26 20:51:36 +0200)

Thanks,
Jacek Anaszewski

----------------------------------------------------------------
LED fix for 4-20-rc1
----------------------------------------------------------------
Liviu Dudau (1):
      leds: gpio: set led_dat->gpiod pointer for OF defined GPIO leds

 drivers/leds/leds-gpio.c | 2 ++
 1 file changed, 2 insertions(+)

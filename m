From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [GIT PULL] LED fixes for 5.1-rc3
Date: Sat, 30 Mar 2019 19:39:42 +0100
Message-ID: <20190330183942.6589-1-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, kjlu@umn.edu, linux@rasmusvillemoes.dk, rafal@milecki.pl
List-Id: linux-leds@vger.kernel.org

Hi Linus,

Please pull LED fixes for 5.1-rc3.

ledtrig-netdev fixes:
	- fix refcnt leak on interface rename
	- use memcpy in device_name_store() to avoid including garbage from
          a previous, longer value in the device_name

leds-pca9532:
	- fix a potential NULL pointer dereference in case of_match_device()
          cannot find a match

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/led-fixes-for-5.1-rc3

for you to fetch changes up to 909346433064b8d840dc82af26161926b8d37558:

  leds: trigger: netdev: use memcpy in device_name_store (2019-03-30 19:09:32 +0100)

Thanks,
Jacek Anaszewski

----------------------------------------------------------------
LED fixes for 5.1-rc3
----------------------------------------------------------------
Kangjie Lu (1):
      leds: pca9532: fix a potential NULL pointer dereference

Rafał Miłecki (1):
      leds: trigger: netdev: fix refcnt leak on interface rename

Rasmus Villemoes (1):
      leds: trigger: netdev: use memcpy in device_name_store

 drivers/leds/leds-pca9532.c           |  8 ++++++--
 drivers/leds/trigger/ledtrig-netdev.c | 16 +++++++---------
 2 files changed, 13 insertions(+), 11 deletions(-)

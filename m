From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [GIT PULL] LED updates for 4.20-rc1
Date: Mon, 22 Oct 2018 21:28:29 +0200
Message-ID: <1540236509-5341-1-git-send-email-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, baolin.wang@linaro.org, jbrunet@baylibre.com, linus.walleij@linaro.org, robh@kernel.org, simon@lineageos.org
List-Id: linux-leds@vger.kernel.org

Hi Linus,

Please pull LED updates for 4.20-rc1.

We introduce LED pattern trigger - the idea that was proposed three years
ago now received enough attention and determination to drive it to the
successful end.

There is also one new LED class driver and couple of improvements
to the existing ones.


New LED class driver
	- add support for Panasonic AN30259A with related DT bindings

New LED trigger
	- introduce LED pattern trigger

leds-sc27xx-bltc
	- implement pattern_set/clear ops to enable support for
	  pattern trigger's hw_pattern sysfs file

Improvements to existing LED class drivers:
	- leds-pwm: don't print error message on -EPROBE_DEFER
	- leds-gpio: try to lookup gpiod from device
	- leds-as3645a: convert to using %pOFn instead of device_node.name


Thanks,
Jacek Anaszewski

The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/leds-for-4.20-rc1

for you to fetch changes up to 8dbac65f5c181e4723586ab738b703bb23bc3f2a:

  leds: sc27xx: Add pattern_set/clear interfaces for LED controller (2018-10-11 21:59:11 +0200)

----------------------------------------------------------------
LED updates for 4.20-rc1.
----------------------------------------------------------------
Baolin Wang (2):
      leds: core: Introduce LED pattern trigger
      leds: sc27xx: Add pattern_set/clear interfaces for LED controller

Jerome Brunet (1):
      leds: pwm: silently error out on EPROBE_DEFER

Linus Walleij (1):
      leds: gpio: Try to lookup gpiod from device

Rob Herring (1):
      leds: Convert to using %pOFn instead of device_node.name

Simon Shields (2):
      dt-bindings: leds: document Panasonic AN30259A bindings
      leds: add Panasonic AN30259A support

 .../ABI/testing/sysfs-class-led-driver-sc27xx      |  22 ++
 .../ABI/testing/sysfs-class-led-trigger-pattern    |  82 ++++
 .../devicetree/bindings/leds/leds-an30259a.txt     |  43 +++
 drivers/leds/Kconfig                               |  10 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-an30259a.c                       | 368 ++++++++++++++++++
 drivers/leds/leds-as3645a.c                        |   4 +-
 drivers/leds/leds-gpio.c                           |  92 +++--
 drivers/leds/leds-pwm.c                            |   5 +-
 drivers/leds/leds-sc27xx-bltc.c                    | 121 ++++++
 drivers/leds/trigger/Kconfig                       |   7 +
 drivers/leds/trigger/Makefile                      |   1 +
 drivers/leds/trigger/ledtrig-pattern.c             | 411 +++++++++++++++++++++
 include/linux/leds.h                               |  15 +
 14 files changed, 1148 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-sc27xx
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-pattern
 create mode 100644 Documentation/devicetree/bindings/leds/leds-an30259a.txt
 create mode 100644 drivers/leds/leds-an30259a.c
 create mode 100644 drivers/leds/trigger/ledtrig-pattern.c

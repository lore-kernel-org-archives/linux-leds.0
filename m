From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [GIT PULL] LED updates for 4.21-rc1
Date: Fri, 21 Dec 2018 16:54:51 +0100
Message-ID: <20181221155451.7024-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, krzk@kernel.org, robh@kernel.org, tiny.windzz@gmail.com
List-Id: linux-leds@vger.kernel.org

Hi Linus,

Please pull LED updates for 4.21-rc1.

There are several few-liners, where most of them are fixes
and improvments. One thing standing out is ground preparation
for inititializing trigger parameters via Device Tree.

We introduce LED_INIT_DEFAULT_TRIGGER flag for that purpose
and set it when default trigger is matched. It indicates
that trigger should parse DT properties to retrieve
the initialization data when set as default one.

The following changes since commit 9ff01193a20d391e8dbce4403dd5ef87c7eaaca6:

  Linux 4.20-rc3 (2018-11-18 13:33:44 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/leds-for-4.21-rc1

for you to fetch changes up to 8146aace60c7409cc60a1598bc9647a5bbb12eb4:

  led: triggers: Initialize LED_INIT_DEFAULT_TRIGGER if trigger is brought after class (2018-12-10 21:31:55 +0100)

Thanks,
Jacek Anaszewski

----------------------------------------------------------------
LEDs for 4.21-rc1
----------------------------------------------------------------
Jacek Anaszewski (2):
      led: triggers: Break the for loop after default trigger is found
      led: triggers: Add LED_INIT_DEFAULT_TRIGGER flag

Krzysztof Kozlowski (4):
      leds: gpio: Drop unneeded manual of_node assignment
      leds: pwm: Simplify with resource-managed devm_led_classdev_register()
      leds: pwm: Use OF variant of LED registering function
      led: triggers: Initialize LED_INIT_DEFAULT_TRIGGER if trigger is brought after class

Rob Herring (1):
      leds: 88pm860x: Use of_node_name_eq for node name comparisons

Yangtao Li (1):
      leds: powernv: add of_node_put()

 drivers/leds/led-triggers.c  |  9 +++++++--
 drivers/leds/leds-88pm860x.c |  2 +-
 drivers/leds/leds-gpio.c     |  1 -
 drivers/leds/leds-powernv.c  | 12 +++++++++---
 drivers/leds/leds-pwm.c      | 22 ++--------------------
 include/linux/leds.h         |  1 +
 6 files changed, 20 insertions(+), 27 deletions(-)

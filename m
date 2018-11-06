From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH 00/24] Add generic support for composing LED class device name
Date: Tue,  6 Nov 2018 23:07:08 +0100
Message-ID: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, jacek.anaszewski@gmail.com
List-Id: linux-leds@vger.kernel.org

LED class device naming pattern included devicename section, which had
unpleasant effect of varying userspace interface dependent on underlaying
hardware. Moreover, this information was redundant in the LED name, since
the LED controller name could have been obtained from sysfs device group

This patch set introduces a led_compose_name() function in the LED core,
which unifies and simplifies LED class device name composition. This
change is accompanied by the improvements in the common LED DT bindings
where two new properties are introduced: "function" and "color" . The two
deprecate the old "label" property which was leaving too much room for
interpretation, leading to inconsistent LED naming.

There are also changes in LED DT node naming, which are in line with
DT maintainer's request from [0].

Since some DT LED naming unification, related to not including devicename
section in "label" DT property, is being requested during reviews of new
LED class drivers for almost a year now, then those drivers are the first
candidates for optimalization and the first users of the new
led_compose_name() API. The modifications were tested with Qemu,
by stubbing the driver internals where hardware interaction was needed
for proper probing.

Thanks,
Jacek Anaszewski

[0] https://lore.kernel.org/patchwork/patch/858993/

Jacek Anaszewski (24):
  leds: class: Improve LED and LED flash class registration API
  leds: core: Add support for composing LED class device names
  leds: dt-bindings: Add LED_FUNCTION definitions
  dt-bindings: leds: Add function and color properties
  dt-bindings: sc27xx-blt: Add function and color properties
  leds: sc27xx-blt: Use led_compose_name()
  dt-bindings: lt3593: Add function and color properties
  leds: lt3593: Use led_compose_name()
  dt-bindings: lp8860: Add function and color properties
  leds: lp8860: Use led_compose_name()
  dt-bindings: lm3692x: Add function and color properties
  leds: lm3692x: Use led_compose_name()
  dt-bindings: lm36010: Add function and color properties
  leds: lm3601x: Use led_compose_name()
  dt-bindings: cr0014114: Add function and color properties
  leds: cr0014114: Use led_compose_name()
  dt-bindings: aat1290: Add function and color properties
  leds: aat1290: Use led_compose_name()
  dt-bindings: as3645a: Add function and color properties
  leds: as3645a: Use led_compose_name()
  dt-bindings: leds-gpio: Add function and color properties
  leds: gpio: Use led_compose_name()
  dt-bindings: an30259a: Add function and color properties
  leds: an30259a: Use led_compose_name()

 .../devicetree/bindings/leds/ams,as3645a.txt       |  22 +++--
 Documentation/devicetree/bindings/leds/common.txt  |  52 +++++++++--
 .../devicetree/bindings/leds/leds-aat1290.txt      |  12 ++-
 .../devicetree/bindings/leds/leds-an30259a.txt     |  22 ++++-
 .../devicetree/bindings/leds/leds-cr0014114.txt    |  26 ++++--
 .../devicetree/bindings/leds/leds-gpio.txt         |  22 +++--
 .../devicetree/bindings/leds/leds-lm3601x.txt      |  10 +-
 .../devicetree/bindings/leds/leds-lm3692x.txt      |   9 +-
 .../devicetree/bindings/leds/leds-lp8860.txt       |   9 +-
 .../devicetree/bindings/leds/leds-lt3593.txt       |  11 ++-
 .../devicetree/bindings/leds/leds-sc27xx-bltc.txt  |  10 +-
 Documentation/leds/leds-class.txt                  |   2 +-
 drivers/leds/led-class-flash.c                     |   9 +-
 drivers/leds/led-class.c                           |  34 ++++---
 drivers/leds/led-core.c                            |  71 +++++++++++++++
 drivers/leds/leds-aat1290.c                        |  17 ++--
 drivers/leds/leds-an30259a.c                       |  26 +++---
 drivers/leds/leds-as3645a.c                        |  65 ++++++-------
 drivers/leds/leds-cr0014114.c                      |  30 ++----
 drivers/leds/leds-gpio.c                           |  27 +++---
 drivers/leds/leds-lm3601x.c                        |  45 ++++-----
 drivers/leds/leds-lm3692x.c                        |  39 ++++----
 drivers/leds/leds-lp8860.c                         |  38 ++++----
 drivers/leds/leds-lt3593.c                         |  19 ++--
 drivers/leds/leds-sc27xx-bltc.c                    |  23 ++---
 include/dt-bindings/leds/functions.h               | 101 +++++++++++++++++++++
 include/linux/led-class-flash.h                    |  13 ++-
 include/linux/leds.h                               |  61 +++++++++++--
 28 files changed, 571 insertions(+), 254 deletions(-)
 create mode 100644 include/dt-bindings/leds/functions.h

-- 
2.1.4

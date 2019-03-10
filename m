From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH v2 00/25] Add generic support for composing LED class device name
Date: Sun, 10 Mar 2019 19:28:11 +0100
Message-ID: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, jacek.anaszewski@gmail.com
List-Id: linux-leds@vger.kernel.org

Changes from v1:

- improved led_parse_properties() to parse label property at first
  and return immediately after parsing succeeds
- added tool get_led_device_info.sh for retrieving LED class device's
  parent device related information
- extended LED naming section of Documentation/leds/leds-class.txt
- adjusted the list of LED_FUNCTION definitions according to the v1 review
  remarks
- added standard LED_COLOR_NAME definitions
- removed functions.h and moved both LED_FUNCTION and LED_COLOR_NAME
  definitions to include/dt-bindings/common.h
- rebased leds-as3645a changes on top of the patch switching to fwnode
  property API
- updated DT bindings to use new LED_COLOR_NAME definitions
- improved common LED bindings to not use address unit for sub-nodes
  without reg property

Generally I still insist on deprecating label property and devicename
section of LED name. The tool I added for obtaining LED device name
proves availability of the related information in other places in
the sysfs. Other discussed use cases are covered in the updated
Documentation/leds/leds-class.txt.

Beside that, I tried also to create macros for automatic composition
of "-N" suffixed LED functions, so that it would not be necessary
to pollute common.h with plenty repetitions of the same function,
differing only with the postfix. Unfortunately, the preprocessor
of the dtc compiler seems not to accept string concatenetation.
I.e. it is not possible to to the following assighment:

function = "hdd""-1"

If anyone knows how to obviate this shortocoming please let me know.

Original cover letter:

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

Jacek Anaszewski (25):
  leds: class: Improve LED and LED flash class registration API
  leds: core: Add support for composing LED class device names
  dt-bindings: leds: Add LED_FUNCTION definitions
  dt-bindings: leds: Add LED_COLOR_NAME definitions
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

 .../devicetree/bindings/leds/ams,as3645a.txt       | 22 +++---
 Documentation/devicetree/bindings/leds/common.txt  | 55 ++++++++++++---
 .../devicetree/bindings/leds/leds-aat1290.txt      | 12 ++--
 .../devicetree/bindings/leds/leds-an30259a.txt     | 22 ++++--
 .../devicetree/bindings/leds/leds-cr0014114.txt    | 26 +++++--
 .../devicetree/bindings/leds/leds-gpio.txt         | 23 ++++--
 .../devicetree/bindings/leds/leds-lm3601x.txt      | 10 ++-
 .../devicetree/bindings/leds/leds-lm3692x.txt      |  9 ++-
 .../devicetree/bindings/leds/leds-lp8860.txt       |  9 ++-
 .../devicetree/bindings/leds/leds-lt3593.txt       | 11 ++-
 .../devicetree/bindings/leds/leds-sc27xx-bltc.txt  | 10 +--
 Documentation/leds/leds-class.txt                  | 20 +++++-
 drivers/leds/led-class-flash.c                     |  9 +--
 drivers/leds/led-class.c                           | 34 +++++----
 drivers/leds/led-core.c                            | 82 ++++++++++++++++++++++
 drivers/leds/leds-aat1290.c                        | 17 +++--
 drivers/leds/leds-an30259a.c                       | 26 +++----
 drivers/leds/leds-as3645a.c                        | 73 ++++++++-----------
 drivers/leds/leds-cr0014114.c                      | 30 +++-----
 drivers/leds/leds-gpio.c                           | 26 +++----
 drivers/leds/leds-lm3601x.c                        | 45 ++++++------
 drivers/leds/leds-lm3692x.c                        | 39 +++++-----
 drivers/leds/leds-lp8860.c                         | 38 +++++-----
 drivers/leds/leds-lt3593.c                         | 19 +++--
 drivers/leds/leds-sc27xx-bltc.c                    | 23 +++---
 include/dt-bindings/leds/common.h                  | 47 +++++++++++++
 include/linux/led-class-flash.h                    | 15 ++--
 include/linux/leds.h                               | 68 +++++++++++++++---
 tools/leds/get_led_device_info.sh                  | 81 +++++++++++++++++++++
 29 files changed, 639 insertions(+), 262 deletions(-)
 create mode 100755 tools/leds/get_led_device_info.sh

-- 
2.11.0

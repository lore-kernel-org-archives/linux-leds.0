From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [GIT PULL] LED updates for 4.9
Date: Mon, 03 Oct 2016 10:48:10 +0200
Message-ID: <1475484490-17183-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:57900 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751754AbcJCIsX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 3 Oct 2016 04:48:23 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, hkallweit1@gmail.com, hns@goldelico.com, linus.walleij@linaro.org, nathan.sullivan@ni.com, paul.gortmaker@windriver.com, vadimp@mellanox.com

Hi Linus,

Please pull LED updates for 4.9 merge cycle. There are three new
LED class drivers and some minor fixes and improvementes to the
leds-gpio driver, LED Trigger core and documentation.

The following changes since commit 694d0d0bb2030d2e36df73e2d23d5770511dbc8d:

  Linux 4.8-rc2 (2016-08-14 19:11:36 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git for-next

for you to fetch changes up to 6f3bad9670729ea3a7c78b3752a89c94ffa2397a:

  leds: triggers: Check return value of kobject_uevent_env() (2016-09-20 10:22:10 +0200)

Thanks,
Jacek Anaszewski

----------------------------------------------------------------
New LED class drivers:
- Add driver for Mellanox systems LEDs
- Add PM8058 LEDs driver
- is31fl319x: 1/3/6/9-channel light effect led driver

LEDs DT bindings:
- Add bindings for ISSI is31fl319x
- Add bindings for PM8058
- common: Centralize definition of "default-state" property

LED core improvements:
- Documentation: move oneshot trigger attributes documentation to ABI

LED Trigger core improvements:
- Check return value of kobject_uevent_env()
- Return from led_trigger_set() if there is nothing to do
- Do not overflow sysfs buffer in led_trigger_show
- Make triggers explicitly non-modular

LED class drivers improvements:
- leds-gpio: fix and simplify error handling in gpio_leds_create
- leds-gpio: switch to managed version of led_classdev_register
- leds-gpio: fix and simplify reading property "label"
- leds-gpio: simplify gpio_leds_create
- leds-gpio: add helper cdev_to_gpio_led_data
- leds-gpio: fix an unhandled error case in create_gpio_led
- leds-gpio: introduce gpio_blink_set_t

----------------------------------------------------------------
H. Nikolaus Schaller (2):
      leds: is31fl319x: 1/3/6/9-channel light effect led driver
      DT: leds: Add bindings for ISSI is31fl319x

Heiner Kallweit (7):
      leds: gpio: introduce gpio_blink_set_t
      leds: gpio: fix an unhandled error case in create_gpio_led
      leds: gpio: add helper cdev_to_gpio_led_data
      leds: gpio: simplify gpio_leds_create
      leds: gpio: fix and simplify reading property "label"
      leds: gpio: switch to managed version of led_classdev_register
      leds: gpio: fix and simplify error handling in gpio_leds_create

Jacek Anaszewski (2):
      leds: triggers: Return from led_trigger_set() if there is nothing to do
      leds: triggers: Check return value of kobject_uevent_env()

Linus Walleij (3):
      leds: pm8058: add device tree bindings
      leds: add PM8058 LEDs driver
      leds: centralize definition of "default-state" property

Nathan Sullivan (1):
      leds: do not overflow sysfs buffer in led_trigger_show

Paul Gortmaker (1):
      leds: make triggers explicitly non-modular

Rafał Miłecki (1):
      Documentation: move oneshot trigger attributes documentation to ABI

Vadim Pasternak (1):
      leds: add driver for Mellanox systems LEDs

 Documentation/ABI/testing/sysfs-class-led          |   3 +-
 .../ABI/testing/sysfs-class-led-trigger-oneshot    |  36 ++
 Documentation/devicetree/bindings/leds/common.txt  |   7 +
 .../devicetree/bindings/leds/leds-bcm6328.txt      |   2 +-
 .../devicetree/bindings/leds/leds-bcm6358.txt      |   2 +-
 .../devicetree/bindings/leds/leds-gpio.txt         |   9 +-
 .../devicetree/bindings/leds/leds-is31fl319x.txt   |  59 +++
 .../devicetree/bindings/leds/leds-pm8058.txt       |  67 +++
 .../devicetree/bindings/leds/register-bit-led.txt  |   9 +-
 Documentation/leds/leds-mlxcpld.txt                | 110 +++++
 Documentation/leds/ledtrig-oneshot.txt             |  20 +-
 MAINTAINERS                                        |   7 +
 drivers/leds/Kconfig                               |  28 ++
 drivers/leds/Makefile                              |   3 +
 drivers/leds/led-triggers.c                        |  25 +-
 drivers/leds/leds-gpio.c                           |  78 ++--
 drivers/leds/leds-is31fl319x.c                     | 450 +++++++++++++++++++++
 drivers/leds/leds-mlxcpld.c                        | 430 ++++++++++++++++++++
 drivers/leds/leds-pm8058.c                         | 191 +++++++++
 include/linux/leds.h                               |   9 +-
 20 files changed, 1446 insertions(+), 99 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-oneshot
 create mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl319x.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pm8058.txt
 create mode 100644 Documentation/leds/leds-mlxcpld.txt
 create mode 100644 drivers/leds/leds-is31fl319x.c
 create mode 100644 drivers/leds/leds-mlxcpld.c
 create mode 100644 drivers/leds/leds-pm8058.c

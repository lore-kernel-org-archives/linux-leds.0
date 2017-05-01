From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [GIT PULL] LED updates for 4.12
Date: Mon,  1 May 2017 21:03:34 +0200
Message-ID: <1493665414-7352-1-git-send-email-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:33970 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750725AbdEATEb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 May 2017 15:04:31 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, fb@ltec.ch, sre@kernel.org, andriy.shevchenko@linux.intel.com, dan.carpenter@oracle.com, sean.wang@mediatek.com, rafal@milecki.pl, kernel@kempniu.pl, me@paulo.costa.nom.br

Hi Linus,

Please pull LED updates for 4.12 merge cycle.

In this development cycle there were two interactions with other
subsystems:
  - mfd: merged a single patch from it, that prevents leds-cpcap build break
  - x86 platform drivers: exposed a set of dell-led related patches
                          for it to merge

Besides that, regular LED updates contain what follows:

New drivers:

- add LED support for MT6323 PMIC

- add LED support for Motorola CPCAP PMIC

New features and improvements:

- add LED trigger for all CPUs aggregated which is useful
  on tiny boards with more CPU cores than LED pins

- add OF variants of LED registering functions as a preparation
  for adding generic support for Device Tree parsing

- dell-led improvements and cleanups, followed by moving it to the
  x86 platform driver subsystem which is a more appropriate place for it

- Extend pca9532 Device Tree support by adding the LEDs
  'default-state' property

- Extend pca963x Device Tree support by adding nxp,inverted-out property
  for inverting the polarity of the output

- Remove ACPI support for lp3952 since it relied on a non-official
  ACPI IDs

The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/leds_for_4.12

for you to fetch changes up to 28c5fe99016d28f15d1b825df8acb1558a3a63a1:

  leds: pca9532: Extend pca9532 device tree support (2017-04-19 20:27:50 +0200)

Best regards,
Jacek Anaszewski

----------------------------------------------------------------
LED updates for 4.12

----------------------------------------------------------------
Andy Shevchenko (2):
      leds: lp3952: Remove ACPI support for lp3952
      leds: lp3952: Use 'if (ret)' pattern

Dan Carpenter (1):
      leds: mt6323: Fix an off by one bug in probe

Felix Brack (1):
      leds: pca9532: Extend pca9532 device tree support

Jacek Anaszewski (1):
      Merge tag 'ib-mfd-leds-v4.12' of git://git.kernel.org/.../lee/mfd into for-next

Michał Kępień (7):
      dell-led: remove GUID check from dell_micmute_led_set()
      ALSA: hda - use dell_micmute_led_set() instead of dell_app_wmi_led_set()
      ALSA: hda - rename dell_led_set_func to dell_micmute_led_set_func
      platform/x86: dell-laptop: import dell_micmute_led_set() from drivers/leds/dell-led.c
      dell-led: remove code related to mic mute LED
      dell-led: move driver to drivers/platform/x86/dell-wmi-led.c
      platform/x86: dell-wmi-led: fix coding style issues

Paulo Costa (1):
      leds/trigger/cpu: Add LED trigger for all CPUs aggregated

Rafał Miłecki (2):
      leds: core: add OF variants of LED registering functions
      leds: gpio: use OF variant of LED registering function

Sean Wang (2):
      leds: Add LED support for MT6323 PMIC
      dt-bindings: leds: Add document bindings for leds-mt6323

Sebastian Reichel (2):
      mfd: cpcap: Add missing include dependencies
      leds: cpcap: new driver

 .../devicetree/bindings/leds/leds-cpcap.txt        |  29 ++
 .../devicetree/bindings/leds/leds-mt6323.txt       |  60 +++
 .../devicetree/bindings/leds/leds-pca9532.txt      |  10 +
 drivers/leds/Kconfig                               |  27 +-
 drivers/leds/Makefile                              |   3 +-
 drivers/leds/led-class.c                           |  26 +-
 drivers/leds/leds-cpcap.c                          | 239 ++++++++++
 drivers/leds/leds-gpio.c                           |  12 +-
 drivers/leds/leds-lp3952.c                         |  18 +-
 drivers/leds/leds-mt6323.c                         | 502 +++++++++++++++++++++
 drivers/leds/leds-pca9532.c                        |  27 +-
 drivers/leds/trigger/ledtrig-cpu.c                 |  33 +-
 drivers/platform/x86/Kconfig                       |   8 +
 drivers/platform/x86/Makefile                      |   1 +
 drivers/platform/x86/dell-laptop.c                 |  28 ++
 .../dell-led.c => platform/x86/dell-wmi-led.c}     | 141 ++----
 include/linux/dell-led.h                           |   6 +-
 include/linux/leds-pca9532.h                       |   4 +-
 include/linux/leds.h                               |  14 +-
 include/linux/mfd/motorola-cpcap.h                 |   3 +
 sound/pci/hda/dell_wmi_helper.c                    |  30 +-
 21 files changed, 1043 insertions(+), 178 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6323.txt
 create mode 100644 drivers/leds/leds-cpcap.c
 create mode 100644 drivers/leds/leds-mt6323.c
 rename drivers/{leds/dell-led.c => platform/x86/dell-wmi-led.c} (56%)

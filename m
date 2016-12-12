From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [GIT PULL] LED updates for 4.10
Date: Mon, 12 Dec 2016 12:21:22 +0100
Message-ID: <1481541682-11626-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:49216 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751584AbcLLLVf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 12 Dec 2016 06:21:35 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, akurz@blala.de, david@lechnology.com, fb@ltec.ch, geliangtang@gmail.com, hdegoede@redhat.com, hui.chun.ong@ni.com, javier@osg.samsung.com, linus.walleij@linaro.org, mranostay@gmail.com, pavel@ucw.cz, tnhuynh@apm.com, vadimp@mellanox.com

Hi Linus,

Please pull LED updates for 4.10 merge cycle.

>From the things that need to be highlighted there are:
- userspace LED class driver - it can be useful for testing triggers
  and can also be used to implement virtual LEDs,
- LED class driver for NIC78bx device,
- LED core fixes for preventing potential races while setting brightness
  when software blinking is enabled,
- improvements in LED documentation to mention semantics on changing
  brightness while trigger is active.

Also please note that this time we have a dependency between MFD, ARM and
LED trees exposed on ib-mfd-arm-leds-v4.10 branch in mfd.git. The branch,
containing a single patch:

40a3a0f "mfd: qcom-pm8xxx: Clean up PM8XXX namespace"

has been merged to linux-leds.

The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/leds_for_4.10

for you to fetch changes up to 44b3e31d540e917a4d2292b902ade63fa1748d9a:

  leds: pca955x: Add ACPI support (2016-12-02 09:31:50 +0100)

Thanks,
Jacek Anaszewski

----------------------------------------------------------------
LED updates for 4.10 merge cycle.

----------------------------------------------------------------
Alexander Kurz (1):
      leds: mc13783: Fix MC13892 keypad led access

David Lechner (3):
      leds: Introduce userspace LED class driver
      leds: Use macro for max device node name size
      tools/leds: Add uledmon program for monitoring userspace LEDs

Felix Brack (1):
      leds: pca9532: Use default trigger value from platform data

Geliang Tang (1):
      leds: leds-cobalt-raq: use builtin_platform_driver

Hans de Goede (2):
      led: core: Use atomic bit-field for the blink-flags
      led: core: Fix blink_brightness setting race

Hui Chun Ong (1):
      leds: Add user LED driver for NIC78bx device

Jacek Anaszewski (1):
      Merge tag 'ib-mfd-arm-leds-v4.10' of git://git.kernel.org/.../lee/mfd into linux-leds/for-next

Javier Martinez Canillas (2):
      leds: lp3952: Export I2C module alias information for module autoload
      leds: netxbig: fix module autoload for OF registration

Linus Walleij (1):
      mfd: qcom-pm8xxx: Clean up PM8XXX namespace

Matt Ranostay (2):
      leds: pca963x: workaround group blink scaling issue
      leds: pca963x: enable low-power state

Pavel Machek (3):
      leds/leds-lp5523.txt: make documentation match reality
      ledtrig-cpu.c: fix english
      cleanup LED documentation and make it match reality

Tin Huynh (2):
      leds: pca963x: Add ACPI support
      leds: pca955x: Add ACPI support

Vadim Pasternak (1):
      leds: verify vendor and change license in mlxcpld driver

 Documentation/ABI/testing/sysfs-class-led          |  14 +-
 Documentation/devicetree/bindings/leds/pca963x.txt |   3 +
 Documentation/leds/leds-lp5523.txt                 |   4 +-
 Documentation/leds/uleds.txt                       |  36 ++++
 arch/arm/configs/multi_v7_defconfig                |   2 +-
 arch/arm/configs/pxa_defconfig                     |   1 -
 arch/arm/configs/qcom_defconfig                    |   1 -
 drivers/leds/Kconfig                               |  21 +-
 drivers/leds/Makefile                              |   4 +
 drivers/leds/led-class.c                           |   4 +-
 drivers/leds/led-core.c                            |  62 +++---
 drivers/leds/leds-cobalt-raq.c                     |   6 +-
 drivers/leds/leds-lp3952.c                         |   1 +
 drivers/leds/leds-mc13783.c                        |   5 +-
 drivers/leds/leds-mlxcpld.c                        |   5 +-
 drivers/leds/leds-netxbig.c                        |   1 +
 drivers/leds/leds-nic78bx.c                        | 209 ++++++++++++++++++
 drivers/leds/leds-pca9532.c                        |   2 +-
 drivers/leds/leds-pca955x.c                        |  24 ++-
 drivers/leds/leds-pca963x.c                        |  80 ++++++-
 drivers/leds/trigger/ledtrig-cpu.c                 |   2 +-
 drivers/leds/uleds.c                               | 235 +++++++++++++++++++++
 drivers/mfd/Kconfig                                |  14 +-
 drivers/mfd/Makefile                               |   2 +-
 drivers/mfd/{pm8921-core.c => qcom-pm8xxx.c}       |  42 ++--
 include/linux/leds.h                               |  25 ++-
 include/uapi/linux/Kbuild                          |   1 +
 include/uapi/linux/uleds.h                         |  24 +++
 tools/Makefile                                     |   7 +-
 tools/leds/.gitignore                              |   1 +
 tools/leds/Makefile                                |  13 ++
 tools/leds/uledmon.c                               |  63 ++++++
 32 files changed, 807 insertions(+), 107 deletions(-)
 create mode 100644 Documentation/leds/uleds.txt
 create mode 100644 drivers/leds/leds-nic78bx.c
 create mode 100644 drivers/leds/uleds.c
 rename drivers/mfd/{pm8921-core.c => qcom-pm8xxx.c} (92%)
 create mode 100644 include/uapi/linux/uleds.h
 create mode 100644 tools/leds/.gitignore
 create mode 100644 tools/leds/Makefile
 create mode 100644 tools/leds/uledmon.c

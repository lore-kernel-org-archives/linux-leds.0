From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [GIT PULL] LED updates for 4.14-rc1
Date: Thu,  7 Sep 2017 22:25:54 +0200
Message-ID: <1504815954-3754-1-git-send-email-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:36405 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755796AbdIGU05 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 7 Sep 2017 16:26:57 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, clg@kaod.org, andrew@aj.id.au, elfring@users.sourceforge.net, colin.king@canonical.com, jacek.anaszewski@gmail.com, amitoj1606@gmail.com, robh@kernel.org, arvind.yadav.cs@gmail.com, Julia.Lawall@lip6.fr

Hi Linus,

Please pull LED updates for 4.14-rc1.

LED class drivers improvements:

  leds-pca955x:
   - add Device Tree support and bindings
   - use devm_led_classdev_register()
   - add GPIO support
   - prevent crippled LED class device name
   - check for I2C errors
  
  leds-gpio:
   - add optional retain-state-shutdown DT property
   - allow LED to retain state at shutdown
  
  leds-tlc591xx:
   - merge conditional tests
   - add missing of_node_put
  
  leds-powernv:
   - delete an error message for a failed memory allocation in powernv_led_create()
  
  leds-is31fl32xx.c
   - convert to using custom %pOF printf format specifier

Constify attribute_group structures in:
   - leds-blinkm
   - leds-lm3533

Make several arrays static const in:
   - leds-aat1290
   - leds-lp5521
   - leds-lp5562
   - leds-lp8501


The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/leds_for_4.14

for you to fetch changes up to 1591caf2d5eafdfb3b300691f8f99e5bb97d5406:

  leds: pca955x: check for I2C errors (2017-08-30 21:37:53 +0200)


Thanks,
Jacek Anaszewski

----------------------------------------------------------------
LED updates for 4.14
----------------------------------------------------------------

Amitoj Kaur Chawla (1):
      leds: lm3533: constify attribute_group structure

Andrew Jeffery (2):
      dt-bindings: leds: gpio: Add optional retain-state-shutdown property
      leds: gpio: Allow LED to retain state at shutdown

Arvind Yadav (1):
      leds: blinkm: constify attribute_group structures.

Colin Ian King (4):
      leds: aat1290: make array max_mm_current_percent static const
      leds: lp5521: make several arrays static const
      leds: lp5562: make several arrays static const
      leds: lp8501: make several arrays static const

Cédric Le Goater (5):
      leds: pca955x: add device tree support
      leds: pca955x: use devm_led_classdev_register
      leds: pca955x: add GPIO support
      dt-bindings: leds: add pca955x
      leds: pca955x: check for I2C errors

Jacek Anaszewski (1):
      leds: pca955x: Prevent crippled LED device name

Julia Lawall (2):
      leds: tlc591xx: merge conditional tests
      leds: tlc591xx: add missing of_node_put

Markus Elfring (1):
      leds: powernv: Delete an error message for a failed memory allocation in powernv_led_create()

Rob Herring (1):
      leds: Convert to using %pOF instead of full_name

 .../devicetree/bindings/leds/leds-gpio.txt         |   3 +
 .../devicetree/bindings/leds/leds-pca955x.txt      |  88 ++++++
 drivers/leds/Kconfig                               |  11 +
 drivers/leds/leds-aat1290.c                        |   6 +-
 drivers/leds/leds-blinkm.c                         |   2 +-
 drivers/leds/leds-gpio.c                           |   7 +-
 drivers/leds/leds-is31fl32xx.c                     |   4 +-
 drivers/leds/leds-lm3533.c                         |   2 +-
 drivers/leds/leds-lp5521.c                         |   8 +-
 drivers/leds/leds-lp5562.c                         |  10 +-
 drivers/leds/leds-lp8501.c                         |   6 +-
 drivers/leds/leds-pca955x.c                        | 350 +++++++++++++++++----
 drivers/leds/leds-powernv.c                        |   6 +-
 drivers/leds/leds-tlc591xx.c                       |  11 +-
 include/dt-bindings/leds/leds-pca955x.h            |  16 +
 include/linux/leds.h                               |   2 +
 16 files changed, 438 insertions(+), 94 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pca955x.txt
 create mode 100644 include/dt-bindings/leds/leds-pca955x.h

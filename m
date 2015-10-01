From: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v2 0/3] leds: add device trigger
Date: Thu,  1 Oct 2015 16:04:30 +0200
Message-ID: <cover.1443705827.git.maciek.borzecki@gmail.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
List-Id: linux-leds@vger.kernel.org

A series of patches that add yet another LED trigger, a device
activity trigger.

The motivation is to have a LED trigger that is associated with a
device and can be fired from cetrain points in the code that have been
chosen by the developer. With this this device activity trigger it is
possible for instance to easily hook up a tty driver for a console to
blink one LED, yet another serial port to blink a second LED and
writes to a block device to trigger a third LED.

The patches have been tested on Wandboard Quad.

The first patch adds the actual trigger. Each device wishing to use
the trigger has to be explicitly registered by calling
ledtrig_dev_add(), and passing it's dev_t. The intention is that the
trigger will be used in scenarios that are impossible to foresee at
this moment, and are likely to be approach in a case by case manner
anyway.

The second patch adds couple of debugfs helpers.

The third patch adds documentation and notes on debugfs interface.

Example hooks into tty driver can be seen here:
https://github.com/bboozzoo/linux/commit/d8a875673e37b27d9c9066febe7633382f97d8af

Changes since v1:
  - fixed debugfs user address space access
  - added unregister debugfs attribute
  - documentation update

Maciek Borzecki (3):
  leds: add device activity LED triggers
  leds: add debugfs to device trigger
  Documentation: leds: document ledtrig-device trigger

 Documentation/leds/00-INDEX           |   3 +
 Documentation/leds/ledtrig-device.txt |  35 ++++
 drivers/leds/trigger/Kconfig          |   8 +
 drivers/leds/trigger/Makefile         |   1 +
 drivers/leds/trigger/ledtrig-device.c | 326 ++++++++++++++++++++++++++++++++++
 include/linux/leds.h                  |  10 ++
 6 files changed, 383 insertions(+)
 create mode 100644 Documentation/leds/ledtrig-device.txt
 create mode 100644 drivers/leds/trigger/ledtrig-device.c

-- 
2.6.0


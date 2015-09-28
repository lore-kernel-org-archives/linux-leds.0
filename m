From: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 0/3] leds: add device trigger
Date: Mon, 28 Sep 2015 22:43:02 +0200
Message-ID: <cover.1443471365.git.maciek.borzecki@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:33076 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751505AbbI1UoO (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 28 Sep 2015 16:44:14 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-kernel@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>

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

Maciek Borzecki (3):
  leds: add device activity LED triggers
  leds: add debugfs to device trigger
  Documentation: leds: document ledtrig-device trigger

 Documentation/leds/00-INDEX           |   3 +
 Documentation/leds/ledtrig-device.txt |  32 ++++
 drivers/leds/trigger/Kconfig          |   8 +
 drivers/leds/trigger/Makefile         |   1 +
 drivers/leds/trigger/ledtrig-device.c | 289 ++++++++++++++++++++++++++++++++++
 include/linux/leds.h                  |  10 ++
 6 files changed, 343 insertions(+)
 create mode 100644 Documentation/leds/ledtrig-device.txt
 create mode 100644 drivers/leds/trigger/ledtrig-device.c

-- 
2.5.3

From: Milo Kim <woogyom.kim@gmail.com>
Subject: [PATCH 00/10] leds: lp5521,5523: restore device attributes for running LED patterns
Date: Thu,  8 Aug 2013 16:59:44 +0900
Message-ID: <1375948794-6286-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:60200 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757642Ab3HHIAT (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 8 Aug 2013 04:00:19 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Milo Kim <milo.kim@ti.com>

This patch-set resolves the application conflict by restoring sysfs files.

For LP5521
  engine1/2/3_mode
  engine1/2/3_load

For LP5523
  engine1/2/3_mode
  engine1/2/3_load
  engine1/2/3_leds

Those attributes are accessed when LED pattern is run by custom application.
Those were removed when LED pattern interface was changed to generic firmware
interface. Please refer to commits below.

  git commit 9ce7cb170f97f83a78dc948bf7d25690f15e1328
  (leds-lp5521: use generic firmware interface)

  git commit db6eaf8388a413a5ee1b4547ce78506b9c6456b0
  (leds-lp5523: use generic firmware interface)

Necessary attributes are restored in this patch-set.

(Other changes)
New data structure is added for handling values from/to an application.
Few code fixes for reducing writing I2C commands.
Add LP55xx common macros for code refactoring.
Documentation updates.

You can also pull from the location below
This branch is based on 'for-next' of linux-leds.

  https://github.com/milokim/lp55xx.git resolve-missing-sysfs

Milo Kim (10):
  leds: lp55xx: add common data structure for program
  leds: lp55xx: add common macros for device attributes
  leds: lp5521: restore legacy device attributes
  leds: lp5521: remove unnecessary writing commands
  leds: lp5523: make separate API for loading engine
  leds: lp5523: LED MUX configuration on initializing
  leds: lp5523: restore legacy device attributes
  leds: lp5523: remove unnecessary writing commands
  Documentation: leds-lp5521,lp5523: update device attribute
    information
  leds: lp5562: use LP55xx common macros for device attributes

 Documentation/leds/leds-lp5521.txt |   20 ++-
 Documentation/leds/leds-lp5523.txt |   21 ++-
 drivers/leds/leds-lp5521.c         |  114 +++++++++++--
 drivers/leds/leds-lp5523.c         |  321 ++++++++++++++++++++++++++++++++++--
 drivers/leds/leds-lp5562.c         |    4 +-
 drivers/leds/leds-lp55xx-common.h  |   66 ++++++++
 6 files changed, 511 insertions(+), 35 deletions(-)

-- 
1.7.9.5


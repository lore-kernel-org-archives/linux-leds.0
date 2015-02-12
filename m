From: Bryan Wu <cooloney@gmail.com>
Subject: [GIT PULL] LED subsystem for 3.20 merge window
Date: Thu, 12 Feb 2015 11:04:47 -0800
Message-ID: <CAK5ve-LiwT5TFm7oy2dJKFi9tNU=L+=DzYymRWjqX7hn+7837w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ig0-f181.google.com ([209.85.213.181]:38312 "EHLO
	mail-ig0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751215AbbBLTFI (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 12 Feb 2015 14:05:08 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>

Hi Linus,

The big change of LED subsystem is introducing a new LED class for
Flash type LEDs which will be used for V4L2 subsystem.

Also we got some cleanup and fixes.

So please conside the following changes since commit
188c901941efd43cbf21e8f4f9e9a276536b989c:

  Merge branch 'leds-fixes-for-3.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/cooloney/linux-leds
(2015-01-14 12:22:56 +1300)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/cooloney/linux-leds.git for-next

for you to fetch changes up to c6e71f813f7208d80bfe0f435d627fad1b204558:

  leds: leds-gpio: Pass on error codes unmodified (2015-02-02 14:36:10 -0800)

----------------------------------------------------------------
Gabriele Mazzotta (1):
      leds: Don't allow brightness values greater than max_brightness

Geert Uytterhoeven (1):
      leds: leds-mc13783: Use of_get_child_by_name() instead of refcount hack

Jacek Anaszewski (2):
      leds: Add LED Flash class extension to the LED subsystem
      DT: leds: Add led-sources property

Julia Lawall (1):
      leds: Use setup_timer

Pavel Machek (1):
      DT: leds: Add flash LED devices related properties

Soren Brinkmann (1):
      leds: leds-gpio: Pass on error codes unmodified

 Documentation/devicetree/bindings/leds/common.txt |  30 ++
 drivers/leds/Kconfig                              |  10 +
 drivers/leds/Makefile                             |   1 +
 drivers/leds/led-class-flash.c                    | 486 ++++++++++++++++++++++
 drivers/leds/led-class.c                          |   9 +-
 drivers/leds/leds-gpio.c                          |   3 +-
 drivers/leds/leds-mc13783.c                       |   4 +-
 drivers/leds/leds.h                               |   3 +-
 include/linux/led-class-flash.h                   | 207 +++++++++
 include/linux/leds.h                              |   3 +
 10 files changed, 748 insertions(+), 8 deletions(-)
 create mode 100644 drivers/leds/led-class-flash.c
 create mode 100644 include/linux/led-class-flash.h

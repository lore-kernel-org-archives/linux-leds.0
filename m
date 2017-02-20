From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [GIT PULL] LED updates for 4.11
Date: Mon, 20 Feb 2017 21:46:34 +0100
Message-ID: <1487623594-3699-1-git-send-email-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:36824 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750829AbdBTUze (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 Feb 2017 15:55:34 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, hdegoede@redhat.com, arnd@arndb.de, andi.shyti@samsung.com, rafal@milecki.pl, pavel@ucw.cz

Hi Linus,

Please pull LED updates for 4.11 merge cycle.

New features and improvements:
- add new optional brightness_hw_changed attribute for the LEDs that
  may have their brightness level changed autonomously, (outside of
  kernel control) by hardware / firmware. The attribute supports
  userspace notifications through POLLPRI events
- add led_brightness_hw_mon tool that demonstrates how to use the
  aforementioned feature
- add LED_ON enum for LEDs that can be only turned on/off, and don't
  allow setting other brightness levels
- allow for adjusting heartbeat trigger blink brightness level

Fixes and cleanups:
- avoid harmless maybe-uninitialized warning in leds-ktd2692.c
- add context to the existing example entries in common LED bindings
  to make the documentation more clear

The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:

  Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/leds_for_4.11

for you to fetch changes up to fb3d769173d26268d7bf068094a599bb28b2ac63:

  leds: ledtrig-heartbeat: Make top brightness adjustable (2017-02-14 22:20:24 +0100)

Best regards,
Jacek Anaszewski

----------------------------------------------------------------
LEDs for 4.11

----------------------------------------------------------------
Andi Shyti (1):
      leds: add LED_ON brightness as boolean value

Arnd Bergmann (1):
      leds: ktd2692: avoid harmless maybe-uninitialized warning

Hans de Goede (1):
      leds: class: Add new optional brightness_hw_changed attribute

Jacek Anaszewski (2):
      tools/leds: Add led_hw_brightness_mon program
      leds: ledtrig-heartbeat: Make top brightness adjustable

Rafał Miłecki (1):
      DT: leds: Improve examples by adding some context

 Documentation/ABI/testing/sysfs-class-led         | 17 +++++
 Documentation/devicetree/bindings/leds/common.txt | 28 +++++---
 Documentation/leds/leds-class.txt                 | 15 ++++
 drivers/leds/Kconfig                              |  9 +++
 drivers/leds/led-class.c                          | 76 ++++++++++++++++++++
 drivers/leds/leds-ktd2692.c                       |  8 +--
 drivers/leds/trigger/ledtrig-heartbeat.c          | 15 ++--
 include/linux/leds.h                              | 16 +++++
 tools/leds/Makefile                               |  4 +-
 tools/leds/led_hw_brightness_mon.c                | 84 +++++++++++++++++++++++
 10 files changed, 252 insertions(+), 20 deletions(-)
 create mode 100644 tools/leds/led_hw_brightness_mon.c

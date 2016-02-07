From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/2] leds: core: add support for color LED's
Date: Sun, 7 Feb 2016 01:37:48 +0100
Message-ID: <56B691DC.3020906@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33870 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751499AbcBGKqE (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 7 Feb 2016 05:46:04 -0500
Received: by mail-wm0-f67.google.com with SMTP id p63so10758194wmp.1
        for <linux-leds@vger.kernel.org>; Sun, 07 Feb 2016 02:46:03 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org

This patchset adds support for color LED's. In addition to RGB LED's
also LED's with native HSV are implicitely supported (although I know
no such devices).

Basic idea is to use enum led_brightness also for the hue and saturation
color component.
Flag LED_BRIGHTNESS_SET_COLOR BIT(24) allows to specify that hue / saturation
should be overridden even if the provided values are zero.

Some examples for writing values to /sys/class/leds/<xx>/brightness:
(now also values in hex notation can be provided)

255 -> set full brightness and keep existing color if set
0 -> switch LED off but keep existing color so that it can be restored if the
     LED is switched on again later
0x1000000 -> switch LED off and set also hue and saturation to 0
0x00ffff -> set full brightness, full saturation and set hue to 0 (red)

Heiner Kallweit (2):
  leds: core: add generic support for color LED's
  leds: core: add support for RGB LED's

 drivers/leds/led-class.c | 10 ++++--
 drivers/leds/led-core.c  | 89 +++++++++++++++++++++++++++++++++++++++++++-----
 include/linux/leds.h     |  5 +++
 3 files changed, 94 insertions(+), 10 deletions(-)

-- 
2.7.0

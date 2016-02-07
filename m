From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/2] leds: core: add support for color LED's
Date: Sun, 7 Feb 2016 11:05:58 +0100
Message-ID: <56B71706.3050604@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34872 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753763AbcBGKGB (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 7 Feb 2016 05:06:01 -0500
Received: by mail-wm0-f68.google.com with SMTP id g62so10658971wme.2
        for <linux-leds@vger.kernel.org>; Sun, 07 Feb 2016 02:06:01 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org

This patchset adds support for color LED's. In addition to RGB LED's
also LED's with native HSV are implicitely supported (although I know
no such devices).

Basic idea is to use enum led_brightness also for the hue and saturation
color component.

Heiner Kallweit (2):
  leds: core: add generic support for color LED's
  leds: core: add support for RGB LED's

 drivers/leds/led-class.c | 10 ++++--
 drivers/leds/led-core.c  | 89 +++++++++++++++++++++++++++++++++++++++++++-----
 include/linux/leds.h     |  5 +++
 3 files changed, 94 insertions(+), 10 deletions(-)

-- 
2.7.0

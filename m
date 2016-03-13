From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/3] leds: triggers: add support for RGB triggers and a RGB
 version of the heartbeat trigger
Date: Sun, 13 Mar 2016 18:14:21 +0100
Message-ID: <56E59FED.9000708@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33349 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751290AbcCMRSi (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 13 Mar 2016 13:18:38 -0400
Received: by mail-wm0-f67.google.com with SMTP id n186so11136820wmn.0
        for <linux-leds@vger.kernel.org>; Sun, 13 Mar 2016 10:18:37 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

This patch series makes use of the recently introduced RGB extension in the
LED core and adds support for RGB triggers. RGB triggers can be used e.g. to
display the state of a subsystem using different colors.

As one use case the patch series includes a RGB version of the heartbeat trigger.

Heiner Kallweit (3):
  leds: triggers: add support for RGB triggers
  leds: triggers: add led_trigger_range_event for RGB triggers
  leds: triggers: heartbeat: add RGB version of the trigger

 drivers/leds/led-triggers.c              | 57 ++++++++++++++++++++++++++--
 drivers/leds/trigger/ledtrig-heartbeat.c | 64 +++++++++++++++++++++++++++++++-
 include/linux/leds.h                     | 17 +++++++++
 3 files changed, 134 insertions(+), 4 deletions(-)

-- 
2.7.2

From: Matt Ranostay <mranostay@gmail.com>
Subject: [PATCH v5 0/2] cap11xx: add LED support
Date: Wed, 17 Jun 2015 20:58:15 -0700
Message-ID: <1434599897-22505-1-git-send-email-mranostay@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:33371 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750942AbbFRD5W (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 17 Jun 2015 23:57:22 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: zonque@gmail.com, dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Matt Ranostay <mranostay@gmail.com>

Changes from v4:
 * Update docs to show proper address and size properties for DT bindings
 * Make all LEDs blank on startup, and remove racey schedule_work calls
   that did this in last revisions
 * Disable cap11xx_set_sleep() if any LEDs registered
   * TODO: Make cap11xx_set_sleep() able to detect if LEDs are in use and
     calculate which power state it should be in.

Matt Ranostay (2):
  dt: add cap11xx LED documentation
  cap11xx: add LED support

 .../devicetree/bindings/input/cap11xx.txt          |  25 ++++
 drivers/input/keyboard/cap11xx.c                   | 140 ++++++++++++++++++++-
 2 files changed, 162 insertions(+), 3 deletions(-)

-- 
1.9.1

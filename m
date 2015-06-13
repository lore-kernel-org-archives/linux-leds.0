From: Matt Ranostay <mranostay@gmail.com>
Subject: [PATCH v3 0/2] cap11xx: Add LED support to driver
Date: Fri, 12 Jun 2015 21:17:32 -0700
Message-ID: <1434169054-11035-1-git-send-email-mranostay@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:33067 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750702AbbFMEQi (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 13 Jun 2015 00:16:38 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: zonque@gmail.com, dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Matt Ranostay <mranostay@gmail.com>

Changes from v2:
 * Use LED subsystem correctly, and dynamically allot used LEDs
 * Add LED trigger support (e.g. heartbeat, mmc trigger, etc)
 * Add DT properties for configuring LED usage, labels, and brightness


Matt Ranostay (2):
  dt: add cap11xx LED documentation
  cap11xx: add LED support

 .../devicetree/bindings/input/cap11xx.txt          |  23 ++++
 drivers/input/keyboard/cap11xx.c                   | 121 ++++++++++++++++++++-
 2 files changed, 141 insertions(+), 3 deletions(-)

-- 
1.9.1

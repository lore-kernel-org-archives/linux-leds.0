From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH 0/3] leds/class: Fix string handling
Date: Mon, 30 Mar 2015 10:55:09 +0200
Message-ID: <1427705712-18083-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:33130 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752833AbbC3IzR (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 30 Mar 2015 04:55:17 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Fix errors reported by Geert Uytterhoeven.

I didn't have the chance to test the changes it in real hardware.


Ricardo Ribalda Delgado (3):
  leds/class: Use strlcpy instead of strncpy
  leds/class: Check snprintf return value
  leds/class: Set naming index as unsigned

 drivers/leds/led-class.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

-- 
2.1.4

From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/3] hid: thingm: Refactor driver
Date: Mon, 29 Feb 2016 21:34:33 +0100
Message-ID: <56D4AB59.1060303@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34054 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750729AbcB2Uis (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 29 Feb 2016 15:38:48 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jiri Kosina <jikos@kernel.org>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-leds@vger.kernel.org, linux-input@vger.kernel.org

This patch series reflects a recent change in the LED core regarding
workqueue usage, simplifies the driver and improves locking.

Heiner Kallweit (3):
  hid: thingm: remove workqueue
  hid: thingm: switch to managed version of led_classdev_register
  hid: thingm: improve locking

 drivers/hid/hid-thingm.c | 105 ++++++++++++++++-------------------------------
 1 file changed, 36 insertions(+), 69 deletions(-)

-- 
2.7.1

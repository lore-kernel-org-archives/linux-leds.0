From: Florian Vaussard <florian.vaussard@gmail.com>
Subject: [PATCH v2 0/2] leds: Add driver for NCP5623 3-channel I2C LED driver
Date: Mon, 27 Jun 2016 09:03:08 +0200
Message-ID: <1467010990-28070-1-git-send-email-florian.vaussard@heig-vd.ch>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35815 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750870AbcF0HDg (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 27 Jun 2016 03:03:36 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Florian Vaussard <florian.vaussard@heig-vd.ch>

Hello,

This series add a new driver for On Semiconductor NCP5623, a 3-channel I2C
LED driver. It is used in our design to drive a RGB LED.

The first patch introduces the device tree binding, while the second patch
adds the driver itself.

Best regards,
Florian

---
Jacek: I did not addressed your request about dynamic allocation,
as discussed by Pavel and me in the previous thread. Tell me if
you are fine like this. Otherwise I will do the necessary changes.
---
Since v1:
- Adapted the DT binding (led-max-microamp for each LED node)
- Removed underscores from node names in the example
- Use brightness_set_blocking to avoid workqueue
- Introduced LED_to_CMD macro to avoid switch statement
- Various other fixes

Florian Vaussard (2):
  leds: ncp5623: Add device tree binding documentation
  leds: Add driver for NCP5623 3-channel I2C LED driver

 .../devicetree/bindings/leds/leds-ncp5623.txt      |  60 +++++
 drivers/leds/Kconfig                               |  11 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-ncp5623.c                        | 269 +++++++++++++++++++++
 4 files changed, 341 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-ncp5623.txt
 create mode 100644 drivers/leds/leds-ncp5623.c

-- 
2.5.5

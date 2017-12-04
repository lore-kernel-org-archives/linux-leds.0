From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 0/5] Numerous fixes for LP8860
Date: Mon, 4 Dec 2017 15:20:21 -0600
Message-ID: <20171204212026.14214-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from fllnx209.ext.ti.com ([198.47.19.16]:37644 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752481AbdLDVVv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Dec 2017 16:21:51 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>

All

After creating a new LED driver for the LM3692x device I went back to the
LP8860 driver that I authored and found some updates that need to be applied.

First the way the LP8860 retrieved the label from the DT was incorrect as the
label should have been from a child node as opposed to the parent.  This is now
fixed with this series.

Second, since that device can be used to as either a backlight driver or as a
string agnostic driver a trigger to the backlight needed to be added.

Finally there are changes to the driver that need to be made as either
unnoticed bugs or updates to the driver to align with the current LED
framework.  For instance moving to the devm LED class registration, destroying
the mutex upon driver removal and removing the in driver dependency on CONFIG_OF
and moving it to the Kconfig.

With these changes this should at least bring the driver into a better shape.

There are additional changes coming for this driver but I wanted to get the
driver up to snuff before adding a feature to it.

Dan

Dan Murphy (5):
  dt: bindings: lp8860: Update DT label binding
  leds: lp8860: Update the dt parsing for LED labeling
  dt: bindings: lp8860: Add trigger binding to the lp8860
  leds: lp8860: Add DT parsing to retrieve the trigger node
  leds: lp8860: Various fixes to align with LED framework

 .../devicetree/bindings/leds/leds-lp8860.txt       | 20 +++++++----
 drivers/leds/Kconfig                               |  2 +-
 drivers/leds/leds-lp8860.c                         | 40 ++++++++++++----------
 3 files changed, 35 insertions(+), 27 deletions(-)

-- 
2.15.0.124.g7668cbc60

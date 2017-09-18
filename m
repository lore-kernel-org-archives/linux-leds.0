From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 0/6] AS3645A fixes
Date: Mon, 18 Sep 2017 13:17:50 +0300
Message-ID: <20170918101756.8562-1-sakari.ailus@linux.intel.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from nblzone-211-213.nblnetworks.fi ([83.145.211.213]:45384 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751622AbdIRKR7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 18 Sep 2017 06:17:59 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-media@vger.kernel.rg, devicetree@vger.kernel.org, pavel@ucw.cz

Hi folks,

Here are a few fixes for the as3645a DTS as well as changes in bindings.
The driver is not in a release yet. I'd like to get these in as through
the media tree fixes branch.

since v1:

- Add LED colour to the name of the LED, this adds two patches to the set.

- Add a patch to unregister the indicator LED in driver remove function.

- No changes to v1 patches.

Sakari Ailus (6):
  as3645a: Use ams,input-max-microamp as documented in DT bindings
  dt: bindings: as3645a: Use LED number to refer to LEDs
  as3645a: Use integer numbers for parsing LEDs
  dt: bindings: as3645a: Improve label documentation, DT example
  as3645a: Add colour to LED name
  as3645a: Unregister indicator LED on device unbind

 .../devicetree/bindings/leds/ams,as3645a.txt       | 40 ++++++++++++++--------
 arch/arm/boot/dts/omap3-n950-n9.dtsi               | 10 ++++--
 drivers/leds/leds-as3645a.c                        | 33 +++++++++++++++---
 3 files changed, 61 insertions(+), 22 deletions(-)

-- 
2.11.0

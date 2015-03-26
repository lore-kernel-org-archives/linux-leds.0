From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH] DT: leds: Add uniqueness requirement for 'label' property.
Date: Thu, 26 Mar 2015 15:03:09 +0100
Message-ID: <1427378590-24219-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:14382 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752391AbbCZOD0 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 26 Mar 2015 10:03:26 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Sakari Ailus <sakari.ailus@iki.fi>, devicetree@vger.kernel.org

Label is used for naming LED class devices. Since ePAPR
doesn't require uniqueness for label properties, it has to be
explicitly required in the LEDs common bindings documentation.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Sakari Ailus <sakari.ailus@iki.fi>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/leds/common.txt |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
index 34811c5..747c538 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -14,8 +14,10 @@ Optional properties for child nodes:
 - led-sources : List of device current outputs the LED is connected to. The
 		outputs are identified by the numbers that must be defined
 		in the LED device binding documentation.
-- label : The label for this LED.  If omitted, the label is
-  taken from the node name (excluding the unit address).
+- label : The label for this LED. If omitted, the label is taken from the node
+	  name (excluding the unit address). It has to uniquely identify
+	  a device, i.e. no other LED class device can be assigned the same
+	  label.
 
 - linux,default-trigger :  This parameter, if present, is a
     string defining the trigger assigned to the LED.  Current triggers are:
-- 
1.7.9.5

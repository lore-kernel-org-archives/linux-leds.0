From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH/RFC] DT: leds: Fix 'label' property description and add 'colour' property
Date: Sat,  2 Dec 2017 22:50:10 +0100
Message-ID: <1512251410-6084-1-git-send-email-jacek.anaszewski@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:32958 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752272AbdLBVvO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 2 Dec 2017 16:51:14 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robh@kernel.org, pavel@ucw.cz, sakari.ailus@iki.fi, dmurphy@ti.com, jacek.anaszewski@gmail.com

Label property was imposed a uniqueness requirement, which was erroneous,
since ePAPR defines it to "a human readable string describing a device".

Also the binding description misleadingly suggested direct usage of label
for LED class device name, whereas it should only define a LED function.

Therefore an additional 'colour' property is being introduced, which together
with the parent DT node name used for devicename shall be used for naming LED
class device according to the patterh <devicename>:<colour>:<function>.

Fixes: 116b8e164116 ("DT: leds: Add uniqueness requirement for 'label' property")
Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---
 Documentation/devicetree/bindings/leds/common.txt | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
index 1d4afe9..16973ee 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -14,10 +14,9 @@ Optional properties for child nodes:
 - led-sources : List of device current outputs the LED is connected to. The
 		outputs are identified by the numbers that must be defined
 		in the LED device binding documentation.
-- label : The label for this LED. If omitted, the label is taken from the node
-	  name (excluding the unit address). It has to uniquely identify
-	  a device, i.e. no other LED class device can be assigned the same
-	  label.
+- label : The label for this LED. It should describe its function. If omitted,
+          the label is taken from the node name (excluding the unit address).
+- colour : Colour of the LED.
 
 - default-state : The initial state of the LED. Valid values are "on", "off",
   and "keep". If the LED is already on or off and the default-state property is
-- 
2.1.4

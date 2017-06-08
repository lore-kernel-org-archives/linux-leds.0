From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH V5 1/2] dt-bindings: leds: document new trigger-sources property
Date: Thu,  8 Jun 2017 18:08:31 +0200
Message-ID: <20170608160833.1567-2-zajec5@gmail.com>
References: <20170530092706.927-1-zajec5@gmail.com>
 <20170608160833.1567-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:35938 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750919AbdFHQJF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 8 Jun 2017 12:09:05 -0400
In-Reply-To: <20170608160833.1567-1-zajec5@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>

From: Rafał Miłecki <rafal@milecki.pl>

Some LEDs can be related to a specific device(s) described in the DT.
This property allows specifying such relations. E.g. USB LED should
usually be used to indicate some USB port(s) state.

Please note this binding is designed to be generic and not influenced by
any operating system design. Linux developers may find "trigger" part a
bit confusing since in Linux triggers are separated drivers. It
shouldn't define the binding though (we shouldn't add an extra level of
indirection).

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Replace "usb-ports" with "led-triggers" property which is more generic and
    allows specifying other devices as well.
V3: Use "trigger-sources" which is even more accurate as devices aren't
    precisely triggers.
V4: Update example to use the correct property
V5: Document #trigger-source-cells
---
 Documentation/devicetree/bindings/leds/common.txt | 35 +++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
index 24b656014089..1d4afe9644b6 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -1,4 +1,4 @@
-Common leds properties.
+* Common leds properties.
 
 LED and flash LED devices provide the same basic functionality as current
 regulators, but extended with LED and flash LED specific features like
@@ -49,6 +49,22 @@ Optional properties for child nodes:
 - panic-indicator : This property specifies that the LED should be used,
 		    if at all possible, as a panic indicator.
 
+- trigger-sources : List of devices which should be used as a source triggering
+		    this LED activity. Some LEDs can be related to a specific
+		    device and should somehow indicate its state. E.g. USB 2.0
+		    LED may react to device(s) in a USB 2.0 port(s).
+		    Another common example is switch or router with multiple
+		    Ethernet ports each of them having its own LED assigned
+		    (assuming they are not hardwired). In such cases this
+		    property should contain phandle(s) of related source
+		    device(s).
+		    In many cases LED can be related to more than one device
+		    (e.g. one USB LED vs. multiple USB ports). Each source
+		    should be represented by a node in the device tree and be
+		    referenced by a phandle and a set of phandle arguments. A
+		    length of arguments should be specified by the
+		    #trigger-source-cells property in the source node.
+
 Required properties for flash LED child nodes:
 - flash-max-microamp : Maximum flash LED supply current in microamperes.
 - flash-max-timeout-us : Maximum timeout in microseconds after which the flash
@@ -59,7 +75,17 @@ property can be omitted.
 For controllers that have no configurable timeout the flash-max-timeout-us
 property can be omitted.
 
-Examples:
+* Trigger source providers
+
+Each trigger source should be represented by a device tree node. It may be e.g.
+a USB port or an Ethernet device.
+
+Required properties for trigger source:
+- #trigger-source-cells : Number of cells in a source trigger. Typically 0 for
+			  nodes of simple trigger sources (e.g. a specific USB
+			  port).
+
+* Examples
 
 gpio-leds {
 	compatible = "gpio-leds";
@@ -69,6 +95,11 @@ gpio-leds {
 		linux,default-trigger = "heartbeat";
 		gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
 	};
+
+	usb {
+		gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
+		trigger-sources = <&ohci_port1>, <&ehci_port1>;
+	};
 };
 
 max77693-led {
-- 
2.11.0

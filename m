From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [EXAMPLE V5 3/2] ARM: BCM53573: Specify ports for USB LED for Tenda AC9
Date: Thu,  8 Jun 2017 18:08:33 +0200
Message-ID: <20170608160833.1567-4-zajec5@gmail.com>
References: <20170530092706.927-1-zajec5@gmail.com>
 <20170608160833.1567-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:34482 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750919AbdFHQJJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 8 Jun 2017 12:09:09 -0400
In-Reply-To: <20170608160833.1567-1-zajec5@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>

From: Rafał Miłecki <rafal@milecki.pl>

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
This patch *should not* be applied. It's only an EXAMPLE and that's why it uses
that weird 3/2 number.

It's a proof of concept, it was tested & will be submitted through ARM tree if
previous patches get accepted.

V3: Switch to the new binding
V5: Use #trigger-source-cells instead of #source-cells
---
 arch/arm/boot/dts/bcm47189-tenda-ac9.dts | 1 +
 arch/arm/boot/dts/bcm53573.dtsi          | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/bcm47189-tenda-ac9.dts b/arch/arm/boot/dts/bcm47189-tenda-ac9.dts
index 34417dac1cd0..ee44dec7d7ec 100644
--- a/arch/arm/boot/dts/bcm47189-tenda-ac9.dts
+++ b/arch/arm/boot/dts/bcm47189-tenda-ac9.dts
@@ -26,6 +26,7 @@
 		usb {
 			label = "bcm53xx:blue:usb";
 			gpios = <&chipcommon 1 GPIO_ACTIVE_HIGH>;
+			trigger-sources = <&ohci_port1>, <&ehci_port1>;
 		};
 
 		wps {
diff --git a/arch/arm/boot/dts/bcm53573.dtsi b/arch/arm/boot/dts/bcm53573.dtsi
index eae623f76401..5c0b9b4d679a 100644
--- a/arch/arm/boot/dts/bcm53573.dtsi
+++ b/arch/arm/boot/dts/bcm53573.dtsi
@@ -138,10 +138,12 @@
 
 				ehci_port1: port@1 {
 					reg = <1>;
+					#trigger-source-cells = <0>;
 				};
 
 				ehci_port2: port@2 {
 					reg = <2>;
+					#trigger-source-cells = <0>;
 				};
 			};
 
@@ -158,10 +160,12 @@
 
 				ohci_port1: port@1 {
 					reg = <1>;
+					#trigger-source-cells = <0>;
 				};
 
 				ohci_port2: port@2 {
 					reg = <2>;
+					#trigger-source-cells = <0>;
 				};
 			};
 		};
-- 
2.11.0

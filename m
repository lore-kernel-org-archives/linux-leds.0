From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [EXAMPLE 3/2] ARM: BCM53573: Specify ports for USB LED for Tenda AC9
Date: Thu, 29 Dec 2016 14:03:06 +0100
Message-ID: <20161229130306.30400-3-zajec5@gmail.com>
References: <20161229130306.30400-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:35695 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752474AbcL2NDa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Dec 2016 08:03:30 -0500
In-Reply-To: <20161229130306.30400-1-zajec5@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>

From: Rafał Miłecki <rafal@milecki.pl>

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
This patch was tested & works as expected. It's marked as EXAMPLE just
because it should go through ARM tree.
---
 arch/arm/boot/dts/bcm47189-tenda-ac9.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/bcm47189-tenda-ac9.dts b/arch/arm/boot/dts/bcm47189-tenda-ac9.dts
index 4403ae8..00bbe48 100644
--- a/arch/arm/boot/dts/bcm47189-tenda-ac9.dts
+++ b/arch/arm/boot/dts/bcm47189-tenda-ac9.dts
@@ -24,6 +24,7 @@
 		compatible = "gpio-leds";
 
 		usb {
+			usb-ports = <&ohci_port1>, <&ehci_port1>;
 			label = "bcm53xx:blue:usb";
 			gpios = <&chipcommon 1 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "default-off";
-- 
2.10.1

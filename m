From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH V3 0/2] usb: introduce "trigger-sources" DT property for usbport trigger
Date: Mon, 29 May 2017 16:01:39 +0200
Message-ID: <20170529140142.13496-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33119 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750986AbdE2OBy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 May 2017 10:01:54 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>

From: Rafał Miłecki <rafal@milecki.pl>

Hi,

This is another try of adding relation between LEDs and devices to the DT (and
usbport). I followed discussions in all old threads and came with this V3.

I'd epxect both patches to go through Greg's usb.git if accepted.

For a reference (and before someome comes with already rejected solution) see
below history of this work:

1) [PATCH V2] leds: trigger: Introduce an USB port trigger
My initial try of adding "usb-ports" property. Rob said it should be more
generic.

2) [PATCH 1/2] dt-bindings: leds: document new usb-ports property
Rob still didn't like it due to being USB specific.

3) [PATCH V2 1/2] dt-bindings: leds: document new led-triggers property
Jacek didn't like it's more generic than what Linux can already support. Later
we agreed (?) that Linux limitations shouldn't influence DT structure.
Jacek still wanted a specific trigger but Rob said he won't accept something
specific to the USB.
Jacek suggested "trigger-sources" and Rob agreed on the name.
Jacek suggested trying triggers as separated nodes.

4) [PATCH 1/4] dt-bindings: leds: document property for LED triggers
This patch was trying to use separated nodes for triggers, e.g.:
foo-trigger { trigger-type = "foo"; };
Rob didn't like this extra level of indirection. He said Linux drivers shouldn't
define/influence the binding.

So finally I came with this patchset. It doesn't try to use separated nodes for
triggers anymore and it uses the name that was mostly accepted I think. It
should be generic and not influenced by Linux design.

Rafał Miłecki (3):
  dt-bindings: leds: document new trigger-sources property
  usb: core: read USB ports from DT in the usbport LED trigger driver
  ARM: BCM53573: Specify ports for USB LED for Tenda AC9

 Documentation/devicetree/bindings/leds/common.txt | 18 ++++++++
 arch/arm/boot/dts/bcm47189-tenda-ac9.dts          |  1 +
 arch/arm/boot/dts/bcm53573.dtsi                   |  4 ++
 drivers/usb/core/ledtrig-usbport.c                | 55 +++++++++++++++++++++++
 4 files changed, 78 insertions(+)

-- 
2.11.0

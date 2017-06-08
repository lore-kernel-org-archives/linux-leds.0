From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH V5 0/2] usb: introduce "trigger-sources" DT property for usbport trigger
Date: Thu,  8 Jun 2017 18:08:30 +0200
Message-ID: <20170608160833.1567-1-zajec5@gmail.com>
References: <20170530092706.927-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:34457 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750919AbdFHQJA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 8 Jun 2017 12:09:00 -0400
In-Reply-To: <20170530092706.927-1-zajec5@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>

From: Rafał Miłecki <rafal@milecki.pl>

This version of my patchset (V5) differs by renaming #source-cells to the
#trigger-source-cells and documenting it in the leds/common.txt.

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

 Documentation/devicetree/bindings/leds/common.txt | 35 +++++++++++++-
 arch/arm/boot/dts/bcm47189-tenda-ac9.dts          |  1 +
 arch/arm/boot/dts/bcm53573.dtsi                   |  4 ++
 drivers/usb/core/ledtrig-usbport.c                | 56 +++++++++++++++++++++++
 4 files changed, 94 insertions(+), 2 deletions(-)

-- 
2.11.0

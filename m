From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 0/4] leds: pca955x: add GPIO support
Date: Tue,  1 Aug 2017 14:09:05 +0200
Message-ID: <1501589349-5681-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from 2.mo178.mail-out.ovh.net ([46.105.39.61]:38646 "EHLO
        2.mo178.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751008AbdHAM1V (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 1 Aug 2017 08:27:21 -0400
Received: from player715.ha.ovh.net (b9.ovh.net [213.186.33.59])
        by mo178.mail-out.ovh.net (Postfix) with ESMTP id 6C7E94B1BD
        for <linux-leds@vger.kernel.org>; Tue,  1 Aug 2017 14:09:37 +0200 (CEST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>

The PCA955x family of chips are I2C LED blinkers whose pins not used
to control LEDs can be used as general purpose I/Os (GPIOs).

The following adds support for device tree and Open Firmware to be
able do define different operation modes for each pin. See bindings
documentation for more details. The pca955x driver is then extended
with a gpio_chip when pins are operating in GPIO mode.

The driver follows the scheme of the leds-pca9532 driver which behaves
quite similarly.
 

Thanks,

C.

Changes since v1:

 - split the patchset in two : DT support and GPIO support
 - introduced the use of devm_led_classdev_register()
 - replaced the 'compatible' property with 'type' 
 - removed the 'gpio-base' property
 
Cédric Le Goater (4):
  leds: pca955x: add device tree support
  leds: pca955x: use devm_led_classdev_register
  leds: pca955x: add GPIO support
  dt-bindings leds: add pca955x

 .../devicetree/bindings/leds/leds-pca955x.txt      |  88 +++++++
 drivers/leds/Kconfig                               |  11 +
 drivers/leds/leds-pca955x.c                        | 263 +++++++++++++++++----
 include/dt-bindings/leds/leds-pca955x.h            |  16 ++
 4 files changed, 333 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pca955x.txt
 create mode 100644 include/dt-bindings/leds/leds-pca955x.h

-- 
2.7.5

From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Subject: [PATCH v3 0/4] leds: pca955x: add GPIO support
Date: Tue,  8 Aug 2017 15:42:36 +0200
Message-ID: <1502199760-763-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hello !

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

Changes since v2:

 - removed 'if (pdata)' tests

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
 drivers/leds/leds-pca955x.c                        | 254 +++++++++++++++++----
 include/dt-bindings/leds/leds-pca955x.h            |  16 ++
 4 files changed, 323 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pca955x.txt
 create mode 100644 include/dt-bindings/leds/leds-pca955x.h

-- 
2.7.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

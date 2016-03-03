From: "David Rivshin (Allworx)" <drivshin.allworx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/4] leds: Add driver for the ISSI IS31FL32xx family of LED controllers
Date: Wed,  2 Mar 2016 22:01:31 -0500
Message-ID: <1456974095-1867-1-git-send-email-drivshin.allworx@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

From: David Rivshin <drivshin-5fOYsn7Fw8lBDgjK7y7TUQ@public.gmane.org>

This series adds support for the ISSI IS31FL32xx family of I2C LED
controllers. Since the IS31FL3218 is actually the same device as the
SN3218, the dedicated leds-sn3218 driver is removed and the compatible
string is folded into this driver.

Changes from RFC [1]:
 - Removed max-brightness DT property.
 - Added #address-cells and #size-cells properties to the example DT.
 - Refer to these devices as "LED controllers" in Kconfig.
 - Removed redundant last sentence from Kconfig entry
 - Removed unnecessary debug code.
 - Do not set led_classdev.brightness to 0 explicitly, as it is
   already initialized to 0 by devm_kzalloc().
 - Used of_property_read_string() instead of of_get_property().
 - Fail immediately on DT parsing error in a child node, rather than
   continuing on with the non-faulty ones.
 - Added additional comments for some things that might be non-obvious.
 - Added constants for the location of the SSD bit in the SHUTDOWN
   register, and the 3216's CONFIG register.
 - Added special sw_shutdown_func for the 3216 device, as that bit
   is in a different register, at a different position, and has reverse
   polarity compared to all the other devices.
 - Refactored is31fl32xx_init_regs() to separate out some logic into
   is31fl32xx_reset_regs() and is31fl32xx_software_shutdown().
 - Added 4th patch to replace the now-redundant leds-sn3218.

[1] http://www.spinics.net/lists/linux-leds/msg05564.html
    http://thread.gmane.org/gmane.linux.leds/4530

David Rivshin (4):
  DT: Add vendor prefix for Integrated Silicon Solutions Inc.
  DT: leds: Add binding for the ISSI IS31FL32xx family of LED
    controllers
  leds: Add driver for the ISSI IS31FL32xx family of LED controllers
  leds: Replace dedicated SN3218 driver with IS31FL32XX driver

 .../devicetree/bindings/leds/leds-is31fl32xx.txt   |  52 +++
 .../devicetree/bindings/leds/leds-sn3218.txt       |  41 --
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/leds/Kconfig                               |  16 +-
 drivers/leds/Makefile                              |   2 +-
 drivers/leds/leds-is31fl32xx.c                     | 509 +++++++++++++++++++++
 drivers/leds/leds-sn3218.c                         | 306 -------------
 7 files changed, 569 insertions(+), 358 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-sn3218.txt
 create mode 100644 drivers/leds/leds-is31fl32xx.c
 delete mode 100644 drivers/leds/leds-sn3218.c

-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

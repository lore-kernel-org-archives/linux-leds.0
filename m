From: Florian Vaussard <florian.vaussard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/2] leds: Add driver for NCP5623 3-channel I2C LED driver
Date: Fri, 16 Sep 2016 13:34:30 +0200
Message-ID: <1474025672-5040-1-git-send-email-florian.vaussard@heig-vd.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hello,

This series add a new driver for On Semiconductor NCP5623, a 3-channel I2C
LED driver. It is used in our design to drive a RGB LED.

The first patch introduces the device tree binding, while the second patch
adds the driver itself.

Best regards,
Florian

---
v2 -> v3:
- Rebased on latest leds/for-next
- Minor fixes to the binding documentation
- Removed ncp5623_set_pwm() by inlining it directly inside the caller
- Removed ncp5623_destroy_devices() as we are already using devm_ flavours
- Got rid of the 'active' state variable by using 'led_no' instead
- Some other cosmetic fixes
v1 -> v2:
- Adapted the DT binding (led-max-microamp for each LED node)
- Removed underscores from node names in the example
- Use brightness_set_blocking to avoid workqueue
- Introduced LED_to_CMD macro to avoid switch statement
- Various other fixes

Florian Vaussard (2):
  leds: ncp5623: Add device tree binding documentation
  leds: Add driver for NCP5623 3-channel I2C LED driver

 .../devicetree/bindings/leds/leds-ncp5623.txt      |  60 ++++++
 drivers/leds/Kconfig                               |  11 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-ncp5623.c                        | 234 +++++++++++++++++++++
 4 files changed, 306 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-ncp5623.txt
 create mode 100644 drivers/leds/leds-ncp5623.c

-- 
2.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

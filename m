From: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: [patch v1 0/2] Introduce support for mlxreg mfd core and I2C drivers
Date: Tue, 25 Jul 2017 16:51:37 +0000
Message-ID: <1501001499-21971-1-git-send-email-vadimp@mellanox.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jiri-rHqAuBHg3fBzbRFIqnYvSA@public.gmane.org, Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

This patchset adds support for the Mellanox BMC card equipped with the
programmable devices controlling hardware.
The support includes:
- signal handling for chassis, ASIC, CPU events;
- LED control;
- exposing sysfs interface for reset control, reset monitoring and mux
  selection for the access to remote devices at the host side.

It contains:
 - Introduction of Mellanox mlxreg-core drivers, which is bus independent
   and could work over register map of the programmable device (for
   example CPLD) attached to different buses, supported by register
   mapping.
 - I2C driver mlxreg-i2c, which creates register mapping for I2C access
   to the programmable devices with I2C interface. It allows control for
   devices with one and two bytes address space.

Vadim Pasternak (2):
  mfd: Add Mellanox regmap core driver
  mfd: Add Mellanox regmap I2C driver

 .../devicetree/bindings/mfd/mellanox,mlxreg-core   |  347 ++++++
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 MAINTAINERS                                        |    8 +
 drivers/mfd/Kconfig                                |   28 +
 drivers/mfd/Makefile                               |    2 +
 drivers/mfd/mlxreg-core.c                          | 1250 ++++++++++++++++++++
 drivers/mfd/mlxreg-i2c.c                           |  183 +++
 include/linux/platform_data/mlxreg.h               |   93 ++
 8 files changed, 1912 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core
 create mode 100644 drivers/mfd/mlxreg-core.c
 create mode 100644 drivers/mfd/mlxreg-i2c.c
 create mode 100644 include/linux/platform_data/mlxreg.h

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

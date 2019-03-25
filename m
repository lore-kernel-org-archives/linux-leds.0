From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 0/5] TI LMU rework
Date: Mon, 25 Mar 2019 09:23:58 -0500
Message-ID: <20190325142403.30447-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

All

I know that it has been a long time but I put some additional effort into this
code.  The TI LMU common code right now handles brightness and ramp up/down
setting for the LM3697.  This so far are the common features I could find.

The LM3697 driver has the ability to assign HVLED strings to specific control
banks as well as assigning different max brightnesses to these strings.

Fault monitoring was removed as the data sheet indicates that this is for
production tests only.

I have plans to add additional LED drivers to use the TI LMU but I figured trying
to add all of them at once would be a daunting review and probably wrought with 
problems.

Dan

Dan Murphy (5):
  dt-bindings: mfd: Update the ramp up/down property
  leds: TI LMU: Add common code for TI LMU devices
  dt-bindings: ti-lmu: Modify dt bindings for the LM3697
  mfd: ti-lmu: Remove support for LM3697
  leds: lm3697: Introduce the lm3697 driver

 .../devicetree/bindings/leds/leds-lm3697.txt  |  77 ++++
 .../devicetree/bindings/mfd/ti-lmu.txt        |  42 +-
 drivers/leds/Kconfig                          |  14 +
 drivers/leds/Makefile                         |   2 +
 drivers/leds/leds-lm3697.c                    | 401 ++++++++++++++++++
 drivers/leds/ti-lmu-led-common.c              | 131 ++++++
 drivers/mfd/Kconfig                           |   2 +-
 drivers/mfd/ti-lmu.c                          |  17 -
 include/linux/mfd/ti-lmu-register.h           |  44 --
 include/linux/mfd/ti-lmu.h                    |   1 -
 include/linux/ti-lmu-led-common.h             |  44 ++
 11 files changed, 682 insertions(+), 93 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
 create mode 100644 drivers/leds/leds-lm3697.c
 create mode 100644 drivers/leds/ti-lmu-led-common.c
 create mode 100644 include/linux/ti-lmu-led-common.h

-- 
2.19.0

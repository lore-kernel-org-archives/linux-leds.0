From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v3 0/9] Multicolor Framework update
Date: Thu, 23 May 2019 14:08:11 -0500
Message-ID: <20190523190820.29375-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Hello

In this series I have done quite a bit of rework and since there was not to
many review comments we can pretty much treat this as unreviewed.

I have removed the brightness-model definition from this series as it is an
enhancement to the multi color framework but is not required in the initial
submission.  And this seems to be the biggest source of contention in the patch
set.  So the idea is to get the base MC FW in place and let developers play with
it.

I have converted the LP5523 to use the MC framework and will update a couple
more drivers once I have the test harnesses to verify the implementation.

The biggest change to this series is that the parent brightness file now controls
all the color LEDs brightness within the directory.

I have written a script that writes brightness values to the colors and then
proceeds to write the parent brightness from 0->255 and then back to 0.
Basically pulsing the LED group.  I found that the color is uniform across the
brightness ranges.

Dan

Dan Murphy (9):
  leds: multicolor: Add sysfs interface definition
  dt: bindings: Add multicolor class dt bindings documention
  documention: leds: Add multicolor class documentation
  dt-bindings: leds: Add multicolor ID to the color ID  list
  leds: Add multicolor ID to the color ID list
  leds: multicolor: Introduce a multicolor class definition
  dt: bindings: lp50xx: Introduce the lp50xx family of RGB drivers
  leds: lp50xx: Add the LP50XX family of the RGB LED driver
  leds: Update the lp55xx to use the multi color framework

 .../ABI/testing/sysfs-class-led-multicolor    |  57 ++
 .../bindings/leds/leds-class-multicolor.txt   |  97 +++
 .../devicetree/bindings/leds/leds-lp50xx.txt  | 142 ++++
 Documentation/leds/leds-class-multicolor.txt  |  99 +++
 drivers/leds/Kconfig                          |  17 +
 drivers/leds/Makefile                         |   2 +
 drivers/leds/led-class-multicolor.c           | 421 +++++++++++
 drivers/leds/led-core.c                       |   1 +
 drivers/leds/leds-lp50xx.c                    | 714 ++++++++++++++++++
 drivers/leds/leds-lp5523.c                    |  13 +
 drivers/leds/leds-lp55xx-common.c             | 133 +++-
 drivers/leds/leds-lp55xx-common.h             |  10 +
 include/dt-bindings/leds/common.h             |   3 +-
 include/linux/led-class-multicolor.h          |  95 +++
 include/linux/platform_data/leds-lp55xx.h     |   5 +
 15 files changed, 1789 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.txt
 create mode 100644 Documentation/leds/leds-class-multicolor.txt
 create mode 100644 drivers/leds/led-class-multicolor.c
 create mode 100644 drivers/leds/leds-lp50xx.c
 create mode 100644 include/linux/led-class-multicolor.h

-- 
2.21.0.5.gaeb582a983

From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v2 0/7] Multicolor Framework
Date: Thu, 11 Apr 2019 14:38:41 -0500
Message-ID: <20190411193848.23140-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, marek.behun@nic.cz, rdunlap@infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

I have updated the patchset for the multicolor framework and scrubed the base
code.  I have incoroporated the minor changes that were asked for.  But I still
have not added any code for the brightness models as this is still in discussion.

I have also included the TI LP50xx driver that demonstrates how to use the
Multicolor framework.

Finally I have built this on top of Jacek's LED name composition patchset
https://lore.kernel.org/patchwork/project/lkml/list/?series=388765

The MC FW will leverage the COLOR_ID and led_colors definitions provided there.
And I have added a new COLOR_ID to support this framework because with multicolor
having to declare a top level color for the directory just did not make sense

So the directory would be appended with multicolor which would denote that this
directory supports the MC FW
multicolor:activity  multicolor:standby   multicolor:status 

Dan

Dan Murphy (7):
  leds: multicolor: Add sysfs interface definition
  dt: bindings: Add multicolor class dt bindings documention
  documention: leds: Add multicolor class documentation
  dt-bindings: leds: Add multicolor ID to the color ID list
  leds: multicolor: Introduce a multicolor class definition
  dt: bindings: lp50xx: Introduce the lp50xx family of RGB drivers
  leds: lp50xx: Add the LP50XX family of the RGB LED driver

 .../ABI/testing/sysfs-class-led-multicolor    |  91 +++
 .../devicetree/bindings/leds/common.txt       |   2 +
 .../bindings/leds/leds-class-multicolor.txt   | 142 ++++
 .../devicetree/bindings/leds/leds-lp50xx.txt  | 142 ++++
 Documentation/leds/leds-class-multicolor.txt  |  99 +++
 Documentation/leds/leds-lp50xx.txt            |  36 +
 drivers/leds/Kconfig                          |  17 +
 drivers/leds/Makefile                         |   2 +
 drivers/leds/led-class-multicolor.c           | 401 ++++++++++
 drivers/leds/led-class.c                      |   1 +
 drivers/leds/leds-lp50xx.c                    | 716 ++++++++++++++++++
 include/dt-bindings/leds/common.h             |   3 +-
 include/linux/led-class-multicolor.h          |  74 ++
 13 files changed, 1725 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.txt
 create mode 100644 Documentation/leds/leds-class-multicolor.txt
 create mode 100644 Documentation/leds/leds-lp50xx.txt
 create mode 100644 drivers/leds/led-class-multicolor.c
 create mode 100644 drivers/leds/leds-lp50xx.c
 create mode 100644 include/linux/led-class-multicolor.h

-- 
2.21.0.5.gaeb582a983

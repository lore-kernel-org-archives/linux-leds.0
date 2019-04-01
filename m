From: Dan Murphy <dmurphy@ti.com>
Subject: [RFC PATCH 0/5] MultiColor LED framework Documentation
Date: Mon, 1 Apr 2019 12:33:55 -0500
Message-ID: <20190401173400.14238-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: marek.behun@nic.cz, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

I am RFCing these patches to start this Multicolor framework as it appears we
have a few devices that need to leverage a framework like this.

I have attempted to create as much documentation as possible and have no issue
in combining documents into a single document but I think this patchset is logical.

I have also added the dt-bindings patch that include the COLOR_ID and COLOR_NAME
and documented the existing patch on the mail list.  I have added this only for
demonstration purposes.

Finally the code itself is a work in progress that at the very least will create
a colors directory as well as the associated colors.  The code works in principle
but I need to scrub it for issues.  The framework code also does not contain the
available brightness support as this seems to be a sticky point.

Dan

Dan Murphy (5):
  leds: multicolor: Add sysfs interface definition
  dt: bindings: Add multicolor class dt bindings documention
  documention: leds: Add multicolor class documentation
  dt-bindings: leds: Add LED_COLOR_ID and COLOR_NAME definitions
  leds: multicolor: Introduce a multicolor class definition

 .../ABI/testing/sysfs-class-led-multicolor    |  91 ++++
 .../bindings/leds/leds-class-multicolor.txt   | 140 ++++++
 Documentation/leds/leds-class-multicolor.txt  |  99 +++++
 drivers/leds/Kconfig                          |  10 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/led-class-multicolor.c           | 411 ++++++++++++++++++
 include/dt-bindings/leds/common.h             |  19 +
 include/linux/led-class-multicolor.h          |  69 +++
 8 files changed, 840 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
 create mode 100644 Documentation/leds/leds-class-multicolor.txt
 create mode 100644 drivers/leds/led-class-multicolor.c
 create mode 100644 include/linux/led-class-multicolor.h

-- 
2.19.0

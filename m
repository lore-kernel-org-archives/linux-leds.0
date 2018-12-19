From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 0/2] LP5024/18 LED introduction
Date: Wed, 19 Dec 2018 10:26:24 -0600
Message-ID: <20181219162626.12297-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Hello

I am introducing the newest of the TI RGB parts the LP5024 and the LP5018.
Now I understand that there is a patchset in the works that changes the way
the LED labeling is created but I wanted to post these patches for comments and
let the maintainers decide whether to pull this in prior to that patchset being
committed.

Dan

Dan Murphy (2):
  dt: bindings: lp5024: Introduce the lp5024 and lp5018 RGB driver
  leds: lp5024: Add the LP5024/18 RGB LED driver

 .../devicetree/bindings/leds/leds-lp5024.txt  |  63 ++
 drivers/leds/Kconfig                          |   7 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-lp5024.c                    | 610 ++++++++++++++++++
 4 files changed, 681 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp5024.txt
 create mode 100644 drivers/leds/leds-lp5024.c

-- 
2.20.0.rc2.7.g965798d1f2

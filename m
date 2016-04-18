From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH] driver: leds: is31fl3196/99 dimmable dual/triple rgb driver
Date: Mon, 18 Apr 2016 20:43:15 +0200
Message-ID: <cover.1461004995.git.hns@goldelico.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, kernel@pyra-handheld.com, marek@goldelico.com, letux-kernel@openphoenux.org
List-Id: linux-leds@vger.kernel.org

This patch adds a driver for the is31fl3196/99 dimmable dual/triple rgb controller chips from ISSI.

H. Nikolaus Schaller (1):
  drivers: led: is31fl319x: 6/9-channel light effect led driver

 .../devicetree/bindings/leds/is31fl319x.txt        |  41 +++
 drivers/leds/Kconfig                               |   8 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-is31fl319x.c                     | 406 +++++++++++++++++++++
 include/linux/leds-is31fl319x.h                    |  24 ++
 5 files changed, 480 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/is31fl319x.txt
 create mode 100644 drivers/leds/leds-is31fl319x.c
 create mode 100644 include/linux/leds-is31fl319x.h

-- 
2.7.3

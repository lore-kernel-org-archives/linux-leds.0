From: Ingi Kim <ingi2.kim@samsung.com>
Subject: [PATCH 0/3] Add ktd2692 Flash LED driver
Date: Fri, 27 Feb 2015 10:01:28 +0900
Message-ID: <1424998891-25591-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kerner.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, cooloney@gmail.com, rpurdie@rpsys.net, treding@nvidia.com, p.zabel@pengutronix.de, andrew@lunn.ch, gregkh@linuxfoundation.org, florian.vaussard@epfl.ch, arno@natisbad.org, kuninori.morimoto.gx@renesas.com, hytszk@gmail.com, antonynpavlov@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Ingi Kim <ingi2.kim@samsung.com>
List-Id: linux-leds@vger.kernel.org

This patch supports KTD2692 flash LED driver

Ingi Kim (3):
  of: Add vendor prefix for Kinetic technologies
  leds: ktd2692: add device tree bindings for ktd2692
  leds: Add ktd2692 flash LED driver

 .../devicetree/bindings/leds/leds-ktd2692.txt      |   19 ++
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 drivers/leds/Kconfig                               |    8 +
 drivers/leds/Makefile                              |    1 +
 drivers/leds/leds-ktd2692.c                        |  245 ++++++++++++++++++++
 5 files changed, 274 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-ktd2692.txt
 create mode 100644 drivers/leds/leds-ktd2692.c

-- 
1.7.9.5

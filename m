From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH 0/2] leds: Add control of the voltage/current regulator to the LED core
Date: Mon, 8 Jul 2019 12:35:45 +0200
Message-ID: <20190708103547.23528-1-jjhiblot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, daniel.thompson@linaro.org
Cc: dmurphy@ti.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jean-Jacques Hiblot <jjhiblot@ti.com>
List-Id: linux-leds@vger.kernel.org

This series makes it possible for the LED core to manage the power supply
of a LED. It uses the regulator API to disable/enable the power if when the
LED is turned on/off.
This is especially useful in situations where the LED driver/controller is
not supplying the power.

Jean-Jacques Hiblot (2):
  leds: Add control of the voltage/current regulator to the LED core
  dt-bindings: leds: document new "power-supply" property

 .../devicetree/bindings/leds/common.txt       |  5 ++
 drivers/leds/led-class.c                      | 10 ++++
 drivers/leds/led-core.c                       | 53 +++++++++++++++++--
 include/linux/leds.h                          |  4 ++
 4 files changed, 69 insertions(+), 3 deletions(-)

-- 
2.17.1

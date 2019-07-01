From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH 0/2] leds: tlc591xx: switch to OF and managed API
Date: Mon, 1 Jul 2019 17:26:00 +0200
Message-ID: <20190701152602.31716-1-jjhiblot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, tomi.valkeinen@ti.com, Jean-Jacques Hiblot <jjhiblot@ti.com>
List-Id: linux-leds@vger.kernel.org

This mini-series updates the tlc591xx driver to use the managed API. The
driver is also modified to pass the DT node to the LED core layer.
The goal is to be able to the generic led-backlight [0] driver on top of
it.

[0] https://lore.kernel.org/patchwork/project/lkml/list/?series=400524

Jean-Jacques Hiblot (2):
  leds: tlc591xx: simplify driver by using the managed led API
  leds: tlc591xx: Use the OF version of the LED registration function

 drivers/leds/leds-tlc591xx.c | 81 ++++++++++--------------------------
 1 file changed, 21 insertions(+), 60 deletions(-)

-- 
2.17.1

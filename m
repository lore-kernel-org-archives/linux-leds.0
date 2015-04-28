From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH v5 0/2] BCM6328 LED driver
Date: Tue, 28 Apr 2015 18:50:48 +0200
Message-ID: <1430239850-26120-1-git-send-email-noltari@gmail.com>
References: <1430050517-8045-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:33031 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030477AbbD1Qup (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 28 Apr 2015 12:50:45 -0400
In-Reply-To: <1430050517-8045-1-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, cooloney@gmail.com, jogo@openwrt.org, f.fainelli@gmail.com, cernekee@gmail.com, j.anaszewski@samsung.com
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>

These patches add support and documentation for the BCM6328 LED driver,=
 which is present on BCM6318, BCM6328, BCM6362 and BCM63268.
In these SoCs it's possible to control LEDs both as GPIOs or by hardwar=
e.
However, on some devices there are Serial LEDs (LEDs connected to a 74h=
c controller), which can either be controlled by software (exporting th=
e 74hc as spi-gpio) or hardware using this driver.
The problem is some of these serial LEDs are hardware controlled (ether=
net LEDs) and exporting the 74hc as spi-gpio prevents those LEDs to be =
hardware controlled, so the only chance to keep them working is by usin=
g this driver.

v4->v5: Introduce changes suggested by Jacek.
v3->v4: Introduce changes suggested by Jacek.
v2->v3: Introduce changes suggested by Jacek.
v1->v2: Introduce changes suggested by Florian and Jonas.

=C3=81lvaro Fern=C3=A1ndez Rojas (2):
  leds: add DT binding for BCM6328 LED controller
  leds: add BCM6328 LED driver

 .../devicetree/bindings/leds/leds-bcm6328.txt      | 309 +++++++++++++=
++
 drivers/leds/Kconfig                               |   8 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-bcm6328.c                        | 413 +++++++++++++=
++++++++
 4 files changed, 731 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-bcm6328=
=2Etxt
 create mode 100644 drivers/leds/leds-bcm6328.c

--=20
1.9.1

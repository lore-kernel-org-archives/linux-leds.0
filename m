From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH 0/2] BCM6328 LED driver
Date: Thu,  2 Apr 2015 13:54:19 +0200
Message-ID: <1427975661-29964-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:38759 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751469AbbDBLyU (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 2 Apr 2015 07:54:20 -0400
Received: by wibgn9 with SMTP id gn9so102398792wib.1
        for <linux-leds@vger.kernel.org>; Thu, 02 Apr 2015 04:54:19 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, cooloney@gmail.com, jogo@openwrt.org, f.fainelli@gmail.com, cernekee@gmail.com
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
g this driver.=20

=C3=81lvaro Fern=C3=A1ndez Rojas (2):
  leds: add DT binding for BCM6328 LED controller
  leds: add BCM6328 LED driver

 .../devicetree/bindings/leds/leds-bcm6328.txt      | 173 +++++++++
 drivers/leds/Kconfig                               |   8 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-bcm6328.c                        | 411 +++++++++++++=
++++++++
 4 files changed, 593 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-bcm6328=
=2Etxt
 create mode 100644 drivers/leds/leds-bcm6328.c

--=20
1.9.1

From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH 0/4] leds-bcm6328: several fixes and improvements
Date: Thu,  8 Oct 2015 12:35:51 +0200
Message-ID: <1444300555-13988-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:33665 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751736AbbJHKfl (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 8 Oct 2015 06:35:41 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, j.anaszewski@samsung.com, jogo@openwrt.org, cernekee@gmail.com, f.fainelli@gmail.com
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>

These patches improve leds-bcm6328 by adding invalid LED printing (like=
 it's done in leds-bcm6358), simplifying default-state handling (once a=
gain like it's done in leds-bcm6358), and adding more init configuratio=
n options.

=C3=81lvaro Fern=C3=A1ndez Rojas (4):
  leds-bcm6328: print invalid LED
  leds-bcm6328: simplify and improve default-state handling
  leds-bcm6328: add more init configuration options
  Documentation: leds: update DT bindings for leds-bcm6328

 .../devicetree/bindings/leds/leds-bcm6328.txt      | 10 ++++++
 drivers/leds/leds-bcm6328.c                        | 41 ++++++++++++++=
++------
 2 files changed, 40 insertions(+), 11 deletions(-)

--=20
1.9.1

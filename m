From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH v2 0/8] leds: bcm6328/bcm6358: several fixes and improvements
Date: Tue, 15 Dec 2015 21:03:44 +0100
Message-ID: <1450209832-2742-1-git-send-email-noltari@gmail.com>
References: <1448814931-1369-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:37846 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932365AbbLOUD6 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 15 Dec 2015 15:03:58 -0500
Received: by mail-wm0-f54.google.com with SMTP id n186so42211879wmn.0
        for <linux-leds@vger.kernel.org>; Tue, 15 Dec 2015 12:03:58 -0800 (PST)
In-Reply-To: <1448814931-1369-1-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, j.anaszewski@samsung.com, jogo@openwrt.org, f.fainelli@gmail.com, cernekee@gmail.com, simon@fire.lp0.eu
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>

These patches add several fixes and improvements for leds-bcm6328 and
leds-bcm6358.

v2: introduce changes suggested by Jacek and Florian
 - change "leds-bcm6328:" to "leds: bcm6328:"
 - change "leds-bcm6358:" to "leds: bcm6358:"
 - add little endian support
 - bcm6358: Merge bcm6358_led_mode into bcm6358_led_set

=C3=81lvaro Fern=C3=A1ndez Rojas (8):
  leds: bcm6328: code cleaning
  leds: bcm6328: remove unneded lock when checking initial LED
  leds: bcm6358: Use bcm6358_led_set() in order to get rid of the lock
  leds: bcm6358: remove unneded lock when checking initial LED status
  leds: bcm6328: add little endian support
  leds: bcm6358: add little endian support
  leds: bcm6328: simplify duplicated unlock in bcm6328_blink_set
  leds: bcm6358: merge bcm6358_led_mode and bcm6358_led_set

 drivers/leds/leds-bcm6328.c | 29 +++++++++++++++++------------
 drivers/leds/leds-bcm6358.c | 34 ++++++++++++++++------------------
 2 files changed, 33 insertions(+), 30 deletions(-)

--=20
1.9.1

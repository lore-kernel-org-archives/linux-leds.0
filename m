From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH 0/2] leds: trigger: gpio: Add update point / use threaded IRQ
Date: Fri, 26 May 2017 15:17:45 +0200
Message-ID: <cover.1495804666.git.jan.kiszka@siemens.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

See patches for details.

Jan Kiszka (2):
  leds: trigger: gpio: Refresh LED state after GPIO change
  leds: trigger: gpio: Use threaded IRQ

 drivers/leds/trigger/ledtrig-gpio.c | 29 +++++++----------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

-- 
2.12.0

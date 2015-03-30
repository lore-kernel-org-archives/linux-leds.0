From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH 0/3] Handle LEDs with the same name
Date: Mon, 30 Mar 2015 19:45:58 +0200
Message-ID: <1427737561-2424-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, sakari.ailus@linux.intel.com, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: linux-leds@vger.kernel.org

This is a rework of the original patch + 3 fixup patches from me.
Contains a lot of feedback from Geert Uytterhoeven <geert@linux-m68k.org>
Thanks!

Ricardo Ribalda Delgado (1):
  leds/led-class: Handle LEDs with the same name

Sakari Ailus (2):
  leds: Use log level warn instead of info when telling about a name
    clash
  leds: Don't treat the LED name as a format string

 drivers/leds/led-class.c | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

-- 
2.1.4

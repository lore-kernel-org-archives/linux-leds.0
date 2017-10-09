From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH] Documentation: leds: Update 00-INDEX file
Date: Mon,  9 Oct 2017 21:10:03 +0200
Message-ID: <1507576203-27633-1-git-send-email-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, pavel@ucw.cz, Jacek Anaszewski <jacek.anaszewski@gmail.com>
List-Id: linux-leds@vger.kernel.org

Add missing entries for the following documentation files:

- leds-class-flash.txt
- leds-lm3556.txt
- leds-mlxcpld.txt
- ledtrig-usbport.txt
- uleds.txt

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---
 Documentation/leds/00-INDEX | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/leds/00-INDEX b/Documentation/leds/00-INDEX
index b4ef1f3..ae626b2 100644
--- a/Documentation/leds/00-INDEX
+++ b/Documentation/leds/00-INDEX
@@ -4,6 +4,10 @@ leds-blinkm.txt
 	- Driver for BlinkM LED-devices.
 leds-class.txt
 	- documents LED handling under Linux.
+leds-class-flash.txt
+	- documents flash LED handling under Linux.
+leds-lm3556.txt
+	- notes on how to use the leds-lm3556 driver.
 leds-lp3944.txt
 	- notes on how to use the leds-lp3944 driver.
 leds-lp5521.txt
@@ -16,7 +20,13 @@ leds-lp55xx.txt
 	- description about lp55xx common driver.
 leds-lm3556.txt
 	- notes on how to use the leds-lm3556 driver.
+leds-mlxcpld.txt
+	- notes on how to use the leds-mlxcpld driver.
 ledtrig-oneshot.txt
 	- One-shot LED trigger for both sporadic and dense events.
 ledtrig-transient.txt
 	- LED Transient Trigger, one shot timer activation.
+ledtrig-usbport.txt
+	- notes on how to use the drivers/usb/core/ledtrig-usbport.c trigger.
+uleds.txt
+	- notes on how to use the uleds driver.
-- 
2.1.4

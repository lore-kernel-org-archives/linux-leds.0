From: Toshi Kikuchi <toshik@chromium.org>
Subject: [PATCH] Documentation: leds-lp5523: describe master fader attributes
Date: Tue, 12 May 2015 18:15:14 -0700
Message-ID: <1431479714-25846-1-git-send-email-toshik@chromium.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:34928 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965020AbbEMBPT (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 May 2015 21:15:19 -0400
Received: by iebpz10 with SMTP id pz10so18591414ieb.2
        for <linux-leds@vger.kernel.org>; Tue, 12 May 2015 18:15:19 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, milo.kim@ti.com, cooloney@gmail.com, j.anaszewski@samsung.com

Add the usage of the new attributes for master faders.

Signed-off-by: Toshi Kikuchi <toshik@chromium.org>
---
 Documentation/leds/leds-lp5523.txt | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/leds/leds-lp5523.txt b/Documentation/leds/leds-lp5523.txt
index 5b3e91d..0dbbd27 100644
--- a/Documentation/leds/leds-lp5523.txt
+++ b/Documentation/leds/leds-lp5523.txt
@@ -49,6 +49,36 @@ There are two ways to run LED patterns.
 2) Firmware interface - LP55xx common interface
   For the details, please refer to 'firmware' section in leds-lp55xx.txt
 
+LP5523 has three master faders. If a channel is mapped to one of
+the master faders, its output is dimmed based on the value of the master
+fader.
+
+For example,
+
+  echo "123000123" > master_fader_leds
+
+creates the following channel-fader mappings:
+
+  channel 0,6 to master_fader1
+  channel 1,7 to master_fader2
+  channel 2,8 to master_fader3
+
+Then, to have 25% of the original output on channel 0,6:
+
+  echo 64 > master_fader1
+
+To have 0% of the original output (i.e. no output) channel 1,7:
+
+  echo 0 > master_fader2
+
+To have 100% of the original output (i.e. no dimming) on channel 2,8:
+
+  echo 255 > master_fader3
+
+To clear all master fader controls:
+
+  echo "000000000" > master_fader_leds
+
 Selftest uses always the current from the platform data.
 
 Each channel contains led current settings.
-- 
2.2.1.62.g3f15098

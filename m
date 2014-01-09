From: Pavel Machek <pavel@ucw.cz>
Subject: [trivial] Comment improvements for lp5523 and friend
Date: Fri, 10 Jan 2014 00:13:39 +0100
Message-ID: <20140109231339.GA20157@amd.pavel.ucw.cz>
References: <20140107204233.GA22413@amd.pavel.ucw.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140107204233.GA22413@amd.pavel.ucw.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, milo.kim@ti.com
Cc: pali.rohar@gmail.com, sre@debian.org, sre@ring0.de
List-Id: linux-leds@vger.kernel.org

Add some comments that are not obvious from first look at the driver
to lp5523, fix typo in lp8501.

Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index c00f55e4..ac64ebc 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -34,7 +34,15 @@
 
 #include "leds-lp55xx-common.h"
 
-#define LP5523_PROGRAM_LENGTH		32
+#define LP5523_PROGRAM_LENGTH		32	/* bytes */
+/* Memory is used like this:
+   0x00 engine 1 program
+   0x10 engine 2 program
+   0x20 engine 3 program
+   0x30 engine 1 muxing info
+   0x40 engine 2 muxing info
+   0x50 engine 3 muxing info
+*/
 #define LP5523_MAX_LEDS			9
 
 /* Registers */
index 8d55a780..ae5c6fe 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -262,7 +262,7 @@ static void lp8501_firmware_loaded(struct lp55xx_chip *chip)
 	}
 
 	/*
-	 * Program momery sequence
+	 * Program memory sequence
 	 *  1) set engine mode to "LOAD"
 	 *  2) write firmware data into program memory
 	 */

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

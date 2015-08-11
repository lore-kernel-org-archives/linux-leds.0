From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 01/57] leds: Add brightness_set_nonblocking op
Date: Tue, 11 Aug 2015 11:37:14 +0200
Message-ID: <1439285890-27329-2-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Andrew Lunn <andrew@lunn.ch>, Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>
List-Id: linux-leds@vger.kernel.org

This patch adds a new brightness_set_nonblocking op to the LED subsystem.
The op is intended for drivers that set brightness in a non-blocking way,
i.e. they neither sleep nor use delays while setting brightness.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Stas Sergeev <stsp@users.sourceforge.net>
---
 include/linux/leds.h |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/leds.h b/include/linux/leds.h
index b122eea..c32f1b8 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -53,6 +53,9 @@ struct led_classdev {
 	/* Must not sleep, use a workqueue if needed */
 	void		(*brightness_set)(struct led_classdev *led_cdev,
 					  enum led_brightness brightness);
+	/* Intended for drivers that set brightness in a non-blocking way */
+	void (*brightness_set_nonblocking)(struct led_classdev *led_cdev,
+					  enum led_brightness brightness);
 	/*
 	 * Set LED brightness level immediately - it can block the caller for
 	 * the time required for accessing a LED device register.
-- 
1.7.9.5

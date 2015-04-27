From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH 3/3] leds: update documentation about new delay units
Date: Mon, 27 Apr 2015 20:14:25 +0300
Message-ID: <553E6E71.4080509@list.ru>
References: <553E6CF5.4030601@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <553E6CF5.4030601@list.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


This adds the description of /sys/class/leds/<device>/delay_unit.
It allows you to specify the delay unit for the led trigger timer.

CC: Jonathan Corbet <corbet@lwn.net>
CC: linux-doc@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
---
 Documentation/leds/leds-class.txt |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/leds/leds-class.txt b/Documentation/leds/leds-class.txt
index 79699c2..0e5ecf5 100644
--- a/Documentation/leds/leds-class.txt
+++ b/Documentation/leds/leds-class.txt
@@ -23,6 +23,10 @@ parameters and work on a per LED basis. The timer trigger is an example.
 The timer trigger will periodically change the LED brightness between
 LED_OFF and the current brightness setting. The "on" and "off" time can
 be specified via /sys/class/leds/<device>/delay_{on,off} in milliseconds.
+If you want to specify the delay in microseconds or nanoseconds, you can
+write 'usec' or 'nsec' to /sys/class/leds/<device>/delay_unit. That
+functionality is available only if you have high-resolution timers
+configured (check CONFIG_HIGH_RES_TIMERS in your kernel config).
 You can change the brightness value of a LED independently of the timer
 trigger. However, if you set the brightness value to LED_OFF it will
 also disable the timer trigger.
-- 
1.7.9.5

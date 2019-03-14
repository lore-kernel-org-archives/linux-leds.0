From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v2 5/6] leds: netdev trigger: add documentation to leds/common.txt
Date: Thu, 14 Mar 2019 15:06:18 +0100
Message-ID: <20190314140619.3309-6-linux@rasmusvillemoes.dk>
References: <20190313202615.22883-1-linux@rasmusvillemoes.dk>
 <20190314140619.3309-1-linux@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190314140619.3309-1-linux@rasmusvillemoes.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

The various sysfs files used to configure a netdev-triggered LED are
already documented, but let's also add "netdev" to the list of things
one can reasonably set linux,default-trigger to.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 Documentation/devicetree/bindings/leds/common.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
index 70876ac11367..7cb88460a47c 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -39,6 +39,9 @@ Optional properties for child nodes:
      "timer" - LED flashes at a fixed, configurable rate
      "pattern" - LED alters the brightness for the specified duration with one
                  software timer (requires "led-pattern" property)
+     "netdev" - LED can be configured via sysfs files (see
+                Documentation/ABI/testing/sysfs-class-led-trigger-netdev)
+                to reflect the state and activity of a net device.
 
 - led-pattern : Array of integers with default pattern for certain triggers.
                 Each trigger may parse this property differently:
-- 
2.20.1

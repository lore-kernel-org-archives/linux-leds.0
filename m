From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 1/2] dt-bindings: leds: gpio: Add optional retain-state-shutdown property
Date: Fri, 25 Aug 2017 16:05:02 +0930
Message-ID: <20170825063503.31577-2-andrew@aj.id.au>
References: <20170825063503.31577-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170825063503.31577-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
List-Id: linux-leds@vger.kernel.org

On BMC systems it's sometimes necessary for a LED to retain its state
across a BMC reset (which is independent of the host system state). Add
a devicetree property to describe this behaviour. The property would
typically be used in conjunction with 'default-state = "keep"'.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/devicetree/bindings/leds/leds-gpio.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-gpio.txt b/Documentation/devicetree/bindings/leds/leds-gpio.txt
index 76535ca37120..a48dda268f81 100644
--- a/Documentation/devicetree/bindings/leds/leds-gpio.txt
+++ b/Documentation/devicetree/bindings/leds/leds-gpio.txt
@@ -18,6 +18,9 @@ LED sub-node properties:
   see Documentation/devicetree/bindings/leds/common.txt
 - retain-state-suspended: (optional) The suspend state can be retained.Such
   as charge-led gpio.
+- retain-state-shutdown: (optional) Retain the state of the LED on shutdown.
+  Useful in BMC systems, for example when the BMC is rebooted while the host
+  remains up.
 - panic-indicator : (optional)
   see Documentation/devicetree/bindings/leds/common.txt
 
-- 
2.11.0

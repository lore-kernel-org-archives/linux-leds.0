From: dt.tangr@gmail.com
Subject: [PATCH 3/3] devicetree: bindings: document lsi,zevio-led
Date: Sun, 15 Dec 2013 20:54:13 +1100
Message-ID: <1387101253-30804-3-git-send-email-dt.tangr@gmail.com>
References: <1387101253-30804-1-git-send-email-dt.tangr@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1387101253-30804-1-git-send-email-dt.tangr@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Daniel Tang <dt.tangr@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

From: Daniel Tang <dt.tangr@gmail.com>

This describes the device tree bindings for the LSI Zevio LED Controller

Signed-off-by: Daniel Tang <dt.tangr@gmail.com>
---
 Documentation/devicetree/bindings/leds/leds-zevio.txt |   13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-zevio.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-zevio.txt b/Documentation/devicetree/bindings/leds/leds-zevio.txt
new file mode 100644
index 0000000..44b0d87
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-zevio.txt
@@ -0,0 +1,13 @@
+LSI Zevio LED controller
+
+Required properties:
+ - compatible : should be "lsi,zevio-led".
+
+Examples:
+
+led {
+	compatible = "lsi,zevio-led";
+	reg = <0x90110B00 0x100>;
+};
+
+
-- 
1.7.10.4

From: dt.tangr@gmail.com
Subject: [PATCH 2/3] arm: nspire: modify device tree to use the LSI Zevio LED driver
Date: Sun, 15 Dec 2013 20:54:12 +1100
Message-ID: <1387101253-30804-2-git-send-email-dt.tangr@gmail.com>
References: <1387101253-30804-1-git-send-email-dt.tangr@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1387101253-30804-1-git-send-email-dt.tangr@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Daniel Tang <dt.tangr@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux@arm.linux.org.uk
List-Id: linux-leds@vger.kernel.org

From: Daniel Tang <dt.tangr@gmail.com>


Signed-off-by: Daniel Tang <dt.tangr@gmail.com>
---
 arch/arm/boot/dts/nspire.dtsi |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nspire.dtsi b/arch/arm/boot/dts/nspire.dtsi
index a22ffe6..bb453bb 100644
--- a/arch/arm/boot/dts/nspire.dtsi
+++ b/arch/arm/boot/dts/nspire.dtsi
@@ -167,8 +167,9 @@
 				reg = <0x900F0000 0x1000>;
 			};
 
-			led: led@90110000 {
-				reg = <0x90110000 0x1000>;
+			led: led@90110B00 {
+				compatible = "lsi,zevio-led";
+				reg = <0x90110B00 0x100>;
 			};
 		};
 	};
-- 
1.7.10.4

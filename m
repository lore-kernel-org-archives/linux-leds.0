From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH v2 2/3] devicetree: leds: Introduce "panic-indicator" optional property
Date: Wed, 13 Apr 2016 15:08:18 -0300
Message-ID: <1460570899-24642-3-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460570899-24642-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460570899-24642-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
List-Id: linux-leds@vger.kernel.org

It's desirable to specify which LEDs are to be blinked on a kernel
panic. Therefore, introduce a devicetree boolean property to mark
which LEDs should be treated this way, if possible.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 Documentation/devicetree/bindings/leds/common.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
index 68419843e32f..7b646a7808ce 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -37,6 +37,9 @@ Optional properties for child nodes:
                      property is mandatory for the LEDs in the non-flash modes
                      (e.g. torch or indicator).
 
+- panic-indicator : This properties specifies that the LED should be used,
+		    if at all possible, as a panic indicator.
+
 Required properties for flash LED child nodes:
 - flash-max-microamp : Maximum flash LED supply current in microamperes.
 - flash-max-timeout-us : Maximum timeout in microseconds after which the flash
-- 
2.7.0

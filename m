From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH v3 2/3] devicetree: leds: Introduce "panic-indicator" optional property
Date: Thu, 28 Apr 2016 19:03:39 -0300
Message-ID: <1461881020-13964-3-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1461881020-13964-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f176.google.com ([209.85.192.176]:33460 "EHLO
	mail-pf0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753957AbcD1WEE (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 28 Apr 2016 18:04:04 -0400
Received: by mail-pf0-f176.google.com with SMTP id 206so39385363pfu.0
        for <linux-leds@vger.kernel.org>; Thu, 28 Apr 2016 15:04:03 -0700 (PDT)
In-Reply-To: <1461881020-13964-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

It's desirable to specify which LEDs are to be blinked on a kernel
panic. Therefore, introduce a devicetree boolean property to mark
which LEDs should be treated this way, if possible.

Acked-by: Rob Herring <rob@kernel.org>
Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 Documentation/devicetree/bindings/leds/common.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
index 68419843e32f..af10678ea2f6 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -37,6 +37,9 @@ Optional properties for child nodes:
                      property is mandatory for the LEDs in the non-flash modes
                      (e.g. torch or indicator).
 
+- panic-indicator : This property specifies that the LED should be used,
+		    if at all possible, as a panic indicator.
+
 Required properties for flash LED child nodes:
 - flash-max-microamp : Maximum flash LED supply current in microamperes.
 - flash-max-timeout-us : Maximum timeout in microseconds after which the flash
-- 
2.7.0

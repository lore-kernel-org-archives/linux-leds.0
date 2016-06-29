From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/3] ARM: dts: add PM8058 LEDs to the APQ8060 Dragonboard
Date: Wed, 29 Jun 2016 16:22:00 +0200
Message-ID: <1467210120-8829-3-git-send-email-linus.walleij@linaro.org>
References: <1467210120-8829-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:33031 "EHLO
	mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752015AbcF2OWQ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 29 Jun 2016 10:22:16 -0400
Received: by mail-lf0-f50.google.com with SMTP id f6so34731244lfg.0
        for <linux-leds@vger.kernel.org>; Wed, 29 Jun 2016 07:22:11 -0700 (PDT)
In-Reply-To: <1467210120-8829-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>

This adds the PM8058 LEDs as used in the platform.

Cc: linux-arm-msm@vger.kernel.org
Cc: Andy Gross <andy.gross@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8060-dragonboard.dts | 39 ++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
index 0abc93e5bb00..b0800b988174 100644
--- a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
@@ -239,6 +239,45 @@
 						};
 					};
 				};
+
+				led@48 {
+					/*
+					 * The keypad LED @0x48 is routed to
+					 * the sensor board where it is
+					 * connected to an infrared LED
+					 * SFH4650 (60mW, @850nm) next to the
+					 * ambient light and proximity sensor
+					 * Capella Microsystems CM3605.
+					 */
+					compatible = "qcom,pm8058-keypad-led";
+					reg = <0x48>;
+					label = "proximity0";
+					default-state = "off";
+				};
+				led@131 {
+					compatible = "qcom,pm8058-led";
+					reg = <0x131>;
+					label = "pm8058:red";
+					default-state = "off";
+				};
+				led@132 {
+					/*
+					 * This is actually green too on my
+					 * board, but documented as yellow.
+					 */
+					compatible = "qcom,pm8058-led";
+					reg = <0x132>;
+					label = "pm8058:yellow";
+					default-state = "off";
+					linux,default-trigger = "mmc0";
+				};
+				led@133 {
+					compatible = "qcom,pm8058-led";
+					reg = <0x133>;
+					label = "pm8058:green";
+					default-state = "on";
+					linux,default-trigger = "heartbeat";
+				};
 			};
 		};
 
-- 
2.4.11

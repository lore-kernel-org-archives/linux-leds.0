From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH V2] leds: s3c24xx: Fix build failure
Date: Fri,  3 Jan 2014 10:55:57 +0530
Message-ID: <1388726757-7387-1-git-send-email-tushar.behera@linaro.org>
References: <1388394595-1347-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:37438 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750788AbaACF3t (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 3 Jan 2014 00:29:49 -0500
Received: by mail-pd0-f174.google.com with SMTP id x10so15030600pdj.33
        for <linux-leds@vger.kernel.org>; Thu, 02 Jan 2014 21:29:49 -0800 (PST)
In-Reply-To: <1388394595-1347-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Cc: rpurdie@rpsys.net, cooloney@gmail.com

Commit c67d0f29262b ("ARM: s3c24xx: get rid of custom <mach/gpio.h>")
removed the usage of mach/gpio.h file, but we need to include
plat/gpio-cfg.h to avoid following build error.

=46ixes following build error.
drivers/leds/leds-s3c24xx.c: In function =E2=80=98s3c24xx_led_probe=E2=80=
=99:
drivers/leds/leds-s3c24xx.c:100:2: error: implicit declaration of
function =E2=80=98s3c_gpio_setpull=E2=80=99 [-Werror=3Dimplicit-functio=
n-declaration]

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
Changes for V2:
* Updated commit message

Bryan,

I should have been more explicit regarding this patch. This patch fixes
build error on linux-next after the above patch was merged.

Tested at next-20131224.

 drivers/leds/leds-s3c24xx.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-s3c24xx.c b/drivers/leds/leds-s3c24xx.c
index 76483fb..87cf215 100644
--- a/drivers/leds/leds-s3c24xx.c
+++ b/drivers/leds/leds-s3c24xx.c
@@ -21,6 +21,7 @@
=20
 #include <mach/hardware.h>
 #include <mach/regs-gpio.h>
+#include <plat/gpio-cfg.h>
 #include <linux/platform_data/leds-s3c24xx.h>
=20
 /* our context */
--=20
1.7.9.5

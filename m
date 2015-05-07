From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/3] leds: leds-gpio: Add missing #include <linux/of.h>
Date: Thu,  7 May 2015 10:08:09 +0200
Message-ID: <1430986090-7243-3-git-send-email-geert@linux-m68k.org>
References: <1430986090-7243-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:38975 "EHLO
	andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750991AbbEGIIQ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 7 May 2015 04:08:16 -0400
In-Reply-To: <1430986090-7243-1-git-send-email-geert@linux-m68k.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Arnd Bergmann <arnd@arndb.de>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

drivers/leds/leds-gpio.c: In function =E2=80=98gpio_leds_create=E2=80=99=
:
drivers/leds/leds-gpio.c:194: error: implicit declaration of function =E2=
=80=98of_node=E2=80=99
drivers/leds/leds-gpio.c:194: warning: assignment makes pointer from in=
teger without a cast
drivers/leds/leds-gpio.c:200: error: dereferencing pointer to incomplet=
e type

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/leds/leds-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 15eb3f86f670ffe4..89d981e8f8cacf55 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -16,6 +16,7 @@
 #include <linux/kernel.h>
 #include <linux/leds.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/slab.h>
--=20
1.9.1

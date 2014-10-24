From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2] leds: delete copy/paste mistake
Date: Fri, 24 Oct 2014 12:57:06 +0200
Message-ID: <1414148226-12975-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46]:44942 "EHLO
	mail-wg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756492AbaJXK5P (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 24 Oct 2014 06:57:15 -0400
Received: by mail-wg0-f46.google.com with SMTP id l18so804355wgh.29
        for <linux-leds@vger.kernel.org>; Fri, 24 Oct 2014 03:57:14 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

A chunk of text followed the copied license text, ehm, sorry
that kind of things happen from time to time.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-syscon.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/leds/leds-syscon.c b/drivers/leds/leds-syscon.c
index 3afec79c43f4..e0ccfc872c2f 100644
--- a/drivers/leds/leds-syscon.c
+++ b/drivers/leds/leds-syscon.c
@@ -18,10 +18,6 @@
  * along with this program; if not, write to the Free Software
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
  * MA 02111-1307 USA
- *
- * This driver provides system reboot functionality for APM X-Gene SoC.
- * For system shutdown, this is board specify. If a board designer
- * implements GPIO shutdown, use the gpio-poweroff.c driver.
  */
 #include <linux/io.h>
 #include <linux/of_device.h>
-- 
1.9.3

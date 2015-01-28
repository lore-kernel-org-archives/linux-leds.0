From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] leds: ipaq needs LEDS_CLASS
Date: Wed, 28 Jan 2015 21:05:50 +0100
Message-ID: <7354226.f7e3npkAlC@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, Philipp Zabel <philipp.zabel@gmail.com>, Paul Parsons <lost.distance@yahoo.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-leds@vger.kernel.org

All other drivers have a dependency on this already, but this one
does not, which can lead to a link error when LEDS_CLASS is not set.

drivers/built-in.o: In function `micro_leds_remove':
:(.text+0x13d1bc): undefined reference to `led_classdev_unregister'
drivers/built-in.o: In function `micro_leds_probe':
:(.text+0x13d3d0): undefined reference to `led_classdev_register'

This patch adds the missing dependency.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 95029dfd311a..927bb4491e1c 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -144,6 +144,7 @@ config LEDS_SUNFIRE
 
 config LEDS_IPAQ_MICRO
 	tristate "LED Support for the Compaq iPAQ h3xxx"
+	depends on LEDS_CLASS
 	depends on MFD_IPAQ_MICRO
 	help
 	  Choose this option if you want to use the notification LED on

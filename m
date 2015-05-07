From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 1/3] gpiolib: Add missing dummies for the unified device properties interface
Date: Thu,  7 May 2015 10:08:08 +0200
Message-ID: <1430986090-7243-2-git-send-email-geert@linux-m68k.org>
References: <1430986090-7243-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430986090-7243-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Arnd Bergmann <arnd@arndb.de>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-leds@vger.kernel.org

If GPIOLIB=3Dn:

    drivers/leds/leds-gpio.c: In function =E2=80=98gpio_leds_create=E2=80=
=99:
    drivers/leds/leds-gpio.c:187: error: implicit declaration of functi=
on =E2=80=98devm_get_gpiod_from_child=E2=80=99
    drivers/leds/leds-gpio.c:187: warning: assignment makes pointer fro=
m integer without a cast

Add dummies for fwnode_get_named_gpiod() and devm_get_gpiod_from_child(=
)
for the !GPIOLIB case to fix this.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
=46ixes: 40b7318319281b1b ("gpio: Support for unified device properties=
 interface")
---
 include/linux/gpio/consumer.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consume=
r.h
index 3a7c9ffd5ab930b4..da042657dc31d7f5 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -406,6 +406,21 @@ static inline int desc_to_gpio(const struct gpio_d=
esc *desc)
 	return -EINVAL;
 }
=20
+/* Child properties interface */
+struct fwnode_handle;
+
+static inline struct gpio_desc *fwnode_get_named_gpiod(
+	struct fwnode_handle *fwnode, const char *propname)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
+static inline struct gpio_desc *devm_get_gpiod_from_child(
+	struct device *dev, const char *con_id, struct fwnode_handle *child)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
 #endif /* CONFIG_GPIOLIB */
=20
 /*
--=20
1.9.1

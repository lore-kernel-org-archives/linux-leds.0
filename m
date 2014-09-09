From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 2/2] leds: trigger: gpio: make ledtrig-gpio useable with GPIO drivers requiring threaded irqs
Date: Tue,  9 Sep 2014 09:40:33 +0200
Message-ID: <1410248433-24005-3-git-send-email-LW@KARO-electronics.de>
References: <1410248433-24005-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1410248433-24005-1-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Bryan Wu <cooloney@gmail.com>, =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: linux-leds@vger.kernel.org

When trying to use the LED GPIO trigger with e.g. the PCA953x GPIO
driver, request_irq() fails with -EINVAL, because the GPIO driver
requires a nested interrupt handler.

Use request_any_context_irq() to be able to use any GPIO driver as LED
trigger.

Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
---
 drivers/leds/trigger/ledtrig-gpio.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-gpio.c b/drivers/leds/trigger=
/ledtrig-gpio.c
index c86c418..b4168a7 100644
--- a/drivers/leds/trigger/ledtrig-gpio.c
+++ b/drivers/leds/trigger/ledtrig-gpio.c
@@ -161,10 +161,10 @@ static ssize_t gpio_trig_gpio_store(struct device=
 *dev,
 		return n;
 	}
=20
-	ret =3D request_irq(gpio_to_irq(gpio), gpio_trig_irq,
+	ret =3D request_any_context_irq(gpio_to_irq(gpio), gpio_trig_irq,
 			IRQF_SHARED | IRQF_TRIGGER_RISING
 			| IRQF_TRIGGER_FALLING, "ledtrig-gpio", led);
-	if (ret) {
+	if (ret < 0) {
 		dev_err(dev, "request_irq failed with error %d\n", ret);
 	} else {
 		if (gpio_data->gpio !=3D 0)
@@ -172,7 +172,7 @@ static ssize_t gpio_trig_gpio_store(struct device *=
dev,
 		gpio_data->gpio =3D gpio;
 	}
=20
-	return ret ? ret : n;
+	return ret < 0 ? ret : n;
 }
 static DEVICE_ATTR(gpio, 0644, gpio_trig_gpio_show, gpio_trig_gpio_sto=
re);
=20
--=20
1.7.10.4

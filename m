From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH for 4.15] leds: pca955x: Fix configuration on GPIO request for input
Date: Wed,  4 Oct 2017 17:57:01 +1030
Message-ID: <20171004072701.25782-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, jacek.anaszewski@gmail.com, pavel@ucw.cz, linux-kernel@vger.kernel.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Joel Stanley <joel@jms.id.au>
List-Id: linux-leds@vger.kernel.org

The prior patch which fixed the problem with output inversion failed to
account for a necessary change to requesting a pin for input, which is
affected by the open-drain nature of the hardware.

Previously pca955x_gpio_direction_input() called through
pca955x_set_value() to configure the direction, however continuing down
this route lead to a brain-hemorrhaging level of necessary inversions.
Instead, remove one layer by calling directly into pca955x_led_set(),
and define PCA955X_GPIO_INPUT to paper over the rest of the confusion.

Cc: Cédric Le Goater <clg@kaod.org>
Cc: Joel Stanley <joel@jms.id.au>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Tested-by: Matt Spinler <mspinler@linux.vnet.ibm.com>
---
Jacek:

The prior patch called out above is "eae1693fb026 leds: pca955x: Don't
invert requested value in pca955x_gpio_set_value()" (at the time of sending). I
think I've seen the leds tree be rebased in the past, so feel free to squash
this change in if desired.

 drivers/leds/leds-pca955x.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 6dcd2d7cc6a4..78183f90820e 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -61,6 +61,7 @@
 #define PCA955X_LS_BLINK0	0x2	/* Blink at PWM0 rate */
 #define PCA955X_LS_BLINK1	0x3	/* Blink at PWM1 rate */
 
+#define PCA955X_GPIO_INPUT	LED_OFF
 #define PCA955X_GPIO_HIGH	LED_OFF
 #define PCA955X_GPIO_LOW	LED_FULL
 
@@ -358,8 +359,11 @@ static int pca955x_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
 static int pca955x_gpio_direction_input(struct gpio_chip *gc,
 					unsigned int offset)
 {
-	/* To use as input ensure pin is not driven */
-	return pca955x_set_value(gc, offset, 0);
+	struct pca955x *pca955x = gpiochip_get_data(gc);
+	struct pca955x_led *led = &pca955x->leds[offset];
+
+	/* To use as input ensure pin is not driven. */
+	return pca955x_led_set(&led->led_cdev, PCA955X_GPIO_INPUT);
 }
 
 static int pca955x_gpio_direction_output(struct gpio_chip *gc,
-- 
2.11.0

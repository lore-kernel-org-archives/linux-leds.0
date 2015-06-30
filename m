From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC RESEND] leds: Use set_brightness_work for brightness_set
 ops that can sleep
Date: Tue, 30 Jun 2015 10:01:08 +0200
Message-ID: <1435651268-9657-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34521 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750800AbbF3IBn (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 30 Jun 2015 04:01:43 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Stas Sergeev <stsp@users.sourceforge.net>, Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@linux.intel.com>, Andreas Werner <andreas.werner@men.de>, Andrew Lunn <andrew@lunn.ch>, Antonio Ospite <ospite@studenti.unina.it>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Ben Dooks <ben@simtec.co.uk>, Chris Boot <bootc@bootc.net>, Dan Murphy <dmurphy@ti.com>, Daniel Jeong <daniel.jeong@ti.com>, Daniel Mack <daniel@zonque.org>, "David S. Miller" <davem@davemloft.net>, Fabio Baltieri <fabio.baltieri@gmail.com>, Felipe Balbi <balbi@ti.com>, Florian Fainelli <florian@openwrt.org>, "G.Shark Jeong" <gshark.jeong@gmail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Ingi Kim <ingi2.kim@samsung.com>, Jan-Simon Moeller <dl9pf@gmx.d>

This patch rearranges the core LED subsystem code, so that it
now removes from drivers the responsibility of using work queues
internally in case their brightness_set ops can sleep.
Addition of two flags: LED_BRIGHTNESS_FAST and LED_BLINK_DISABLE
as well as new_brightness_value property to the struct led_classdev
allows for employing existing set_brightness_work to do the job.
The modifications allow also to get rid of brightness_set_sync op,
as flash LED devices can now be handled properly only basing on the
SET_BRIGHTNESS_SYNC flag.


Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Stas Sergeev <stsp@users.sourceforge.net>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andreas Werner <andreas.werner@men.de>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Antonio Ospite <ospite@studenti.unina.it>
Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Cc: Ben Dooks <ben@simtec.co.uk>
Cc: Chris Boot <bootc@bootc.net>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Daniel Jeong <daniel.jeong@ti.com>
Cc: Daniel Mack <daniel@zonque.org>
Cc: David S. Miller <davem@davemloft.net>
Cc: Fabio Baltieri <fabio.baltieri@gmail.com>
Cc: Felipe Balbi <balbi@ti.com>
Cc: Florian Fainelli <florian@openwrt.org>
Cc: G.Shark Jeong <gshark.jeong@gmail.com>
Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Ingi Kim <ingi2.kim@samsung.com>
Cc: Jan-Simon Moeller <dl9pf@gmx.de>
Cc: Johan Hovold <johan@kernel.org>
Cc: John Lenz <lenz@cs.wisc.edu>
Cc: Jonas Gorski <jogo@openwrt.org>
Cc: Kim Kyuwon <q1.kim@samsung.com>
Cc: Kristian Kielhofner <kris@krisk.org>
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>
Cc: Milo Kim <milo.kim@ti.com>
Cc: M=C3=A1rton N=C3=A9meth <nm127@freemail.hu>
Cc: Nate Case <ncase@xes-inc.com>
Cc: NeilBrown <neilb@suse.de>
Cc: Nick Forbes <nick.forbes@incepta.com>
Cc: Paul Parsons <lost.distance@yahoo.com>
Cc: Peter Meerwald <p.meerwald@bct-electronic.com>
Cc: Phil Sutter <n0-1@freewrt.org>
Cc: Philippe Retornaz <philippe.retornaz@epfl.ch>
Cc: Raphael Assenat <raph@8d.com>
Cc: Richard Purdie <rpurdie@openedhand.com>
Cc: Rod Whitby <rod@whitby.id.au>
Cc: Dave Hansen <dave@sr71.net>
Cc: Rodolfo Giometti <giometti@linux.it>
Cc: Sebastian A. Siewior <bigeasy@linutronix.de>
Cc: Shuah Khan <shuahkhan@gmail.com>
Cc: Simon Guinot <sguinot@lacie.com>
Cc: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---

Resending because previously this patch failed to reach
linux-leds list. Also updated/removed defunct Cc addresses.

Hi All,

Since this patch will affect all the LED subsystem drivers
I'd like it was tested by as many developers as possible
to make sure that I haven't missed something.

=46or the drivers which can sleep in their brightness_set ops
(e.g. use mutex or gpio "cansleep" API) you only need to
remove the work queues and move the code executed currently
in the work queue task to the brightness_set op, as now
LED core does the job.

=46or drivers that are capable of setting brightness with use
of MMIO you need to set the LED_BRIGHTNESS_FAST flag, so
that LED core would know that it doesn't have to employ
work queue.

After the patch is positively verified I will create relevant
patches for every LED class driver.

This patch is based on linux-next_20150622.

I am looking forward to your cooperation.

Best Regards,
Jacek Anaszewski


 drivers/leds/led-class.c                  |   18 +++++++----
 drivers/leds/led-core.c                   |   50 +++++++++++++++++----=
--------
 drivers/leds/leds.h                       |   41 +++++++++++++--------=
--
 drivers/leds/trigger/ledtrig-backlight.c  |    8 ++---
 drivers/leds/trigger/ledtrig-default-on.c |    2 +-
 drivers/leds/trigger/ledtrig-gpio.c       |    6 ++--
 drivers/leds/trigger/ledtrig-heartbeat.c  |    2 +-
 drivers/leds/trigger/ledtrig-oneshot.c    |    4 +--
 drivers/leds/trigger/ledtrig-transient.c  |    8 ++---
 include/linux/leds.h                      |    9 ++----
 10 files changed, 83 insertions(+), 65 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index beabfbc..07ccaeb 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -109,7 +109,7 @@ static void led_timer_function(unsigned long data)
 	unsigned long delay;
=20
 	if (!led_cdev->blink_delay_on || !led_cdev->blink_delay_off) {
-		led_set_brightness_async(led_cdev, LED_OFF);
+		led_set_brightness_nosleep(led_cdev, LED_OFF);
 		return;
 	}
=20
@@ -121,10 +121,10 @@ static void led_timer_function(unsigned long data=
)
 	brightness =3D led_get_brightness(led_cdev);
 	if (!brightness) {
 		/* Time to switch the LED on. */
-		if (led_cdev->delayed_set_value) {
+		if (led_cdev->new_brightness_value) {
 			led_cdev->blink_brightness =3D
-					led_cdev->delayed_set_value;
-			led_cdev->delayed_set_value =3D 0;
+					led_cdev->new_brightness_value;
+			led_cdev->new_brightness_value =3D 0;
 		}
 		brightness =3D led_cdev->blink_brightness;
 		delay =3D led_cdev->blink_delay_on;
@@ -137,7 +137,7 @@ static void led_timer_function(unsigned long data)
 		delay =3D led_cdev->blink_delay_off;
 	}
=20
-	led_set_brightness_async(led_cdev, brightness);
+	led_set_brightness_nosleep(led_cdev, brightness);
=20
 	/* Return in next iteration if led is in one-shot mode and we are in
 	 * the final blink state so that the led is toggled each delay_on +
@@ -161,9 +161,13 @@ static void set_brightness_delayed(struct work_str=
uct *ws)
 	struct led_classdev *led_cdev =3D
 		container_of(ws, struct led_classdev, set_brightness_work);
=20
-	led_stop_software_blink(led_cdev);
+	if (led_cdev->flags & LED_BLINK_DISABLE) {
+		led_stop_software_blink(led_cdev);
+		led_cdev->flags &=3D ~LED_BLINK_DISABLE;
+		return;
+	}
=20
-	led_set_brightness_async(led_cdev, led_cdev->delayed_set_value);
+	__led_set_brightness(led_cdev, led_cdev->delayed_set_value);
 }
=20
 /**
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 549de7e..0e13fb0 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -42,13 +42,14 @@ static void led_set_software_blink(struct led_class=
dev *led_cdev,
=20
 	/* never on - just set to off */
 	if (!delay_on) {
-		led_set_brightness_async(led_cdev, LED_OFF);
+		led_set_brightness_nosleep(led_cdev, LED_OFF);
 		return;
 	}
=20
 	/* never off - just set to brightness */
 	if (!delay_off) {
-		led_set_brightness_async(led_cdev, led_cdev->blink_brightness);
+		led_set_brightness_nosleep(led_cdev,
+					   led_cdev->blink_brightness);
 		return;
 	}
=20
@@ -117,27 +118,36 @@ EXPORT_SYMBOL_GPL(led_stop_software_blink);
 void led_set_brightness(struct led_classdev *led_cdev,
 			enum led_brightness brightness)
 {
-	int ret =3D 0;
-
-	/* delay brightness if soft-blink is active */
+	/*
+	 * In case blinking is on delay brightness setting
+	 * to the next timer tick.
+	 */
 	if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
-		led_cdev->delayed_set_value =3D brightness;
-		if (brightness =3D=3D LED_OFF)
-			schedule_work(&led_cdev->set_brightness_work);
-		return;
+		led_cdev->new_brightness_value =3D brightness;
+
+		/* New brightness will be set on next timer tick. */
+		if (brightness !=3D LED_OFF)
+			return;
+		/*
+		 * If need to disable soft blinking delegate this to the
+		 * work queue task to avoid problems in case we are
+		 * called from hard irq context.
+		 */
+		led_cdev->flags |=3D LED_BLINK_DISABLE;
+	} else {
+		/*
+		 * Don't use work queue if brightness has to be set as quickly
+		 * as possible or if this is fast LED.
+		 */
+		if ((led_cdev->flags & SET_BRIGHTNESS_SYNC) ||
+		    (led_cdev->flags & LED_BRIGHTNESS_FAST)) {
+			__led_set_brightness(led_cdev, brightness);
+			return;
+		}
 	}
=20
-	if (led_cdev->flags & SET_BRIGHTNESS_ASYNC) {
-		led_set_brightness_async(led_cdev, brightness);
-		return;
-	} else if (led_cdev->flags & SET_BRIGHTNESS_SYNC)
-		ret =3D led_set_brightness_sync(led_cdev, brightness);
-	else
-		ret =3D -EINVAL;
-
-	if (ret < 0)
-		dev_dbg(led_cdev->dev, "Setting LED brightness failed (%d)\n",
-			ret);
+	led_cdev->delayed_set_value =3D brightness;
+	schedule_work(&led_cdev->set_brightness_work);
 }
 EXPORT_SYMBOL(led_set_brightness);
=20
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index bc89d7a..dd9dd9b 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -2,8 +2,10 @@
  * LED Core
  *
  * Copyright 2005 Openedhand Ltd.
+ * Copyright 2014, 2015 Samsung Electronics Co., Ltd.
  *
  * Author: Richard Purdie <rpurdie@openedhand.com>
+ * Author: Jacek Anaszewski <j.anaszewski@samsung.com>
  *
  * This program is free software; you can redistribute it and/or modif=
y
  * it under the terms of the GNU General Public License version 2 as
@@ -16,27 +18,15 @@
 #include <linux/rwsem.h>
 #include <linux/leds.h>
=20
-static inline void led_set_brightness_async(struct led_classdev *led_c=
dev,
+static inline void __led_set_brightness(struct led_classdev *led_cdev,
 					enum led_brightness value)
 {
-	value =3D min(value, led_cdev->max_brightness);
-	led_cdev->brightness =3D value;
-
-	if (!(led_cdev->flags & LED_SUSPENDED))
-		led_cdev->brightness_set(led_cdev, value);
-}
-
-static inline int led_set_brightness_sync(struct led_classdev *led_cde=
v,
-					enum led_brightness value)
-{
-	int ret =3D 0;
-
 	led_cdev->brightness =3D min(value, led_cdev->max_brightness);
=20
-	if (!(led_cdev->flags & LED_SUSPENDED))
-		ret =3D led_cdev->brightness_set_sync(led_cdev,
-						led_cdev->brightness);
-	return ret;
+	if (led_cdev->flags & LED_SUSPENDED)
+		return;
+
+	led_cdev->brightness_set(led_cdev, led_cdev->brightness);
 }
=20
 static inline int led_get_brightness(struct led_classdev *led_cdev)
@@ -44,6 +34,23 @@ static inline int led_get_brightness(struct led_clas=
sdev *led_cdev)
 	return led_cdev->brightness;
 }
=20
+static inline void led_set_brightness_nosleep(struct led_classdev *led=
_cdev,
+					      enum led_brightness value)
+{
+	/*
+	 * Delegate setting brightness to a work queue task only for slow LED=
s
+	 * as the FAST ones are guaranteed not to sleep while setting
+	 * brightness.
+	 */
+	if (!(led_cdev->flags & LED_BRIGHTNESS_FAST)) {
+		led_cdev->delayed_set_value =3D value;
+		schedule_work(&led_cdev->set_brightness_work);
+		return;
+	}
+
+	__led_set_brightness(led_cdev, value);
+}
+
 void led_stop_software_blink(struct led_classdev *led_cdev);
=20
 extern struct rw_semaphore leds_list_lock;
diff --git a/drivers/leds/trigger/ledtrig-backlight.c b/drivers/leds/tr=
igger/ledtrig-backlight.c
index 59eca17..1ca1f16 100644
--- a/drivers/leds/trigger/ledtrig-backlight.c
+++ b/drivers/leds/trigger/ledtrig-backlight.c
@@ -51,9 +51,9 @@ static int fb_notifier_callback(struct notifier_block=
 *p,
=20
 	if ((n->old_status =3D=3D UNBLANK) ^ n->invert) {
 		n->brightness =3D led->brightness;
-		led_set_brightness_async(led, LED_OFF);
+		led_set_brightness_nosleep(led, LED_OFF);
 	} else {
-		led_set_brightness_async(led, n->brightness);
+		led_set_brightness_nosleep(led, n->brightness);
 	}
=20
 	n->old_status =3D new_status;
@@ -89,9 +89,9 @@ static ssize_t bl_trig_invert_store(struct device *de=
v,
=20
 	/* After inverting, we need to update the LED. */
 	if ((n->old_status =3D=3D BLANK) ^ n->invert)
-		led_set_brightness_async(led, LED_OFF);
+		led_set_brightness_nosleep(led, LED_OFF);
 	else
-		led_set_brightness_async(led, n->brightness);
+		led_set_brightness_nosleep(led, n->brightness);
=20
 	return num;
 }
diff --git a/drivers/leds/trigger/ledtrig-default-on.c b/drivers/leds/t=
rigger/ledtrig-default-on.c
index 6f38f88..ff455cb 100644
--- a/drivers/leds/trigger/ledtrig-default-on.c
+++ b/drivers/leds/trigger/ledtrig-default-on.c
@@ -19,7 +19,7 @@
=20
 static void defon_trig_activate(struct led_classdev *led_cdev)
 {
-	led_set_brightness_async(led_cdev, led_cdev->max_brightness);
+	led_set_brightness_nosleep(led_cdev, led_cdev->max_brightness);
 }
=20
 static struct led_trigger defon_led_trigger =3D {
diff --git a/drivers/leds/trigger/ledtrig-gpio.c b/drivers/leds/trigger=
/ledtrig-gpio.c
index 4cc7040..51288a4 100644
--- a/drivers/leds/trigger/ledtrig-gpio.c
+++ b/drivers/leds/trigger/ledtrig-gpio.c
@@ -54,12 +54,12 @@ static void gpio_trig_work(struct work_struct *work=
)
=20
 	if (tmp) {
 		if (gpio_data->desired_brightness)
-			led_set_brightness_async(gpio_data->led,
+			led_set_brightness_nosleep(gpio_data->led,
 					   gpio_data->desired_brightness);
 		else
-			led_set_brightness_async(gpio_data->led, LED_FULL);
+			led_set_brightness_nosleep(gpio_data->led, LED_FULL);
 	} else {
-		led_set_brightness_async(gpio_data->led, LED_OFF);
+		led_set_brightness_nosleep(gpio_data->led, LED_OFF);
 	}
 }
=20
diff --git a/drivers/leds/trigger/ledtrig-heartbeat.c b/drivers/leds/tr=
igger/ledtrig-heartbeat.c
index fea6871..44c9f23 100644
--- a/drivers/leds/trigger/ledtrig-heartbeat.c
+++ b/drivers/leds/trigger/ledtrig-heartbeat.c
@@ -74,7 +74,7 @@ static void led_heartbeat_function(unsigned long data=
)
 		break;
 	}
=20
-	led_set_brightness_async(led_cdev, brightness);
+	led_set_brightness_nosleep(led_cdev, brightness);
 	mod_timer(&heartbeat_data->timer, jiffies + delay);
 }
=20
diff --git a/drivers/leds/trigger/ledtrig-oneshot.c b/drivers/leds/trig=
ger/ledtrig-oneshot.c
index fbd02cd..6729317 100644
--- a/drivers/leds/trigger/ledtrig-oneshot.c
+++ b/drivers/leds/trigger/ledtrig-oneshot.c
@@ -63,9 +63,9 @@ static ssize_t led_invert_store(struct device *dev,
 	oneshot_data->invert =3D !!state;
=20
 	if (oneshot_data->invert)
-		led_set_brightness_async(led_cdev, LED_FULL);
+		led_set_brightness_nosleep(led_cdev, LED_FULL);
 	else
-		led_set_brightness_async(led_cdev, LED_OFF);
+		led_set_brightness_nosleep(led_cdev, LED_OFF);
=20
 	return size;
 }
diff --git a/drivers/leds/trigger/ledtrig-transient.c b/drivers/leds/tr=
igger/ledtrig-transient.c
index 3c34de4..1dddd8f 100644
--- a/drivers/leds/trigger/ledtrig-transient.c
+++ b/drivers/leds/trigger/ledtrig-transient.c
@@ -41,7 +41,7 @@ static void transient_timer_function(unsigned long da=
ta)
 	struct transient_trig_data *transient_data =3D led_cdev->trigger_data=
;
=20
 	transient_data->activate =3D 0;
-	led_set_brightness_async(led_cdev, transient_data->restore_state);
+	led_set_brightness_nosleep(led_cdev, transient_data->restore_state);
 }
=20
 static ssize_t transient_activate_show(struct device *dev,
@@ -72,7 +72,7 @@ static ssize_t transient_activate_store(struct device=
 *dev,
 	if (state =3D=3D 0 && transient_data->activate =3D=3D 1) {
 		del_timer(&transient_data->timer);
 		transient_data->activate =3D state;
-		led_set_brightness_async(led_cdev,
+		led_set_brightness_nosleep(led_cdev,
 					transient_data->restore_state);
 		return size;
 	}
@@ -81,7 +81,7 @@ static ssize_t transient_activate_store(struct device=
 *dev,
 	if (state =3D=3D 1 && transient_data->activate =3D=3D 0 &&
 	    transient_data->duration !=3D 0) {
 		transient_data->activate =3D state;
-		led_set_brightness_async(led_cdev, transient_data->state);
+		led_set_brightness_nosleep(led_cdev, transient_data->state);
 		transient_data->restore_state =3D
 		    (transient_data->state =3D=3D LED_FULL) ? LED_OFF : LED_FULL;
 		mod_timer(&transient_data->timer,
@@ -204,7 +204,7 @@ static void transient_trig_deactivate(struct led_cl=
assdev *led_cdev)
=20
 	if (led_cdev->activated) {
 		del_timer_sync(&transient_data->timer);
-		led_set_brightness_async(led_cdev,
+		led_set_brightness_nosleep(led_cdev,
 					transient_data->restore_state);
 		device_remove_file(led_cdev->dev, &dev_attr_activate);
 		device_remove_file(led_cdev->dev, &dev_attr_duration);
diff --git a/include/linux/leds.h b/include/linux/leds.h
index b122eea..ea99de9 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -48,17 +48,13 @@ struct led_classdev {
 #define SET_BRIGHTNESS_ASYNC	(1 << 21)
 #define SET_BRIGHTNESS_SYNC	(1 << 22)
 #define LED_DEV_CAP_FLASH	(1 << 23)
+#define LED_BRIGHTNESS_FAST	(1 << 24)
+#define LED_BLINK_DISABLE	(1 << 25)
=20
 	/* Set LED brightness level */
 	/* Must not sleep, use a workqueue if needed */
 	void		(*brightness_set)(struct led_classdev *led_cdev,
 					  enum led_brightness brightness);
-	/*
-	 * Set LED brightness level immediately - it can block the caller for
-	 * the time required for accessing a LED device register.
-	 */
-	int		(*brightness_set_sync)(struct led_classdev *led_cdev,
-					enum led_brightness brightness);
 	/* Get LED brightness level */
 	enum led_brightness (*brightness_get)(struct led_classdev *led_cdev);
=20
@@ -87,6 +83,7 @@ struct led_classdev {
=20
 	struct work_struct	set_brightness_work;
 	int			delayed_set_value;
+	int			new_brightness_value;
=20
 #ifdef CONFIG_LEDS_TRIGGERS
 	/* Protects the trigger data below */
--=20
1.7.9.5

From: Pavel Machek <pavel@ucw.cz>
Subject: Re: RGB support prototype
Date: Wed, 30 Aug 2017 16:51:21 +0200
Message-ID: <20170830145121.GA22595@amd>
References: <20170812224818.GA5960@amd>
 <87ddf9f2-40b8-fd3a-f106-35b202697391@gmail.com>
 <20170813114100.GA6321@xo-6d-61-c0.localdomain>
 <d295d76a-3a51-cb94-d452-8f68d3d65a67@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d295d76a-3a51-cb94-d452-8f68d3d65a67@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, hkallweit1@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > We could even export (read-only) hue/saturation for single-color LEDs...
>=20
> Related patches from Heiner Kallweit are still sitting on devel branch
> of linux-leds.git:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.g=
it/log/?h=3Ddevel
>=20
> Possibly it can serve as a basis for further development.

> I liked that approach because it was compatible with monochrome
> LEDs and triggers.

Yeah, I like that. I don't like the implementation and the sysfs
interface.

Let me try and see if I can turn them into something better...

I'm using full 32-bits for parameters; that should give us enough
precision. In particular, 32-bits is important for "brightness"; I
already have light that goes from .1lm to 1000lm -- which is more than
8-bits can handle.

lp5523 conversion... is a very quick hack.

Signed-off-by: Pavel Machek <pavel@ucw.cz>


									Pavel

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 594b24d..bad8a6e 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -19,6 +19,14 @@ config LEDS_CLASS
 	  This option enables the led sysfs class in /sys/class/leds.  You'll
 	  need this to do anything useful with LEDs.  If unsure, say N.
=20
+config LEDS_CLASS_RGB
+	bool "LED RGB Class Support"
+	depends on LEDS_CLASS
+	help
+	  This option enables support for RGB LED devices.
+	  Sysfs attribute brightness is interpreted as a HSV color value.
+	  For details see Documentation/leds/leds-class.txt.
+
 config LEDS_CLASS_FLASH
 	tristate "LED Flash Class Support"
 	depends on LEDS_CLASS
@@ -38,6 +46,10 @@ config LEDS_BRIGHTNESS_HW_CHANGED
=20
 	  See Documentation/ABI/testing/sysfs-class-led for details.
=20
+if LEDS_CLASS_RGB
+comment "RGB LED drivers"
+endif # LEDS_CLASS_RGB
+
 comment "LED drivers"
=20
 config LEDS_88PM860X
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 909dae6..d5b5e76 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -1,6 +1,8 @@
=20
 # LED Core
-obj-$(CONFIG_NEW_LEDS)			+=3D led-core.o
+obj-$(CONFIG_NEW_LEDS)			+=3D led-core-objs.o
+led-core-objs-y				:=3D led-core.o
+led-core-objs-$(CONFIG_LEDS_CLASS_RGB)	+=3D led-rgb-core.o
 obj-$(CONFIG_LEDS_CLASS)		+=3D led-class.o
 obj-$(CONFIG_LEDS_CLASS_FLASH)		+=3D led-class-flash.o
 obj-$(CONFIG_LEDS_TRIGGERS)		+=3D led-triggers.o
diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index b0e2d55..0bd68a4 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -65,6 +65,83 @@ static ssize_t brightness_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(brightness);
=20
+static ssize_t saturation_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
+
+	/* no lock needed for this */
+	led_update_brightness(led_cdev);
+
+	return sprintf(buf, "%u\n", led_cdev->saturation);
+}
+
+static ssize_t saturation_store(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t size)
+{
+	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
+	unsigned long state;
+	ssize_t ret;
+
+	mutex_lock(&led_cdev->led_access);
+
+	if (led_sysfs_is_disabled(led_cdev)) {
+		ret =3D -EBUSY;
+		goto unlock;
+	}
+
+	ret =3D kstrtoul(buf, 10, &state);
+	if (ret)
+		goto unlock;
+
+	led_cdev->saturation =3D state;
+
+	ret =3D size;
+unlock:
+	mutex_unlock(&led_cdev->led_access);
+	return ret;
+}
+static DEVICE_ATTR_RW(saturation);
+
+static ssize_t hue_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
+
+	/* no lock needed for this */
+	led_update_brightness(led_cdev);
+
+	return sprintf(buf, "%u\n", led_cdev->hue);
+}
+
+static ssize_t hue_store(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t size)
+{
+	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
+	unsigned long state;
+	ssize_t ret;
+
+	mutex_lock(&led_cdev->led_access);
+
+	if (led_sysfs_is_disabled(led_cdev)) {
+		ret =3D -EBUSY;
+		goto unlock;
+	}
+
+	ret =3D kstrtoul(buf, 10, &state);
+	if (ret)
+		goto unlock;
+
+	led_cdev->hue =3D state;
+
+	ret =3D size;
+unlock:
+	mutex_unlock(&led_cdev->led_access);
+	return ret;
+}
+static DEVICE_ATTR_RW(hue);
+
+
 static ssize_t max_brightness_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
@@ -88,6 +165,8 @@ static const struct attribute_group led_trigger_group =
=3D {
 static struct attribute *led_class_attrs[] =3D {
 	&dev_attr_brightness.attr,
 	&dev_attr_max_brightness.attr,
+	&dev_attr_hue.attr,
+	&dev_attr_saturation.attr,
 	NULL,
 };
=20
diff --git a/drivers/leds/led-rgb-core.c b/drivers/leds/led-rgb-core.c
new file mode 100644
index 0000000..3d79ba1
--- /dev/null
+++ b/drivers/leds/led-rgb-core.c
@@ -0,0 +1,60 @@
+/*
+ * LED RGB Class Support
+ *
+ * Author: Heiner Kallweit <hkallweit1@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/leds.h>
+#include "leds.h"
+
+struct led_rgb led_hsv_to_rgb(struct led_hsv hsv)
+{
+	int h =3D hsv.hue >> 24;
+	int s =3D hsv.saturation >> 24;
+	int v =3D hsv.value >> 24;
+	int f, p, q, t, r, g, b;
+	struct led_rgb res;
+
+	if (!v) {
+		res.red =3D 0;
+		res.green =3D 0;
+		res.blue =3D 0;
+		return res;
+	}
+	if (!s) {
+		res.red =3D v << 24;
+		res.green =3D v << 24;
+		res.blue =3D v << 24;
+		return res;
+	}
+
+	f =3D DIV_ROUND_CLOSEST((h % 42) * 255, 42);
+	p =3D v - DIV_ROUND_CLOSEST(s * v, 255);
+	q =3D v - DIV_ROUND_CLOSEST(f * s * v, 255 * 255);
+	t =3D v - DIV_ROUND_CLOSEST((255 - f) * s * v, 255 * 255);
+
+	switch (h / 42) {
+	case 0:
+		r =3D v; g =3D t; b =3D p; break;
+	case 1:
+		r =3D q; g =3D v; b =3D p; break;
+	case 2:
+		r =3D p; g =3D v; b =3D t; break;
+	case 3:
+		r =3D p; g =3D q; b =3D v; break;
+	case 4:
+		r =3D t; g =3D p; b =3D v; break;
+	case 5:
+		r =3D v; g =3D p; b =3D q; break;
+	}
+
+	res.red =3D r << 24;
+	res.green =3D g << 24;
+	res.blue =3D b << 24;
+}
+EXPORT_SYMBOL_GPL(led_hsv_to_rgb);
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 924e50a..861f4df2 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -802,6 +802,26 @@ static ssize_t store_master_fader_leds(struct device *=
dev,
 	return ret;
 }
=20
+int lp5523_rgb_brightness(struct lp55xx_led *led, struct led_rgb r)
+{
+	struct lp55xx_chip *chip =3D led->chip;
+	int ret;
+
+	mutex_lock(&chip->lock);
+	r.red >>=3D 24;
+	r.green >>=3D 24;
+	r.blue >>=3D 24;=09
+	printk("RGB brightness %d %d %d\n", r.red, r.green, r.blue);
+	ret =3D lp55xx_write(chip, LP5523_REG_LED_PWM_BASE + led->chan_nr, r.red);
+	if (!ret)
+		lp55xx_write(chip, LP5523_REG_LED_PWM_BASE + led->chan_nr - 1, r.green);
+	if (!ret)
+		lp55xx_write(chip, LP5523_REG_LED_PWM_BASE + led->chan_nr - 1, r.blue);
+	mutex_unlock(&chip->lock);
+	return ret;
+
+}
+
 static int lp5523_led_brightness(struct lp55xx_led *led)
 {
 	struct lp55xx_chip *chip =3D led->chip;
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-c=
ommon.c
index 5377f22..16e65dc 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -134,6 +134,8 @@ static struct attribute *lp55xx_led_attrs[] =3D {
 };
 ATTRIBUTE_GROUPS(lp55xx_led);
=20
+extern int lp5523_rgb_brightness(struct lp55xx_led *led, struct led_rgb r);
+
 static int lp55xx_set_brightness(struct led_classdev *cdev,
 			     enum led_brightness brightness)
 {
@@ -141,6 +143,18 @@ static int lp55xx_set_brightness(struct led_classdev *=
cdev,
 	struct lp55xx_device_config *cfg =3D led->chip->cfg;
=20
 	led->brightness =3D (u8)brightness;
+
+	if (led->chan_nr =3D=3D 6) {
+		struct led_rgb r;
+		struct led_hsv hsv;
+
+		printk("RGB set request: %d %d %d\n", cdev->brightness, cdev->hue >> 24,=
 cdev->saturation >> 24);
+		hsv.value =3D brightness << 24;
+		hsv.hue =3D cdev->hue;
+		hsv.saturation =3D cdev->saturation;
+		r =3D led_hsv_to_rgb(hsv);
+		return lp5523_rgb_brightness(led, r);
+	}
 	return cfg->brightness_fn(led);
 }
=20
@@ -176,6 +190,8 @@ static int lp55xx_init_led(struct lp55xx_led *led,
 	led->cdev.brightness_set_blocking =3D lp55xx_set_brightness;
 	led->cdev.groups =3D lp55xx_led_groups;
=20
+	printk("Led %d name %s\n", chan, pdata->led_config[chan].name);
+
 	if (pdata->led_config[chan].name) {
 		led->cdev.name =3D pdata->led_config[chan].name;
 	} else {
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 64c56d4..bd0ae46 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -37,6 +37,8 @@ struct led_classdev {
 	const char		*name;
 	enum led_brightness	 brightness;
 	enum led_brightness	 max_brightness;
+	int			 hue;
+	int			 saturation;
 	int			 flags;
=20
 	/* Lower 16 bits reflect status */
@@ -49,6 +51,7 @@ struct led_classdev {
 #define LED_HW_PLUGGABLE	(1 << 19)
 #define LED_PANIC_INDICATOR	(1 << 20)
 #define LED_BRIGHT_HW_CHANGED	(1 << 21)
+#define LED_DEV_CAP_RGB		(1 << 24)
=20
 	/* set_brightness_work / blink_timer flags, atomic, private. */
 	unsigned long		work_flags;
@@ -238,6 +241,26 @@ static inline bool led_sysfs_is_disabled(struct led_cl=
assdev *led_cdev)
 	return led_cdev->flags & LED_SYSFS_DISABLE;
 }
=20
+struct led_hsv {
+	u32 hue;
+	u32 saturation;
+	u32 value;
+};
+
+struct led_rgb {
+	u32 red;
+	u32 green;
+	u32 blue;
+};
+
+/**
+ * led_hsv_to_rgb - convert a hsv color value to rgb color model
+ * @hsv: the hsv value to convert
+ *
+ * Returns: the resulting rgb value
+ */
+struct led_rgb led_hsv_to_rgb(struct led_hsv hsv);
+
 /*
  * LED Triggers
  */

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmm0OkACgkQMOfwapXb+vK4NACeP/Jh2NKriSDPSNTBONVMMqIO
Q3YAoMA+lxcL1PUQzqDaoS3H2PwVAkNI
=7WoD
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--

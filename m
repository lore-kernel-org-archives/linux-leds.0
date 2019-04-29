From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: Thinkpad ACPI led -- it keeps blinking
Date: Mon, 29 Apr 2019 14:52:22 +0200
Message-ID: <20190429125222.GA27773@amd>
References: <20190426123513.GA18172@amd> <20190426214246.GA24966@amd>
 <84fac57d-1121-a1da-fb45-16a2521bdef9@gmail.com>
 <20190427193411.GA9709@amd>
 <2578a614-beb9-1c9d-9f74-208a8a7ab64f@gmail.com>
 <20190427223207.GA3585@amd>
 <d2373c8b-5c66-c875-16c7-0c5a93470793@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2209474554128631554=="
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <d2373c8b-5c66-c875-16c7-0c5a93470793-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--===============2209474554128631554==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >This fixes one problem:

> >Signed-off-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
> >
> >diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> >index e3da7c0..d795d8f 100644
> >--- a/drivers/leds/led-core.c
> >+++ b/drivers/leds/led-core.c
> >@@ -164,8 +164,14 @@ static void led_blink_setup(struct led_classdev *le=
d_cdev,
> >  		     unsigned long *delay_on,
> >  		     unsigned long *delay_off)
> >  {
> >+	while (work_pending(&led_cdev->set_brightness_work)) {
> >+		printk("Waiting for brightness set to finish\n");
> >+		schedule();
> >+	}
>=20
> Or even better:
>=20
> flush_work(&led_cdev->set_brightness_work);

Yup, thanks for a hint.

I should have acceptable patch, soon; but no promises I catched all
similar bugs, that code is quite ... tricky.

So far I have this:

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 3c7e348..85848c5 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -57,6 +57,7 @@ static ssize_t brightness_store(struct device *dev,
 	if (state =3D=3D LED_OFF)
 		led_trigger_remove(led_cdev);
 	led_set_brightness(led_cdev, state);
+	flush_work(&led_cdev->set_brightness_work);
=20
 	ret =3D size;
 unlock:
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index e3da7c0..e9ae7f8 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -164,6 +164,11 @@ static void led_blink_setup(struct led_classdev *led_c=
dev,
 		     unsigned long *delay_on,
 		     unsigned long *delay_off)
 {
+	/*
+	 * If "set brightness to 0" is pending in workqueue, we don't
+	 * want that to be reordered after blink_set()
+	 */
+	flush_work(&led_cdev->set_brightness_work);
 	if (!test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
 	    led_cdev->blink_set &&
 	    !led_cdev->blink_set(led_cdev, delay_on, delay_off))
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 2d451b6..ddfd2dd 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -65,6 +65,7 @@ ssize_t led_trigger_store(struct device *dev, struct devi=
ce_attribute *attr,
 	up_read(&triggers_list_lock);
=20
 unlock:
+	flush_work(&led_cdev->set_brightness_work);
 	mutex_unlock(&led_cdev->led_access);
 	return ret;
 }
diff --git a/drivers/leds/trigger/ledtrig-timer.c b/drivers/leds/trigger/le=
dtrig-timer.c
index ca898c1..0b061bb5 100644
--- a/drivers/leds/trigger/ledtrig-timer.c
+++ b/drivers/leds/trigger/ledtrig-timer.c
@@ -104,6 +104,7 @@ static void pattern_init(struct led_classdev *led_cdev)
=20
 static int timer_trig_activate(struct led_classdev *led_cdev)
 {
+	printk("timer_trig_activate\n");
 	if (led_cdev->flags & LED_INIT_DEFAULT_TRIGGER) {
 		pattern_init(led_cdev);
 		/*
@@ -115,14 +116,18 @@ static int timer_trig_activate(struct led_classdev *l=
ed_cdev)
=20
 	led_blink_set(led_cdev, &led_cdev->blink_delay_on,
 		      &led_cdev->blink_delay_off);
+	printk("timer_trig_activate done\n");
=20
 	return 0;
 }
=20
 static void timer_trig_deactivate(struct led_classdev *led_cdev)
 {
+	printk("timer_trig_deactivate\n");
 	/* Stop blinking */
 	led_set_brightness(led_cdev, LED_OFF);
+
+	printk("timer_trig_deactivate done\n");
 }
=20
 static struct led_trigger timer_led_trigger =3D {
diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index 3a4402a..b3fa9c9 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -363,11 +363,11 @@ int mmc_of_parse_voltage(struct device_node *np, u32 =
*mask)
 	int num_ranges, i;
=20
 	voltage_ranges =3D of_get_property(np, "voltage-ranges", &num_ranges);
-	num_ranges =3D num_ranges / sizeof(*voltage_ranges) / 2;
 	if (!voltage_ranges) {
 		pr_debug("%pOF: voltage-ranges unspecified\n", np);
 		return 0;
 	}
+	num_ranges =3D num_ranges / sizeof(*voltage_ranges) / 2;
 	if (!num_ranges) {
 		pr_err("%pOF: voltage-ranges empty\n", np);
 		return -EINVAL;
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/th=
inkpad_acpi.c
index 57d9ae9..3580bab 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -5867,6 +5867,8 @@ static int led_set_status(const unsigned int led,
=20
 	int rc =3D 0;
=20
+	printk("LED set %d to %d\n", led, ledstatus);
+
 	switch (led_supported) {
 	case TPACPI_LED_570:
 		/* 570 */
@@ -5876,7 +5878,7 @@ static int led_set_status(const unsigned int led,
 			return -EPERM;
 		if (!acpi_evalf(led_handle, NULL, NULL, "vdd",
 				(1 << led), led_sled_arg1[ledstatus]))
-			rc =3D -EIO;
+			return -EIO;
 		break;
 	case TPACPI_LED_OLD:
 		/* 600e/x, 770e, 770x, A21e, A2xm/p, T20-22, X20 */
@@ -5900,12 +5902,14 @@ static int led_set_status(const unsigned int led,
 			return -EPERM;
 		if (!acpi_evalf(led_handle, NULL, NULL, "vdd",
 				led, led_led_arg1[ledstatus]))
-			rc =3D -EIO;
+			return -EIO;
 		break;
 	default:
-		rc =3D -ENXIO;
+		return -ENXIO;
 	}
=20
+	printk("LED set %d to %d... %d\n", led, ledstatus, rc);
+
 	if (!rc)
 		tpacpi_led_state_cache[led] =3D ledstatus;
=20
@@ -5919,6 +5923,8 @@ static int led_sysfs_set(struct led_classdev *led_cde=
v,
 			     struct tpacpi_led_classdev, led_classdev);
 	enum led_status_t new_state;
=20
+	printk("sysfs_set %d\n", brightness);
+
 	if (brightness =3D=3D LED_OFF)
 		new_state =3D TPACPI_LED_OFF;
 	else if (tpacpi_led_state_cache[data->led] !=3D TPACPI_LED_BLINK)
@@ -5935,6 +5941,8 @@ static int led_sysfs_blink_set(struct led_classdev *l=
ed_cdev,
 	struct tpacpi_led_classdev *data =3D container_of(led_cdev,
 			     struct tpacpi_led_classdev, led_classdev);
=20
+	printk("sysfs_blink_set\n");
+
 	/* Can we choose the flash rate? */
 	if (*delay_on =3D=3D 0 && *delay_off =3D=3D 0) {
 		/* yes. set them to the hardware blink rate (1 Hz) */
@@ -5943,6 +5951,7 @@ static int led_sysfs_blink_set(struct led_classdev *l=
ed_cdev,
 	} else if ((*delay_on !=3D 500) || (*delay_off !=3D 500))
 		return -EINVAL;
=20
+	printk("sysfs_blink_set: hardware can do it\n");
 	return led_set_status(data->led, TPACPI_LED_BLINK);
 }
=20

								Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzG84YACgkQMOfwapXb+vIrwACfZdATje91plL9po8urcJdlcvT
npoAoJ/MiOGZLU7YEjAsCmBuyLBJy6QZ
=wRai
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--


--===============2209474554128631554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============2209474554128631554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ibm-acpi-devel mailing list
ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel

--===============2209474554128631554==--

From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: Thinkpad ACPI led -- it keeps blinking
Date: Sun, 28 Apr 2019 00:16:55 +0200
Message-ID: <20190427221655.GA3844@amd>
References: <20190426123513.GA18172@amd> <20190426214246.GA24966@amd>
 <84fac57d-1121-a1da-fb45-16a2521bdef9@gmail.com>
 <20190427193411.GA9709@amd>
 <2578a614-beb9-1c9d-9f74-208a8a7ab64f@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2316593121854628134=="
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <2578a614-beb9-1c9d-9f74-208a8a7ab64f-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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


--===============2316593121854628134==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

It seems quite clear:

static int timer_trig_activate(struct led_classdev *led_cdev)
{
        printk("timer_trig_activate\n");
	if (led_cdev->flags & LED_INIT_DEFAULT_TRIGGER) {
=09
        led_blink_set(led_cdev, &led_cdev->blink_delay_on, &led_cdev->blink=
_delay_off);

	printk("timer_trig_activate done\n");

        return 0;
}

static void timer_trig_deactivate(struct led_classdev *led_cdev)
{
        printk("timer_trig_deactivate\n");

	/* Stop blinking */
	led_set_brightness(led_cdev, LED_OFF);

        printk("timer_trig_deactivate done\n");
}

We get timer_trig_deactivate() immediately followed by
timer_trig_activate().

set_brightness goes to workqueue because it would block. That means
that blink_set() happens before set_brightness...

								Pavel

[   16.194141] e1000e 0000:02:00.0 eth1: 10/100 speed: disabling TSO
[  145.887931] timer_trig_activate
[  145.888011] LED set 0 to 2
[  145.888879] LED set 0 to 2... 0
[  145.888893] timer_trig_activate done
[  149.977138] timer_trig_deactivate
[  149.977169] timer_trig_deactivate done
[  149.977479] timer_trig_activate
[  149.977497] LED set 0 to 2
[  149.978281] LED set 0 to 2... 0
[  149.978295] timer_trig_activate done
[  149.978415] LED set 0 to 0
[  149.979851] LED set 0 to 0... 0
[  184.839252] timer_trig_deactivate
[  184.839282] timer_trig_deactivate done
[  184.839319] timer_trig_activate
[  184.839337] LED set 0 to 2
[  184.839907] LED set 0 to 0
[  184.840369] LED set 0 to 2... 0
[  184.840383] timer_trig_activate done
[  184.843318] LED set 0 to 0... 0
root@amd:/sys/class/leds/tpacpi::power#

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index e3da7c0..ca1f69b 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -166,6 +166,7 @@ static void led_blink_setup(struct led_classdev *led_cd=
ev,
 {
 	if (!test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
 	    led_cdev->blink_set &&
+	    /* This can sleep */
 	    !led_cdev->blink_set(led_cdev, delay_on, delay_off))
 		return;
=20
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
index 57d9ae9..3ec6636 100644
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

=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzE1NcACgkQMOfwapXb+vJgFACgplv96Oc196GwivJnpG3bzLS0
gxwAoJll4FbFvNNdgzW89qNi//F99zup
=Ysda
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--


--===============2316593121854628134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============2316593121854628134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ibm-acpi-devel mailing list
ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel

--===============2316593121854628134==--

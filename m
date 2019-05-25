From: Pavel Machek <pavel@ucw.cz>
Subject: Re: Revert "leds: avoid races with workqueue"?
Date: Sat, 25 May 2019 11:37:59 +0200
Message-ID: <20190525093759.GA17767@amd>
References: <alpine.LSU.2.11.1905241540080.1674@eggly.anvils>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LSU.2.11.1905241540080.1674@eggly.anvils>
Sender: linux-kernel-owner@vger.kernel.org
To: Hugh Dickins <hughd@google.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> I'm having to revert 0db37915d912 ("leds: avoid races with workqueue")
> from my 5.2-rc testing tree, because lockdep and other debug options
> don't like it: net/mac80211/led.c arranges for led_blink_setup() to be
> called at softirq time, and flush_work() is not good for calling
> then.

This should keep X60 working (as well as it is now; X60 will still
have problems with lost events in setup like yours).

Can you test this instead of the revert?

Thanks,
								Pavel

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index aefac4d..ebaac4d 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -158,19 +159,14 @@ static void led_set_software_blink(struct led_classde=
v *led_cdev,
 	}
=20
 	set_bit(LED_BLINK_SW, &led_cdev->work_flags);
-	mod_timer(&led_cdev->blink_timer, jiffies + 1);
+	mod_timer(&led_cdev->blink_timer, jiffies + 1); /* Why oh why? Just call =
it directly? */
 }
=20
-
+/* May not block */
 static void led_blink_setup(struct led_classdev *led_cdev,
 		     unsigned long *delay_on,
 		     unsigned long *delay_off)
 {
-	/*
-	 * If "set brightness to 0" is pending in workqueue, we don't
-	 * want that to be reordered after blink_set()
-	 */
-	flush_work(&led_cdev->set_brightness_work);
 	if (!test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
 	    led_cdev->blink_set &&
 	    !led_cdev->blink_set(led_cdev, delay_on, delay_off))
diff --git a/drivers/leds/trigger/ledtrig-timer.c b/drivers/leds/trigger/le=
dtrig-timer.c
index ca898c1..427fc3c 100644
--- a/drivers/leds/trigger/ledtrig-timer.c
+++ b/drivers/leds/trigger/ledtrig-timer.c
@@ -113,6 +113,11 @@ static int timer_trig_activate(struct led_classdev *le=
d_cdev)
 		led_cdev->flags &=3D ~LED_INIT_DEFAULT_TRIGGER;
 	}
=20
+	/*
+	 * If "set brightness to 0" is pending in workqueue, we don't
+	 * want that to be reordered after blink_set()
+	 */
+	flush_work(&led_cdev->set_brightness_work);
 	led_blink_set(led_cdev, &led_cdev->blink_delay_on,
 		      &led_cdev->blink_delay_off);
=20



--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzpDPcACgkQMOfwapXb+vJBTQCdGXyvrKhaF+8tfO2Ckd9ww0th
AsAAmwXZqlXOMenyO2Hnp6+x7P7ekSsP
=nRA5
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--

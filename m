From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: Add mutex protection in brightness_show()
Date: Wed, 9 Nov 2016 21:26:26 +0100
Message-ID: <20161109202625.GA9627@amd>
References: <1478245962-15706-1-git-send-email-j.anaszewski@samsung.com>
 <CGME20161104115324epcas3p32bee0b0f57ae8d1141ded4fa1d1f2ae2@epcas3p3.samsung.com>
 <fb98c74d-137d-cffb-6d56-2f3aeed1a3d6@redhat.com>
 <9d28f3d3-1d3d-c670-a102-3e2698764fdd@samsung.com>
 <9367cc2f-5ce9-0443-bb87-66198d437061@redhat.com>
 <1189fd14-a0a6-867e-1082-e84771f29014@redhat.com>
 <32b106fa-1315-3e27-07b6-1f91ac9773c4@samsung.com>
 <20161109123751.GA3488@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161109123751.GA3488@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>
List-Id: linux-leds@vger.kernel.org


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Thanks for the analysis. Either way, this patch, with the modification
> > I mentioned in my previous message is required to assure proper
> > LED sysfs locking.
> >=20
> > Regarding the races between user and atomic context, I think that
> > it should be system root's responsibility to define LED access
> > policy. If a LED is registered for any trigger events then setting
> > brightness from user space should be made impossible. Such a hint
> > could be even added to the Documentation/leds/leds-class.txt.
>=20
> No, kernel locking may not depend on "root did not do anything
> stupid". Sorry.
>=20
> Is there problem with led_access becoming a spinlock, and
> brightness_set_blocking taking it internally while it reads the
> brightness (but not while sleeping)?=20

led_timer_function() does not seem to have any locking. IMO it needs
some, as it does not use atomic accesses.

Do we need a spinlock protecting led_classdev.flags and
delayed_set_value?

Would it be good idea to create new "blink_cancel" so brightness_set
is used just for .. brightness and not for timer manipulations?

Should we do something like this for consistency?

BTW how is locking expected to work with userland LED drivers? What if
userland LED driver accesses /sys files for its own LED? I'd really
prefer that patch not to be merged until we get locking right.

Thanks,
								Pavel

diff --git a/include/linux/leds.h b/include/linux/leds.h
index ddfcb2d..60e436d 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -88,11 +88,11 @@ struct led_classdev {
=20
 	unsigned long		 blink_delay_on, blink_delay_off;
 	struct timer_list	 blink_timer;
-	int			 blink_brightness;
+	enum led_brightness      blink_brightness;
 	void			(*flash_resume)(struct led_classdev *led_cdev);
=20
 	struct work_struct	set_brightness_work;
-	int			delayed_set_value;
+	enum led_brightness     delayed_set_value;
=20
 #ifdef CONFIG_LEDS_TRIGGERS
 	/* Protects the trigger data below */

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlgjhnEACgkQMOfwapXb+vJ0qwCdFvQmlxSiKlfYxWvvNALtfYXH
wr8An0GpJoL7II1JtzTxaBrSUyiQ+1u+
=A5QR
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--

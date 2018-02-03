From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH AUTOSEL for 4.14 065/110] led: core: Fix brightness
 setting when setting delay_off=0
Date: Sat, 3 Feb 2018 21:35:26 +0100
Message-ID: <20180203203525.GA5860@amd>
References: <20180203180015.29073-1-alexander.levin@microsoft.com>
 <20180203180015.29073-65-alexander.levin@microsoft.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180203180015.29073-65-alexander.levin@microsoft.com>
Sender: stable-owner@vger.kernel.org
To: Sasha Levin <Alexander.Levin@microsoft.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Matthieu CASTET <matthieu.castet@parrot.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>
List-Id: linux-leds@vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2018-02-03 18:00:59, Sasha Levin wrote:
> From: Matthieu CASTET <matthieu.castet@parrot.com>
>=20
> [ Upstream commit 2b83ff96f51d0b039c4561b9f95c824d7bddb85c ]
>=20
> With the current code, the following sequence won't work :
> echo timer > trigger
>=20
> echo 0 >  delay_off
> * at this point we call
> ** led_delay_off_store
> ** led_blink_set
> *** stop timer
> ** led_blink_setup
> ** led_set_software_blink
> *** if !delay_on, led off
> *** if !delay_off, set led_set_brightness_nosleep <--- LED_BLINK_SW is se=
t but timer is stop
> *** otherwise start timer/set LED_BLINK_SW flag
>=20
> echo xxx > brightness
> * led_set_brightness
> ** if LED_BLINK_SW
> *** if brightness=3D0, led off
> *** else apply brightness if next timer <--- timer is stop, and will neve=
r apply new setting
> ** otherwise set led_set_brightness_nosleep
>=20
> To fix that, when we delete the timer, we should clear LED_BLINK_SW.

Can you run the tests on the affected stable kernels? I have feeling
that the problem described might not be present there.

Thanks,
								Pavel

> Cc: linux-leds@vger.kernel.org
> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Sasha Levin <alexander.levin@microsoft.com>
> ---
>  drivers/leds/led-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index ef1360445413..af630c11c284 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -187,7 +187,7 @@ void led_blink_set(struct led_classdev *led_cdev,
>  		   unsigned long *delay_on,
>  		   unsigned long *delay_off)
>  {
> -	del_timer_sync(&led_cdev->blink_timer);
> +	led_stop_software_blink(led_cdev);
> =20
>  	clear_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags);
>  	clear_bit(LED_BLINK_ONESHOT_STOP, &led_cdev->work_flags);

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlp2HQ0ACgkQMOfwapXb+vJzcwCggkyvXV+eYBgW9uojRTJQDWXt
cRkAnjid4Uut1U7xVicfyQ6uuNNiHZSn
=x4//
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--

From: Pavel Machek <pavel@ucw.cz>
Subject: trigger named just "tx" in drivers/net/wireless/atmel/at76c50x-usb.c
Date: Sat, 1 Dec 2018 15:31:44 +0100
Message-ID: <20181201143144.GC31631@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="m51xatjYGsM+13rf"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Cc: kernel list <linux-kernel@vger.kernel.org>, kvalo@codeaurora.org, davem@davemloft.net, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--m51xatjYGsM+13rf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

While grepping something else, I came across LED trigger that is named
just "tx".

That's a bit too generic afaict?

+++ b/drivers/net/wireless/atmel/at76c50x-usb.c
@@ -520,7 +520,7 @@ static int at76_usbdfu_download(struct usb_device
*udev, u8 *buf, u32 size,
 static int tx_activity;
  static void at76_ledtrig_tx_timerfunc(struct timer_list *unused);
   static DEFINE_TIMER(ledtrig_tx_timer, at76_ledtrig_tx_timerfunc);
   -DEFINE_LED_TRIGGER(ledtrig_tx);
   +DEFINE_LED_TRIGGER(ledtrig_tx); /* Hey! "tx" is a bit too generic
   name for a trigger! */


									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--m51xatjYGsM+13rf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlwCm1AACgkQMOfwapXb+vK2YgCgiamQ7GmoHDSiQ2R65aMDNjry
L0YAnAl/Q+06PzEyg9fuIzZnj3nN0eea
=c7oF
-----END PGP SIGNATURE-----

--m51xatjYGsM+13rf--

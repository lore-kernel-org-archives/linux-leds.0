From: Pavel Machek <pavel@ucw.cz>
Subject: Re: trigger named just "tx" in
 drivers/net/wireless/atmel/at76c50x-usb.c
Date: Sun, 9 Dec 2018 21:08:44 +0100
Message-ID: <20181209200844.GA12756@amd>
References: <20181201143144.GC31631@amd>
 <87lg57f182.fsf@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87lg57f182.fsf@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>, davem@davemloft.net, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2018-12-03 10:45:01, Kalle Valo wrote:
> Pavel Machek <pavel@ucw.cz> writes:
>=20
> > While grepping something else, I came across LED trigger that is named
> > just "tx".
> >
> > That's a bit too generic afaict?
> >
> > +++ b/drivers/net/wireless/atmel/at76c50x-usb.c
> > @@ -520,7 +520,7 @@ static int at76_usbdfu_download(struct usb_device
> > *udev, u8 *buf, u32 size,
> >  static int tx_activity;
> >   static void at76_ledtrig_tx_timerfunc(struct timer_list *unused);
> >    static DEFINE_TIMER(ledtrig_tx_timer, at76_ledtrig_tx_timerfunc);
> >    -DEFINE_LED_TRIGGER(ledtrig_tx);
> >    +DEFINE_LED_TRIGGER(ledtrig_tx); /* Hey! "tx" is a bit too generic
> >    name for a trigger! */
>=20
> This is an ancient driver, my guess is that nobody uses it anymore. I
> should orphan it and maybe even remove it at some point.

Are you willing to add a fixme there? I really don't want people to
copy that example.
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlwNdkwACgkQMOfwapXb+vIFugCgruCm9/ACguL9fMeJjswzFgCt
3TcAnjJ60I+ja4xwG1FqHLvHc33BuucN
=oWTy
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--

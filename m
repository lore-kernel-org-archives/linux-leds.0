From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] led: ledtrig-transient: replace timer_list with hrtimer
Date: Mon, 24 Apr 2017 09:44:17 +0200
Message-ID: <20170424074417.GA24242@amd>
References: <20170424044254.145192-1-dtwlin@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170424044254.145192-1-dtwlin@google.com>
Sender: stable-owner@vger.kernel.org
To: David Lin <dtwlin@google.com>
Cc: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, robh@kernel.org, romlem@google.com, joelaf@google.com, stable@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2017-04-23 21:42:54, David Lin wrote:
> This patch replaces the kernel timer used by led transient trigger as an
> one-shot timer with an hrtimer. As Android is moving away from the
> obsoleted timed_output to ledtrig-transient for the vibrator HAL,
> ledtrig-transient needs to be able to handle the "duration" property to
> millisecond precision as modern haptic actuators can be driven in
> precisely one cycle (~1 ms) in order to provide a crisp and subtle
> feedback.

(Insert rant about using LED subsystem for something that is not a
LED; if we are going to these subtleties, LEDs _do_ have  different
properties than vibration motor...).

Otherwise it looks good.

Acked-by: Pavel Machek <pavel@ucw.cz>
								Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlj9rNEACgkQMOfwapXb+vI4KQCfSw32t8VAXFqTkt01pHjX7Wq+
8qkAn3ghvZWhwaD2psL1kHdl/Gl65UPN
=Zk/U
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--

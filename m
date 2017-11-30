From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH/trivial] ledtrig-activity: Grammar s/a immediate/an
 immediate/
Date: Thu, 30 Nov 2017 16:05:15 +0100
Message-ID: <20171130150515.GA21599@amd>
References: <1512049001-19669-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:42941 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750742AbdK3PFR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 30 Nov 2017 10:05:17 -0500
Content-Disposition: inline
In-Reply-To: <1512049001-19669-1-git-send-email-geert+renesas@glider.be>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jiri Kosina <trivial@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Willy Tarreau <w@1wt.eu>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2017-11-30 14:36:41, Geert Uytterhoeven wrote:
> Fixes: 7df4f9a9f0667ee6 ("leds: ledtrig-activity: Add a system activity L=
ED trigger")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

ACK.

Is it time we create scripts to pull all the english texts from
kernel, so that we can run them through spell / grammar checkers?

I guess "a [aeiou]" regexp over kernel would result in quite few hits.

								Pavel
> ---
>  drivers/leds/trigger/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
> index bb090216b4dc338d..6dac48c457d17ca5 100644
> --- a/drivers/leds/trigger/Kconfig
> +++ b/drivers/leds/trigger/Kconfig
> @@ -81,7 +81,7 @@ config LEDS_TRIGGER_ACTIVITY
>  	tristate "LED activity Trigger"
>  	depends on LEDS_TRIGGERS
>  	help
> -	  This allows LEDs to be controlled by a immediate CPU usage.
> +	  This allows LEDs to be controlled by an immediate CPU usage.
>  	  The flash frequency and duty cycle varies from faint flashes to
>  	  intense brightness depending on the instant CPU load.
>  	  If unsure, say N.

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlogHisACgkQMOfwapXb+vIw5QCfXemBaM0GqfjAldJrc8HIqSZx
NB4An3fDvdJ3Ez/CJlDb2CCFpf74QT4x
=ZrPh
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--

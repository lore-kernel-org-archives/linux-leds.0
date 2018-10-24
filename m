From: Pavel Machek <pavel@ucw.cz>
Subject: [PATCH] Fix pattern handling optimalization
Date: Wed, 24 Oct 2018 22:44:39 +0200
Message-ID: <20181024204439.GA32300@amd>
References: <9794969ab8a5a6f62d8ac54cdebcaa3caedfc6d6.1539230481.git.baolin.wang@linaro.org>
 <d90397dd-429f-4f3f-307c-b69dccc360e0@gmail.com>
 <20181024083143.GA24165@amd>
 <bdadda71-f919-b6a6-4e1c-f87ed298b6b5@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bdadda71-f919-b6a6-4e1c-f87ed298b6b5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>, rteysseyre@gmail.com, bjorn.andersson@linaro.org, broonie@kernel.org, linus.walleij@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Check for zero duration before skipping step. This fixes pattern
   =20
    echo "0 1000 10 2550 0 1000" > pattern
   =20
which should do [  .-xXx-.] but does [   Xx-.]
   =20
Signed-off-by: Pavel Machek <pavel@ucw.cz>
Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>


diff --git a/drivers/leds/trigger/ledtrig-pattern.c b/drivers/leds/trigger/=
ledtrig-pattern.c
index ce7acd1..bc5f495 100644
--- a/drivers/leds/trigger/ledtrig-pattern.c
+++ b/drivers/leds/trigger/ledtrig-pattern.c
@@ -87,9 +87,10 @@ static void pattern_trig_timer_function(struct timer_lis=
t *t)
 					   data->curr->brightness);
 			mod_timer(&data->timer,
 				  jiffies + msecs_to_jiffies(data->curr->delta_t));
-
-			/* Skip the tuple with zero duration */
-			pattern_trig_update_patterns(data);
+			if (!data->next->delta_t) {
+				/* Skip the tuple with zero duration */
+				pattern_trig_update_patterns(data);
+			}
 			/* Select next tuple */
 			pattern_trig_update_patterns(data);
 		} else {

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvQ2bcACgkQMOfwapXb+vKyowCgmQw1KOCxLLu4I87qhZA1qRqC
5SgAn1uGctB8Vfbn0/8DL1CPCrFjOLb+
=WJ0K
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--

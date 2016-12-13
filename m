From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 5/5] firmware: add DECLARE_FW_CUSTOM_FALLBACK() annotation
Date: Tue, 13 Dec 2016 20:04:29 +0100
Message-ID: <20161213190429.GC8676@amd>
References: <20161213030828.17820-1-mcgrof@kernel.org>
 <20161213030828.17820-6-mcgrof@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="oJ71EGRlYNjSvfq7"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:44920 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932964AbcLMTEc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Dec 2016 14:04:32 -0500
Content-Disposition: inline
In-Reply-To: <20161213030828.17820-6-mcgrof@kernel.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc: gregkh@linuxfoundation.org, ming.lei@canonical.com, daniel.wagner@bmw-carit.de, teg@jklm.no, mchehab@osg.samsung.com, zajec5@gmail.com, linux-kernel@vger.kernel.org, markivx@codeaurora.org, stephen.boyd@linaro.org, broonie@kernel.org, zohar@linux.vnet.ibm.com, tiwai@suse.de, johannes@sipsolutions.net, chunkeey@googlemail.com, hauke@hauke-m.de, jwboyer@fedoraproject.org, dmitry.torokhov@gmail.com, dwmw2@infradead.org, jslaby@suse.com, torvalds@linux-foundation.org, luto@amacapital.net, fengguang.wu@intel.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, Abhay_Salunke@dell.com, Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, dhowells@redhat.com, bjorn.andersson@linaro.org, arend.vanspriel@broadcom.com, kvalo@codeaurora.org, linux-leds@vger.kernel.org


--oJ71EGRlYNjSvfq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> We need to ensure that when driver developers use the custom firmware
> fallback mechanism it was not a copy and paste bug. These use cases on
> upstream drivers are rare, we only have 2 upstream users and its for
> really old drivers. Since valid uses are rare but possible enable a
> white-list for its use, and use this same white-list annotation to refer
> to the documentation covering the custom use case.

> --- a/drivers/leds/leds-lp55xx-common.c
> +++ b/drivers/leds/leds-lp55xx-common.c
> @@ -219,6 +219,7 @@ static void lp55xx_firmware_loaded(const struct firmw=
are *fw, void *context)
>  	release_firmware(chip->fw);
>  }
> =20
> +DECLARE_FW_CUSTOM_FALLBACK("Documentation/leds/leds-lp55xx.txt");
>  static int lp55xx_request_firmware(struct lp55xx_chip *chip)
>  {
>  	const char *name =3D chip->cl->name;

The driver does:

static void lp55xx_firmware_loaded(const struct firmware *fw, void
*context)
{
	struct lp55xx_chip *chip =3D context;
	        struct device *dev =3D &chip->cl->dev;
		        enum lp55xx_engine_index idx =3D
			chip->engine_idx;

        if (!fw) {
	                dev_err(dev, "firmware request failed\n");
			                goto out;
					     }
        ...
out:
        /* firmware should be released for other channel use */
	        release_firmware(chip->fw);
}


Does that match the "custom fallback" definition?


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--oJ71EGRlYNjSvfq7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlhQRj0ACgkQMOfwapXb+vIeegCgiLV8bB4jtuxqxwCgeycXSIfo
o3sAoJ8WX91yWWSKuvuaGRky1cVjAzyM
=KDWS
-----END PGP SIGNATURE-----

--oJ71EGRlYNjSvfq7--

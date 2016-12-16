From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 5/5] firmware: add DECLARE_FW_CUSTOM_FALLBACK() annotation
Date: Fri, 16 Dec 2016 10:29:20 +0100
Message-ID: <20161216092919.GA26091@amd>
References: <20161213030828.17820-1-mcgrof@kernel.org>
 <20161213030828.17820-6-mcgrof@kernel.org>
 <20161213190429.GC8676@amd>
 <20161216092241.GO13946@wotan.suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:49537 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754882AbcLPJ32 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 16 Dec 2016 04:29:28 -0500
Content-Disposition: inline
In-Reply-To: <20161216092241.GO13946@wotan.suse.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc: gregkh@linuxfoundation.org, ming.lei@canonical.com, daniel.wagner@bmw-carit.de, teg@jklm.no, mchehab@osg.samsung.com, zajec5@gmail.com, linux-kernel@vger.kernel.org, markivx@codeaurora.org, stephen.boyd@linaro.org, broonie@kernel.org, zohar@linux.vnet.ibm.com, tiwai@suse.de, johannes@sipsolutions.net, chunkeey@googlemail.com, hauke@hauke-m.de, jwboyer@fedoraproject.org, dmitry.torokhov@gmail.com, dwmw2@infradead.org, jslaby@suse.com, torvalds@linux-foundation.org, luto@amacapital.net, fengguang.wu@intel.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, Abhay_Salunke@dell.com, Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, dhowells@redhat.com, bjorn.andersson@linaro.org, arend.vanspriel@broadcom.com, kvalo@codeaurora.org, linux-leds@vger.kernel.org


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2016-12-16 10:22:41, Luis R. Rodriguez wrote:
> On Tue, Dec 13, 2016 at 08:04:29PM +0100, Pavel Machek wrote:
> > Hi!
> >=20
> > > We need to ensure that when driver developers use the custom firmware
> > > fallback mechanism it was not a copy and paste bug. These use cases on
> > > upstream drivers are rare, we only have 2 upstream users and its for
> > > really old drivers. Since valid uses are rare but possible enable a
> > > white-list for its use, and use this same white-list annotation to re=
fer
> > > to the documentation covering the custom use case.
> >=20
> > > --- a/drivers/leds/leds-lp55xx-common.c
> > > +++ b/drivers/leds/leds-lp55xx-common.c
> > > @@ -219,6 +219,7 @@ static void lp55xx_firmware_loaded(const struct f=
irmware *fw, void *context)
> > >  	release_firmware(chip->fw);
> > >  }
> > > =20
> > > +DECLARE_FW_CUSTOM_FALLBACK("Documentation/leds/leds-lp55xx.txt");
> > >  static int lp55xx_request_firmware(struct lp55xx_chip *chip)
> > >  {
> > >  	const char *name =3D chip->cl->name;
> >=20
> > The driver does:
> >=20
> > static void lp55xx_firmware_loaded(const struct firmware *fw, void
> > *context)
> > {
> > 	struct lp55xx_chip *chip =3D context;
> > 	        struct device *dev =3D &chip->cl->dev;
> > 		        enum lp55xx_engine_index idx =3D
> > 			chip->engine_idx;
> >=20
> >         if (!fw) {
> > 	                dev_err(dev, "firmware request failed\n");
> > 			                goto out;
> > 					     }
> >         ...
> > out:
> >         /* firmware should be released for other channel use */
> > 	        release_firmware(chip->fw);
> > }
> >=20
> >=20
> > Does that match the "custom fallback" definition?
>=20
> Refer to the documentation I supplied, and also to the grammar rule, in
> particular the patch "firmware: add SmPL report for custom fallback mecha=
nism",
> it captures the SmPL form for the custom fallback mechanism as:

I don't much care what the rule says. If you believe the code is
buggy, submit a patch.

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlhTs+8ACgkQMOfwapXb+vIq6QCgh3M9+KZwBbWiIgarPoZ58SRJ
Zl0An0lBuoILpdEgUTfSjTObLcKlhPeL
=RGRA
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--

From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 5/5] firmware: add DECLARE_FW_CUSTOM_FALLBACK() annotation
Date: Fri, 16 Dec 2016 11:14:05 +0100
Message-ID: <20161216101405.GA29069@amd>
References: <20161213030828.17820-1-mcgrof@kernel.org>
 <20161213030828.17820-6-mcgrof@kernel.org>
 <20161213190429.GC8676@amd>
 <20161216092241.GO13946@wotan.suse.de>
 <20161216092919.GA26091@amd>
 <20161216095906.GS13946@wotan.suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:50546 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760723AbcLPKOI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 16 Dec 2016 05:14:08 -0500
Content-Disposition: inline
In-Reply-To: <20161216095906.GS13946@wotan.suse.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc: gregkh@linuxfoundation.org, ming.lei@canonical.com, daniel.wagner@bmw-carit.de, teg@jklm.no, mchehab@osg.samsung.com, zajec5@gmail.com, linux-kernel@vger.kernel.org, markivx@codeaurora.org, stephen.boyd@linaro.org, broonie@kernel.org, zohar@linux.vnet.ibm.com, tiwai@suse.de, johannes@sipsolutions.net, chunkeey@googlemail.com, hauke@hauke-m.de, jwboyer@fedoraproject.org, dmitry.torokhov@gmail.com, dwmw2@infradead.org, jslaby@suse.com, torvalds@linux-foundation.org, luto@amacapital.net, fengguang.wu@intel.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, Abhay_Salunke@dell.com, Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, dhowells@redhat.com, bjorn.andersson@linaro.org, arend.vanspriel@broadcom.com, kvalo@codeaurora.org, linux-leds@vger.kernel.org


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2016-12-16 10:59:06, Luis R. Rodriguez wrote:
> On Fri, Dec 16, 2016 at 10:29:20AM +0100, Pavel Machek wrote:
> > On Fri 2016-12-16 10:22:41, Luis R. Rodriguez wrote:
> > > On Tue, Dec 13, 2016 at 08:04:29PM +0100, Pavel Machek wrote:
> > > > Hi!
> > > >=20
> > > > > We need to ensure that when driver developers use the custom firm=
ware
> > > > > fallback mechanism it was not a copy and paste bug. These use cas=
es on
> > > > > upstream drivers are rare, we only have 2 upstream users and its =
for
> > > > > really old drivers. Since valid uses are rare but possible enable=
 a
> > > > > white-list for its use, and use this same white-list annotation t=
o refer
> > > > > to the documentation covering the custom use case.
> > > >=20
> > > > > --- a/drivers/leds/leds-lp55xx-common.c
> > > > > +++ b/drivers/leds/leds-lp55xx-common.c
> > > > > @@ -219,6 +219,7 @@ static void lp55xx_firmware_loaded(const stru=
ct firmware *fw, void *context)
> > > > >  	release_firmware(chip->fw);
> > > > >  }
> > > > > =20
> > > > > +DECLARE_FW_CUSTOM_FALLBACK("Documentation/leds/leds-lp55xx.txt");
> > > > >  static int lp55xx_request_firmware(struct lp55xx_chip *chip)
> > > > >  {
> > > > >  	const char *name =3D chip->cl->name;
> > > >=20
> > > > The driver does:
> > > >=20
> > > > static void lp55xx_firmware_loaded(const struct firmware *fw, void
> > > > *context)
> > > > {
> > > > 	struct lp55xx_chip *chip =3D context;
> > > > 	        struct device *dev =3D &chip->cl->dev;
> > > > 		        enum lp55xx_engine_index idx =3D
> > > > 			chip->engine_idx;
> > > >=20
> > > >         if (!fw) {
> > > > 	                dev_err(dev, "firmware request failed\n");
> > > > 			                goto out;
> > > > 					     }
> > > >         ...
> > > > out:
> > > >         /* firmware should be released for other channel use */
> > > > 	        release_firmware(chip->fw);
> > > > }
> > > >=20
> > > >=20
> > > > Does that match the "custom fallback" definition?
> > >=20
> > > Refer to the documentation I supplied, and also to the grammar rule, =
in
> > > particular the patch "firmware: add SmPL report for custom fallback m=
echanism",
> > > it captures the SmPL form for the custom fallback mechanism as:
> >=20
> > I don't much care what the rule says. If you believe the code is
> > buggy, submit a patch.
>=20
> Huh? No, its an old API and valid uses are scarce. The point is to avoid =
folks
> adding yet other users by mistake by using grammar to help white-list act=
ual
> valid users.

Well, I was asking if the above snipped looks like valid use. Because
AFAICT, the "custom fallback" is just dev_err(), see above. Coccinelle
rules don't help me...
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlhTvm0ACgkQMOfwapXb+vJYPwCfQ3MfKJhTKjEcVNdHk+Xof0Ex
qmIAoJ//xQk4hLmyQS3FY+m61dGDO+IX
=W4Py
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--

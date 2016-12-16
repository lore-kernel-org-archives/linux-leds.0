From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 5/5] firmware: add DECLARE_FW_CUSTOM_FALLBACK() annotation
Date: Fri, 16 Dec 2016 12:27:00 +0100
Message-ID: <20161216112700.GB29069@amd>
References: <20161213030828.17820-1-mcgrof@kernel.org>
 <20161213030828.17820-6-mcgrof@kernel.org>
 <20161213190429.GC8676@amd>
 <20161216092241.GO13946@wotan.suse.de>
 <20161216092919.GA26091@amd>
 <20161216095906.GS13946@wotan.suse.de>
 <20161216101405.GA29069@amd>
 <20161216105648.GT13946@wotan.suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="H+4ONPRPur6+Ovig"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:52678 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755028AbcLPL10 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 16 Dec 2016 06:27:26 -0500
Content-Disposition: inline
In-Reply-To: <20161216105648.GT13946@wotan.suse.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc: gregkh@linuxfoundation.org, ming.lei@canonical.com, daniel.wagner@bmw-carit.de, teg@jklm.no, mchehab@osg.samsung.com, zajec5@gmail.com, linux-kernel@vger.kernel.org, markivx@codeaurora.org, stephen.boyd@linaro.org, broonie@kernel.org, zohar@linux.vnet.ibm.com, tiwai@suse.de, johannes@sipsolutions.net, chunkeey@googlemail.com, hauke@hauke-m.de, jwboyer@fedoraproject.org, dmitry.torokhov@gmail.com, dwmw2@infradead.org, jslaby@suse.com, torvalds@linux-foundation.org, luto@amacapital.net, fengguang.wu@intel.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, Abhay_Salunke@dell.com, Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, dhowells@redhat.com, bjorn.andersson@linaro.org, arend.vanspriel@broadcom.com, kvalo@codeaurora.org, linux-leds@vger.kernel.org


--H+4ONPRPur6+Ovig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2016-12-16 11:56:48, Luis R. Rodriguez wrote:
> On Fri, Dec 16, 2016 at 11:14:05AM +0100, Pavel Machek wrote:
> >=20
> > Well, I was asking if the above snipped looks like valid use. Because
> > AFAICT, the "custom fallback" is just dev_err(), see above. Coccinelle
> > rules don't help me...
>=20
> Its not. Its when you ask for no uevent. Only 2 drivers do this.

That was one of two you listed. If that is not valid use, perhaps it
should be removed, not annotated?
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--H+4ONPRPur6+Ovig
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlhTz4QACgkQMOfwapXb+vKW3ACgmgl8jpep7qlSSGufj5WenjY3
LpoAn1PqLGBIb5aNRWMvIwtnS+1NvChm
=ZNeV
-----END PGP SIGNATURE-----

--H+4ONPRPur6+Ovig--

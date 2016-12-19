From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 5/5] firmware: add DECLARE_FW_CUSTOM_FALLBACK() annotation
Date: Mon, 19 Dec 2016 21:08:36 +0100
Message-ID: <20161219200835.GA7135@amd>
References: <20161213190429.GC8676@amd>
 <20161216092241.GO13946@wotan.suse.de>
 <20161216092919.GA26091@amd>
 <20161216095906.GS13946@wotan.suse.de>
 <20161216101405.GA29069@amd>
 <20161216105648.GT13946@wotan.suse.de>
 <20161216112700.GB29069@amd>
 <20161216161017.GU13946@wotan.suse.de>
 <20161216161455.GV13946@wotan.suse.de>
 <7292444e-43d8-3561-2835-34b75a650107@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:40349 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752877AbcLSUIo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 19 Dec 2016 15:08:44 -0500
Content-Disposition: inline
In-Reply-To: <7292444e-43d8-3561-2835-34b75a650107@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Milo Kim <woogyom.kim@gmail.com>
Cc: "Luis R. Rodriguez" <mcgrof@kernel.org>, gregkh@linuxfoundation.org, ming.lei@canonical.com, daniel.wagner@bmw-carit.de, teg@jklm.no, mchehab@osg.samsung.com, zajec5@gmail.com, linux-kernel@vger.kernel.org, markivx@codeaurora.org, stephen.boyd@linaro.org, broonie@kernel.org, zohar@linux.vnet.ibm.com, tiwai@suse.de, johannes@sipsolutions.net, chunkeey@googlemail.com, hauke@hauke-m.de, jwboyer@fedoraproject.org, dmitry.torokhov@gmail.com, dwmw2@infradead.org, jslaby@suse.com, torvalds@linux-foundation.org, luto@amacapital.net, fengguang.wu@intel.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, Abhay_Salunke@dell.com, Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, dhowells@redhat.com, bjorn.andersson@linaro.org, arend.vanspriel@broadcom.com, kvalo@codeaur


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> On 12/17/2016 01:14 AM, Luis R. Rodriguez wrote:
> >Milo if sysfs is used can't the old userspace be mapped to use the new
> >sysfs interface through a wrapper of some sort ? What exactly would be
> >needed to ensure old userspace will not break?
>=20
> LP5521 and LP5523 have two ways to load hex code from the userspace - the
> sysfs and firmware I/F. So user program supports both interfaces. Even if
> the firmware I/F is not available, user can still run LED effect through =
the
> sysfs.
>=20
> However, LP5562 and LP8501 support only single way which is the firmware
> I/F. So user-space program for LP5562/8501 should be modified if lp55xx
> removes the interface. My idea is

Actually... it would be good to have some reasonable interface for RGB
LEDs. This way, we need separate "firmware" for each LED
controller. It would be good to have common format for LED effects.

>   Phase 1)
>   - create sysfs in LP5562 and LP8501
>   - use new sysfs inside the firmware I/F loading callback
>   - mark the firmware callback as a deprecated interface

Phase 1a)

stick WARN_ON() in the firmware callback.

>   Phase 2)
>   - remove the firmware I/F after all user program fixes the interface
>     (but the problem is how can we get to know when this is done?)
>=20
> > Why has no one cried
> > after the v4.0 custom fallback mechanism breaking ?
>=20
> Well, I don't know the reason exactly but my guess is they maybe still us=
ing
> old kernel.
>=20
> > How wide spread is this custom userspace ?
>=20
> Device manufactures in Asia & North America requested lp55xx drivers, but=
 I
> don't know how many vendors uses the firmware I/F. Some vendors embeds the
> binary code inside the driver instead of using user-program.

Nokia N900 uses lp55xx, and I have custom scripts interfacing sysfs.

Maemo uses the LEDs, too, but maemo is not open source.

So no, I don't think there's anything important that could be broken.

Best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlhYPkMACgkQMOfwapXb+vIOWwCffcz+A4M0gPsfC5fQvwWDXyPg
jP0An2xTNvtNfeMVguomyJukd7YP+Hc1
=X+eO
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--

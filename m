From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3] leds: trigger: Introduce a NETDEV trigger
Date: Fri, 8 Dec 2017 15:27:07 +0100
Message-ID: <20171208142707.GA7793@amd>
References: <1512647169-11796-1-git-send-email-ben.whitten@lairdtech.com>
 <CAOFm3uGxzg45ZGmE4GRwy=oiaNERtq7tYdG4VwgZc0xgvXG6Pg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:58637 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753331AbdLHO1K (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 8 Dec 2017 09:27:10 -0500
Content-Disposition: inline
In-Reply-To: <CAOFm3uGxzg45ZGmE4GRwy=oiaNERtq7tYdG4VwgZc0xgvXG6Pg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Philippe Ombredanne <pombredanne@nexb.com>
Cc: Ben Whitten <ben.whitten@gmail.com>, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2017-12-07 14:01:39, Philippe Ombredanne wrote:
> Ben,
>=20
> On Thu, Dec 7, 2017 at 12:46 PM, Ben Whitten <ben.whitten@gmail.com> wrot=
e:
> > From: Ben Whitten <ben.whitten@gmail.com>
> >
> > This commit introduces a NETDEV trigger for named device
> > activity. Available triggers are link, rx, and tx.
> >
> > Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
> []
> > --- /dev/null
> > +++ b/drivers/leds/trigger/ledtrig-netdev.c
> > @@ -0,0 +1,503 @@
> > +/*
> > + * LED Kernel Netdev Trigger
> > + *
> > + * Toggles the LED to reflect the link and traffic state of a named ne=
t device
> > + *
> > + * Copyright 2017 Ben Whitten <ben.whitten@gmail.com>
> > + *
> > + * Copyright 2007 Oliver Jowett <oliver@opencloud.com>
> > + *
> > + * Derived from ledtrig-timer.c which is:
> > + *  Copyright 2005-2006 Openedhand Ltd.
> > + *  Author: Richard Purdie <rpurdie@openedhand.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + */
>=20
> Have you considered using the new SPDX id instead ? See Thomas doc
> patches and Greg and Linus comments on the topic
> Here this would likely come out this way (yes, using a C++ comment at the=
 top):
>=20
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * LED Kernel Netdev Trigger
> > + *
> > + * Toggles the LED to reflect the link and traffic state of a named ne=
t device
> > + *
> > + * Copyright 2017 Ben Whitten <ben.whitten@gmail.com>
> > + *
> > + * Copyright 2007 Oliver Jowett <oliver@opencloud.com>
> > + *
> > + * Derived from ledtrig-timer.c which is:
> > + *  Copyright 2005-2006 Openedhand Ltd.
> > + *  Author: Richard Purdie <rpurdie@openedhand.com>
> > + *
> > + */
>=20
>=20
> This is cleaner and simpler, don't you think?

Please consider putting SPDX where it logically belongs -- near the
copyright.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAloqoTsACgkQMOfwapXb+vIGJQCdFqJUsVmUm48TJMeYFP7er5Os
E2wAoI4gJ31HCLSAikJZB4gtU4Yd2+H5
=8uzm
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--

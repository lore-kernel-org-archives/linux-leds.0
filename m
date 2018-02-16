From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v9 2/2] leds: add driver for support Mellanox regmap LEDs
 for BMC and x86 platform
Date: Fri, 16 Feb 2018 23:25:58 +0100
Message-ID: <20180216222558.GA5265@amd>
References: <1518737870-73290-1-git-send-email-vadimp@mellanox.com>
 <fadb3132-9cc9-745e-2852-52b145f1a7ee@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:51104 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750727AbeBPW0B (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 16 Feb 2018 17:26:01 -0500
Content-Disposition: inline
In-Reply-To: <fadb3132-9cc9-745e-2852-52b145f1a7ee@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Vadim Pasternak <vadimp@mellanox.com>, rpurdie@rpsys.net, linux-leds@vger.kernel.org, jiri@resnulli.us


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > +++ b/drivers/leds/leds-mlxreg.c
> > @@ -0,0 +1,309 @@
> > +/*
> > + * Copyright (c) 2018 Mellanox Technologies. All rights reserved.
> > + * Copyright (c) 2018 Vadim Pasternak <vadimp@mellanox.com>
> > + *
> > + * Redistribution and use in source and binary forms, with or without
> > + * modification, are permitted provided that the following conditions =
are met:
> > + *
> > + * 1. Redistributions of source code must retain the above copyright
> > + *    notice, this list of conditions and the following disclaimer.
> > + * 2. Redistributions in binary form must reproduce the above copyright
> > + *    notice, this list of conditions and the following disclaimer in =
the
> > + *    documentation and/or other materials provided with the distribut=
ion.
> > + * 3. Neither the names of the copyright holders nor the names of its
> > + *    contributors may be used to endorse or promote products derived =
=66rom
> > + *    this software without specific prior written permission.
> > + *
> > + * Alternatively, this software may be distributed under the terms of =
the
> > + * GNU General Public License ("GPL") version 2 as published by the Fr=
ee
> > + * Software Foundation.
> > + *
> > + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS=
 "AS IS"
> > + * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED T=
O, THE
> > + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR =
PURPOSE
> > + * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTO=
RS BE
> > + * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> > + * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
> > + * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUS=
INESS
> > + * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHE=
R IN
> > + * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERW=
ISE)
> > + * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED=
 OF THE
> > + * POSSIBILITY OF SUCH DAMAGE.
> > + */

You may want to switch on to spdx next time you update the driver...
										Pavel
									=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlqHWnYACgkQMOfwapXb+vI88ACfdHbKRONVhdQYMra/Dri4b6nc
iigAoL0BSIwhpskF9NkiAIGuuqMo9XYr
=IOLy
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--

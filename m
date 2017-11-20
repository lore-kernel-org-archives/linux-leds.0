From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 1/3] leds: core: Introduce generic pattern interface
Date: Tue, 21 Nov 2017 00:20:15 +0100
Message-ID: <20171120232015.GB13906@amd>
References: <20171115071345.24331-1-bjorn.andersson@linaro.org>
 <20171115071345.24331-2-bjorn.andersson@linaro.org>
 <20171115073642.GA21307@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:34341 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751159AbdKTXUR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 Nov 2017 18:20:17 -0500
Content-Disposition: inline
In-Reply-To: <20171115073642.GA21307@kroah.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Fenglin Wu <fenglinw@codeaurora.org>


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2017-11-15 08:36:42, Greg KH wrote:
> On Tue, Nov 14, 2017 at 11:13:43PM -0800, Bjorn Andersson wrote:
> > Some LED controllers have support for autonomously controlling
> > brightness over time, according to some preprogrammed pattern or
> > function.
> >=20
> > This adds a new optional operator that LED class drivers can implement
> > if they support such functionality as well as a new device attribute to
> > configure the pattern for a given LED.
> >=20
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >=20
> > Changes since v2:
> > - None
> >=20
> > Changes since v1:
> > - New patch, based on discussions following v1
> >=20
> >  Documentation/ABI/testing/sysfs-class-led |  20 ++++
> >  drivers/leds/led-class.c                  | 150 ++++++++++++++++++++++=
++++++++
> >  include/linux/leds.h                      |  21 +++++
> >  3 files changed, 191 insertions(+)
> >=20
> > diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/=
ABI/testing/sysfs-class-led
> > index 5f67f7ab277b..74a7f5b1f89b 100644
> > --- a/Documentation/ABI/testing/sysfs-class-led
> > +++ b/Documentation/ABI/testing/sysfs-class-led
> > @@ -61,3 +61,23 @@ Description:
> >  		gpio and backlight triggers. In case of the backlight trigger,
> >  		it is useful when driving a LED which is intended to indicate
> >  		a device in a standby like state.
> > +
> > +What:		/sys/class/leds/<led>/pattern
> > +Date:		July 2017
>=20
> That was many months ago :)
>=20
> > +KernelVersion:	4.14
>=20
> And that kernel version is long since released :)

Yeah, the other problem is it has some interesting format with ":|"
marking repeat, and is not really suitable for RGB LEDs...

I'd really prefer to get driver in first, and add pattern interface
later.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAloTYy8ACgkQMOfwapXb+vKL8wCfcWjEhnOYfTajF6bcNU1XGLnP
+9IAnipZ5djx8KAr64swV/T+mJttvlFZ
=2fS/
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--

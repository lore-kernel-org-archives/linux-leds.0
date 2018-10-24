From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v4 5/7] dt-bindings: ti-lmu: Modify dt bindings for the
 LM3633
Date: Wed, 24 Oct 2018 20:38:35 +0200
Message-ID: <20181024183835.GA17911@amd>
References: <20181023170623.31820-1-dmurphy@ti.com>
 <20181023170623.31820-5-dmurphy@ti.com>
 <20181024092328.GD24997@amd>
 <20181024143506.GA9327@bogus>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181024143506.GA9327@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Dan Murphy <dmurphy@ti.com>, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, lee.jones@linaro.org, tony@atomide.com
List-Id: linux-leds@vger.kernel.org


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2018-10-24 09:35:06, Rob Herring wrote:
> On Wed, Oct 24, 2018 at 11:23:28AM +0200, Pavel Machek wrote:
> > On Tue 2018-10-23 12:06:21, Dan Murphy wrote:
> > > The LM3633 is a single function LED driver. The single function LED
> > > driver needs to reside in the LED directory as a dedicated LED driver
> > > and not as a MFD device.  The device does have common brightness and =
ramp
> > > features and those can be accomodated by a TI LMU framework.
> > >=20
> > > The LM3633 dt binding needs to be moved from the ti-lmu.txt and a ded=
icated
> > > LED dt binding needs to be added.  The new LM3633 LED dt binding will=
 then
> > > reside in the Documentation/devicetree/bindings/leds directory and fo=
llow the
> > > current LED and general bindings guidelines.
> >=20
> > What?
> >=20
> > >  .../devicetree/bindings/leds/leds-lm3633.txt  | 102 ++++++++++++++++=
++
> > >  .../devicetree/bindings/mfd/ti-lmu.txt        |  48 ---------
> > >  2 files changed, 102 insertions(+), 48 deletions(-)
> > >  create mode 100644
> > >  Documentation/devicetree/bindings/leds/leds-lm3633.txt
> >=20
> > > index 920f910be4e9..573e88578d3d 100644
> > > --- a/Documentation/devicetree/bindings/mfd/ti-lmu.txt
> > > +++ b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
> > > @@ -7,7 +7,6 @@ TI LMU driver supports lighting devices below.
> > >    LM3532       Backlight
> > >    LM3631       Backlight and regulator
> > >    LM3632       Backlight and regulator
> > > -  LM3633       Backlight, LED and fault monitor
> > >    LM3695       Backlight
> >=20
> > Are you seriously proposing to take one binding and split it into 6
> > copy&pasted ones?
> >=20
> > That's not the way we do development. NAK.
> >=20
> > We don't want to have copy & pasted code. We also don't want to have
> > copy & pasted bindings. Nor changelogs, for that matter.
>=20
> I looked at the LM3633 and LM3632 datasheets. They look quite different=
=20
> to me and should be separate IMO. Just looking at different LED=20
> functions and GPIO control lines is enough to make that determination.=20
> The LM3697 looks like a subset of LM3633 at least at a schematic=20
> diagram level, so maybe those can be shared.

Well, they have blocks in common, and are currently handled by one
driver. Two .c files proposed here shared 80% code when I reviewed
previous version. Original merge documentation is:

https://groups.google.com/forum/#!msg/fa.linux.kernel/hWvxahP7INw/Y2EDZmjoA=
QAJ

TI LMU(Lighting Management Unit) driver supports lighting devices
below.
=20
 	                 Enable pin  Backlights  HWMON  LEDs   Regulators
	                 ----------  ----------  -----  ----  ------------
		  LM3532       o           o         x     x        x
		  LM3631       o           o         x     x    5 regulators
		  LM3632       o           o         x     x    3 regulators
		  LM3633       o           o         o     o        x
		  LM3695       o           o         x     x        x
		  LM3697       o           o         o     x        x


I thought I understood that table, but maybe I'm confused. Anyway,
there seemed to be "enough" to share.

> While we could litter the binding with conditions on properties=20
> depending on specific compatible strings (such as which GPIO properties=
=20
> apply to which compatible), that is going to be problematic down the=20
> line when we convert to json-schema[1].

Well, situation where different devices share common features /
function blocks is going to be somehow common. Not sure how to solve
it in json, maybe the properties can simply be marked optional?, but I
guess it will need solving somehow.

> [1] https://lkml.org/lkml/2018/10/5/883

								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvQvCsACgkQMOfwapXb+vIWkgCfdmCH9ofGZqCWcC7KtQOdCEYW
dX4AoKy5nl2RUw6R1+OBEn+0wnskrzIn
=w639
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--

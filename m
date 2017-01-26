From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v6 1/4] leds: class: Add new optional
 brightness_hw_changed attribute
Date: Thu, 26 Jan 2017 22:12:03 +0100
Message-ID: <20170126211203.GA23841@amd>
References: <20170125161130.5424-1-hdegoede@redhat.com>
 <20170125161130.5424-2-hdegoede@redhat.com>
 <2e3375d0-42fb-8123-06f9-df6877fb4264@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2e3375d0-42fb-8123-06f9-df6877fb4264@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Thanks for the patch. I have a few comments below.
>=20
> On 01/25/2017 05:11 PM, Hans de Goede wrote:
> > Some LEDs may have their brightness level changed autonomously
> > (outside of kernel control) by hardware / firmware. This commit
> > adds support for an optional brightness_hw_changed attribute to
> > signal such changes to userspace (if a driver can detect them):
> >=20
> > What:		/sys/class/leds/<led>/brightness_hw_changed
> > Date:		January 2017
> > KernelVersion:	4.11
> > Description:
> > 		Last hardware set brightness level for this LED. Some LEDs
> > 		may be changed autonomously by hardware/firmware. Only LEDs
> > 		where this happens and the driver can detect this, will
> > 		have this file.
> >=20
> > 		This file supports poll() to detect when the hardware
> > 		changes the brightness.
> >=20
> > 		Reading this file will return the last brightness level set
> > 		by the hardware, this may be different from the current
> > 		brightness.
> >=20
> > Drivers which want to support this, simply add LED_BRIGHT_HW_CHANGED to
> > their flags field and call led_classdev_notify_brightness_hw_changed()
> > with the hardware set brightness when they detect a hardware / firmware
> > triggered brightness change.
> >=20
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> > Changes in v6:
> > -New patch in v6 of this set, replacing previous trigger based API
> > ---
> >  Documentation/ABI/testing/sysfs-class-led | 16 +++++++++
> >  drivers/leds/led-class.c                  | 57 +++++++++++++++++++++++=
++++++++
> >  include/linux/leds.h                      |  8 +++++
> >  3 files changed, 81 insertions(+)
> >=20
> > diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/=
ABI/testing/sysfs-class-led
> > index 491cdee..9f6e75d 100644
> > --- a/Documentation/ABI/testing/sysfs-class-led
> > +++ b/Documentation/ABI/testing/sysfs-class-led
> > @@ -23,6 +23,22 @@ Description:
> >  		If the LED does not support different brightness levels, this
> >  		should be 1.
> > =20
> > +What:		/sys/class/leds/<led>/brightness_hw_changed
> > +Date:		January 2017
> > +KernelVersion:	4.11
> > +Description:
> > +		Last hardware set brightness level for this LED. Some LEDs
> > +		may be changed autonomously by hardware/firmware. Only LEDs
> > +		where this happens and the driver can detect this, will have
> > +		this file.
> > +
> > +		This file supports poll() to detect when the hardware changes
> > +		the brightness.
> > +
> > +		Reading this file will return the last brightness level set
> > +		by the hardware, this may be different from the current
> > +		brightness.
>=20
> Let's return -ENODATA when no such an event occurred till the moment
> of file reading.

I'd do that.

Actually, maybe we should make this undefined behaviour. "Reading this
file will return the last brightness level set by the hardware. If the
software changed the brightness in the meantime, maybe due to active
trigger, the result is undefined, and it may return error."

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAliKZiMACgkQMOfwapXb+vJ1bACgofdIdzUz6DGfbZi3HkwaVpu8
nTAAoIFBpWL7E4KYHQtCKERldGBmAOkw
=79vb
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--

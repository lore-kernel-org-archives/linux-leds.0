From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH/RFC] DT: leds: Fix 'label' property description and add
 'colour' property
Date: Mon, 4 Dec 2017 11:43:51 +0100
Message-ID: <20171204104351.GA6611@amd>
References: <1512251410-6084-1-git-send-email-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:47422 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752592AbdLDKnx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Dec 2017 05:43:53 -0500
Content-Disposition: inline
In-Reply-To: <1512251410-6084-1-git-send-email-jacek.anaszewski@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, sakari.ailus@iki.fi, dmurphy@ti.com


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Label property was imposed a uniqueness requirement, which was erroneous,
> since ePAPR defines it to "a human readable string describing a device".
>=20
> Also the binding description misleadingly suggested direct usage of label
> for LED class device name, whereas it should only define a LED function.
>=20
> Therefore an additional 'colour' property is being introduced, which toge=
ther
> with the parent DT node name used for devicename shall be used for naming=
 LED
> class device according to the patterh
> <devicename>:<colour>:<function>.


> -- label : The label for this LED. If omitted, the label is taken from th=
e node
> -	  name (excluding the unit address). It has to uniquely identify
> -	  a device, i.e. no other LED class device can be assigned the same
> -	  label.
> +- label : The label for this LED. It should describe its function. If om=
itted,
> +          the label is taken from the node name (excluding the unit addr=
ess).

So the label contains "as1235:green:capslock"? I guess it might be
nice to mention that. Or just the "capslock" part?

Also.. it would be good to start pushing for more consistency in the
labels: I have these on the thinkpad:

input5::scrolllock/   tpacpi::dock_status2/ tpacpi::unknown_led/
mmc0::/               tpacpi:green:batt/    tpacpi::unknown_led2/
phy0-led/             tpacpi:orange:batt/   tpacpi::unknown_led3/
tpacpi::bay_active/   tpacpi::power/

On embedded system, I'd like to see <devicename> to corespond
to.. device the led belongs to, as opposed to name of the chip that
drives the led. Maybe we should do 'main_camera:white:flash' instead of
'as4132:white:flash' because userspace already has information on what
chip it is (sysfs paths), but can not easily figure out to which
device the flash belongs.

> +- colour : Colour of the LED.
> =20
>  - default-state : The initial state of the LED. Valid values are "on", "=
off",
>    and "keep". If the LED is already on or off and the default-state
> -	  property is

Best regards,
								Pavel


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlolJucACgkQMOfwapXb+vJ2BgCgrohdOnAHv9XFjKtrPS2dWy8O
008AoIv78Q1uaT8AJJuMamKDGZZSwaHW
=vMXu
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--

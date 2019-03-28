From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 4/4] leds: lm3532: Introduce the lm3532 LED driver
Date: Thu, 28 Mar 2019 22:04:37 +0100
Message-ID: <20190328210437.tcojjqynggk72zo2@earth.universe>
References: <20190321142838.22985-1-dmurphy@ti.com>
 <20190321142838.22985-4-dmurphy@ti.com>
 <20190322221654.GG19425@atomide.com>
 <dc24b66c-658e-41aa-c869-42c4a7e812a8@ti.com>
 <20190325145444.GK19425@atomide.com>
 <044f67e7-e196-a5b9-728b-a7c5f283f56f@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ghrii74l7jnyggtc"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <044f67e7-e196-a5b9-728b-a7c5f283f56f@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--ghrii74l7jnyggtc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 25, 2019 at 11:01:18AM -0500, Dan Murphy wrote:
> On 3/25/19 9:54 AM, Tony Lindgren wrote:
> > * Dan Murphy <dmurphy@ti.com> [190325 12:36]:
> >> On 3/22/19 5:16 PM, Tony Lindgren wrote:
> >>> I can control the backlight brightness just fine via /sys, and
> >>> backlight shows up as the trigger in /sys/class/leds/lm3532:backlight,
> >>> but /sys/class/backlight is empty and looks like drm can't find it.
> >>>
> >>> Do I need to enable some additional driver(s) to get this to work
> >>> with the drm driver?
> >>>
> >>
> >> Can you dump or point to the defconfig?
> >=20
> > This is just with the omap2plus_defconfig as in the droid4-pending-v5.0
> > test branch below [0]. That branch has Sebastian's drm patches. The
> > branch also has the older ti-lmu patches that I reverted for testing
> > before applying your new series and enabling it in .config.
> >=20
> > The drm driver (drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c) just
> > does:
> >=20
> > backlight =3D of_parse_phandle(node, "backlight", 0);
> > ...
> >=20
> > That should still work the same, right?
>=20
> Yes it should still work the same.
> I did not change the node name.
> So the DRM driver should find the node.

This will not work, since the next line tries to get it as a
backlight device, but it's an LED device instead:

of_find_backlight_by_node(backlight);

I suppose the backlight device could be instantiated on top
of the LED device somehow.

(sorry for slow responses; I'm quite busy right now)

-- Sebastian

--ghrii74l7jnyggtc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlydNuIACgkQ2O7X88g7
+ppAog/9HDu2FtUIoAG8EpCXIUENPyp8q7H9suEpjKQ26n6wpdm1aeeAVUG/gUeT
CqqE77qq4O+k5ENxVK69W5t+8JiERfxLDRKfau53s6tVJ212uEq+8jGvFMr3DPgV
1ZGb2cAo/L7bGk01X6y6YWDduDM1C7KiVPAdp/Ui1ZJsbmyPTzxVGqchj8zt7pIS
aPVFvYOQsJ9Zx7661KBPS5+rYted2mJGhnRpLnTxJSJDtRYEq11V//FBkiap4o2p
B01rAQ0M/733SfuctnuJsyEfCEbJsq5DW0Ailp7YYTTWzfYbBsZgY95IeCOSMJZ7
Y/8EN95Whe1izlV3tCKqqf3nnQImn5MWFMZL+fGoW18uXxYGIhufwSyfBTUpAvWa
wVWI/+LFceoex6wsQU3h4MuJKqSwNA+NkLpN5WX1L/l/bgyDD6wpTMT4e/FcaXdC
AI3x7+T5QZcD2KfaJ7uLUsLZcNv4OvMvGnt9IBO465e4EKqDGnWLcjf8ziIYcf+9
gQi1VLqKtUclWXHsZLfAfOJzSXF9QD9Q0dn1iWNEzccA/QRLmg+af18urNSQ19j+
AaE5cwXQK4chIWUVWtzKbkwBS9Z3mj3G71DnVhpR9V6Wwr6z2GZjidAY6mSUhAwu
HZsslJMaTJaACoV7O/Vu4MRJ4i3m+dkGxhGXak1HHA7WBiyT0I4=
=tXzm
-----END PGP SIGNATURE-----

--ghrii74l7jnyggtc--

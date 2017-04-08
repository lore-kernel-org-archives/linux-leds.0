From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH 1/2] leds: Add driver for Qualcomm LPG
Date: Sat, 8 Apr 2017 11:33:50 +0200
Message-ID: <20170408093350.GA17007@amd>
References: <20170323203749.GB8563@amd>
 <20170329021734.afhqmfpmbcjyv7bu@rob-hp-laptop>
 <20170329190725.GN20094@minitux>
 <20170329222301.GB7977@amd>
 <20170330000955.GP20094@minitux>
 <20170330074309.GA28533@amd>
 <bf999f34-4509-6f0b-602c-f82d50a18e97@gmail.com>
 <20170403190032.GX20094@minitux>
 <20170407133223.GE4756@amd>
 <20170407203649.GD15143@minitux>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170407203649.GD15143@minitux>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2017-04-07 13:36:49, Bjorn Andersson wrote:
> On Fri 07 Apr 06:32 PDT 2017, Pavel Machek wrote:
>=20
> > > For the patterns I don't know how a trigger for this would look like,
> > > how would setting the pattern of a trigger be propagated down to the
> > > hardware?
> >=20
> > Well... I'm not sure if we _want_ to do triggers for
> > patterns. LED triggers change rather quickly (100 times a second?) so
> > doing them in kernel makes sense. Patterns take 10s of seconds, so we
> > do not need to handle them in kernel.=20
> >=20
>=20
> On any current Qualcomm based phone (using the Qualcomm PMIC to drive
> the RGB notification LED) the patterns are hard coded in DeviceTree and
> the option you have in runtime is to enable/disable the usage of the
> configured pattern and a few knobs of how to traverse the configured
> pattern.

Yes... that's easy, but I believe too limiting. Users will want to
configure their own patterns for their own events.

> When you enter e.g. a low-battery scenario you trigger the red LED to
> run its low-battery-pattern and you don't touch it until there's a
> higher prio notification (e.g. someone connects the charger).

Yes, I have something like that, too.

https://gitlab.com/tui/tui/blob/master/ofone/watchdog.py

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljorn4ACgkQMOfwapXb+vLeNQCePZEaXBPoXM2ZXlFPKDAjCY5V
Ab8AnRZhUGpFAvd4QjKrPM7/KFPbdUfY
=fwee
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

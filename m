From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/2] leds: Add driver for Qualcomm LPG
Date: Fri, 7 Apr 2017 15:32:23 +0200
Message-ID: <20170407133223.GE4756@amd>
References: <20170323055435.29197-1-bjorn.andersson@linaro.org>
 <20170323203749.GB8563@amd>
 <20170329021734.afhqmfpmbcjyv7bu@rob-hp-laptop>
 <20170329190725.GN20094@minitux>
 <20170329222301.GB7977@amd>
 <20170330000955.GP20094@minitux>
 <20170330074309.GA28533@amd>
 <bf999f34-4509-6f0b-602c-f82d50a18e97@gmail.com>
 <20170403190032.GX20094@minitux>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="T6xhMxlHU34Bk0ad"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:34165 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755455AbdDGNc0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 7 Apr 2017 09:32:26 -0400
Content-Disposition: inline
In-Reply-To: <20170403190032.GX20094@minitux>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org


--T6xhMxlHU34Bk0ad
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > In both RGB and pattern approaches we should assess
> > if it is acceptable to provide a pattern for trigger name,
> > e.g. blink-pattern-{num_intervals}.
> >=20
> > If so, then "echo transition-pattern-15" would create a directory
> > e.g. transition_intervals with files interval_0 to interval_14,
> > that could be adjusted by userspace.
>=20
> Having a RGB-trigger that proxy a accepts a userspace request of a
> brightness-tripple and sets the brightness on the individual associated
> LEDs sounds reasonable - but should probably be generalized to any
> number of LEDs.

Well..  Generalizing for any number of leds would be nice -- because
hardware can do that. OTOH, if we do that, we'll not have a place
where to do "white-adjustment".

> A slightly related matter is the question on how to use a single LED for
> multiple trigger sources, e.g. how do I get a single LED to show
> activity of two MMCs?.

We normally don't do that. We'd either have a trigger for a single
MMC, or trigger of all the MMCs..

> For the patterns I don't know how a trigger for this would look like,
> how would setting the pattern of a trigger be propagated down to the
> hardware?

Well... I'm not sure if we _want_ to do triggers for
patterns. LED triggers change rather quickly (100 times a second?) so
doing them in kernel makes sense. Patterns take 10s of seconds, so we
do not need to handle them in kernel.=20

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--T6xhMxlHU34Bk0ad
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljnlOcACgkQMOfwapXb+vJCeQCaA8Ubkvy5deDBVVyCPP1kjPiy
uHYAn0lZxGn18ENXi0Naj8B/TOsS5NyX
=nJm0
-----END PGP SIGNATURE-----

--T6xhMxlHU34Bk0ad--

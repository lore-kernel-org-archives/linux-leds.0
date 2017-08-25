From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/2] leds: gpio: Allow LED to retain state at shutdown
Date: Fri, 25 Aug 2017 09:32:39 +0200
Message-ID: <20170825073239.GB15494@amd>
References: <20170825063503.31577-1-andrew@aj.id.au>
 <20170825063503.31577-3-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5I6of5zJg18YgZEa"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:54305 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754187AbdHYHcl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Aug 2017 03:32:41 -0400
Content-Disposition: inline
In-Reply-To: <20170825063503.31577-3-andrew@aj.id.au>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-leds@vger.kernel.org, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org


--5I6of5zJg18YgZEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2017-08-25 16:05:03, Andrew Jeffery wrote:
> In some systems, such as BMCs, we want to retain the state of LEDs
> across a reboot of the BMC whilst the host remains up.

I'd spell out what BMC is...

Otherwise series looks good.

Acked-by: Pavel Machek <pavel@ucw.cz>


								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--5I6of5zJg18YgZEa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmf0pcACgkQMOfwapXb+vK2bQCdHsMlxUDUGCrKSU0qXN6A/oF8
xLwAoJdV1UxnnPeOWeGpUOStV5SM1e5d
=eGz1
-----END PGP SIGNATURE-----

--5I6of5zJg18YgZEa--

From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: pca955x: Prevent crippled LED device name
Date: Mon, 28 Aug 2017 12:12:30 +0200
Message-ID: <20170828101229.GB18012@amd>
References: <1503003364-14952-1-git-send-email-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="rJwd6BRFiFCcLxzm"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:54897 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751674AbdH1KMd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 28 Aug 2017 06:12:33 -0400
Content-Disposition: inline
In-Reply-To: <1503003364-14952-1-git-send-email-jacek.anaszewski@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org, colin.king@canonical.com, dan.carpenter@oracle.com, ncase@xes-inc.com


--rJwd6BRFiFCcLxzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2017-08-17 22:56:04, Jacek Anaszewski wrote:
> In case platform data provided empty LED name string the resulting
> LED class device name would be crippled. Use corresponding LED chip
> bit in place of "function" segment of LED class device name then to
> make the LEDs at least distinguishable.
>=20
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Reported-by: Colin King <colin.king@canonical.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Suggested-by: Nate Case <ncase@xes-inc.com>

If anyone knows driver that triggers this codepath, please speak
up... we want to fix it, too.
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--rJwd6BRFiFCcLxzm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmj7I0ACgkQMOfwapXb+vKrjQCbB/jxD5Nl4Mn4VknIDsa5piTw
frQAn1gBHaURAvLMbED6OAGNtfCZCsdc
=28bb
-----END PGP SIGNATURE-----

--rJwd6BRFiFCcLxzm--

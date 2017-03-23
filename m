From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v1 1/2] Revert "i2c: mux: pca954x: Add ACPI support for
 pca954x"
Date: Thu, 23 Mar 2017 11:04:04 +0100
Message-ID: <20170323100403.GA9307@amd>
References: <20170321191310.32957-1-andriy.shevchenko@linux.intel.com>
 <01b7c79e-c52f-8e87-59a8-2eb17a72d733@axentia.se>
 <1490187942.19767.161.camel@linux.intel.com>
 <7d5fba14-d3f1-dfaa-ac7d-5001ccf370a1@axentia.se>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:57007 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751832AbdCWKEH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Mar 2017 06:04:07 -0400
Content-Disposition: inline
In-Reply-To: <7d5fba14-d3f1-dfaa-ac7d-5001ccf370a1@axentia.se>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, Tin Huynh <tnhuynh@apm.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2017-03-23 08:45:58, Peter Rosin wrote:
> On 2017-03-22 14:05, Andy Shevchenko wrote:
> > On Wed, 2017-03-22 at 11:23 +0100, Peter Rosin wrote:
> >> On 2017-03-21 20:13, Andy Shevchenko wrote:
> >>> In ACPI world any ID should be carefully chosen and registered
> >>> officially. The commit bbf9d262a147 seems did a wrong assumption
> >>> because
> >>> PCA is the registered PNP ID for "PHILIPS BU ADD ON CARD". I'm
> >>> pretty
> >>> sure this prefix has nothing to do with the driver in question.
> >>
> >> [Cc: leds people, in case they know any details]
> >>
> >> Hmmm, a couple of questions about that "pretty sure"...
> >=20
> > I didn't neither see the *real* excerpt from DSDT nor hear anything
> > about official IDs from Phillips.
> >=20
> >> Philips and NXP are pretty much just different faces of the same coin,
> >> IIUC.
> >=20
> > Good to know.
> >=20
> > While I might be mistaken, I would like to remove a confusion until we
> > get an official confirmation either in *real* existing product on the
> > market or letter from Phillips representatives (see above).
>=20
> Right, I don't disagree with the revert at all. The IDs were
> apparently just grabbed and, as you point out, that is not the ACPI
> way.
>=20
> One more question though, the revert (patch 1/2) should probably be
> queued up for current (4.11) and sent to stable as well (4.10 is the
> only version affected), but what about patch 2/2? Is that 4.12

Sent to stable? What serious bug it fixes?
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljTnZMACgkQMOfwapXb+vIgRQCgtdtDCcsOUxgYAFSssoli92R5
CVYAnA8vusPywXEflw8djgGGgLHPNysh
=p4dD
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--

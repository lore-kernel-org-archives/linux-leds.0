From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: core: use deferred probing if default trigger
 isn't available yet
Date: Sun, 26 Feb 2017 22:00:14 +0100
Message-ID: <20170226210014.GA435@amd>
References: <39873979-0231-1605-1d37-9ee29c6a0286@gmail.com>
 <20170223210811.GC19376@amd>
 <1f9ec7ec-b1ce-48ab-b0f0-dbdbf4e7e18f@gmail.com>
 <82111085-baf8-efb9-d195-47153aa3b918@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:39918 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751299AbdBZVAy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 26 Feb 2017 16:00:54 -0500
Content-Disposition: inline
In-Reply-To: <82111085-baf8-efb9-d195-47153aa3b918@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2017-02-26 18:10:56, Jacek Anaszewski wrote:
> On 02/23/2017 10:23 PM, Heiner Kallweit wrote:
> > Am 23.02.2017 um 22:08 schrieb Pavel Machek:
> >> On Wed 2017-02-22 21:35:52, Heiner Kallweit wrote:
> >>> When registering a LED device we have the option to set a default tri=
gger.
> >>> Depending on load order of drivers this trigger may not be available =
yet.
> >>> (affected LED device in my case: a DT-configured GPIO LED)
> >>> So far if the default trigger can't be found this error is silently
> >>> ignored.
> >>>
> >>> Let's change this to return EPROBE_DEFER if the default trigger can't=
 be
> >>> found. This gives the system the chance to probe the LED device later
> >>> once the trigger is available.
> >>
> >> I see a lot of EPROBE_DEFERs on N900, and it is quite nasty, as it
> >> spams a log a lot.
> >>
> > Usually error messages are printed only if there is an error and it is =
not
> > EPROBE_DEFER. However indeed there still may be several drivers not
> > taking into account that a subsystem they depend on may return
> > EPROBE_DEFER and this should not be treated as "hard error".
> >=20
> >> Rather then re-trying LED registration few times, could we make sure
> >> leds are always registered after triggers or something like that?
> >>
> > I'm afraid if guaranteeing a particular order would be possible w/o
> > significant effort then the whole deferred probing concept wouldn't exi=
st.
> >=20
> > I could imagine that we can try reordering definitions in the DTS to
> > ensure a certain load order. But this might be somewhat fragile.
> > So using the existing concept of deferred probing seems to me to be
> > the cleaner solution.
>=20
> We could go for a solution similar to v4l2-async.c mechanism which
> allows for deferring video pipeline linking until all video pipeline
> entities are probed, but in the LED subsystem case I think it would be
> an overengineering. V4L2 media device has to wait for completion of
> probing of several v4l2 drivers, whereas here we've got to wait for
> a single driver. EPROBE_DEFER seems to fit for that ideally.

I was more thinking of ... just initialize all triggers earlier then
all LEDs?

Initcalls do have few levels we could use..
								Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlizQd4ACgkQMOfwapXb+vLe2QCfU/1fJpRLz/4QG0bEC8WQ0yuE
bKcAn3Vil6LC7KbWa57mAuQZRflaBk5O
=vohu
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--

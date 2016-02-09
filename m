From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 01/14] dell-laptop: extract SMBIOS-related code to a separate module
Date: Tue, 9 Feb 2016 20:12:07 +0100
Message-ID: <201602092012.07392@pali>
References: <1452607380-20861-1-git-send-email-kernel@kempniu.pl> <20160209083303.GN30075@pali> <20160209165106.GB1309@dvhart-mobl5.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart42802131.vFdu6qGfX9";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:37151 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754046AbcBITMM (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 9 Feb 2016 14:12:12 -0500
In-Reply-To: <20160209165106.GB1309@dvhart-mobl5.amr.corp.intel.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

--nextPart42802131.vFdu6qGfX9
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday 09 February 2016 17:51:06 Darren Hart wrote:
> On Tue, Feb 09, 2016 at 09:33:03AM +0100, Pali Roh=C3=A1r wrote:
> > On Monday 08 February 2016 13:42:10 Darren Hart wrote:
> > > Assuming the above is an accurate view, I don't see any reason to
> > > go beyond the minimal change to the existing SMBIOS code to make
> > > it a usable API. If the need arises, we can always make such
> > > optimizations and performance improvements later. This is an
> > > internal API and we can change it whenever we need to so long as
> > > we update the call sites.
> >=20
> > Problem is that now smbios code from dell-laptop.c is moved into
> > dell-smbios.c and dell-smbios.h and LED subsystem starts using
> > dell-smbios.h. In this case I'm thinking that we have something
> > like API usable by other modules/subsystem. And I'm thinking if it
> > is not better to create "correct" API now instead rewriting code
> > in LED and platform subsystem again later... As this API needs to
> > provide just 1 function, send command to Dell SMBIOS I think that
> > API is still minimal. Currently we have another two functions
> > alloc/free buffer (needed for send).
>=20
> The internal kernel API changes all the time, we are not bound to it
> beyond ensuring we update the internal users when we change it. I
> prefer not to introduce complexity until we have to.
>=20
> 	buffer =3D dell_smbios_get_buffer();
> 	buffer->input[0] =3D token->location;
> 	buffer->input[1] =3D token->value;
> 	dell_smbios_send_request(1, 0);
> 	dell_smbios_release_buffer();
>=20
> The get_buffer and release_buffer also include the locking which is
> necessary for a shared buffer. If you eliminate the shared buffer,
> then you have to have a local buffer, which adds back code to create
> the buffer, initializize it, free it if it's dynamic, etc.
>=20
> So from that sense, Micha=C5=82's API seems at least as concise as the
> alternative, and it introduces less change.

Ok. Then let's stay with it. I have not tested patches yet, but do not=20
see anything wrong. So go ahead you can add my Reviewed-by.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart42802131.vFdu6qGfX9
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAla6OgcACgkQi/DJPQPkQ1KRKACgpXI2ixn0ecb05Fb/kJTyCF7P
O+gAoMH3OuwRz7oIiBy+C8BxKn6n3NpM
=U9up
-----END PGP SIGNATURE-----

--nextPart42802131.vFdu6qGfX9--

From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 01/14] dell-laptop: extract SMBIOS-related code to a
 separate module
Date: Wed, 10 Feb 2016 15:03:50 -0800
Message-ID: <20160210230350.GA11461@dvhart-mobl5.amr.corp.intel.com>
References: <1452607380-20861-1-git-send-email-kernel@kempniu.pl>
 <20160209083303.GN30075@pali>
 <20160209165106.GB1309@dvhart-mobl5.amr.corp.intel.com>
 <201602092012.07392@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:42582 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750828AbcBJXD6 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 10 Feb 2016 18:03:58 -0500
Content-Disposition: inline
In-Reply-To: <201602092012.07392@pali>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Feb 09, 2016 at 08:12:07PM +0100, Pali Roh=C3=A1r wrote:
> On Tuesday 09 February 2016 17:51:06 Darren Hart wrote:
> > On Tue, Feb 09, 2016 at 09:33:03AM +0100, Pali Roh=C3=A1r wrote:
> > > On Monday 08 February 2016 13:42:10 Darren Hart wrote:
> > > > Assuming the above is an accurate view, I don't see any reason =
to
> > > > go beyond the minimal change to the existing SMBIOS code to mak=
e
> > > > it a usable API. If the need arises, we can always make such
> > > > optimizations and performance improvements later. This is an
> > > > internal API and we can change it whenever we need to so long a=
s
> > > > we update the call sites.
> > >=20
> > > Problem is that now smbios code from dell-laptop.c is moved into
> > > dell-smbios.c and dell-smbios.h and LED subsystem starts using
> > > dell-smbios.h. In this case I'm thinking that we have something
> > > like API usable by other modules/subsystem. And I'm thinking if i=
t
> > > is not better to create "correct" API now instead rewriting code
> > > in LED and platform subsystem again later... As this API needs to
> > > provide just 1 function, send command to Dell SMBIOS I think that
> > > API is still minimal. Currently we have another two functions
> > > alloc/free buffer (needed for send).
> >=20
> > The internal kernel API changes all the time, we are not bound to i=
t
> > beyond ensuring we update the internal users when we change it. I
> > prefer not to introduce complexity until we have to.
> >=20
> > 	buffer =3D dell_smbios_get_buffer();
> > 	buffer->input[0] =3D token->location;
> > 	buffer->input[1] =3D token->value;
> > 	dell_smbios_send_request(1, 0);
> > 	dell_smbios_release_buffer();
> >=20
> > The get_buffer and release_buffer also include the locking which is
> > necessary for a shared buffer. If you eliminate the shared buffer,
> > then you have to have a local buffer, which adds back code to creat=
e
> > the buffer, initializize it, free it if it's dynamic, etc.
> >=20
> > So from that sense, Micha=C5=82's API seems at least as concise as =
the
> > alternative, and it introduces less change.
>=20
> Ok. Then let's stay with it. I have not tested patches yet, but do no=
t=20
> see anything wrong. So go ahead you can add my Reviewed-by.

Great. Thank you Pali.

This has been queued to testing.

Thank you all for your diligence in getting this series to this point.

--=20
Darren Hart
Intel Open Source Technology Center

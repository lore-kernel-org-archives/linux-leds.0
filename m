From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 01/14] dell-laptop: extract SMBIOS-related code to a
 separate module
Date: Tue, 9 Feb 2016 08:51:06 -0800
Message-ID: <20160209165106.GB1309@dvhart-mobl5.amr.corp.intel.com>
References: <1452607380-20861-1-git-send-email-kernel@kempniu.pl>
 <1452607380-20861-2-git-send-email-kernel@kempniu.pl>
 <20160116151922.GA5060@pali>
 <20160120092107.GA3247@eudyptula.hq.kempniu.pl>
 <20160121083559.GM7192@pali>
 <20160121130603.GA4360@eudyptula.hq.kempniu.pl>
 <20160121131450.GE7192@pali>
 <20160121133921.GA4626@eudyptula.hq.kempniu.pl>
 <20160208214210.GT1779@malice.jf.intel.com>
 <20160209083303.GN30075@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57156 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755225AbcBIQvN (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 9 Feb 2016 11:51:13 -0500
Content-Disposition: inline
In-Reply-To: <20160209083303.GN30075@pali>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Feb 09, 2016 at 09:33:03AM +0100, Pali Roh=C3=A1r wrote:
> On Monday 08 February 2016 13:42:10 Darren Hart wrote:
> > Assuming the above is an accurate view, I don't see any reason to g=
o beyond the
> > minimal change to the existing SMBIOS code to make it a usable API.=
 If the need
> > arises, we can always make such optimizations and performance impro=
vements
> > later. This is an internal API and we can change it whenever we nee=
d to so long
> > as we update the call sites.
>=20
> Problem is that now smbios code from dell-laptop.c is moved into
> dell-smbios.c and dell-smbios.h and LED subsystem starts using
> dell-smbios.h. In this case I'm thinking that we have something like =
API
> usable by other modules/subsystem. And I'm thinking if it is not bett=
er
> to create "correct" API now instead rewriting code in LED and platfor=
m
> subsystem again later... As this API needs to provide just 1 function=
,
> send command to Dell SMBIOS I think that API is still minimal. Curren=
tly
> we have another two functions alloc/free buffer (needed for send).

The internal kernel API changes all the time, we are not bound to it be=
yond
ensuring we update the internal users when we change it. I prefer not t=
o
introduce complexity until we have to.

	buffer =3D dell_smbios_get_buffer();
	buffer->input[0] =3D token->location;
	buffer->input[1] =3D token->value;
	dell_smbios_send_request(1, 0);
	dell_smbios_release_buffer();

The get_buffer and release_buffer also include the locking which is nec=
essary
for a shared buffer. If you eliminate the shared buffer, then you have =
to have a
local buffer, which adds back code to create the buffer, initializize
it, free it if it's dynamic, etc.

So from that sense, Micha=C5=82's API seems at least as concise as the =
alternative,
and it introduces less change.

--=20
Darren Hart
Intel Open Source Technology Center

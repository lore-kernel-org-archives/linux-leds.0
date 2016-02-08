From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 01/14] dell-laptop: extract SMBIOS-related code to a
 separate module
Date: Mon, 8 Feb 2016 13:42:10 -0800
Message-ID: <20160208214210.GT1779@malice.jf.intel.com>
References: <1452607380-20861-1-git-send-email-kernel@kempniu.pl>
 <1452607380-20861-2-git-send-email-kernel@kempniu.pl>
 <20160116151922.GA5060@pali>
 <20160120092107.GA3247@eudyptula.hq.kempniu.pl>
 <20160121083559.GM7192@pali>
 <20160121130603.GA4360@eudyptula.hq.kempniu.pl>
 <20160121131450.GE7192@pali>
 <20160121133921.GA4626@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160121133921.GA4626@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thu, Jan 21, 2016 at 02:39:21PM +0100, Micha=C5=82 K=C4=99pie=C5=84 =
wrote:
> > Another idea:
> >=20
> > What about passing struct calling_interface_buffer from caller allo=
cated
> > memory (either from stack or kernel alloc) to dell-smbios which wil=
l
> > copy it into own buffer under 4GB and then pass it to dcdbas?
> >=20
> > This will avoid to use that get/release function and there will be =
only
> > one send_request.
>=20
> Well, yes, these two functions could then be ripped out, but the call=
ers
> would have to do the error checking on their own.  Of course that's n=
ot
> a bad thing per se, but it changes the currently used concept.
>=20
> > But I will let decision for API to other people as I do not know wh=
at
> > the best API to use here...
>=20
> In order to avoid delaying this any further, I'll post a v2 soon and
> hopefully it'll be good enough for your Acked-by.  If it turns out mo=
re
> people have misgivings about it, I'll adjust the code.
>=20

It seems to me the question is primarily over whether or not the interf=
ace
protects a shared resource (a common buffer) or if that buffer should b=
e
independent for every caller.

I favor minimal and incremental change and avoiding complexity where it=
 is not
needed. I don't believe there is anything performance critical in any o=
f these
paths, e.g. nothing requires a better response time than about 100ms an=
d nothing
is likely to occur at a frequency above 10Hz or so.

Assuming the above is an accurate view, I don't see any reason to go be=
yond the
minimal change to the existing SMBIOS code to make it a usable API. If =
the need
arises, we can always make such optimizations and performance improveme=
nts
later. This is an internal API and we can change it whenever we need to=
 so long
as we update the call sites.

Does anyone have a compelling reason to look for changes to the v2 subm=
itted by
Micha=C5=82?

--=20
Darren Hart
Intel Open Source Technology Center

From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 01/14] dell-laptop: extract SMBIOS-related code to a
 separate module
Date: Tue, 9 Feb 2016 14:58:46 +0100
Message-ID: <20160209135846.GB7443@eudyptula.hq.kempniu.pl>
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
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160209083303.GN30075@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

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

Pali, forgive me, but I fail to understand your last two sentences.
Currently, we don't have functions for allocating/freeing the SMBIOS
buffer as it is allocated in dell_init() (or dell_smbios_init() after
applying this patch series) and freed in dell_(smbios_)exit().

In your previous messages [1][2], you suggested that we could allocate =
a
separate SMBIOS buffer for each caller or copy input parameters from
caller-allocated memory into a module-wide SMBIOS buffer before
performing the SMBIOS request.  Did you just mean to remind Darren of
these ideas or did you have something else on your mind?  If the latter=
,
could you please try rephrasing the last two sentences of your message?

[1] http://www.spinics.net/lists/platform-driver-x86/msg08260.html
[2] http://www.spinics.net/lists/platform-driver-x86/msg08268.html

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84

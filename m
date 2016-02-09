From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 01/14] dell-laptop: extract SMBIOS-related code to a
 separate module
Date: Tue, 9 Feb 2016 09:33:03 +0100
Message-ID: <20160209083303.GN30075@pali>
References: <1452607380-20861-1-git-send-email-kernel@kempniu.pl>
 <1452607380-20861-2-git-send-email-kernel@kempniu.pl>
 <20160116151922.GA5060@pali>
 <20160120092107.GA3247@eudyptula.hq.kempniu.pl>
 <20160121083559.GM7192@pali>
 <20160121130603.GA4360@eudyptula.hq.kempniu.pl>
 <20160121131450.GE7192@pali>
 <20160121133921.GA4626@eudyptula.hq.kempniu.pl>
 <20160208214210.GT1779@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160208214210.GT1779@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Monday 08 February 2016 13:42:10 Darren Hart wrote:
> Assuming the above is an accurate view, I don't see any reason to go =
beyond the
> minimal change to the existing SMBIOS code to make it a usable API. I=
f the need
> arises, we can always make such optimizations and performance improve=
ments
> later. This is an internal API and we can change it whenever we need =
to so long
> as we update the call sites.

Problem is that now smbios code from dell-laptop.c is moved into
dell-smbios.c and dell-smbios.h and LED subsystem starts using
dell-smbios.h. In this case I'm thinking that we have something like AP=
I
usable by other modules/subsystem. And I'm thinking if it is not better
to create "correct" API now instead rewriting code in LED and platform
subsystem again later... As this API needs to provide just 1 function,
send command to Dell SMBIOS I think that API is still minimal. Currentl=
y
we have another two functions alloc/free buffer (needed for send).

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

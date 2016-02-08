From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 00/16] Common Dell SMBIOS API
Date: Mon, 8 Feb 2016 11:20:14 -0800
Message-ID: <20160208192014.GN1779@malice.jf.intel.com>
References: <1453472848-3118-1-git-send-email-kernel@kempniu.pl>
 <20160122144851.GN7192@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160122144851.GN7192@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Fri, Jan 22, 2016 at 03:48:51PM +0100, Pali Roh=C3=A1r wrote:
> On Friday 22 January 2016 15:27:12 Micha=C5=82 K=C4=99pie=C5=84 wrote=
:
> > Note:
> >=20
> >     In this series (both v1 and v2) I tried to stick to the overall
> >     concept used in dell-laptop, but in the v1 thread me and Pali a=
lso
> >     briefly discussed his alternative ideas [1][2] as to what this =
API
> >     could look like, so feel free to suggest a different approach.
> >=20
> > [1] http://www.spinics.net/lists/platform-driver-x86/msg08260.html
> > [2] http://www.spinics.net/lists/platform-driver-x86/msg08268.html
>=20
> I would like to hear opinion about dell-smbios API also from other
> people. Darren, can you look and comment it?

This is an excellently prepared series, nice work Micha=C5=82.

Most of my concerns were addressed by later patches in the series. I ha=
ve pushed
a version of this 1/7 fixed per lkp (linux/io.h) and 7/16 with a correc=
ted body
as I sent in reply to that patch. This is on my tree as the dell-smbios=
 branch.

My only major concern is module load order dependencies. Inter-module
dependencies are frowned upon with good reason, the kernel load orderin=
g is
non-deterministic and it's possible, for example, for dell-laptop to fa=
il to
find the symbols exported by dell-smbios under certain conditions.

I have worked around this in the past with things like the following:

#ifdef MODULE
#ifdef CONFIG_FOO_MODULE
	if (request_module("foo"))
		return -ENODEV;
#endif
#endif

Something like the above may be necessary for dell-smbios in dell-lapto=
p,
dell-wmi, and dell-leds now that they depend on the dell-smbios exporte=
d
functions.

Cc Greg in case there is a better way to handle this that I'm not aware=
 of.

--=20
Darren Hart
Intel Open Source Technology Center

From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 00/16] Common Dell SMBIOS API
Date: Mon, 8 Feb 2016 12:46:46 -0800
Message-ID: <20160208204646.GQ1779@malice.jf.intel.com>
References: <1453472848-3118-1-git-send-email-kernel@kempniu.pl>
 <20160122144851.GN7192@pali>
 <20160208192014.GN1779@malice.jf.intel.com>
 <20160208192920.GA10110@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160208192920.GA10110@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Mon, Feb 08, 2016 at 11:29:20AM -0800, Greg Kroah-Hartman wrote:
> On Mon, Feb 08, 2016 at 11:20:14AM -0800, Darren Hart wrote:
> > On Fri, Jan 22, 2016 at 03:48:51PM +0100, Pali Roh=C3=A1r wrote:
> > > On Friday 22 January 2016 15:27:12 Micha=C5=82 K=C4=99pie=C5=84 w=
rote:
> > > > Note:
> > > >=20
> > > >     In this series (both v1 and v2) I tried to stick to the ove=
rall
> > > >     concept used in dell-laptop, but in the v1 thread me and Pa=
li also
> > > >     briefly discussed his alternative ideas [1][2] as to what t=
his API
> > > >     could look like, so feel free to suggest a different approa=
ch.
> > > >=20
> > > > [1] http://www.spinics.net/lists/platform-driver-x86/msg08260.h=
tml
> > > > [2] http://www.spinics.net/lists/platform-driver-x86/msg08268.h=
tml
> > >=20
> > > I would like to hear opinion about dell-smbios API also from othe=
r
> > > people. Darren, can you look and comment it?
> >=20
> > This is an excellently prepared series, nice work Micha=C5=82.
> >=20
> > Most of my concerns were addressed by later patches in the series. =
I have pushed
> > a version of this 1/7 fixed per lkp (linux/io.h) and 7/16 with a co=
rrected body
> > as I sent in reply to that patch. This is on my tree as the dell-sm=
bios branch.
> >=20
> > My only major concern is module load order dependencies. Inter-modu=
le
> > dependencies are frowned upon with good reason, the kernel load ord=
ering is
> > non-deterministic and it's possible, for example, for dell-laptop t=
o fail to
> > find the symbols exported by dell-smbios under certain conditions.
> >=20
> > I have worked around this in the past with things like the followin=
g:
> >=20
> > #ifdef MODULE
> > #ifdef CONFIG_FOO_MODULE
> > 	if (request_module("foo"))
> > 		return -ENODEV;
> > #endif
> > #endif
> >=20
> > Something like the above may be necessary for dell-smbios in dell-l=
aptop,
> > dell-wmi, and dell-leds now that they depend on the dell-smbios exp=
orted
> > functions.
> >=20
> > Cc Greg in case there is a better way to handle this that I'm not a=
ware of.
>=20
> No need to request_module anything, the symbol resolution should pull
> the dependant module in automagically when you do a 'modprobe',
> otherwise the symbols would never be found.

OK, Thank you Greg. Based on this, I have no concerns that haven't been=
 addressed in the
pdx86/dell-smbios branch.

Micha=C5=82, did you have any changes you wanted to make?

Pali, are you happy enough with this to add your reviewed-by?

I'm satisfied with the series and can push to next tomorrow if we're al=
l in
agreement.

--=20
Darren Hart
Intel Open Source Technology Center

From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2 00/16] Common Dell SMBIOS API
Date: Tue, 9 Feb 2016 15:15:49 +0100
Message-ID: <20160209141549.GA7965@eudyptula.hq.kempniu.pl>
References: <1453472848-3118-1-git-send-email-kernel@kempniu.pl>
 <20160122144851.GN7192@pali>
 <20160208192014.GN1779@malice.jf.intel.com>
 <20160208192920.GA10110@kroah.com>
 <20160208204646.GQ1779@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:36348 "EHLO
	mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757222AbcBIOPz (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 9 Feb 2016 09:15:55 -0500
Received: by mail-lf0-f67.google.com with SMTP id h198so6426143lfh.3
        for <linux-leds@vger.kernel.org>; Tue, 09 Feb 2016 06:15:54 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20160208204646.GQ1779@malice.jf.intel.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

> > > Most of my concerns were addressed by later patches in the series=
=2E I have pushed
> > > a version of this 1/7 fixed per lkp (linux/io.h) and 7/16 with a =
corrected body
> > > as I sent in reply to that patch. This is on my tree as the dell-=
smbios branch.

Thanks!

> > >=20
> > > My only major concern is module load order dependencies. Inter-mo=
dule
> > > dependencies are frowned upon with good reason, the kernel load o=
rdering is
> > > non-deterministic and it's possible, for example, for dell-laptop=
 to fail to
> > > find the symbols exported by dell-smbios under certain conditions=
=2E
> > >=20
> > > I have worked around this in the past with things like the follow=
ing:
> > >=20
> > > #ifdef MODULE
> > > #ifdef CONFIG_FOO_MODULE
> > > 	if (request_module("foo"))
> > > 		return -ENODEV;
> > > #endif
> > > #endif
> > >=20
> > > Something like the above may be necessary for dell-smbios in dell=
-laptop,
> > > dell-wmi, and dell-leds now that they depend on the dell-smbios e=
xported
> > > functions.
> > >=20
> > > Cc Greg in case there is a better way to handle this that I'm not=
 aware of.
> >=20
> > No need to request_module anything, the symbol resolution should pu=
ll
> > the dependant module in automagically when you do a 'modprobe',
> > otherwise the symbols would never be found.
>=20
> OK, Thank you Greg. Based on this, I have no concerns that haven't be=
en addressed in the
> pdx86/dell-smbios branch.
>=20
> Micha=C5=82, did you have any changes you wanted to make?

No, thanks, nothing new popped up.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84

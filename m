From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 00/16] Common Dell SMBIOS API
Date: Mon, 8 Feb 2016 13:31:22 -0800
Message-ID: <20160208213122.GS1779@malice.jf.intel.com>
References: <1453472848-3118-1-git-send-email-kernel@kempniu.pl>
 <20160208192920.GA10110@kroah.com>
 <20160208204646.GQ1779@malice.jf.intel.com>
 <201602082204.32958@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201602082204.32958@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Mon, Feb 08, 2016 at 10:04:32PM +0100, Pali Roh=E1r wrote:
> On Monday 08 February 2016 21:46:46 Darren Hart wrote:
> > Pali, are you happy enough with this to add your reviewed-by?
>=20
> There was dicussion about dell-smbios API which you probably missed i=
n
> tons of other emails. It has subject:
>=20
> "[PATCH 01/14] dell-laptop: extract SMBIOS-related code to a separate=
 module"
>=20
> And you can find it in archive at:
> http://www.spinics.net/lists/linux-leds/msg05379.html
>=20
> I wanted to hear your opinion about this API and I'm not 100% fine wi=
th
> it but on other side it is not easy to design better... Maybe you cou=
ld
> have better idea.

I will review the above. However, a new API can be treated as separate =
from
the refactoring which is all this series really does. It doesn't do any=
thing
that I saw beyond moving existing code into a separate module and wrapp=
ing the
use of the buffer and tokens. In that sense, it seems to me that this c=
an be
considered a first step toward a redesigned API by first removing dupli=
cate code
and reusing some of the existing code.

--=20
Darren Hart
Intel Open Source Technology Center

From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 00/14] Common Dell SMBIOS API
Date: Thu, 14 Jan 2016 14:43:31 -0800
Message-ID: <20160114224331.GE1989@malice.jf.intel.com>
References: <1452607380-20861-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:38683 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754116AbcANWni (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 14 Jan 2016 17:43:38 -0500
Content-Disposition: inline
In-Reply-To: <1452607380-20861-1-git-send-email-kernel@kempniu.pl>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jan 12, 2016 at 03:02:46PM +0100, Micha=C5=82 K=C4=99pie=C5=84 =
wrote:
> The Linux kernel tree currently contains two Dell laptop-related driv=
ers
> issuing SMBIOS requests in different ways (dell-laptop in
> drivers/platform/x86 and dell-led in drivers/led).  As an upcoming pa=
tch
> series for the dell-wmi driver (also in drivers/platform/x86) will
> change it so that it also performs SMBIOS requests, I took the
> opportunity to unify the API used for issuing Dell SMBIOS requests
> throughout the kernel before any further code duplication happens.
> Credit for suggesting this goes to Pali Roh=C3=A1r.
>=20
> This patch series is primarily intended for the platform-x86 subsyste=
m,
> with only 2 final patches touching the LED subsystem.  I decided to s=
end
> the whole series to everyone involved to provide context - my apologi=
es
> if this is frowned upon.

I much prefer it, thank you.

>=20
> As for making dell-led dependent on a driver in drivers/platform/x86,
> let me just hint that Pali and I think it could be possible to
> eventually move all of dell-led's code to drivers/platform/x86.  But
> first things first.
>=20
> The first patch generates a lot of checkpatch warnings, but these are
> also raised for the original code and I decided that not changing the
> code while moving around large quantities of it is critical for
> reviewability.

Noted, thanks.

>=20
> Alex, as I don't have the hardware to test the changes in dell-led
> (beyond compilation) and you contributed the parts of it which this
> patch series changes, is there any way you might test it on relevant
> hardware?

OK, before I dive into a review on this, I'm going to be looking for an=
 ack from
Pali and some Tested-by from the usual suspects. We're already into the=
 merge
window and this series needs to spend some time in next. We'll plan on =
getting
this into next after the merge window closes and have it land in 4.6. H=
opefully
that will allow us to work through Andy's wmi rearchitecting at the sam=
e time
and catch any incompatibilities without introducing undue churn to main=
line.

>=20
>  drivers/leds/Kconfig               |    1 +
>  drivers/leds/dell-led.c            |  125 ++--------
>  drivers/platform/x86/Kconfig       |   12 +-
>  drivers/platform/x86/Makefile      |    1 +
>  drivers/platform/x86/dell-laptop.c |  444 ++++++++++++--------------=
----------
>  drivers/platform/x86/dell-smbios.c |  179 +++++++++++++++
>  drivers/platform/x86/dell-smbios.h |   48 ++++
>  7 files changed, 395 insertions(+), 415 deletions(-)

My favorite kind of patch              ^ :-)

Thanks!

>  create mode 100644 drivers/platform/x86/dell-smbios.c
>  create mode 100644 drivers/platform/x86/dell-smbios.h
>=20
> --=20
> 1.7.10.4
>=20
>=20

--=20
Darren Hart
Intel Open Source Technology Center

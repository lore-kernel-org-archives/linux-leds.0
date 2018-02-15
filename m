From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH v7 1/2] leds: fix Kconfig text for MLXCPLD and SYSCON
Date: Thu, 15 Feb 2018 15:55:53 +0000
Message-ID: <AM4PR05MB3330009C62578134F5AE5E46A2F40@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <1518682525-101578-1-git-send-email-vadimp@mellanox.com>
 <1518682525-101578-2-git-send-email-vadimp@mellanox.com>
 <20180215064841.GA2942@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-eopbgr00069.outbound.protection.outlook.com ([40.107.0.69]:49056
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1424942AbeBOPz5 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 15 Feb 2018 10:55:57 -0500
In-Reply-To: <20180215064841.GA2942@localhost>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>



> -----Original Message-----
> From: Pavel Machek [mailto:pavel@ucw.cz]
> Sent: Thursday, February 15, 2018 8:49 AM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: jacek.anaszewski@gmail.com; rpurdie@rpsys.net; linux-
> leds@vger.kernel.org; jiri@resnulli.us
> Subject: Re: [PATCH v7 1/2] leds: fix Kconfig text for MLXCPLD and SYSCON
>=20
> On Thu 2018-02-15 08:15:24, Vadim Pasternak wrote:
> > It fixes grammatical errors in Kconfig file for LEDS_SYSCON and
> > LEDS_MLXCPLD.
> >
> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > Reported-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > ---
> >  drivers/leds/Kconfig | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig index
> > a3fdf83..ed44013 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -674,7 +674,7 @@ config LEDS_SYSCON
> >  	depends on MFD_SYSCON
> >  	depends on OF
> >  	help
> > -	  This option enabled support for the LEDs on syscon type
> > +	  This option enable support for the LEDs on syscon type
>=20
> "enables".

Sorry.

Let's fix also these two?
drivers/leds/Kconfig:     This option enable support for on-chip LED driver=
s found
drivers/leds/Kconfig:     This option enable support for LEDs found on the =
LaCie 2Big

>=20
> 								Pavel
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/b=
log.html

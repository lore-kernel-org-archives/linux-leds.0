From: "Kim, Milo" <Milo.Kim@ti.com>
Subject: RE: [PATCH 01/10] leds: lp55xx: add common data structure for
 program
Date: Sun, 18 Aug 2013 22:57:09 +0000
Message-ID: <A874F61F95741C4A9BA573A70FE3998F82E888D0@DQHE06.ent.ti.com>
References: <1375948794-6286-1-git-send-email-milo.kim@ti.com>
 <1375948794-6286-2-git-send-email-milo.kim@ti.com>
 <CAK5ve-K10M3+=ctxu+5hU=pPz1_x6p1JgQS6jEin-LfxnP8Hog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:40367 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754996Ab3HRW5Q convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 18 Aug 2013 18:57:16 -0400
In-Reply-To: <CAK5ve-K10M3+=ctxu+5hU=pPz1_x6p1JgQS6jEin-LfxnP8Hog@mail.gmail.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: =?iso-8859-1?Q?Pali_Roh=E1r?= <pali.rohar@gmail.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Milo Kim <woogyom.kim@gmail.com>

Hi Bryan,

> -----Original Message-----
> From: Bryan Wu [mailto:cooloney@gmail.com]
> Sent: Wednesday, August 14, 2013 3:56 AM
> To: Milo Kim
> Cc: Pali Roh=E1r; Linux LED Subsystem; lkml; Kim, Milo
> Subject: Re: [PATCH 01/10] leds: lp55xx: add common data structure fo=
r
> program
>=20
> On Thu, Aug 8, 2013 at 12:59 AM, Milo Kim <woogyom.kim@gmail.com> wro=
te:
> > LP55xx family devices have internal three program engines which are
> > used for loading LED patterns.
> > To maintain legacy device attributes, specific data structure is us=
ed,
> 'mode'
> > and 'led_mux'.
> > The mode is used for showing/storing current engine mode such like
> > disabled, load and run.
> > Then led_mux is used for showing/storing current output LED selecti=
on.
> > This is only for LP5523/55231.
> >
>=20
> This patch looks good to me, but the commit message format is little =
bit odd
> to me. I will fix that and merge into my tree.

Thanks for your help.
Can I get more detailed information about this format problem?
I need to check my configurations.

Thanks,
Milo-
--
To unsubscribe from this list: send the line "unsubscribe linux-leds" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

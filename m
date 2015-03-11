From: =?ISO-8859-1?Q?Rapha=EBl?= Teysseyre <rteysseyre@gmail.com>
Subject: Re: [PATCH RFC] leds: Add status code trigger
Date: Wed, 11 Mar 2015 16:10:14 +0100
Message-ID: <1426086614.59115.14.camel@localhost>
References: <1424334377.11286.3.camel@localhost>
	 <CAK5ve-KTmkh4XBLAEhvUFme+qmTb9hFKxQnvisxySw1skTLr1w@mail.gmail.com>
	 <20150310080042.GA27585@amd> <BLU172-W3716E59BC9E98F60F424C4AC180@phx.gbl>
	 <20150310192226.GB11260@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:40006 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751124AbbCKPJP (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 11 Mar 2015 11:09:15 -0400
In-Reply-To: <20150310192226.GB11260@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Joe Xue <lgxue@hotmail.com>, Bryan Wu <cooloney@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

Le mardi 10 mars 2015 =C3=A0 20:22 +0100, Pavel Machek a =C3=A9crit :
> Hi!
>=20
> > This patch is very similar to mine patten trigger and all features =
are covered by my patch.
> > If you are considering to take this feature, could you consider my =
patch instead?
> > http://thread.gmane.org/gmane.linux.documentation/19116/focus=3D191=
35
>=20
> That one is indeed better than this patch (as it supports almost
> arbitrary blinking pattern on single LED, it will not help much with
> smooth brightness control.

I agree, that patch supports more features than mine, I didn't find it
while browsing the mailing list archive.

>=20
> Would solution below work for you?
>=20
> Best regards,
> 									Pavel
>=20
> > > I think I have interface to handle most of the issues: array of
> > > integers in "brightness, length in miliseconds".
> > >=20
> > > So for example slowly blinking LED would be "0 1000msec, 255 1000
> > > msec". On off pattern would be "0 1000msec, 255 0msec, 255 1000ms=
ec, 0
> > > 0msec".
> > >=20
> > > Rapahael, this should be able to do all the stuff you want to do.=
 It
> > > can also do morse code, slow blinks, and combination of both. Do =
you
> > > want to try implementing it?
> >  		 	   		 =20
>=20

I could implement it. This is how I'd do it :
When activated, the trigger would export three
sysfs attributes : pattern, pattern_repeat, and pattern_once.

	pattern : list of brightness/time couple, separated by newlines
		For the slowly blinking LED of your example,
		this attribute would contain :
		0 1000
		255 1000

		For a heartbeat-like pattern :
		0 1000
		255 100
		0 100
		255 100

	pattern_repeat : repeat this pattern indefinitely ?
		1 -> yes, 0 -> no

	pattern_once : if pattern_repeat =3D 0, writing 1 to this
		file makes the pattern run once .

Does that seem OK to you?

Regards,
Rapha=C3=ABl

From: =?ISO-8859-1?Q?Rapha=EBl?= Teysseyre <rteysseyre@gmail.com>
Subject: Re: [PATCH RFC] leds: Add status code trigger
Date: Thu, 12 Mar 2015 07:56:00 +0100
Message-ID: <1426143360.59115.21.camel@localhost>
References: <1424334377.11286.3.camel@localhost>
	 <CAK5ve-KTmkh4XBLAEhvUFme+qmTb9hFKxQnvisxySw1skTLr1w@mail.gmail.com>
	 <20150310080042.GA27585@amd> <BLU172-W3716E59BC9E98F60F424C4AC180@phx.gbl>
	 <20150310192226.GB11260@amd> <1426086614.59115.14.camel@localhost>
	 <20150311190255.GA20247@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wg0-f41.google.com ([74.125.82.41]:35953 "EHLO
	mail-wg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752982AbbCLGzA (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 12 Mar 2015 02:55:00 -0400
In-Reply-To: <20150311190255.GA20247@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Joe Xue <lgxue@hotmail.com>, Bryan Wu <cooloney@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

> > 		For a heartbeat-like pattern :
> > 		0 1000
> > 		255 100
> > 		0 100
> > 		255 100
>=20
> That would be "slowly go to zero intensity, quickly go to max
> intensity, to zero, to maximum". If you wanted to turn the LED on/off
> without going through partial brightnesses, you'd do
>=20
> 	        0 1000
> 		255 0
> 		255 100
> 		0 0
> 		0 100
> 		255 0
> 		255 100
> 		0 0
>=20
Okay, now I get why there were zero-time lines in your second example.

> > 	pattern_repeat : repeat this pattern indefinitely ?
> > 		1 -> yes, 0 -> no
> >=20
> > 	pattern_once : if pattern_repeat =3D 0, writing 1 to this
> > 		file makes the pattern run once .
>=20
> I'd do attribute "repeat" with number of repetitions, or -1 =3D=3D "r=
epeat
> forever" default value.
>=20

Yes that's better.

Best regards,
Rapha=C3=ABl

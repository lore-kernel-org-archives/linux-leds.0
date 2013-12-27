From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] Add the LED burst trigger
Date: Fri, 27 Dec 2013 10:57:05 +0100
Message-ID: <20131227095705.GC17143@amd.pavel.ucw.cz>
References: <1387895407-28031-1-git-send-email-lgxue@hotmail.com>
 <20131225230935.GB13593@amd.pavel.ucw.cz>
 <BLU172-W52032BFEF4512123D7516EACC20@phx.gbl>
 <20131226142607.GA15225@amd.pavel.ucw.cz>
 <BLU172-W30E6E7C0BC2B6C08FA0552ACCD0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:33272 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754169Ab3L0J5J (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 27 Dec 2013 04:57:09 -0500
Content-Disposition: inline
In-Reply-To: <BLU172-W30E6E7C0BC2B6C08FA0552ACCD0@phx.gbl>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Joe Xue <lgxue@hotmail.com>
Cc: "cooloney@gmail.com" <cooloney@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "rob@landley.net" <rob@landley.net>, "milo.kim@ti.com" <milo.kim@ti.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>

Hi!

> I'm writing the Morse code trigger.
> what about this
>=20
> echo "-.-. *"> patten
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 a long on then a off
> .=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 a short on then a off
> space=A0=A0=A0=A0 a long off
> *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mean repeat the patten
> s=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mean indicate the patten just o=
ne time then stop

Actually, that's a bit more complex that it needs to be.

Make it

"#" -- LED on

" " -- LED off.

To do morse -.-., you use "### # ### #    " pattern. But this is more
flexible, you can for example do "led mostly on, two blinks to off per
cycle" using

"########### ## ###########"

pattern.

Hmm?
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses=
/blog.html

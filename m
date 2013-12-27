From: Joe Xue <lgxue@hotmail.com>
Subject: RE: [PATCH] Add the LED burst trigger
Date: Thu, 26 Dec 2013 19:31:40 -0500
Message-ID: <BLU172-W30E6E7C0BC2B6C08FA0552ACCD0@phx.gbl>
References: <1387895407-28031-1-git-send-email-lgxue@hotmail.com>,<20131225230935.GB13593@amd.pavel.ucw.cz>,<BLU172-W52032BFEF4512123D7516EACC20@phx.gbl>,<20131226142607.GA15225@amd.pavel.ucw.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from blu0-omc4-s27.blu0.hotmail.com ([65.55.111.166]:7295 "EHLO
	blu0-omc4-s27.blu0.hotmail.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751229Ab3L0Abl convert rfc822-to-8bit
	(ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 26 Dec 2013 19:31:41 -0500
In-Reply-To: <20131226142607.GA15225@amd.pavel.ucw.cz>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: "cooloney@gmail.com" <cooloney@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "rob@landley.net" <rob@landley.net>, "milo.kim@ti.com" <milo.kim@ti.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>

Hi,

I'm writing the Morse code trigger.
what about this

echo "-.-. *"> patten
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 a long on then a off
=2E=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 a short on then a off
space=A0=A0=A0=A0 a long off
*=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mean repeat the patten
s=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mean indicate the patten just one=
 time then stop

Do we also need a  "step_length_ms" as Pavel's suggestion?
If so, we can define long on as 2*step_length_ms and short on as 1*step=
_length_ms.

Any other parameters do you guys think we should add?

Any suggestion is very appreciated.

Thanks

Joe



----------------------------------------
> Date: Thu, 26 Dec 2013 15:26:08 +0100
> From: pavel@ucw.cz
> To: lgxue@hotmail.com
> CC: cooloney@gmail.com; rpurdie@rpsys.net; rob@landley.net; milo.kim@=
ti.com; linux-leds@vger.kernel.org; linux-kernel@vger.kernel.org; linux=
-doc@vger.kernel.org
> Subject: Re: [PATCH] Add the LED burst trigger
>
> Hi!
>
>> Yes, Morse code can indicate any means. But when we look at the LEDs=
, would we like to also have a Morse code book in hand?
>>
>> The burst led blink idea is because it is easy to use and easy to de=
scribe. Mostly when users on site are describing the LEDs states to the=
 support engineer.
>>
>
> Well.. above 7 or so blinks, people will be unable to count. "one
> short, one long" will help to extend that.
>
> Plus, there may be patterns such as "keep it ON, count number of brie=
f
> OFFs"...
>
> That's why I suggested:
>
>>> echo 40> step_length_ms
>>> echo "- - - "> pattern
>>>
>>> do the same trick?
>>>
>>> Plus, you could for example do
>>>
>>> echo "- --- "> pattern
>>>
>>> to do morse code...
>
> Interface
>
> (Note that your client stripped some spaces out of it).
>
> With that, it should be very easy to program all the reasonable
> blinking patterns for single LED without PWM.
> Pavel
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/hors=
es/blog.html 		 	   		  --
To unsubscribe from this list: send the line "unsubscribe linux-leds" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

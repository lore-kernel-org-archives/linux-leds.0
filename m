From: Joe Xue <lgxue@hotmail.com>
Subject: RE: [PATCH] Add the LED burst trigger
Date: Thu, 26 Dec 2013 10:02:38 -0500
Message-ID: <BLU172-W3236C029069708048D5697ACC20@phx.gbl>
References: <1387895407-28031-1-git-send-email-lgxue@hotmail.com>,<20131225230935.GB13593@amd.pavel.ucw.cz>,<BLU172-W52032BFEF4512123D7516EACC20@phx.gbl>,<20131226142607.GA15225@amd.pavel.ucw.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from blu0-omc4-s27.blu0.hotmail.com ([65.55.111.166]:58170 "EHLO
	blu0-omc4-s27.blu0.hotmail.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752726Ab3LZPCj convert rfc822-to-8bit
	(ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 26 Dec 2013 10:02:39 -0500
In-Reply-To: <20131226142607.GA15225@amd.pavel.ucw.cz>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: "cooloney@gmail.com" <cooloney@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "rob@landley.net" <rob@landley.net>, "milo.kim@ti.com" <milo.kim@ti.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>

Hi Pavel,

Yes, your suggest looks reasonable. Only issue maybe is not easy to called by program. After all, the interface is called by program more ofter then by human being.

I would like to change the way what you suggest, let see if other guys agree with your idea.

Before that, I'll submit another change as per Geert's suggest that change HZ to Hz.

Joe

----------------------------------------
> Date: Thu, 26 Dec 2013 15:26:08 +0100
> From: pavel@ucw.cz
> To: lgxue@hotmail.com
> CC: cooloney@gmail.com; rpurdie@rpsys.net; rob@landley.net; milo.kim@ti.com; linux-leds@vger.kernel.org; linux-kernel@vger.kernel.org; linux-doc@vger.kernel.org
> Subject: Re: [PATCH] Add the LED burst trigger
>
> Hi!
>
>> Yes, Morse code can indicate any means. But when we look at the LEDs, would we like to also have a Morse code book in hand?
>>
>> The burst led blink idea is because it is easy to use and easy to describe. Mostly when users on site are describing the LEDs states to the support engineer.
>>
>
> Well.. above 7 or so blinks, people will be unable to count. "one
> short, one long" will help to extend that.
>
> Plus, there may be patterns such as "keep it ON, count number of brief
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
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at http://www.tux.org/lkml/ 		 	   		  
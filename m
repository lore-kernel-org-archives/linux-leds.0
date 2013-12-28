From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] Add the LED burst trigger
Date: Sat, 28 Dec 2013 20:26:30 +0100
Message-ID: <20131228192630.GA28026@amd.pavel.ucw.cz>
References: <1387895407-28031-1-git-send-email-lgxue@hotmail.com>
 <20131225230935.GB13593@amd.pavel.ucw.cz>
 <BLU172-W52032BFEF4512123D7516EACC20@phx.gbl>
 <20131226142607.GA15225@amd.pavel.ucw.cz>
 <BLU172-W30E6E7C0BC2B6C08FA0552ACCD0@phx.gbl>
 <20131227095705.GC17143@amd.pavel.ucw.cz>
 <BLU172-W8D850A8DEA8C0D87FBF45ACCC0@phx.gbl>
 <20131228101622.GA13564@amd.pavel.ucw.cz>
 <BLU172-W7ED2FA23CAA436EA47FCBACCC0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BLU172-W7ED2FA23CAA436EA47FCBACCC0@phx.gbl>
Sender: linux-doc-owner@vger.kernel.org
To: Joe Xue <lgxue@hotmail.com>
Cc: "cooloney@gmail.com" <cooloney@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "rob@landley.net" <rob@landley.net>, "milo.kim@ti.com" <milo.kim@ti.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi!

> > And while " " for pause and "#" for light would work. Maybe we chould
> > do "\0" for pause and "\177" for light... and interpret everything
> > between as an intensity. That will make it useful for LEDs with
> > variable intensites, too...
> 
> "\0" is not easy to give if application is a script.
> intensity is a good idea, but makes it more complex, and user need to convert the "\num" to a ASCII code.
> 


OTOH it is easier for C programs _and_ we can support different
brightness levels.

It is not that bad from script:

echo -ne '\0\051\0377' > foo...

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

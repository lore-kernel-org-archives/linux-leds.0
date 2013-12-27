From: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] Add the LED burst trigger
Date: Fri, 27 Dec 2013 22:45:01 +0000
Message-ID: <1388184301.11527.29.camel@ted>
References: <1387895407-28031-1-git-send-email-lgxue@hotmail.com>
	 <20131225230935.GB13593@amd.pavel.ucw.cz>
	 <BLU172-W52032BFEF4512123D7516EACC20@phx.gbl>
	 <20131227115746.4cbd9523@alan.etchedpixels.co.uk>
	 <20131227125725.GA21506@amd.pavel.ucw.cz>
	 <20131227141826.3fe406e4@alan.etchedpixels.co.uk>
	 <20131227152354.GA24152@amd.pavel.ucw.cz>
	 <20131227181349.475abe88@alan.etchedpixels.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131227181349.475abe88@alan.etchedpixels.co.uk>
Sender: linux-doc-owner@vger.kernel.org
To: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Cc: Pavel Machek <pavel@ucw.cz>, Joe Xue <lgxue@hotmail.com>, "cooloney@gmail.com" <cooloney@gmail.com>, "rob@landley.net" <rob@landley.net>, "milo.kim@ti.com" <milo.kim@ti.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Fri, 2013-12-27 at 18:13 +0000, One Thousand Gnomes wrote:
> > Well, this one will be really smaller. And yes, it will make some
> > memory non-swappable, but I believe with triggers and infrastructure
> > for N900 (and similar) it will be worth it.
> 
> Ah yes thats such a major proportion of platforms
> 
> > Plus, it will actually save CPU cycles, and thus significant power.
> 
> All of which will be totally wiped out if you bump all the millions of
> x86 server boxes in the world up by one page of kernel space and cause a
> few disk I/Os

FWIW the LED subsystem was designed to take advantage of kernel modules.
If you don't use a given trigger, it needn't be in memory, loaded or
even built at all. If something changed there which made that not
possible, that would be rather sad.

I agree with you that we shouldn't bump the kernel size unnecessarily
but I don't think triggers should do so. I actually think the kernel
could do with going on a diet and at least made so you can untangle more
of the pieces you don't want/need.

Cheers,

Richard


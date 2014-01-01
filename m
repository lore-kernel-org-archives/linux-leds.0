From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] Add LED pattern trigger
Date: Wed, 1 Jan 2014 20:10:53 +0000
Message-ID: <20140101201053.12be7d27@alan.etchedpixels.co.uk>
References: <1388362275-1618-1-git-send-email-lgxue@hotmail.com>
	<20131230162158.7420e811@alan.etchedpixels.co.uk>
	<BLU172-W451DF59115DB2B0A7F694AACC90@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BLU172-W451DF59115DB2B0A7F694AACC90@phx.gbl>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Xue <lgxue@hotmail.com>
Cc: "cooloney@gmail.com" <cooloney@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "rob@landley.net" <rob@landley.net>, "milo.kim@ti.com" <milo.kim@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Tue, 31 Dec 2013 13:48:50 -0500
Joe Xue <lgxue@hotmail.com> wrote:

> >> + * Based on Richard Purdie's ledtrig-timer.c and Atsushi Nemoto's
> >> + * ledtrig-heartbeat.c and Shuah Khan's ledtrig-transient.c
> >
> > I stil think this belongs in user space except for platforms with hardware
> > acceleration for it.
> 
> This can free the user space application from loop or thread.

Which is not a good reason for putting it in the kernel. I could make the
same argument for putting firefox in the kernel ...

> > This doesn't as far as I can see do what you think. If I have the file
> > currently open then device_remove_file will not remove my existing access
> > to it, but you just released the pattern data so I now write to free
> > memory.
> 
> will add the mutex lock to avoid that 		 	   		  

Ok

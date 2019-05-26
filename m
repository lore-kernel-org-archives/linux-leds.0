From: Pavel Machek <pavel@ucw.cz>
Subject: Re: Revert "leds: avoid races with workqueue"?
Date: Sun, 26 May 2019 19:20:02 +0200
Message-ID: <20190526172002.GB1282@xo-6d-61-c0.localdomain>
References: <alpine.LSU.2.11.1905241540080.1674@eggly.anvils>
 <20190525093759.GA17767@amd>
 <alpine.LSU.2.11.1905251025300.1112@eggly.anvils>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LSU.2.11.1905251025300.1112@eggly.anvils>
Sender: linux-kernel-owner@vger.kernel.org
To: Hugh Dickins <hughd@google.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Sat 2019-05-25 10:32:31, Hugh Dickins wrote:
> On Sat, 25 May 2019, Pavel Machek wrote:
> 
> > Hi!
> > 
> > > I'm having to revert 0db37915d912 ("leds: avoid races with workqueue")
> > > from my 5.2-rc testing tree, because lockdep and other debug options
> > > don't like it: net/mac80211/led.c arranges for led_blink_setup() to be
> > > called at softirq time, and flush_work() is not good for calling
> > > then.
> > 
> > This should keep X60 working (as well as it is now; X60 will still
> > have problems with lost events in setup like yours).
> > 
> > Can you test this instead of the revert?
> 
> Thanks, Pavel: yes, that works fine for me on the T420s, no debug
> complaints, good and silent; and the wifi LED is blinking as before.

I'd like to prevent recurrence of similar problem, and I wonder if you
can give me a hint.

I can annotate code that can sleep with might_sleep().

How can I annotate code that can not sleep? I might do 

spin_lock(&dummy);
this_should_not_sleep();
spin_unlock(&dummy);

But I don't really need extra serialization. I just want annotations for
lockdep. Any ideas?

								Pavel

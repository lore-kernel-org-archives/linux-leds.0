From: Hugh Dickins <hughd@google.com>
Subject: Re: Revert "leds: avoid races with workqueue"?
Date: Sun, 26 May 2019 13:36:11 -0700 (PDT)
Message-ID: <alpine.LSU.2.11.1905261318290.2394@eggly.anvils>
References: <alpine.LSU.2.11.1905241540080.1674@eggly.anvils> <20190525093759.GA17767@amd> <alpine.LSU.2.11.1905251025300.1112@eggly.anvils> <20190526172002.GB1282@xo-6d-61-c0.localdomain>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190526172002.GB1282@xo-6d-61-c0.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Hugh Dickins <hughd@google.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Sun, 26 May 2019, Pavel Machek wrote:
> On Sat 2019-05-25 10:32:31, Hugh Dickins wrote:
> > 
> > Thanks, Pavel: yes, that works fine for me on the T420s, no debug
> > complaints, good and silent; and the wifi LED is blinking as before.
> 
> I'd like to prevent recurrence of similar problem, and I wonder if you
> can give me a hint.
> 
> I can annotate code that can sleep with might_sleep().
> 
> How can I annotate code that can not sleep? I might do 
> 
> spin_lock(&dummy);
> this_should_not_sleep();
> spin_unlock(&dummy);
> 
> But I don't really need extra serialization. I just want annotations for
> lockdep. Any ideas?

I haven't tried to do that directly, so I'm likely to give bad advice:
in particular, I forget the limitations of checking in_atomic().

But very useful (and much cheaper than lockdep) debug options in
this area are CONFIG_DEBUG_PREEMPT and CONFIG_DEBUG_ATOMIC_SLEEP.

Hugh

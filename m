From: Hugh Dickins <hughd@google.com>
Subject: Re: leds: avoid flush_work in atomic context
Date: Sun, 26 May 2019 12:34:54 -0700 (PDT)
Message-ID: <alpine.LSU.2.11.1905261226040.2004@eggly.anvils>
References: <20190526073854.GA13681@amd> <5a741b3c-cf45-3577-9b6c-653f083ca96b@gmail.com> <20190526173700.GD1282@xo-6d-61-c0.localdomain>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190526173700.GD1282@xo-6d-61-c0.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, hughd@google.com, linux-leds@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Sun, 26 May 2019, Pavel Machek wrote:
> Hi!
> 
> > Thank you for the patch.
> > 
> > I've applied it however I'm not sure if it is an official
> > submission, since it doesn't look like (no [PATCH] tag
> > in the subject).
> 
> It was official submission :-).
> 
> > Beside that 'Fixes' tag is somewhat incomplete - it should be
> > generated using following git command:
> > 
> > git log -1 0db37915d912 --format='Fixes: %h ("%s")'
> > 
> > Fixed that and applied to the for-next branch and will push
> > it upstream after a bit of testing for rc3 or rc4.
> 
> Ok. Note that this did not crash Hugh's machine but it may crash
> someone else's, and probably crashed mine already.

Where "this" is commit 0db37915d912, I hope: right, it did not
actually crash my machine, but the splurge of warning messages
forced me to reboot quickly, and go look for the culprit.

Your fix certainly did not crash my machine either,
but I hope we don't expect your fix to crash someone else's!

> 
> So... it makes sense to push it to Linus "soon".

Agreed.

Hugh

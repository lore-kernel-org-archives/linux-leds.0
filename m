From: Pavel Machek <pavel@ucw.cz>
Subject: Re: leds: avoid flush_work in atomic context
Date: Sun, 26 May 2019 19:37:00 +0200
Message-ID: <20190526173700.GD1282@xo-6d-61-c0.localdomain>
References: <20190526073854.GA13681@amd>
 <5a741b3c-cf45-3577-9b6c-653f083ca96b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5a741b3c-cf45-3577-9b6c-653f083ca96b@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: hughd@google.com, linux-leds@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi!

> Thank you for the patch.
> 
> I've applied it however I'm not sure if it is an official
> submission, since it doesn't look like (no [PATCH] tag
> in the subject).

It was official submission :-).

> Beside that 'Fixes' tag is somewhat incomplete - it should be
> generated using following git command:
> 
> git log -1 0db37915d912 --format='Fixes: %h ("%s")'
> 
> Fixed that and applied to the for-next branch and will push
> it upstream after a bit of testing for rc3 or rc4.

Ok. Note that this did not crash Hugh's machine but it may crash
someone else's, and probably crashed mine already.

So... it makes sense to push it to Linus "soon".

Thanks,
								Pavel

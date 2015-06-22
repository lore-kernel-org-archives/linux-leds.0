From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: lp5523: add master_fader support
Date: Mon, 22 Jun 2015 13:58:46 +0200
Message-ID: <20150622115846.GA9179@xo-6d-61-c0.localdomain>
References: <1431371454-2035-1-git-send-email-toshik@chromium.org>
 <5551AAFA.5080807@samsung.com>
 <5551B8F9.6040808@ti.com>
 <5551BF04.5010503@samsung.com>
 <CAK5ve-KkLmJMLs0Q3KskUodEJrjcWRx_tobVUm5+G=Q+_sFxmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:49654 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751938AbbFVL6z (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 22 Jun 2015 07:58:55 -0400
Content-Disposition: inline
In-Reply-To: <CAK5ve-KkLmJMLs0Q3KskUodEJrjcWRx_tobVUm5+G=Q+_sFxmg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, "Kim, Milo" <milo.kim@ti.com>, Toshi Kikuchi <toshik@chromium.org>, lkml <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>

Hi!

> >>>> This patch introduces 4 new attributes:
> >>>>     master_fader_leds
> >>>>     master_fader1
> >>>>     master_fader2
> >>>>     master_fader3
> >>>>
> >>>> Fo example, to map channel 0,6 to master_fader1,
> >>>> map channel 1,7 to master_fader2,
> >>>> map channel 2,8 to master_fader3, and
> >>>> map channel 3,4,5 to none
> >>>
> >>>   >
> >>>>
> >>>>     echo "123000123" > master_fader_leds
> >>>
> >>>
> >>> I propose to add ABI documentation for this driver. It already exposes
> >>> many custom attributes but I can't find documentation for them.
> >>
> >>
> >> I agree with Jacek's comment but it would be better if we could see the
> >> description in lp5523 driver
> >> documentation(Documentation/leds/leds-lp5523.txt).
> >
> >
> > Right, I missed that file.
> >
> >
> 
> Toshi,
> 
> I merged this patch into my tree with Milo and Jacek Acks. But please
> follow their advice and provide a patch to update those document
> files.

Are you sure this is the right interface? lp5523 is turing-complete. Yes, it
can multiply brightness values by a constant. It can also do morse code on its
own, and compute prime numbers.

Why is this useful addition to kernel<->user interface?

Can we do better interface that works on more than one chip?
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

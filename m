From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: Introduce userspace leds driver
Date: Thu, 15 Sep 2016 14:41:03 +0200
Message-ID: <20160915124103.GF13132@amd>
References: <1473128158-26915-1-git-send-email-david@lechnology.com>
 <04c5ee0d-9bfb-6e0a-2616-6cf720fc8763@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:58911 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757106AbcIOMlG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 15 Sep 2016 08:41:06 -0400
Content-Disposition: inline
In-Reply-To: <04c5ee0d-9bfb-6e0a-2616-6cf720fc8763@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: David Lechner <david@lechnology.com>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>

Hi!

> Thanks for the patch. It is very nice. I have only one minor remark
> in the code.
> 
> I think that it would be good to add a documentation for this
> driver to Documentation/leds, with exemplary C program instead
> of python one. The program could poll the dev node in a loop,
> which allows to conveniently check the impact of setting particular
> triggers and all other brightness change events.

Actually, I'd say that python is fine -- it is used heavily in tools/.

But perhaps the example program should go to tools/?

> >def change_brightness(b):
> >    with open('/sys/class/leds/{}/brightness'.format(name) , 'w') as f:
> >       f.write(str(b))
> >
> >
> >with open('/dev/uleds', 'rb+', 0) as uleds:
> >    bname = name.encode("ascii")
> >    # create the leds class device
> >    uleds.write(bname + b'\0' * (ULEDS_MAX_NAME_SIZE - len(bname)))

Umm. I don't see it in the kernel code. You let userspace provide a
LED name?

Where is the LED name tested for sanity? I guess there could be a lot
of fun naming a led ".." for example...

Best regards,
								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

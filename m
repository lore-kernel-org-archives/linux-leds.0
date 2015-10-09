From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 01/12] leds: core: Use EXPORT_SYMBOL_GPL consistently
Date: Fri, 9 Oct 2015 13:17:36 +0200
Message-ID: <20151009111735.GB13923@amd>
References: <1443445641-9529-1-git-send-email-j.anaszewski@samsung.com>
 <1443445641-9529-2-git-send-email-j.anaszewski@samsung.com>
 <56095923.7090600@samsung.com>
 <20151008155107.GJ11776@xo-6d-61-c0.localdomain>
 <561778A4.3020006@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:53144 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756019AbbJILRi (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 9 Oct 2015 07:17:38 -0400
Content-Disposition: inline
In-Reply-To: <561778A4.3020006@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com, andrew@lunn.ch, rpurdie@rpsys.net

On Fri 2015-10-09 10:19:48, Jacek Anaszewski wrote:
> On 10/08/2015 05:51 PM, Pavel Machek wrote:
> >On Mon 2015-09-28 17:13:39, Jacek Anaszewski wrote:
> >>This patch isn't going to be applied since it can cause
> >>legal implications for existing users.
> >>
> >
> >Are there any? Best do this ASAP :-).
> 
> Current non-GPL users of led_set_brightness would be affected if we
> changed this. I am not however certain if there are any, having in
> mind

Actually, _GPL or not is just an annotation, it has little legal
power.

> that led_classdev_register is exported with EXPORT_SYMBOL_GPL.
> Theoretically it is possible to use led_set_brightness without
> registering LED class device, but it would be partially broken then
> due to not initialized set_brightness_work.
> I think that it would be safe to apply this patch.
> I need acks, though :)

Acked-by: Pavel Machek <pavel@ucw.cz>
								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

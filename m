From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2] leds: fix brightness changing when software blinking
 is active
Date: Sat, 2 May 2015 16:59:57 +0200
Message-ID: <20150502145957.GB8156@xo-6d-61-c0.localdomain>
References: <5554BE12.7050209@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:58532 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933463AbbFWQvp (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 23 Jun 2015 12:51:45 -0400
Content-Disposition: inline
In-Reply-To: <5554BE12.7050209@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Stas Sergeev <stsp@list.ru>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Stas Sergeev <stsp@users.sourceforge.net>

On Thu 2015-05-14 18:24:02, Stas Sergeev wrote:
> 
> The following sequence:
> echo timer >/sys/class/leds/<name>/trigger
> echo 1 >/sys/class/leds/<name>/brightness
> should change the ON brightness for blinking.
> The function led_set_brightness() was mistakenly initiating the
> delayed blink stop procedure, which resulted in no blinking with
> the timer trigger still active.
> 
> This patch fixes the problem by changing led_set_brightness()
> to not initiate the delayed blink stop when brightness is not 0.

Could we get this part of API documented? It is quite non-obvious... 0 clears the trigger,
other values do not, I thought it is a bug when I saw it...

Thanks,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

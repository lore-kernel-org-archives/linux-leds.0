From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 0/3] Extend the LED panic trigger
Date: Fri, 29 Apr 2016 00:22:19 +0200
Message-ID: <20160428222219.GA2155@amd>
References: <1461881020-13964-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:34593 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752346AbcD1WWW (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 28 Apr 2016 18:22:22 -0400
Content-Disposition: inline
In-Reply-To: <1461881020-13964-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>

On Thu 2016-04-28 19:03:37, Ezequiel Garcia wrote:
> As per commit 916fe619951f ("leds: trigger: Introduce a kernel
> panic LED trigger"), the kernel now supports a new LED trigger
> to hook on the panic blink.
> 
> However, the only way of using this is to dedicate a LED device,
> making it rather useless.
> 
> To overcome this limitation, the present series introduces the
> capability to switch the LED trigger of certain LED devices upon
> a kernel panic (using the panic notifier).
> 
> The decision of which LEDs should be switched to the panic trigger
> is left to each LED device driver. As an example, a devicetree
> boolean property is introduced and used in the leds-gpio driver.
> 
> The big change in this v3 is that I've moved the panic trigger
> switching away from the core code and it's now part of
> ledtrig-panic.c. Pavel, Jacek: How does it look?

Seems better now. Thanks for doing that.

For the series:

Acked-by: Pavel Machek <pavel@ucw.cz>
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

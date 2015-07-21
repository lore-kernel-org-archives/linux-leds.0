From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH/RFC 03/51] leds: Add an internal
 led_set_brightness_nosleep function
Date: Tue, 21 Jul 2015 11:53:31 +0200
Message-ID: <20150721095331.GC23841@amd>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
 <1437122857-6765-4-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:59831 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752299AbbGUJxe (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 21 Jul 2015 05:53:34 -0400
Content-Disposition: inline
In-Reply-To: <1437122857-6765-4-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>, Sakari Ailus <sakari.ailus@linux.intel.com>


>  	/* Set LED brightness level */
> -	/* Must not sleep, use a workqueue if needed */
> +	/* Must not sleep if the driver sets LED_BRIGHTNESS_FAST flag */
>  	void		(*brightness_set)(struct led_classdev *led_cdev,
>  					  enum led_brightness brightness);
>  	/*

Have fun improving static checkers to check for this kind of crazy
semantics.

NAK.

Just use two callbacks, one of them always NULL.
									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

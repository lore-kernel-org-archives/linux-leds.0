From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH/RFC v2 1/5] leds: Use set_brightness_work for
 brightness_set ops that can sleep
Date: Tue, 30 Jun 2015 20:30:16 +0200
Message-ID: <20150630183016.GA15047@amd>
References: <1435672770-4261-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:38906 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752407AbbF3SaS (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 30 Jun 2015 14:30:18 -0400
Content-Disposition: inline
In-Reply-To: <1435672770-4261-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, sakari.ailus@linux.intel.com, andreas.werner@men.de, andrew@lunn.ch, ospite@studenti.unina.it, anemo@mba.ocn.ne.jp, ben@simtec.co.uk, bootc@bootc.net, dmurphy@ti.com, daniel.jeong@ti.com, daniel@zonque.org, davem@davemloft.net, fabio.baltieri@gmail.com, balbi@ti.com, florian@openwrt.org, gshark.jeong@gmail.com, g.liakhovetski@gmx.de, ingi2.kim@samsung.com, dl9pf@gmx.de, johan@kernel.org, lenz@cs.wisc.edu, jogo@openwrt.org, q1.kim@samsung.com, kris@krisk.org, kristoffer.ericson@gmail.com, linus.walleij@linaro.org, broonie@kernel.org, michael.hennerich@analog.com, milo.kim@ti.com, nm127@freemail.hu, ncase@xes-inc.com, neilb@suse.de, nick.forbes@incepta.com, lost.distance@yahoo.com, p.meerwald@bct-electronic.com, n0-1@freewrt.org, philippe.retornaz@


>  
>  	/* Set LED brightness level */
>  	/* Must not sleep, use a workqueue if needed */
>  	void		(*brightness_set)(struct led_classdev *led_cdev,
>  					  enum led_brightness brightness);
> -	/*
> -	 * Set LED brightness level immediately - it can block the caller for
> -	 * the time required for accessing a LED device register.
> -	 */
> -	int		(*brightness_set_sync)(struct led_classdev *led_cdev,
> -					enum led_brightness brightness);
>  	/* Get LED brightness level */
>  	enum led_brightness (*brightness_get)(struct led_classdev *led_cdev);
>

NAK. Feel free to rearrange the code so that driver's work is easier,
but keep separate callbacks for "can sleep" and "can not sleep"
situations. 4 bytes are not worth the confusion.
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

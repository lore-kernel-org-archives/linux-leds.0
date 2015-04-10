From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v6 3/3] leds: Add ktd2692 flash LED driver
Date: Fri, 10 Apr 2015 12:16:39 +0300
Message-ID: <20150410091639.GG20756@valkosipuli.retiisi.org.uk>
References: <1428648359-23289-1-git-send-email-ingi2.kim@samsung.com>
 <1428648359-23289-4-git-send-email-ingi2.kim@samsung.com>
 <20150410081106.GF20756@valkosipuli.retiisi.org.uk>
 <55278DAA.40700@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from nblzone-211-213.nblnetworks.fi ([83.145.211.213]:44259 "EHLO
	hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754242AbbDJJRQ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>);
	Fri, 10 Apr 2015 05:17:16 -0400
Content-Disposition: inline
In-Reply-To: <55278DAA.40700@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ingi Kim <ingi2.kim@samsung.com>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, j.anaszewski@samsung.com, varkabhadram@gmail.com, joe@perches.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Ingi,

On Fri, Apr 10, 2015 at 05:45:30PM +0900, Ingi Kim wrote:
...
> >> +	ret = devm_gpio_request_one(dev, led->ctrl_gpio,
> >> +					GPIOF_OPEN_SOURCE, "ctrl-gpio");
> >
> > I think you could simply use devm_gpio_get(), and start using the new API
> > instead. It'd save quite a few lines of code, too.
> >
> 
> did you mean devm_gpiod_get()
> Ok, I'll check it

Yes, that's what I meant.

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk

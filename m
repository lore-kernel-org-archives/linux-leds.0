From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH/RFC v6 05/36] leds: Improve setting brightness in a non
 sleeping way
Date: Fri, 21 Aug 2015 22:42:01 +0200
Message-ID: <20150821204201.GD8193@lunn.ch>
References: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
 <1440081846-11697-6-git-send-email-j.anaszewski@samsung.com>
 <20150820160938.GF27457@lunn.ch>
 <55D6EDD9.6050202@samsung.com>
 <20150821174507.GB8193@lunn.ch>
 <55D78A89.2030407@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:37778 "EHLO vps0.lunn.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751392AbbHUUtY (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 21 Aug 2015 16:49:24 -0400
Content-Disposition: inline
In-Reply-To: <55D78A89.2030407@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Stas Sergeev <stsp@users.sourceforge.net>

> This work queue from led-class.c is used for setting brightness, when
> blink timer is on. Blinking is the functionality from the LED core,
> so the work queue should also belong to the core. It should be moved
> there along with led_timer_function, for consistency reasons. In view
> of the above, using it for setting brightness by blocking drivers
> would be correct from the architectural point of view.

So lets assume we are not doing all the changes in a single patch
set. Its too complex. You say the work queue should be in the
core. Lets put a work queue in the core to handle the blocking op, and
strip it out of the drivers. That allows you to get a lot of driver
patches merged.

You can then work on moving led_timer_function into the core, etc,
with a much smaller patch set, and hopefully in a number of small
steps which are easy to review.

      Andrew

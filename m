From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH/RFC v6 05/36] leds: Improve setting brightness in a non
 sleeping way
Date: Thu, 20 Aug 2015 18:09:38 +0200
Message-ID: <20150820160938.GF27457@lunn.ch>
References: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
 <1440081846-11697-6-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:37110 "EHLO vps0.lunn.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752308AbbHTQQ7 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 20 Aug 2015 12:16:59 -0400
Content-Disposition: inline
In-Reply-To: <1440081846-11697-6-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Stas Sergeev <stsp@users.sourceforge.net>

On Thu, Aug 20, 2015 at 04:43:35PM +0200, Jacek Anaszewski wrote:
> This patch replaces led_set_brightness_async with
> led_set_brightness_nosleep in all places where the most vital was setting
> brightness in a non sleeping way but not necessarily asynchronously, which
> is not needed for non-blocking drivers.

O.K, so i've lost the plot. _sync, _asymc, _nosleep, etc. Too many
changes without a clearly documented vision of what you are trying to
achieve.

How about splitting this up into at least two patch sets.

1) Add the brightness_set_blocking op and the minimum of changes
needed to the core to make it work, and the driver changes taking out
the work queue.

2) A set of patches cleaning up the core and its API. We want a well
documented linux/leds.h and drivers/led/leds.h defining the APIs which
users and triggers should be using.

      Andrew

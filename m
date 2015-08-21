From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH/RFC v6 05/36] leds: Improve setting brightness in a non
 sleeping way
Date: Fri, 21 Aug 2015 19:45:07 +0200
Message-ID: <20150821174507.GB8193@lunn.ch>
References: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
 <1440081846-11697-6-git-send-email-j.anaszewski@samsung.com>
 <20150820160938.GF27457@lunn.ch>
 <55D6EDD9.6050202@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55D6EDD9.6050202@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Stas Sergeev <stsp@users.sourceforge.net>
List-Id: linux-leds@vger.kernel.org

On Fri, Aug 21, 2015 at 11:22:33AM +0200, Jacek Anaszewski wrote:
> Hi Andrew,
> 
> Thanks for the review.
> 
> On 08/20/2015 06:09 PM, Andrew Lunn wrote:
> >On Thu, Aug 20, 2015 at 04:43:35PM +0200, Jacek Anaszewski wrote:
> >>This patch replaces led_set_brightness_async with
> >>led_set_brightness_nosleep in all places where the most vital was setting
> >>brightness in a non sleeping way but not necessarily asynchronously, which
> >>is not needed for non-blocking drivers.
> >
> >O.K, so i've lost the plot. _sync, _asymc, _nosleep, etc. Too many
> >changes without a clearly documented vision of what you are trying to
> >achieve.
> >
> >How about splitting this up into at least two patch sets.
> >
> >1) Add the brightness_set_blocking op and the minimum of changes
> >needed to the core to make it work, and the driver changes taking out
> >the work queue.
> 
> The minimum of changes needed includes harnessing existing
> set_brightness_work for setting brightness instead of the work queues
> in the drivers.

I'm not sure that is the correct architecture.

The work queue is in the class, not the core. So you need to define
the core API to not need this work queue. What exactly is the core
API? What does it say about blocking and non-blocking, synchronous and
non-synchronous?

Adding the work queue to the core is the quick and simple way of
removing it from the drivers. Maybe that is the way forward. You can
then later come back and sort out the core API and the class API, and
clean up the documentation.

      Andrew

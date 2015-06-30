From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH/RFC v2 1/5] leds: Use set_brightness_work for
 brightness_set ops that can sleep
Date: Wed, 1 Jul 2015 01:24:50 +0300
Message-ID: <20150630222450.GR5904@valkosipuli.retiisi.org.uk>
References: <1435672770-4261-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from nblzone-211-213.nblnetworks.fi ([83.145.211.213]:58514 "EHLO
	hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752016AbbF3WZa (ORCPT
	<rfc822;linux-leds@vger.kernel.org>);
	Tue, 30 Jun 2015 18:25:30 -0400
Content-Disposition: inline
In-Reply-To: <1435672770-4261-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, pavel@ucw.cz, sakari.ailus@linux.intel.com, andreas.werner@men.de, andrew@lunn.ch, ospite@studenti.unina.it, anemo@mba.ocn.ne.jp, ben@simtec.co.uk, bootc@bootc.net, dmurphy@ti.com, daniel.jeong@ti.com, daniel@zonque.org, davem@davemloft.net, fabio.baltieri@gmail.com, balbi@ti.com, florian@openwrt.org, gshark.jeong@gmail.com, g.liakhovetski@gmx.de, ingi2.kim@samsung.com, dl9pf@gmx.de, johan@kernel.org, lenz@cs.wisc.edu, jogo@openwrt.org, q1.kim@samsung.com, kris@krisk.org, kristoffer.ericson@gmail.com, linus.walleij@linaro.org, broonie@kernel.org, michael.hennerich@analog.com, milo.kim@ti.com, nm127@freemail.hu, ncase@xes-inc.com, neilb@suse.de, nick.forbes@incepta.com, lost.distance@yahoo.com, p.meerwald@bct-electronic.com, n0-1@freewrt.org, phil

Hi Jacek,

On Tue, Jun 30, 2015 at 03:59:26PM +0200, Jacek Anaszewski wrote:
> This patch rearranges the core LED subsystem code, so that it
> now shifts the responsibility for using work queues from drivers,
> in case their brightness_set ops can sleep, onto the LED core
> Addition of two flags: LED_BRIGHTNESS_FAST and LED_BLINK_DISABLE
> as well as new_brightness_value property to the struct led_classdev
> allows for employing existing set_brightness_work to do the job.
> The modifications allows also to get rid of brightness_set_sync op,
> as flash LED devices can now be handled properly only basing on the
> SET_BRIGHTNESS_SYNC flag.

Nice patch! Thanks!

Looks like this is the favourite topic nowadays. ;-)

The documentation should be improved to tell how the API is expected to be
have, e.g. which functions may block. I think this is out of scope for this
patch though.

I think all the existing drivers that implement the set_brightness()
callback have a fast (and non-blocking) implementation, and some of these
drivers use a work queue. In order to avoid modifying those drivers right
now, how about adding a flag for slow devices instead? "Slow" handlers
should be those that do at least one of the following: 1) sleep and 2) take
excessive amount of time to run.

How about splitting the patch as follows:

- set_brightness()/set_brightness_sync() -> set_brightness() +
  LED_BRIGHTNESS_FAST + slow handlers in a work queue,
- add LED_BLINK_DISABLE flag,
- fix the heartbeat trigger (it's sleeping in a timer if LED_BRIGHTNESS_SYNC
  is set).

I'd propose to drop led_set_brightness_async() and just make
led_set_brightness() asynchronous (or non-blocking if you wish) as it was
before the LED flash class patches. Considering the nature and tradition of
the framework, that's probably how most users want it to be. One can always
use led_set_brightness_sync() if needed.

The caller should indeed decide whether the operation is synchronous or not,
that's not really a property of the LED. I requested that for the V4L2
framework due to the very different use cases that are typical for the LED
class devices.

I have some patches along these lines, but I probably won't have much time
to work on them, and I can rebase mine on yours later on. If you're
interested in taking a peek they're here:

<URL:http://salottisipuli.retiisi.org.uk/cgi-bin/gitweb.cgi?p=~sailus/linux.git;a=shortlog;h=refs/heads/leds-as3645a>

As the result the as3645a driver is quite a bit smaller than the V4L2
sub-device one, which is a good sign. :-)

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk

From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH/RFC v2 1/5] leds: Use set_brightness_work for
 brightness_set ops that can sleep
Date: Thu, 2 Jul 2015 00:56:19 +0200
Message-ID: <20150701225619.GE30187@lunn.ch>
References: <1435672770-4261-1-git-send-email-j.anaszewski@samsung.com>
 <20150630222450.GR5904@valkosipuli.retiisi.org.uk>
 <5593B84B.7030806@samsung.com>
 <20150701213623.GT5904@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:60971 "EHLO vps0.lunn.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751496AbbGAXCs (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 1 Jul 2015 19:02:48 -0400
Content-Disposition: inline
In-Reply-To: <20150701213623.GT5904@valkosipuli.retiisi.org.uk>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, pavel@ucw.cz, sakari.ailus@linux.intel.com, andreas.werner@men.de, ospite@studenti.unina.it, anemo@mba.ocn.ne.jp, ben@simtec.co.uk, bootc@bootc.net, dmurphy@ti.com, daniel.jeong@ti.com, daniel@zonque.org, davem@davemloft.net, fabio.baltieri@gmail.com, balbi@ti.com, florian@openwrt.org, gshark.jeong@gmail.com, g.liakhovetski@gmx.de, ingi2.kim@samsung.com, dl9pf@gmx.de, johan@kernel.org, lenz@cs.wisc.edu, jogo@openwrt.org, q1.kim@samsung.com, kris@krisk.org, kristoffer.ericson@gmail.com, linus.walleij@linaro.org, broonie@kernel.org, michael.hennerich@analog.com, milo.kim@ti.com, nm127@freemail.hu, ncase@xes-inc.com, neilb@suse.de, nick.forbes@incepta.com, lost.distance@yahoo.com, p.meerwald@bct-electronic

> > As Andrew Lunn mentioned, he was also working on this issue and he did
> > the vast majority of work [1] needed to remove work queues from existing
> > drivers. Only new flags would have to be added.
> 
> Excellent! This is what I was thinking as well.
> 
> It think it'd be good if we could get the framework improvements in without
> having to change the existing drivers. They could be fixed later on; I
> wonder how testing could be arranged.

The work for the drivers is mostly brainless donkey work. So long as a
few people review each patch to catch dumb errors, the risk should be
quite low.

So ask people to test, but don't hold back drivers which nobody
tested, would be my suggestion.

	Andrew

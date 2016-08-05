From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [RFC] User-defined leds
Date: Fri, 5 Aug 2016 21:51:31 +0200
Message-ID: <20160805195130.GA26694@amd>
References: <57965C15.1070705@lechnology.com>
 <DB74DD94-7737-4F06-BD35-D698A65E30AD@holtmann.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:55743 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S2993124AbcHETvf (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 5 Aug 2016 15:51:35 -0400
Content-Disposition: inline
In-Reply-To: <DB74DD94-7737-4F06-BD35-D698A65E30AD@holtmann.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Marcel Holtmann <marcel@holtmann.org>
Cc: David Lechner <david@lechnology.com>, linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Joel Becker <jlbec@evilplan.org>

Hi!

> > short version: I have a use case for leds where I want to be able to use the triggers in the leds subsystem without having a physical hardware led.
> > 
> > long version: I am working on a program to make one embedded system (http://fatcatlab.com/product/evb/) compatible with another (http://mindstorms.lego.com). One has physical red/green LEDs, that use the gpio leds driver to control them. The other system does not have physical leds. However, it does have a color screen. So, my idea is
> > to create virtual LEDs on the screen that emulate the physical LEDs on the other device.
> > 
> > I would like to make a userspace program that works the same on both devices. If the leds were simple on-off, then it would of course be simpler to make the virtual leds completely in userspace. However, we are currently using other triggers (disk activity/heatbeat/etc.) with the leds. I would like for the virtual LEDs to be able to use these triggers as well.
> 
> this is funny since I have just written a ledsim.c using debugfs to emulate a LED and read out its state via a simple cat command. I found that useful for testing triggers in the Bluetooth subsystem and see if they behave correctly without bothering to run this on real hardware.
> 

Could the device tree be used to bind LED driver to otherwise unused
gpio?

								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

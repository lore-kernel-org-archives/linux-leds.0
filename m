From: "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>
Subject: Re: [PATCH] Add LED driven by multiple gpio.
Date: Tue, 26 Apr 2016 16:26:58 -0400
Message-ID: <20160426162658.761a88e7.drivshin.allworx@gmail.com>
References: <1461572078.2269.2.camel@dlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qg0-f65.google.com ([209.85.192.65]:32946 "EHLO
	mail-qg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752555AbcDZU1C (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 26 Apr 2016 16:27:02 -0400
Received: by mail-qg0-f65.google.com with SMTP id 7so1908874qgj.0
        for <linux-leds@vger.kernel.org>; Tue, 26 Apr 2016 13:27:01 -0700 (PDT)
In-Reply-To: <1461572078.2269.2.camel@dlinux>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dmitry Bondar <bond@simicon.com>
Cc: linux-leds@vger.kernel.org, Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>

On Mon, 25 Apr 2016 11:14:38 +0300
Dmitry Bondar <bond@simicon.com> wrote:

> Hello, on our board we have one LED with 2 gpio connected to it:
>  - when gpio0 is on and gpio1 on - LED is orange.
>  - when gpio0 is on and gpio1 off - LED is green.
>  - when gpio0 is off and gpio1 on - LED is red.
>  - when gpio0 is off and gpio1 off - LED is off.
> We want use led_trigger (nand-disk) on this LED.
> Below patch which we use for get one LED on 2 gpios.
> Can be this in mainline, or may be exist other - better way?
> 

It sounds like what you have is two independent GPIO controlled LEDs: 
one green and the other red (even if they are part of the same IC). 
Given the current infrastructure, I have modeled such cases as two 
separate LEDs in the devicetree, named <device>:green:<function> and 
<device>:red:<function>. Userspace is then responsible for controlling 
them appropriately to get the desired color.

Unless I'm mistaken, in your case (nand-disk) there are blinking
combinations you wouldn't be able to achieve this way, but there
are a number you can do:
- off/green:  	green:nand-disk	red:off
- off/red: 	green:off 	red:nand-disk
- off/orange:	green:nand-disk	red:nand-disk
- green/orange:	green:on	red:nand-disk
- red/orange:	green:nand-disk	red:on
The other cases (e.g. green/red) would need an inverted nand-disk 
trigger (on while inactive, off while active).

I'm hoping that if the RGB LED framework comes to fruition, that there
will be some way to combine arbitrary single-color LED devices into a 
logical RGB LED. I suspect there are many boards that would find it
useful to expose a single RGB LED to userspace (and triggers), as opposed 
to separate R, G, and B LEDs. 

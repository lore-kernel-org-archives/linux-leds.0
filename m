From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH RESEND v6 0/2] Driver for TI tlc591xx 8/16 Channel i2c
 LED driver
Date: Mon, 17 Aug 2015 18:48:22 +0200
Message-ID: <20150817164822.GA29494@lunn.ch>
References: <1426630107-25057-1-git-send-email-andrew@lunn.ch>
 <55D1CF84.8040906@ti.com>
 <20150817132718.GF7537@lunn.ch>
 <55D1EBA8.9090609@ti.com>
 <20150817142147.GG7537@lunn.ch>
 <55D20E96.3020504@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:60721 "EHLO vps0.lunn.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754720AbbHQQzj (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 17 Aug 2015 12:55:39 -0400
Content-Disposition: inline
In-Reply-To: <55D20E96.3020504@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Matthew.Fatheree@belkin.com, "R, Vignesh" <vigneshr@ti.com>

> TLC591xx is quite simple HW, and the code doing the HW programming
> should be identical for a pwm and for a led driver. I don't see either a
> pwm or a led driver being somehow superior. They are very similar simple
> drivers, implementing a different interface. Whether the interface works
> for you should be clear from the interface itself. The code is just details.
> 
> On the other hand, if you want something you can use to test, it's a
> different case, but you haven't indicated any interest in that.

What i want is code in the kernel to driver the LEDs on my Linksys
WRT1900ac. You say, "the code is just details", is just plain
wrong. Code is the Linux kernel and is the process of getting stuff
into the kernel. I've followed the process, submitted code for review,
fixed up comments, got it tested and ACKed by people, and merged.

Where as all you have done is emailed.

So i'm done.

   Andrew

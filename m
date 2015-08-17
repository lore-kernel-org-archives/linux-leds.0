From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH RESEND v6 0/2] Driver for TI tlc591xx 8/16 Channel i2c
 LED driver
Date: Mon, 17 Aug 2015 16:21:47 +0200
Message-ID: <20150817142147.GG7537@lunn.ch>
References: <1426630107-25057-1-git-send-email-andrew@lunn.ch>
 <55D1CF84.8040906@ti.com>
 <20150817132718.GF7537@lunn.ch>
 <55D1EBA8.9090609@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:60648 "EHLO vps0.lunn.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755161AbbHQO3E (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 17 Aug 2015 10:29:04 -0400
Content-Disposition: inline
In-Reply-To: <55D1EBA8.9090609@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Matthew.Fatheree@belkin.com

> > Hi Tomi
> > 
> > Our discussions were going around in circles, no progress being made.
> > The subsystem maintainer is ultimately the one who needs to decide,
> > bar Linus himself. Bryan Wu has seen all the discussions, and
> > ultimately decided the driver was O.K, despite any unresolved issues
> > you might have.
> 
> If so, Bryan did not comment to the unanswered questions in any way.
> More probable is that he missed them.

I would not jump to that conclusion. As one of the maintainers of
Marvell SoCs, i don't feel the need to address every open question
going back and forward between two developers, when i decide to end
the discussion by just accepting the patch.

> > If you think your PWM code is so much better, please submit a revert
> > patch plus your PWM LED driver. We can find somebody to do a side by
> > side review.
> 
> It's not about the driver code. That can be cleaned up if needed. The
> question is whether the driver should be a PWM driver or a LED driver.

There i disagree. It is all about the code. Release early, release
often.  Show us the code. Get it discussed, reviewed, tested, and then
ultimately merged.

You keep saying PWM is the way to solve this problem, but where is
your code showing your solution is superior to mine, yet still solves
my use case?

So please stop talking and show us the code.

   Thanks
	Andrew

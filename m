From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH 4/5] leds: leds-pwm: implement PWM inversion
Date: Mon, 7 Apr 2014 11:28:03 +0200
Message-ID: <20140407092803.GT30127@piout.net>
References: <20140406221854.GS7528@n2100.arm.linux.org.uk>
 <E1WWvQI-00049e-Vl@rmk-PC.arm.linux.org.uk>
 <20140407084651.GA30127@piout.net>
 <20140407085245.GT7528@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:46923 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754182AbaDGJ2H (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Apr 2014 05:28:07 -0400
Content-Disposition: inline
In-Reply-To: <20140407085245.GT7528@n2100.arm.linux.org.uk>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Thierry Reding <thierry.reding@gmail.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

On 07/04/2014 at 09:52:45 +0100, Russell King - ARM Linux wrote :
> On Mon, Apr 07, 2014 at 10:46:51AM +0200, Alexandre Belloni wrote:
> > 
> > This will conflict with my patch (which is still lacking proper review)
> > there:
> > http://thread.gmane.org/gmane.linux.leds/482
> > 
> > I would say that it is better to hide the polarity inversion in the PWM
> > driver for your specific PWM. Else we will end up with all the drivers
> > using PWMs trying to detect whether the PWM supports inversion and if it
> > is not the case, calculating the inverted duty cycle.
> > 
> > So, I would go for my patch which is adding the missing polarity
> > inversion setting when using platform data and then implement software
> > polarity inversion in your underlying PWM driver. That also avoids patch
> > 5/5 and I believe not adding a DT property is always a good idea.
> > 
> > What is your PWM that is not supporting polarity inversion ?
> 
> Did you read the commit message properly, particularly the last sentence
> of the first paragraph which refers to the problem with your approach?
> 

If disabling the PWM is putting the output low, I would then enable the
channel on pwm_request() and disable it on pwm_free() because anyway,
you'll have to let it run continuously to get the correct result.
However, Thierry seems to believe that there is an other underlying
issue in the PWM driver when this happens.

Going with your approach will end up with all the drivers trying to use
PWMs having to use the same logic and I'm sure a lot of people will get
confused between polarity inversion and using active_low...

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

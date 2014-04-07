From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 4/5] leds: leds-pwm: implement PWM inversion
Date: Mon, 7 Apr 2014 16:01:53 +0100
Message-ID: <20140407150153.GF7528@n2100.arm.linux.org.uk>
References: <20140406221854.GS7528@n2100.arm.linux.org.uk> <E1WWvQI-00049e-Vl@rmk-PC.arm.linux.org.uk> <20140407084651.GA30127@piout.net> <20140407111003.GA26985@ulmo> <20140407113547.GB7528@n2100.arm.linux.org.uk> <20140407120143.GF26985@ulmo> <20140407123750.GC7528@n2100.arm.linux.org.uk> <20140407133758.GA25556@ulmo> <20140407142024.GX30127@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:52787 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753143AbaDGPC1 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Apr 2014 11:02:27 -0400
Content-Disposition: inline
In-Reply-To: <20140407142024.GX30127@piout.net>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

On Mon, Apr 07, 2014 at 04:20:24PM +0200, Alexandre Belloni wrote:
> Point taken. I'm still a bit afraid about people then setting both the
> inverted polarity on the PWM and active-low. Or not knowing when to
> choose which one. I would expect that inverting the PWM is still the
> better choice as it allows to disable the PWM.

That depends.  Consider the case that I have - a LED connected between
supply and the PWM output.  The PWM controller, when disabled, sets the
output to ground.  When when the PWM controller supports output inversion,
when the controller is disabled, it still sets the output to ground.

That's the root of my problem - the iMX6 "inversion" isn't a real
inversion of the output itself, it's a change in the way the logic
inside the PWM works.

The design appears to be:

1. A counter which resets to zero, and then increments to a programmable
   maximum value.
2. A comparitor which compares the counter output with the sample value.
3. A set-reset flip flop on the output
4. Muxes on the set and reset input to select which signals are routed
   to the flip-flop.

What this means is that when the counter is reset to zero, the output
flip flop can be either set or cleared.  When the counter reaches the
sample value, the output can be either cleared or set.

While the PWM is running, this results in apparant polarity changes as
per the description in linux/pwm.h.  However, when disabled, the output
is always forced to zero.

What is not clearly specified is what happens at enable time.  The
documentations use of "the output pin is set to start a new period"
is rather ambiguous when they've already shown that there's a set-reset
latch - does it mean that a pulse is always sent to the 'set' input
causing the output to go high when the PWM is enabled... which would
mean it would end up remaining high until the end of the first period.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.

From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [RFC] User-defined leds
Date: Fri, 5 Aug 2016 21:58:09 +0200
Message-ID: <20160805195809.GA28410@amd>
References: <57965C15.1070705@lechnology.com>
 <DB74DD94-7737-4F06-BD35-D698A65E30AD@holtmann.org>
 <20160805195130.GA26694@amd>
 <8db4e308-ae2f-ee8a-d570-cd751c4f0269@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:55919 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S2993780AbcHET6N (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 5 Aug 2016 15:58:13 -0400
Content-Disposition: inline
In-Reply-To: <8db4e308-ae2f-ee8a-d570-cd751c4f0269@lechnology.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Joel Becker <jlbec@evilplan.org>

On Fri 2016-08-05 14:54:33, David Lechner wrote:
> On 08/05/2016 02:51 PM, Pavel Machek wrote:
> >
> >Could the device tree be used to bind LED driver to otherwise unused
> >gpio?
> 
> There is already a leds-gpio driver that does this.
> 
> https://www.kernel.org/doc/Documentation/devicetree/bindings/leds/leds-gpio.txt

Yeah, I know, that's why I suggested it :-).

What might be missing: simple way to attach leds-gpio driver to
hardware on non-devicetree machines, and perhaps teaching leds-gpio
special gpio value "no gpio" meaning ... that hardware is not actually
updated.

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

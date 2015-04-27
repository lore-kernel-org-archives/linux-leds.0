From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 0/3] leds: blink resolution improvements
Date: Mon, 27 Apr 2015 22:54:41 +0200
Message-ID: <20150427205441.GB1301@xo-6d-61-c0.localdomain>
References: <553E6CF5.4030601@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:59758 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965081AbbD0Uys (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 27 Apr 2015 16:54:48 -0400
Content-Disposition: inline
In-Reply-To: <553E6CF5.4030601@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Stas Sergeev <stsp@list.ru>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>

Hi!

> The following patches improve the precision of led
> timer trigger and add the delay unit control.
> That allows to make PWM brightness control with timer
> trigger.

Are you sure that is good idea? Doing LED pwm with main cpu is quite harsh...

We already have "brightness" for... well... brightness level.

Would it make sense to have an option (Kconfig?) to do PWM using timer on hardware
that does not do hardware PWM?
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

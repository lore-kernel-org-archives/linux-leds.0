From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/2] leds: Add driver for NCP5623 3-channel I2C LED driver
Date: Sun, 26 Jun 2016 23:49:02 +0200
Message-ID: <20160626214902.GB21026@amd>
References: <1466494154-3786-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1466494154-3786-3-git-send-email-florian.vaussard@heig-vd.ch>
 <57695D45.60107@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:46148 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750876AbcFZVtE (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 26 Jun 2016 17:49:04 -0400
Content-Disposition: inline
In-Reply-To: <57695D45.60107@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Florian Vaussard <florian.vaussard@gmail.com>, devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Florian Vaussard <florian.vaussard@heig-vd.ch>

Hi!

> >+struct ncp5623_led {
> >+	bool active;
> >+	unsigned int led_no;
> >+	struct led_classdev ldev;
> >+	struct work_struct work;
> >+	struct ncp5623_priv *priv;
> >+};
> >+
> >+struct ncp5623_priv {
> >+	struct ncp5623_led leds[NCP5623_MAX_LEDS];
> 
> Please allocate memory dynamically, depending on the number
> of LEDs defined in a Device Tree.

MAX_LEDs is three. Are you sure overhead of dynamic allocation is
worth it?

And if this is for RGB leds... very probably device will want to use
all 3 channels.

Best regards,
								Pavel
								
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: leds-pwm - does anyone care for it?
Date: Sun, 6 Apr 2014 15:12:58 +0100
Message-ID: <20140406141257.GR7528@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:51553 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750856AbaDFON3 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 6 Apr 2014 10:13:29 -0400
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org

So during the last three months, I've sent a patch twice for leds-pwm,
and both times it's been completely ignored.

Today, I find that OMAP4430 SDP fails to boot due to an oops caused by
this driver in the workqueue code - it frees structures which contain
queued workqueues if we're booting with DT and it can't find the PWM
device.

If I look closer at this driver, I find that it doesn't of_node_put()
the OF node in the case of devm_of_pwm_get() failure... I'm sure these
aren't the only problems.

Then there's the three entirely separately coded cleanup paths - the
removal function, the cleanup for failure in the OF code, and the
cleanup for failure in the non-OF case.  This is where the oops stems
from because the author of the patch adding the work queue only fixed
up two of these sites - the ones which applied to his case and never
bothered with the third.

I'm going to fix this latest failure in the driver, and send a patch
later today, and I will hope for a timely response.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.

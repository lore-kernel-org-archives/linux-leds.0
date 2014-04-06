From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: [PATCH 0/5] Fix various issues with leds-pwm
Date: Sun, 6 Apr 2014 23:18:54 +0100
Message-ID: <20140406221854.GS7528@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:51961 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754266AbaDFWTb (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 6 Apr 2014 18:19:31 -0400
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-leds@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>

This patch series fixes various problems with leds-pwm.

The first patch is very important to solve a boot time oops on OMAP
boards (and probably others) which has recently shown its face.

The next two clean up leds-pwm so that we can avoid the madness of
having entirely separate initialisation paths for DT and non-DT, which
I believe is the core cause of the initial problem.

The last two patches add support for LEDs connected in the opposite
sense to PWM outputs, where either the PWM does not support inversion,
or does not support it in a way that works sanely with leds-pwm.  These
add a new property to leds-pwm, hence why that patch (and this cover)
copies the DT people.

The first patch is an absolute must for going.

 .../devicetree/bindings/leds/leds-pwm.txt          |   2 +
 drivers/leds/leds-pwm.c                            | 161 ++++++++++-----------
 2 files changed, 82 insertions(+), 81 deletions(-)

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.

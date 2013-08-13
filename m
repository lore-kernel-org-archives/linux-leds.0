From: Ian Pilcher <arequipeno@gmail.com>
Subject: Re: Registering GPIO LEDs
Date: Tue, 13 Aug 2013 18:35:06 -0500
Message-ID: <kuefr3$4li$1@ger.gmane.org>
References: <ktuj0g$qci$1@ger.gmane.org> <A874F61F95741C4A9BA573A70FE3998F82E868B9@DQHE06.ent.ti.com> <52046755.7010602@gmail.com> <A874F61F95741C4A9BA573A70FE3998F82E86950@DQHE06.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:60912 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758072Ab3HMXfT (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 13 Aug 2013 19:35:19 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gll-linux-leds@m.gmane.org>)
	id 1V9O7S-00005B-Bk
	for linux-leds@vger.kernel.org; Wed, 14 Aug 2013 01:35:18 +0200
Received: from pool-71-252-209-206.dllstx.fios.verizon.net ([71.252.209.206])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-leds@vger.kernel.org>; Wed, 14 Aug 2013 01:35:18 +0200
Received: from arequipeno by pool-71-252-209-206.dllstx.fios.verizon.net with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-leds@vger.kernel.org>; Wed, 14 Aug 2013 01:35:18 +0200
In-Reply-To: <A874F61F95741C4A9BA573A70FE3998F82E86950@DQHE06.ent.ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org

On 08/09/2013 12:26 AM, Kim, Milo wrote:
> It sounds you want to make the LED platform data flexible, right?

Yes, but only to the extent that it can handle this particular hardware.
I'm mostly concerned that something like a kernel upgrade, BIOS upgrade,
or loading additional modules will cause the "magic" GPIO numbers to
change.

> If you can use .dtb file in your system, it may be possible to use just offset
> values with GPIO controller, ich_gpio. Then, no hardcoded GPIO is required.

I'm fairly sure that device tree is not an option in most x86_64
distros.  (And the whole reason I'm doing this is to used such a
"mainstream" distro on this hardware, rather than the NAS vendor's
"firmware".)

For now, I think I'll go the kernel module route.  If necessary, user-
space can use sysfs to find the GPIO base of the ICH and pass it in.  I
suspect there's a way to do this entirely in the kernel, but I also
suspect that it's too much trouble to be worth the effort right now.

Thanks!

-- 
========================================================================
Ian Pilcher                                         arequipeno@gmail.com
Sometimes there's nothing left to do but crash and burn...or die trying.
========================================================================


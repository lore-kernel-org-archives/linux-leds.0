From: Ian Pilcher <arequipeno@gmail.com>
Subject: Make PCA9532 LEDs blink?
Date: Sun, 01 Sep 2013 02:25:27 -0500
Message-ID: <kvuq4v$ckc$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:51408 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753128Ab3IAHZn (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Sun, 1 Sep 2013 03:25:43 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gll-linux-leds@m.gmane.org>)
	id 1VG22X-0003iE-2U
	for linux-leds@vger.kernel.org; Sun, 01 Sep 2013 09:25:41 +0200
Received: from pool-71-252-209-206.dllstx.fios.verizon.net ([71.252.209.206])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-leds@vger.kernel.org>; Sun, 01 Sep 2013 09:25:41 +0200
Received: from arequipeno by pool-71-252-209-206.dllstx.fios.verizon.net with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-leds@vger.kernel.org>; Sun, 01 Sep 2013 09:25:41 +0200
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org

How can I make PCA9532-controlled LEDs blink (without continually
turning them on and off in my application)?

I know that the hardware is capable, and I can see that the driver has
a blink_set function, but I can't figure out how to access it from
userspace.  (This may be more of a general API question than PCA9532-
specific.)

Thanks!

-- 
========================================================================
Ian Pilcher                                         arequipeno@gmail.com
Sometimes there's nothing left to do but crash and burn...or die trying.
========================================================================


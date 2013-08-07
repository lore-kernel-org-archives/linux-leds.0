From: Ian Pilcher <arequipeno@gmail.com>
Subject: Registering GPIO LEDs
Date: Wed, 07 Aug 2013 17:51:03 -0500
Message-ID: <ktuj0g$qci$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:40713 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933451Ab3HGWzI (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 7 Aug 2013 18:55:08 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gll-linux-leds@m.gmane.org>)
	id 1V7CdE-0005Ze-7p
	for linux-leds@vger.kernel.org; Thu, 08 Aug 2013 00:55:04 +0200
Received: from pool-71-252-209-206.dllstx.fios.verizon.net ([71.252.209.206])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-leds@vger.kernel.org>; Thu, 08 Aug 2013 00:55:04 +0200
Received: from arequipeno by pool-71-252-209-206.dllstx.fios.verizon.net with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-leds@vger.kernel.org>; Thu, 08 Aug 2013 00:55:04 +0200
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org

I've discovered that it's quite simple to control the drive activity
LEDs on my Thecus N5550 with the standard gpio_ich module.  AFAIK, this
means that I should be able to use them with the leds_gpio module.  I
just need to register them.

I've found this page that gives an example:

  http://fabiobaltieri.com/2011/09/21/linux-led-subsystem/

I'm confused, however, about the .gpio member of the struct gpio_led.
I'm guessing that it's the GPIO number, but (at least in the case of
gpio_ich) that number can vary depending on the base number for that
chip.

Am I missing something?

Thanks!

-- 
========================================================================
Ian Pilcher                                         arequipeno@gmail.com
Sometimes there's nothing left to do but crash and burn...or die trying.
========================================================================


From: Ian Pilcher <arequipeno@gmail.com>
Subject: Re: Make PCA9532 LEDs blink?
Date: Sun, 01 Sep 2013 23:52:17 -0500
Message-ID: <l015hp$ad5$1@ger.gmane.org>
References: <kvuq4v$ckc$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:33001 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753322Ab3IBEwc (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 2 Sep 2013 00:52:32 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gll-linux-leds@m.gmane.org>)
	id 1VGM7p-00008N-8Q
	for linux-leds@vger.kernel.org; Mon, 02 Sep 2013 06:52:29 +0200
Received: from pool-71-252-209-206.dllstx.fios.verizon.net ([71.252.209.206])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-leds@vger.kernel.org>; Mon, 02 Sep 2013 06:52:29 +0200
Received: from arequipeno by pool-71-252-209-206.dllstx.fios.verizon.net with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-leds@vger.kernel.org>; Mon, 02 Sep 2013 06:52:29 +0200
In-Reply-To: <kvuq4v$ckc$1@ger.gmane.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org

On 09/01/2013 02:25 AM, Ian Pilcher wrote:
> How can I make PCA9532-controlled LEDs blink (without continually
> turning them on and off in my application)?
> 
> I know that the hardware is capable, and I can see that the driver has
> a blink_set function, but I can't figure out how to access it from
> userspace.  (This may be more of a general API question than PCA9532-
> specific.)

And the answer is the timer trigger ... as mentioned in leds-class.txt.

Sorry for the noise.  :-|

-- 
========================================================================
Ian Pilcher                                         arequipeno@gmail.com
Sometimes there's nothing left to do but crash and burn...or die trying.
========================================================================


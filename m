From: Ian Pilcher <arequipeno@gmail.com>
Subject: device_create_file returns 0 but doesn't work
Date: Sun, 01 Sep 2013 18:38:30 -0500
Message-ID: <l00j5e$8b0$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:40689 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753129Ab3IAXip (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Sun, 1 Sep 2013 19:38:45 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gll-linux-leds@m.gmane.org>)
	id 1VGHEC-0001lx-Ka
	for linux-leds@vger.kernel.org; Mon, 02 Sep 2013 01:38:44 +0200
Received: from pool-71-252-209-206.dllstx.fios.verizon.net ([71.252.209.206])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-leds@vger.kernel.org>; Mon, 02 Sep 2013 01:38:44 +0200
Received: from arequipeno by pool-71-252-209-206.dllstx.fios.verizon.net with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-leds@vger.kernel.org>; Mon, 02 Sep 2013 01:38:44 +0200
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: kernelnewbies@kernelnewbies.org, linux-kernel@vger.kernel.org

I am trying to add an additional sysfs attribute to a device (LED) that
is created by another driver.  (My ultimate goal is to provide a way for
a userspace application to use the functionality provided by
led_blink_set, which doesn't currently seem to be possible.)

The kernel module code that sets up all the GPIOs & LEDs in my NAS is
at:

  http://pastebin.com/TJZGww8T

The call to device_create_file is at line 373.

device_create_file is returning 0, but the "foo" attribute is not being
created.  ("find /sys -name '*foo*'" doesn't find anything, so I'm not
just looking in the wrong place.)

What am I doing wrong?

Thanks!

-- 
========================================================================
Ian Pilcher                                         arequipeno@gmail.com
Sometimes there's nothing left to do but crash and burn...or die trying.
========================================================================


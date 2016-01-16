From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Problem with resetting LED in led_classdev_unregister in case of USB
 LED device removal
Date: Sat, 16 Jan 2016 22:34:53 +0100
Message-ID: <569AB77D.3020909@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:35942 "EHLO
	mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752751AbcAPVfN (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 16 Jan 2016 16:35:13 -0500
Received: by mail-wm0-f48.google.com with SMTP id l65so58554751wmf.1
        for <linux-leds@vger.kernel.org>; Sat, 16 Jan 2016 13:35:13 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Milo Kim <milo.kim@ti.com>

In led_classdev_unregister the LED gets switched off.
This is fine when the driver module is removed but causes issues
when the physical LED device is removed (e.g. USB LED devices).

In case of the thingm driver (hid/hid-thingm.c) it complains with
ENODEV because the physical LED device is no longer available.

When I switched this driver to use the generic workqueue in the
LED core then this error was also propagated to set_brightness_delayed 
and it complains with "Setting an LED's brightness failed (-19)".

Recent commit d1aa577f5e19 [turn off the LED and wait for completion
on unregistering LED class device] tackled a first potential issue
in led_classdev_unregister but it seems like the case of removal
of the physical LED device hasn't been considered yet.

At a first glance I see no way for the LED core to tell between
the two unregister cases (driver module removal vs. physical LED
device removal), but maybe I miss something.

If we can't tell between the two cases them I'm not sure what's the
best solution: Not touching the brightness is general in
led_classdev_unregister, live with the situation as it is or add
a special handling for ENODEV.

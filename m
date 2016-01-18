From: Milo Kim <milo.kim@ti.com>
Subject: Re: Problem with resetting LED in led_classdev_unregister in case of
 USB LED device removal
Date: Mon, 18 Jan 2016 09:20:43 +0900
Message-ID: <569C2FDB.8090005@ti.com>
References: <569AB77D.3020909@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:58156 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752888AbcARAUu (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Sun, 17 Jan 2016 19:20:50 -0500
In-Reply-To: <569AB77D.3020909@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org

On 01/17/2016 06:34 AM, Heiner Kallweit wrote:
> In led_classdev_unregister the LED gets switched off.
> This is fine when the driver module is removed but causes issues
> when the physical LED device is removed (e.g. USB LED devices).
>
> In case of the thingm driver (hid/hid-thingm.c) it complains with
> ENODEV because the physical LED device is no longer available.

I'd like to understand this situation clearly.

rmmod hid_thingm
-> detach the USB LED device
-> -ENODEV is reported.

Is it correct? I think -ENODEV seems reasonable because HID device is 
gone. Could you tell us what the problem is?

> When I switched this driver to use the generic workqueue in the
> LED core then this error was also propagated to set_brightness_delayed
> and it complains with "Setting an LED's brightness failed (-19)".
>
> Recent commit d1aa577f5e19 [turn off the LED and wait for completion
> on unregistering LED class device] tackled a first potential issue
> in led_classdev_unregister but it seems like the case of removal
> of the physical LED device hasn't been considered yet.

What happens if resetting only this commit?

> At a first glance I see no way for the LED core to tell between
> the two unregister cases (driver module removal vs. physical LED
> device removal), but maybe I miss something.
>
> If we can't tell between the two cases them I'm not sure what's the
> best solution: Not touching the brightness is general in
> led_classdev_unregister, live with the situation as it is or add
> a special handling for ENODEV.

We may handle this by using internal flag in LED subsystem, but I'd like 
to understand what the problem is and what expected behavior is.

Best regards,
Milo

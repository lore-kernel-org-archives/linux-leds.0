From: Milo Kim <milo.kim@ti.com>
Subject: Re: Problem with resetting LED in led_classdev_unregister in case of
 USB LED device removal
Date: Tue, 19 Jan 2016 09:11:29 +0900
Message-ID: <569D7F31.8060905@ti.com>
References: <569AB77D.3020909@gmail.com> <569C2FDB.8090005@ti.com>
 <569C8822.2000203@gmail.com> <569CA67F.3070204@samsung.com>
 <569D508A.8010906@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:52415 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754668AbcASALg (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 18 Jan 2016 19:11:36 -0500
In-Reply-To: <569D508A.8010906@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org

On 01/19/2016 05:52 AM, Heiner Kallweit wrote:
> Setting such a flag from the driver might cause significant effort in different layers.
> When we talk about thingm as an example, it uses the hid subsystem with the usbhid low level driver.
> We would need a callback in the usbhid driver (to be notified when the device is unplugged)
> and a way to propagate this event to the hid core.
>
> Maybe simpler: We could ignore ENODEV errors if a function is called from led_classdev_unregister.
> This way we wouldn't have to touch drivers. I think of something like this:

Well, simple solution is good but I'm thinking about more generic handling.


LED subsystem				HID LED driver
-------------				--------------
					Create a LED device

Registers an event notifier

					Device is unplugged,
					notify an event to LED
					subsystem

Notification callback sets
a flag which means HW is removed

Set-brightness scheduler work
function checks this flag and
ignore the brightness update


blocking_notifier_chain_register() and blocking_notifier_call_chain() 
helpers can be used for this implementation.

However, I'm not sure how much latency will exist between step 3 (device 
is unplugged) and step 5 (check the flag and ignore brightness-set).

Best regards,
Milo

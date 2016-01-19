From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: Problem with resetting LED in led_classdev_unregister in case of
 USB LED device removal
Date: Tue, 19 Jan 2016 21:23:10 +0100
Message-ID: <569E9B2E.4070306@gmail.com>
References: <569AB77D.3020909@gmail.com> <569C2FDB.8090005@ti.com>
 <569C8822.2000203@gmail.com> <569CA67F.3070204@samsung.com>
 <569D508A.8010906@gmail.com> <569DFD68.9050200@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:34685 "EHLO
	mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933044AbcASUmL (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 19 Jan 2016 15:42:11 -0500
Received: by mail-wm0-f47.google.com with SMTP id u188so159426932wmu.1
        for <linux-leds@vger.kernel.org>; Tue, 19 Jan 2016 12:42:10 -0800 (PST)
In-Reply-To: <569DFD68.9050200@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Milo Kim <milo.kim@ti.com>, linux-leds@vger.kernel.org

Am 19.01.2016 um 10:10 schrieb Jacek Anaszewski:
> Hi Heiner,
> 
> On 01/18/2016 09:52 PM, Heiner Kallweit wrote:
> 
>>> Yes, this seems to be the best solution. Driver should set this flag
>>> before calling led_classdev_unregister. If the flag is set the -ENODEV
>>> error will not be reported. It could be named LED_HW_ABSENT for
>>> instance. Feel free to propose other ideas.
>>>
>> Setting such a flag from the driver might cause significant effort in different layers.
>> When we talk about thingm as an example, it uses the hid subsystem with the usbhid low level driver.
>> We would need a callback in the usbhid driver (to be notified when the device is unplugged)
>> and a way to propagate this event to the hid core.
> 
>> Maybe simpler: We could ignore ENODEV errors if a function is called from led_classdev_unregister.
>> This way we wouldn't have to touch drivers. I think of something like this:
> 
> Ignoring -ENODEV errors for all devices would filter out also valid
> error cases and hinder debugging.
> 
> How about adding a flag LED_HW_PLUGGABLE in addition to
> LED_UNREGISTERING, and make the pluggable LED class drivers having set
> it all the time. The -ENODEV error would be reported only
> if !(LED_UNREGISTERING && LED_HW_PLUGGABLE).
> 
Sounds good, I'll send a patch including the additional LED_HW_PLUGGABLE flag.
The patch may apply cleanly only after applying a comment fix I sent on Jan 10th.
(led: core: fix misleading comment after workqueue removal from drivers)

Regards, Heiner

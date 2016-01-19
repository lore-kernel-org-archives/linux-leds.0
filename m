From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: Problem with resetting LED in led_classdev_unregister in case of
 USB LED device removal
Date: Tue, 19 Jan 2016 07:46:54 +0100
Message-ID: <569DDBDE.9070300@gmail.com>
References: <569AB77D.3020909@gmail.com> <569C2FDB.8090005@ti.com>
 <569C8822.2000203@gmail.com> <569CA67F.3070204@samsung.com>
 <569D508A.8010906@gmail.com> <569D7F31.8060905@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:37175 "EHLO
	mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751146AbcASGrD (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 19 Jan 2016 01:47:03 -0500
Received: by mail-wm0-f48.google.com with SMTP id n5so95685243wmn.0
        for <linux-leds@vger.kernel.org>; Mon, 18 Jan 2016 22:47:02 -0800 (PST)
In-Reply-To: <569D7F31.8060905@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org

Am 19.01.2016 um 01:11 schrieb Milo Kim:
> On 01/19/2016 05:52 AM, Heiner Kallweit wrote:
>> Setting such a flag from the driver might cause significant effort in different layers.
>> When we talk about thingm as an example, it uses the hid subsystem with the usbhid low level driver.
>> We would need a callback in the usbhid driver (to be notified when the device is unplugged)
>> and a way to propagate this event to the hid core.
>>
>> Maybe simpler: We could ignore ENODEV errors if a function is called from led_classdev_unregister.
>> This way we wouldn't have to touch drivers. I think of something like this:
> 
> Well, simple solution is good but I'm thinking about more generic handling.
> 
> 
> LED subsystem                HID LED driver
> -------------                --------------
>                     Create a LED device
> 
> Registers an event notifier
> 
>                     Device is unplugged,
>                     notify an event to LED
>                     subsystem
> 
> Notification callback sets
> a flag which means HW is removed
> 
> Set-brightness scheduler work
> function checks this flag and
> ignore the brightness update
> 
Most likely not the LED subsystem but the respective driver would have to register the notifier as only the driver
knows what kind of subsystem (usb, ..) is used.

I agree that this would be somewhat cleaner. However I have my doubts that the relatively small benefit of getting read of one
a little annoying error message justifies the required efforts.
> 
> blocking_notifier_chain_register() and blocking_notifier_call_chain() helpers can be used for this implementation.
> 
> However, I'm not sure how much latency will exist between step 3 (device is unplugged) and step 5 (check the flag and ignore brightness-set).
> 
At a first glance I dont't think this is an issue because the notifier chain is blocking.

> Best regards,
> Milo
> 
Regards, Heiner

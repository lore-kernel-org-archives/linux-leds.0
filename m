From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: Problem with resetting LED in led_classdev_unregister in case of
 USB LED device removal
Date: Tue, 19 Jan 2016 10:10:00 +0100
Message-ID: <569DFD68.9050200@samsung.com>
References: <569AB77D.3020909@gmail.com> <569C2FDB.8090005@ti.com>
 <569C8822.2000203@gmail.com> <569CA67F.3070204@samsung.com>
 <569D508A.8010906@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:52154 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932641AbcASJKE (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 19 Jan 2016 04:10:04 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O1700HSJ04P7I60@mailout4.w1.samsung.com> for
 linux-leds@vger.kernel.org; Tue, 19 Jan 2016 09:10:01 +0000 (GMT)
In-reply-to: <569D508A.8010906@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Milo Kim <milo.kim@ti.com>, linux-leds@vger.kernel.org

Hi Heiner,

On 01/18/2016 09:52 PM, Heiner Kallweit wrote:

>> Yes, this seems to be the best solution. Driver should set this flag
>> before calling led_classdev_unregister. If the flag is set the -ENODEV
>> error will not be reported. It could be named LED_HW_ABSENT for
>> instance. Feel free to propose other ideas.
>>
> Setting such a flag from the driver might cause significant effort in different layers.
> When we talk about thingm as an example, it uses the hid subsystem with the usbhid low level driver.
> We would need a callback in the usbhid driver (to be notified when the device is unplugged)
> and a way to propagate this event to the hid core.

> Maybe simpler: We could ignore ENODEV errors if a function is called from led_classdev_unregister.
> This way we wouldn't have to touch drivers. I think of something like this:

Ignoring -ENODEV errors for all devices would filter out also valid
error cases and hinder debugging.

How about adding a flag LED_HW_PLUGGABLE in addition to
LED_UNREGISTERING, and make the pluggable LED class drivers having set
it all the time. The -ENODEV error would be reported only
if !(LED_UNREGISTERING && LED_HW_PLUGGABLE).

-- 
Best Regards,
Jacek Anaszewski

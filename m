From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: Problem with resetting LED in led_classdev_unregister in case of
 USB LED device removal
Date: Mon, 18 Jan 2016 09:46:55 +0100
Message-ID: <569CA67F.3070204@samsung.com>
References: <569AB77D.3020909@gmail.com> <569C2FDB.8090005@ti.com>
 <569C8822.2000203@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:33002 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753549AbcARIq7 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 18 Jan 2016 03:46:59 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O1500KN04E8DK70@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 18 Jan 2016 08:46:56 +0000 (GMT)
In-reply-to: <569C8822.2000203@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Milo Kim <milo.kim@ti.com>, linux-leds@vger.kernel.org

Hi Heiner, Milo,

On 01/18/2016 07:37 AM, Heiner Kallweit wrote:
> Am 18.01.2016 um 01:20 schrieb Milo Kim:
>> On 01/17/2016 06:34 AM, Heiner Kallweit wrote:
>>> In led_classdev_unregister the LED gets switched off.
>>> This is fine when the driver module is removed but causes issues
>>> when the physical LED device is removed (e.g. USB LED devices).
>>>
>>> In case of the thingm driver (hid/hid-thingm.c) it complains with
>>> ENODEV because the physical LED device is no longer available.
>>
>> I'd like to understand this situation clearly.
>>
>> rmmod hid_thingm
>> -> detach the USB LED device
>> -> -ENODEV is reported.
>>
>> Is it correct? I think -ENODEV seems reasonable because HID device is gone. Could you tell us what the problem is?
>>
> Sure, this is reasonable. The problem is that this causes dev_err messages.
> And if it's a normal situation it shouldn't result in error messages (at least not on error level).
>
>>> When I switched this driver to use the generic workqueue in the
>>> LED core then this error was also propagated to set_brightness_delayed
>>> and it complains with "Setting an LED's brightness failed (-19)".
>>>
>>> Recent commit d1aa577f5e19 [turn off the LED and wait for completion
>>> on unregistering LED class device] tackled a first potential issue
>>> in led_classdev_unregister but it seems like the case of removal
>>> of the physical LED device hasn't been considered yet.
>>
>> What happens if resetting only this commit?
>>
> It's not that something with this commit is wrong. The behaviour was the same before, I just mention it
> because you addressed the same part of the code and maybe stumbled across the same issue.
>
>>> At a first glance I see no way for the LED core to tell between
>>> the two unregister cases (driver module removal vs. physical LED
>>> device removal), but maybe I miss something.
>>>
>>> If we can't tell between the two cases them I'm not sure what's the
>>> best solution: Not touching the brightness is general in
>>> led_classdev_unregister, live with the situation as it is or add
>>> a special handling for ENODEV.
>>
>> We may handle this by using internal flag in LED subsystem, but I'd like to understand what the problem is and what expected behavior is.

Yes, this seems to be the best solution. Driver should set this flag
before calling led_classdev_unregister. If the flag is set the -ENODEV
error will not be reported. It could be named LED_HW_ABSENT for
instance. Feel free to propose other ideas.

> Ideally we would detect that the device is gone in the unregister function and skip trying to write to it.
>
>> Best regards,
>> Milo
>>
> Regards, Heiner
>
>
>


-- 
Best Regards,
Jacek Anaszewski
